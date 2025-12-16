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

async function consultarEsquema() {
  try {
    console.log('🔌 Conectando a Railway...');
    await client.connect();
    console.log('✅ Conectado\n');

    // Consultar TODAS las columnas de la tabla Proyecto
    console.log('📋 COLUMNAS DE LA TABLA "Proyecto":');
    console.log('='.repeat(60));
    const proyectoColumns = await client.query(`
      SELECT column_name, data_type, is_nullable, column_default
      FROM information_schema.columns 
      WHERE table_name = 'Proyecto'
      ORDER BY ordinal_position;
    `);

    if (proyectoColumns.rows.length === 0) {
      console.log('❌ Tabla "Proyecto" no encontrada');
    } else {
      proyectoColumns.rows.forEach((col, idx) => {
        console.log(`${idx + 1}. ${col.column_name}`);
        console.log(`   Tipo: ${col.data_type}`);
        console.log(`   Nullable: ${col.is_nullable}`);
        if (col.column_default) console.log(`   Default: ${col.column_default}`);
        console.log('');
      });
    }

    // Buscar tablas relacionadas con evaluación
    console.log('\n🔍 TABLAS RELACIONADAS CON EVALUACIÓN:');
    console.log('='.repeat(60));
    const tablasEval = await client.query(`
      SELECT table_name
      FROM information_schema.tables
      WHERE table_schema = 'public'
      AND (
        table_name ILIKE '%evaluacion%' OR 
        table_name ILIKE '%calificacion%' OR 
        table_name ILIKE '%jurado%' OR
        table_name ILIKE '%nota%' OR
        table_name ILIKE '%puntuacion%' OR
        table_name ILIKE '%puntaje%'
      )
      ORDER BY table_name;
    `);

    if (tablasEval.rows.length === 0) {
      console.log('❌ No se encontraron tablas de evaluación\n');
    } else {
      tablasEval.rows.forEach(t => console.log(`   ✓ ${t.table_name}`));
      console.log('');
    }

    // Listar TODAS las tablas disponibles
    console.log('\n📚 TODAS LAS TABLAS EN LA BASE DE DATOS:');
    console.log('='.repeat(60));
    const todasTablas = await client.query(`
      SELECT table_name
      FROM information_schema.tables
      WHERE table_schema = 'public'
      ORDER BY table_name;
    `);

    todasTablas.rows.forEach(t => console.log(`   - ${t.table_name}`));

  } catch (error) {
    console.error('❌ Error:', error.message);
    if (error.code) console.error('Código:', error.code);
  } finally {
    await client.end();
    console.log('\n🔌 Conexión cerrada');
  }
}

consultarEsquema();
