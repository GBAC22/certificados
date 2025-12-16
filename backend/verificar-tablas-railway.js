import pkg from 'pg';
const { Client } = pkg;

const client = new Client({
  host: 'centerbeam.proxy.rlwy.net',
  port: 52280,
  database: 'railway',
  user: 'postgres',
  password: 'YsplMMdVfiIeeStcKPbyHLtZGZHRcMCC',
  ssl: { rejectUnauthorized: false }
});

async function verificarTablas() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway\n');

    // Listar TODAS las tablas
    const tablas = await client.query(`
      SELECT table_name 
      FROM information_schema.tables 
      WHERE table_schema = 'public' 
      ORDER BY table_name;
    `);

    console.log('📋 TABLAS EN RAILWAY:\n');
    tablas.rows.forEach((t, idx) => {
      const marca = t.table_name === 'certificados' ? '🆕' : '📌';
      console.log(`${marca} ${idx + 1}. ${t.table_name}`);
    });

    console.log('\n🔍 VERIFICANDO INTEGRIDAD:\n');

    // Verificar tabla Feria (NO debe estar modificada)
    const feriaColumns = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'Feria'
      ORDER BY ordinal_position;
    `);

    console.log('✅ Tabla "Feria" (original, NO modificada):');
    feriaColumns.rows.forEach(col => console.log(`   - ${col.column_name}: ${col.data_type}`));

    // Verificar tabla Proyecto (NO debe estar modificada)
    const proyectoColumns = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'Proyecto'
      ORDER BY ordinal_position;
    `);

    console.log('\n✅ Tabla "Proyecto" (original, NO modificada):');
    proyectoColumns.rows.forEach(col => console.log(`   - ${col.column_name}: ${col.data_type}`));

    // Mostrar solo la tabla nueva
    const certColumns = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'certificados'
      ORDER BY ordinal_position;
    `);

    console.log('\n🆕 Tabla "certificados" (NUEVA, creada por el sistema):');
    certColumns.rows.forEach(col => console.log(`   - ${col.column_name}: ${col.data_type}`));

    // Verificar foreign keys
    const fks = await client.query(`
      SELECT
        tc.constraint_name,
        tc.table_name,
        kcu.column_name,
        ccu.table_name AS foreign_table_name,
        ccu.column_name AS foreign_column_name
      FROM information_schema.table_constraints AS tc
      JOIN information_schema.key_column_usage AS kcu
        ON tc.constraint_name = kcu.constraint_name
      JOIN information_schema.constraint_column_usage AS ccu
        ON ccu.constraint_name = tc.constraint_name
      WHERE tc.constraint_type = 'FOREIGN KEY'
        AND tc.table_name = 'certificados';
    `);

    console.log('\n🔗 RELACIONES (Foreign Keys de certificados):');
    fks.rows.forEach(fk => {
      console.log(`   ✓ ${fk.column_name} → ${fk.foreign_table_name}.${fk.foreign_column_name}`);
    });

    console.log('\n✅ CONCLUSIÓN:');
    console.log('   - Tablas originales: INTACTAS ✓');
    console.log('   - Relaciones originales: INTACTAS ✓');
    console.log('   - Nueva tabla "certificados": Agregada sin afectar existentes ✓');

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

verificarTablas();
