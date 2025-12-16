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

async function analizarRelaciones() {
  try {
    await client.connect();
    
    console.log('🔗 RELACIÓN COMPLETA PARA OBTENER CALIFICACIONES DE UN PROYECTO\n');
    console.log('═'.repeat(80));

    // Verificar DocenteProyecto
    console.log('\n📋 TABLA: DocenteProyecto (tabla intermedia)');
    console.log('─'.repeat(80));
    const docenteProyecto = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'DocenteProyecto'
      ORDER BY ordinal_position;
    `);
    docenteProyecto.rows.forEach(col => {
      console.log(`  ${col.column_name.padEnd(30)} ${col.data_type}`);
    });

    // Mostrar el flujo de relaciones
    console.log('\n' + '═'.repeat(80));
    console.log('📊 FLUJO DE DATOS: Proyecto → Calificaciones');
    console.log('═'.repeat(80));
    console.log(`
  Proyecto
     ↓ (idProyecto)
  DocenteProyecto  ← (idDocenteProyecto es la clave)
     ↓
  Calificacion
     ↓ (idSubCalificacion)
  SubCalificacion
     ↓ (idTipoCalificacion)
  TipoCalificacion (nombre: tipo de evaluación)
    `);

    // Consulta de ejemplo para obtener calificaciones de un proyecto
    console.log('\n' + '═'.repeat(80));
    console.log('💡 CONSULTA PARA OBTENER CALIFICACIONES DE UN PROYECTO:');
    console.log('═'.repeat(80));
    console.log(`
SELECT 
  p.nombre as proyecto,
  tc.nombre as tipo_evaluacion,
  sc.nombre as criterio,
  sc."maximoPuntaje" as puntaje_maximo,
  c."puntajeObtenido" as puntaje_obtenido,
  c.calificado
FROM "Proyecto" p
JOIN "DocenteProyecto" dp ON p."idProyecto" = dp."idProyecto"
JOIN "Calificacion" c ON dp."idDocenteProyecto" = c."idDocenteProyecto"
JOIN "SubCalificacion" sc ON c."idSubCalificacion" = sc."idSubCalificacion"
JOIN "TipoCalificacion" tc ON sc."idTipoCalificacion" = tc."idTipoCalificacion"
WHERE p."idProyecto" = 'UUID_DEL_PROYECTO';
    `);

    // Intentar obtener datos reales
    console.log('\n' + '═'.repeat(80));
    console.log('🔍 DATOS REALES (si existen):');
    console.log('═'.repeat(80));
    
    const datosReales = await client.query(`
      SELECT 
        p.nombre as proyecto,
        tc.nombre as tipo_evaluacion,
        sc.nombre as criterio,
        sc."maximoPuntaje" as puntaje_maximo,
        c."puntajeObtenido" as puntaje_obtenido,
        c.calificado
      FROM "Proyecto" p
      JOIN "DocenteProyecto" dp ON p."idProyecto" = dp."idProyecto"
      JOIN "Calificacion" c ON dp."idDocenteProyecto" = c."idDocenteProyecto"
      JOIN "SubCalificacion" sc ON c."idSubCalificacion" = sc."idSubCalificacion"
      JOIN "TipoCalificacion" tc ON sc."idTipoCalificacion" = tc."idTipoCalificacion"
      WHERE c.calificado = true
      LIMIT 5;
    `);

    if (datosReales.rows.length > 0) {
      console.log('\n✅ Calificaciones encontradas:');
      datosReales.rows.forEach((row, idx) => {
        console.log(`\n  ${idx + 1}. ${row.proyecto}`);
        console.log(`     Tipo: ${row.tipo_evaluacion}`);
        console.log(`     Criterio: ${row.criterio}`);
        console.log(`     Puntaje: ${row.puntaje_obtenido}/${row.puntaje_maximo}`);
      });
    } else {
      console.log('\n  ℹ️  No hay calificaciones registradas todavía');
    }

    // Verificar TipoCalificacion para entender qué tipos existen
    console.log('\n' + '═'.repeat(80));
    console.log('📚 TIPOS DE CALIFICACIÓN DISPONIBLES:');
    console.log('═'.repeat(80));
    const tipos = await client.query(`
      SELECT nombre FROM "TipoCalificacion" ORDER BY nombre;
    `);
    
    if (tipos.rows.length > 0) {
      tipos.rows.forEach(t => console.log(`  ✓ ${t.nombre}`));
    } else {
      console.log('  ℹ️  No hay tipos de calificación configurados');
    }

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

analizarRelaciones();
