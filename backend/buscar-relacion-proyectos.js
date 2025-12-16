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

async function buscarRelacionDirecta() {
  try {
    await client.connect();
    console.log('✅ Conectado\n');

    // Buscar si hay alguna tabla que relacione Proyecto con Feria directamente
    console.log('🔍 BUSCANDO TABLAS CON FOREIGN KEYS A Proyecto Y Feria:\n');
    
    const fkQuery = await client.query(`
      SELECT
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
        AND (ccu.table_name = 'Proyecto' OR ccu.table_name = 'Feria')
      ORDER BY tc.table_name, kcu.column_name
    `);

    console.log('Relaciones encontradas:');
    fkQuery.rows.forEach(row => {
      console.log(`  ${row.table_name}.${row.column_name} → ${row.foreign_table_name}.${row.foreign_column_name}`);
    });

    // Verificar si los proyectos tienen alguna columna que referencie ferias
    console.log('\n📋 COLUMNAS DE LA TABLA Proyecto:');
    const colsProyecto = await client.query(`
      SELECT column_name, data_type, is_nullable
      FROM information_schema.columns
      WHERE table_name = 'Proyecto'
      ORDER BY ordinal_position
    `);
    colsProyecto.rows.forEach(col => {
      console.log(`  - ${col.column_name} (${col.data_type})`);
    });

    // Verificar columnas de GrupoMateria
    console.log('\n📋 COLUMNAS DE LA TABLA GrupoMateria:');
    const colsGrupo = await client.query(`
      SELECT column_name, data_type
      FROM information_schema.columns
      WHERE table_name = 'GrupoMateria'
      ORDER BY ordinal_position
    `);
    colsGrupo.rows.forEach(col => {
      console.log(`  - ${col.column_name} (${col.data_type})`);
    });

    // Ver una muestra de GrupoMateria
    console.log('\n🔬 MUESTRA DE GrupoMateria (primeros 3):');
    const grupoSample = await client.query(`
      SELECT * FROM "GrupoMateria" LIMIT 3
    `);
    grupoSample.rows.forEach((g, idx) => {
      console.log(`\n${idx + 1}.`, JSON.stringify(g, null, 2));
    });

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

buscarRelacionDirecta();
