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

async function inspectTables() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway PostgreSQL\n');

    // Ver estructura de Proyecto
    console.log('📋 Estructura de tabla Proyecto:');
    const proyectoColumns = await client.query(`
      SELECT 
        column_name, 
        data_type,
        column_default,
        is_nullable,
        character_maximum_length
      FROM information_schema.columns 
      WHERE table_name = 'Proyecto'
      ORDER BY ordinal_position;
    `);
    
    proyectoColumns.rows.forEach(col => {
      console.log(`  ${col.column_name.padEnd(25)} ${col.data_type.padEnd(20)} ${col.is_nullable === 'YES' ? 'NULL' : 'NOT NULL'}`);
    });

    // Ver estructura de Feria
    console.log('\n📋 Estructura de tabla Feria:');
    const feriaColumns = await client.query(`
      SELECT 
        column_name, 
        data_type,
        column_default,
        is_nullable,
        character_maximum_length
      FROM information_schema.columns 
      WHERE table_name = 'Feria'
      ORDER BY ordinal_position;
    `);
    
    feriaColumns.rows.forEach(col => {
      console.log(`  ${col.column_name.padEnd(25)} ${col.data_type.padEnd(20)} ${col.is_nullable === 'YES' ? 'NULL' : 'NOT NULL'}`);
    });

    // Ver llaves primarias
    console.log('\n🔑 Llaves primarias:');
    const pks = await client.query(`
      SELECT 
        tc.table_name, 
        kcu.column_name
      FROM information_schema.table_constraints tc
      JOIN information_schema.key_column_usage kcu 
        ON tc.constraint_name = kcu.constraint_name
      WHERE tc.constraint_type = 'PRIMARY KEY'
        AND tc.table_name IN ('Proyecto', 'Feria');
    `);
    
    pks.rows.forEach(pk => {
      console.log(`  ${pk.table_name}: ${pk.column_name}`);
    });

    await client.end();

  } catch (err) {
    console.error('❌ Error:', err.message);
    process.exit(1);
  }
}

inspectTables();
