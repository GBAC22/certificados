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
  ssl: { rejectUnauthorized: false },
  connectionTimeoutMillis: 10000,
  query_timeout: 10000
});

async function verificarEstructuraGrupoMateria() {
  try {
    await client.connect();
    
    console.log('📋 ESTRUCTURA DE LA TABLA GrupoMateria');
    console.log('═'.repeat(80));
    
    const columns = await client.query(`
      SELECT column_name, data_type, is_nullable
      FROM information_schema.columns 
      WHERE table_name = 'GrupoMateria'
      ORDER BY ordinal_position;
    `);
    
    columns.rows.forEach(col => {
      console.log(`  ${col.column_name.padEnd(30)} ${col.data_type.padEnd(25)} ${col.is_nullable === 'NO' ? 'NOT NULL' : 'NULL'}`);
    });

    console.log('\n📊 DATOS DE EJEMPLO (primeros 5 registros):');
    console.log('─'.repeat(80));
    
    const ejemplos = await client.query(`
      SELECT 
        gm.*,
        m.nombre as materia_nombre
      FROM "GrupoMateria" gm
      JOIN "Materia" m ON gm."idMateria" = m."idMateria"
      LIMIT 5;
    `);
    
    ejemplos.rows.forEach((row, idx) => {
      console.log(`\n${idx + 1}. GrupoMateria ID: ${row.idGrupoMateria}`);
      Object.keys(row).forEach(key => {
        if (key !== 'idGrupoMateria') {
          console.log(`   ${key}: ${row[key]}`);
        }
      });
    });

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

verificarEstructuraGrupoMateria();
