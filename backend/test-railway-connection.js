import pkg from 'pg';
const { Client } = pkg;

const client = new Client({
  host: 'centerbeam.proxy.rlwy.net',
  port: 52280,
  database: 'railway',
  user: 'postgres',
  password: 'YsplMMdVfiIeeStcKPbyHLtZGZHRcMCC',
  ssl: {
    rejectUnauthorized: false
  }
});

async function testConnection() {
  try {
    await client.connect();
    console.log('✅ Conexión exitosa a Railway PostgreSQL\n');

    // Verificar versión
    const version = await client.query('SELECT version()');
    console.log('📊 Versión PostgreSQL:');
    console.log(version.rows[0].version.substring(0, 50) + '...\n');

    // Listar tablas
    const tables = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' 
      ORDER BY table_name
    `);

    console.log('📋 Tablas disponibles:');
    if (tables.rows.length === 0) {
      console.log('  ⚠️ No hay tablas creadas aún');
      console.log('  💡 Ejecuta las migraciones primero');
    } else {
      tables.rows.forEach(t => console.log('  ✓', t.table_name));
    }

    // Contar registros en cada tabla
    if (tables.rows.length > 0) {
      console.log('\n📊 Conteo de registros:');
      for (const table of tables.rows) {
        const count = await client.query(`SELECT COUNT(*) FROM ${table.table_name}`);
        console.log(`  ${table.table_name}: ${count.rows[0].count} registros`);
      }
    }

    await client.end();
    console.log('\n✅ Conexión cerrada correctamente');

  } catch (err) {
    console.error('❌ Error de conexión:', err.message);
    console.error('Stack:', err.stack);
    process.exit(1);
  }
}

testConnection();
