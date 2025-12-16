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

async function verEnum() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway PostgreSQL\n');

    // Ver valores del enum estado
    console.log('📋 Valores permitidos para estado de Feria:');
    const enumValues = await client.query(`
      SELECT e.enumlabel as valor
      FROM pg_type t 
      JOIN pg_enum e ON t.oid = e.enumtypid  
      WHERE t.typname = 'enum_Feria_estado'
      ORDER BY e.enumsortorder;
    `);

    enumValues.rows.forEach(v => {
      console.log(`  - ${v.valor}`);
    });

    // Ver estados actuales de las ferias
    console.log('\n📅 Estados actuales de las ferias:');
    const ferias = await client.query('SELECT nombre, estado FROM "Feria"');
    ferias.rows.forEach(f => {
      console.log(`  ${f.nombre}: ${f.estado}`);
    });

    await client.end();

  } catch (err) {
    console.error('❌ Error:', err.message);
    process.exit(1);
  }
}

verEnum();
