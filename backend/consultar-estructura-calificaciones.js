import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const { Client } = pg;

const client = new Client({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  ssl: {
    rejectUnauthorized: false
  },
  connectionTimeoutMillis: 10000,
  query_timeout: 10000
});

async function consultarCalificaciones() {
  try {
    await client.connect();
    console.log('📊 ESTRUCTURA DE TABLAS DE EVALUACIÓN\n');

    // Tabla Calificacion
    console.log('═'.repeat(70));
    console.log('📋 TABLA: Calificacion');
    console.log('═'.repeat(70));
    const calificacion = await client.query(`
      SELECT column_name, data_type, is_nullable
      FROM information_schema.columns 
      WHERE table_name = 'Calificacion'
      ORDER BY ordinal_position;
    `);
    calificacion.rows.forEach(col => {
      console.log(`  ${col.column_name.padEnd(30)} ${col.data_type.padEnd(25)} ${col.is_nullable === 'NO' ? 'NOT NULL' : 'NULL'}`);
    });

    // Tabla SubCalificacion
    console.log('\n' + '═'.repeat(70));
    console.log('📋 TABLA: SubCalificacion');
    console.log('═'.repeat(70));
    const subCalificacion = await client.query(`
      SELECT column_name, data_type, is_nullable
      FROM information_schema.columns 
      WHERE table_name = 'SubCalificacion'
      ORDER BY ordinal_position;
    `);
    subCalificacion.rows.forEach(col => {
      console.log(`  ${col.column_name.padEnd(30)} ${col.data_type.padEnd(25)} ${col.is_nullable === 'NO' ? 'NOT NULL' : 'NULL'}`);
    });

    // Tabla TipoCalificacion
    console.log('\n' + '═'.repeat(70));
    console.log('📋 TABLA: TipoCalificacion');
    console.log('═'.repeat(70));
    const tipoCalificacion = await client.query(`
      SELECT column_name, data_type, is_nullable
      FROM information_schema.columns 
      WHERE table_name = 'TipoCalificacion'
      ORDER BY ordinal_position;
    `);
    tipoCalificacion.rows.forEach(col => {
      console.log(`  ${col.column_name.padEnd(30)} ${col.data_type.padEnd(25)} ${col.is_nullable === 'NO' ? 'NOT NULL' : 'NULL'}`);
    });

    // Verificar relaciones (foreign keys)
    console.log('\n' + '═'.repeat(70));
    console.log('🔗 RELACIONES (Foreign Keys)');
    console.log('═'.repeat(70));
    const fks = await client.query(`
      SELECT
        tc.table_name as tabla_origen,
        kcu.column_name as columna,
        ccu.table_name AS tabla_referencia,
        ccu.column_name AS columna_referencia
      FROM information_schema.table_constraints AS tc
      JOIN information_schema.key_column_usage AS kcu
        ON tc.constraint_name = kcu.constraint_name
      JOIN information_schema.constraint_column_usage AS ccu
        ON ccu.constraint_name = tc.constraint_name
      WHERE tc.constraint_type = 'FOREIGN KEY'
      AND tc.table_name IN ('Calificacion', 'SubCalificacion', 'TipoCalificacion')
      ORDER BY tc.table_name, kcu.column_name;
    `);
    
    fks.rows.forEach(fk => {
      console.log(`  ${fk.tabla_origen}.${fk.columna} → ${fk.tabla_referencia}.${fk.columna_referencia}`);
    });

    // Consultar datos de ejemplo
    console.log('\n' + '═'.repeat(70));
    console.log('📊 DATOS DE EJEMPLO (primeros 3 registros)');
    console.log('═'.repeat(70));
    
    const ejemplos = await client.query(`
      SELECT 
        c.*,
        p.nombre as nombre_proyecto
      FROM "Calificacion" c
      LEFT JOIN "Proyecto" p ON c."idProyecto" = p."idProyecto"
      LIMIT 3;
    `);

    if (ejemplos.rows.length > 0) {
      console.log('\n🔍 Calificaciones encontradas:');
      ejemplos.rows.forEach((row, idx) => {
        console.log(`\n  ${idx + 1}. Proyecto: ${row.nombre_proyecto || 'N/A'}`);
        Object.keys(row).forEach(key => {
          if (key !== 'nombre_proyecto') {
            console.log(`     ${key}: ${row[key]}`);
          }
        });
      });
    } else {
      console.log('  ℹ️  No hay calificaciones registradas aún');
    }

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

consultarCalificaciones();
