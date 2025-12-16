import pkg from 'pg';
const { Pool } = pkg;

// Configuración Railway
const pool = new Pool({
  host: 'centerbeam.proxy.rlwy.net',
  port: 52280,
  database: 'railway',
  user: 'postgres',
  password: 'FEDdzEhGXTNVqxGCUiTxJMDfSQHqkPbF',
  ssl: { rejectUnauthorized: false }
});

async function testListarFerias() {
  try {
    console.log('🔍 Probando endpoint listarFerias...\n');

    // Simular la query del backend actualizado
    const isRailway = true;
    const queryText = isRailway
      ? 'SELECT "idFeria" as id, nombre, semestre, año, estado, "fechaCreacion" as fecha_creacion FROM "Feria" ORDER BY año DESC, semestre DESC'
      : 'SELECT * FROM ferias ORDER BY año DESC, semestre DESC';

    console.log('Query ejecutada:');
    console.log(queryText);
    console.log();

    const result = await pool.query(queryText);

    console.log(`✅ Ferias encontradas: ${result.rows.length}\n`);

    if (result.rows.length > 0) {
      console.log('📋 Datos que recibirá el dashboard:');
      result.rows.forEach((feria, idx) => {
        console.log(`\n${idx + 1}. ${feria.nombre}`);
        console.log(`   - ID: ${feria.id}`);
        console.log(`   - Semestre: ${feria.semestre}`);
        console.log(`   - Año: ${feria.año}`);
        console.log(`   - Estado: ${feria.estado}`);
        console.log(`   - Fecha: ${feria.fecha_creacion}`);
      });
    }

    console.log('\n✅ Test completado exitosamente');
    console.log('El dashboard debería mostrar estos datos correctamente');

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await pool.end();
  }
}

testListarFerias();
