import dotenv from 'dotenv';
import pkg from 'pg';
const { Client } = pkg;

dotenv.config();

const client = new Client({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
});

async function extraerEsquema() {
  try {
    console.log('🔌 Conectando a Railway PostgreSQL...');
    console.log(`📍 Host: ${process.env.DB_HOST}:${process.env.DB_PORT}`);
    console.log(`🗄️  Database: ${process.env.DB_NAME}\n`);
    
    await client.connect();
    console.log('✅ Conexión exitosa!\n');

    // 1. Obtener todas las tablas
    console.log('📊 Extrayendo estructura de tablas...\n');
    const tablesQuery = `
      SELECT 
        table_name,
        table_type
      FROM information_schema.tables 
      WHERE table_schema = 'public'
      ORDER BY table_name;
    `;
    const tablesResult = await client.query(tablesQuery);
    
    console.log(`📋 Total de tablas encontradas: ${tablesResult.rows.length}\n`);
    console.log('═'.repeat(80));

    let sqlOutput = `-- ============================================
-- ESQUEMA REAL DE BASE DE DATOS RAILWAY
-- Extraído automáticamente: ${new Date().toLocaleString()}
-- Sistema de Certificados Blockchain - UAGRM
-- ============================================

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

`;

    for (const table of tablesResult.rows) {
      const tableName = table.table_name;
      console.log(`\n📦 Tabla: ${tableName}`);

      // 2. Obtener columnas de cada tabla
      const columnsQuery = `
        SELECT 
          column_name,
          data_type,
          character_maximum_length,
          column_default,
          is_nullable,
          udt_name
        FROM information_schema.columns 
        WHERE table_schema = 'public' 
          AND table_name = $1
        ORDER BY ordinal_position;
      `;
      const columnsResult = await client.query(columnsQuery, [tableName]);
      
      console.log(`   └─ Columnas: ${columnsResult.rows.length}`);

      // 3. Obtener constraints (PK, FK, UNIQUE, CHECK)
      const constraintsQuery = `
        SELECT
          tc.constraint_name,
          tc.constraint_type,
          kcu.column_name,
          ccu.table_name AS foreign_table_name,
          ccu.column_name AS foreign_column_name,
          rc.update_rule,
          rc.delete_rule
        FROM information_schema.table_constraints AS tc
        LEFT JOIN information_schema.key_column_usage AS kcu
          ON tc.constraint_name = kcu.constraint_name
          AND tc.table_schema = kcu.table_schema
        LEFT JOIN information_schema.constraint_column_usage AS ccu
          ON ccu.constraint_name = tc.constraint_name
          AND ccu.table_schema = tc.table_schema
        LEFT JOIN information_schema.referential_constraints AS rc
          ON tc.constraint_name = rc.constraint_name
        WHERE tc.table_schema = 'public'
          AND tc.table_name = $1
        ORDER BY tc.constraint_type, tc.constraint_name;
      `;
      const constraintsResult = await client.query(constraintsQuery, [tableName]);
      
      if (constraintsResult.rows.length > 0) {
        console.log(`   └─ Constraints: ${constraintsResult.rows.length}`);
      }

      // 4. Obtener índices
      const indexesQuery = `
        SELECT
          i.relname AS index_name,
          a.attname AS column_name,
          ix.indisunique AS is_unique,
          ix.indisprimary AS is_primary
        FROM pg_class t
        JOIN pg_index ix ON t.oid = ix.indrelid
        JOIN pg_class i ON i.oid = ix.indexrelid
        JOIN pg_attribute a ON a.attrelid = t.oid AND a.attnum = ANY(ix.indkey)
        WHERE t.relkind = 'r'
          AND t.relname = $1
          AND i.relname NOT LIKE '%_pkey'
        ORDER BY i.relname, a.attname;
      `;
      const indexesResult = await client.query(indexesQuery, [tableName]);
      
      if (indexesResult.rows.length > 0) {
        console.log(`   └─ Índices: ${indexesResult.rows.length}`);
      }

      // Construir CREATE TABLE
      sqlOutput += `\n-- Tabla: ${tableName}\n`;
      sqlOutput += `CREATE TABLE "${tableName}" (\n`;

      // Agregar columnas
      const columnLines = columnsResult.rows.map((col, idx) => {
        let line = `    "${col.column_name}" `;
        
        // Tipo de dato
        if (col.data_type === 'character varying') {
          line += `VARCHAR(${col.character_maximum_length})`;
        } else if (col.data_type === 'USER-DEFINED') {
          line += col.udt_name === 'uuid' ? 'UUID' : col.udt_name.toUpperCase();
        } else {
          line += col.data_type.toUpperCase();
        }

        // Nullable
        if (col.is_nullable === 'NO') {
          line += ' NOT NULL';
        }

        // Default
        if (col.column_default) {
          line += ` DEFAULT ${col.column_default}`;
        }

        return line;
      });

      sqlOutput += columnLines.join(',\n');

      // Agregar constraints
      const pkConstraints = constraintsResult.rows.filter(c => c.constraint_type === 'PRIMARY KEY');
      const fkConstraints = constraintsResult.rows.filter(c => c.constraint_type === 'FOREIGN KEY');
      const uniqueConstraints = constraintsResult.rows.filter(c => c.constraint_type === 'UNIQUE');

      if (pkConstraints.length > 0) {
        const pkCols = pkConstraints.map(c => `"${c.column_name}"`).join(', ');
        sqlOutput += `,\n    CONSTRAINT ${pkConstraints[0].constraint_name} PRIMARY KEY (${pkCols})`;
      }

      if (uniqueConstraints.length > 0) {
        for (const uc of uniqueConstraints) {
          sqlOutput += `,\n    CONSTRAINT ${uc.constraint_name} UNIQUE ("${uc.column_name}")`;
        }
      }

      if (fkConstraints.length > 0) {
        for (const fk of fkConstraints) {
          sqlOutput += `,\n    CONSTRAINT ${fk.constraint_name} FOREIGN KEY ("${fk.column_name}")`;
          sqlOutput += `\n        REFERENCES "${fk.foreign_table_name}"("${fk.foreign_column_name}")`;
          if (fk.update_rule && fk.update_rule !== 'NO ACTION') {
            sqlOutput += ` ON UPDATE ${fk.update_rule}`;
          }
          if (fk.delete_rule && fk.delete_rule !== 'NO ACTION') {
            sqlOutput += ` ON DELETE ${fk.delete_rule}`;
          }
        }
      }

      sqlOutput += `\n);\n`;

      // Agregar índices
      if (indexesResult.rows.length > 0) {
        const uniqueIndexes = [...new Set(indexesResult.rows.map(i => i.index_name))];
        for (const indexName of uniqueIndexes) {
          const indexCols = indexesResult.rows
            .filter(i => i.index_name === indexName)
            .map(i => `"${i.column_name}"`)
            .join(', ');
          sqlOutput += `CREATE INDEX ${indexName} ON "${tableName}" (${indexCols});\n`;
        }
      }
    }

    console.log('\n' + '═'.repeat(80));
    console.log('✅ Esquema extraído exitosamente!\n');

    // Guardar en archivo
    const fs = await import('fs');
    const filePath = 'esquema-railway.sql';
    fs.writeFileSync(filePath, sqlOutput, 'utf8');
    console.log(`💾 Archivo guardado: ${filePath}`);
    console.log(`📏 Tamaño: ${(sqlOutput.length / 1024).toFixed(2)} KB`);

  } catch (error) {
    console.error('❌ Error:', error.message);
    if (error.code) {
      console.error(`   Código: ${error.code}`);
    }
  } finally {
    await client.end();
    console.log('\n🔌 Conexión cerrada');
  }
}

extraerEsquema();
