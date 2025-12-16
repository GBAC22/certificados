import pkg from 'pg';
const { Client } = pkg;

async function verificarSchemaLocal() {
  const client = new Client({
    host: 'localhost',
    port: 5432,
    database: 'proyecto_certificados',
    user: 'postgres',
    password: 'admin'
  });

  try {
    await client.connect();
    console.log('🔌 Conectado a PostgreSQL local\n');

    // Verificar si hay tabla proyectos
    const tablas = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' 
      AND table_name LIKE '%proyect%'
    `);
    console.log('📋 Tablas relacionadas a proyectos:');
    console.log(tablas.rows);

    // Verificar columnas de proyectos
    if (tablas.rows.some(t => t.table_name === 'proyectos')) {
      const columnas = await client.query(`
        SELECT column_name, data_type 
        FROM information_schema.columns 
        WHERE table_name = 'proyectos'
      `);
      console.log('\n📊 Columnas de tabla proyectos:');
      console.log(columnas.rows);

      // Ver un proyecto de ejemplo
      const ejemplo = await client.query('SELECT * FROM proyectos LIMIT 1');
      console.log('\n📄 Proyecto de ejemplo:');
      console.log(ejemplo.rows[0]);
    }

    // Verificar tablas de estudiantes
    const estudiantes = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' 
      AND (table_name LIKE '%estudiante%' OR table_name LIKE '%student%')
    `);
    console.log('\n👨‍🎓 Tablas relacionadas a estudiantes:');
    console.log(estudiantes.rows);

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

verificarSchemaLocal();
