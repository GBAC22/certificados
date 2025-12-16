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

async function verDatos() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway PostgreSQL\n');

    // Ver Ferias
    console.log('========================================');
    console.log('📅 FERIAS');
    console.log('========================================');
    const ferias = await client.query(`
      SELECT 
        "idFeria",
        nombre,
        semestre,
        año,
        estado,
        "fechaCreacion"
      FROM "Feria"
      ORDER BY año DESC, semestre DESC
      LIMIT 10
    `);
    
    if (ferias.rows.length === 0) {
      console.log('⚠️  No hay ferias registradas\n');
    } else {
      ferias.rows.forEach(f => {
        console.log(`\n📌 ${f.nombre}`);
        console.log(`   ID: ${f.idFeria}`);
        console.log(`   Semestre: ${f.semestre} - ${f.año}`);
        console.log(`   Estado: ${f.estado}`);
        console.log(`   Creación: ${f.fechaCreacion?.toLocaleDateString('es-ES') || 'N/A'}`);
      });
    }

    // Ver Proyectos
    console.log('\n========================================');
    console.log('📚 PROYECTOS (últimos 10)');
    console.log('========================================');
    const proyectos = await client.query(`
      SELECT 
        p."idProyecto",
        p.nombre,
        p.descripcion,
        p."estaAprobado",
        p."esFinal",
        gm."idGrupoMateria",
        p."fechaCreacion"
      FROM "Proyecto" p
      LEFT JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
      ORDER BY p."fechaCreacion" DESC
      LIMIT 10
    `);
    
    if (proyectos.rows.length === 0) {
      console.log('⚠️  No hay proyectos registrados\n');
    } else {
      proyectos.rows.forEach(p => {
        console.log(`\n📘 ${p.nombre}`);
        console.log(`   ID: ${p.idProyecto.substring(0, 8)}...`);
        console.log(`   Descripción: ${p.descripcion?.substring(0, 60)}...`);
        console.log(`   Aprobado: ${p.estaAprobado ? '✅' : '❌'}`);
        console.log(`   Final: ${p.esFinal ? '✅' : '❌'}`);
        console.log(`   Creación: ${p.fechaCreacion?.toLocaleDateString('es-ES') || 'N/A'}`);
      });
    }

    // Ver Certificados
    console.log('\n========================================');
    console.log('🎓 CERTIFICADOS');
    console.log('========================================');
    const certificados = await client.query(`
      SELECT 
        id,
        codigo,
        estado,
        fecha_emision,
        tx_hash
      FROM certificados
      ORDER BY fecha_emision DESC
      LIMIT 10
    `);
    
    if (certificados.rows.length === 0) {
      console.log('⚠️  No hay certificados generados aún\n');
    } else {
      certificados.rows.forEach(c => {
        console.log(`\n🎖️  ${c.codigo}`);
        console.log(`   ID: ${c.id.substring(0, 8)}...`);
        console.log(`   Estado: ${c.estado}`);
        console.log(`   Emisión: ${c.fecha_emision?.toLocaleDateString('es-ES') || 'N/A'}`);
        console.log(`   Blockchain: ${c.tx_hash ? '✅' : '❌'}`);
      });
    }

    // Relación Proyecto -> Feria
    console.log('\n========================================');
    console.log('🔗 RELACIÓN: Proyectos con sus Ferias');
    console.log('========================================');
    const relaciones = await client.query(`
      SELECT 
        p."idProyecto",
        p.nombre as proyecto_nombre,
        p."estaAprobado",
        f."idFeria",
        f.nombre as feria_nombre,
        f.estado as feria_estado
      FROM "Proyecto" p
      JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
      JOIN "Materia" m ON gm."idMateria" = m."idMateria"
      JOIN "Semestre" s ON m."idSemestre" = s."idSemestre"
      JOIN "Feria" f ON s."idFeria" = f."idFeria"
      ORDER BY f.año DESC, f.semestre DESC, p.nombre
      LIMIT 10
    `);

    if (relaciones.rows.length === 0) {
      console.log('⚠️  No hay proyectos vinculados a ferias\n');
    } else {
      relaciones.rows.forEach(r => {
        console.log(`\n🔗 ${r.proyecto_nombre}`);
        console.log(`   Feria: ${r.feria_nombre}`);
        console.log(`   Estado Feria: ${r.feria_estado}`);
        console.log(`   Proyecto Aprobado: ${r.estaAprobado ? '✅' : '❌'}`);
        console.log(`   Puede generar certificado: ${r.feria_estado === 'Finalizado' && r.estaAprobado ? '✅ SÍ' : '❌ NO'}`);
      });
    }

    // Resumen
    console.log('\n========================================');
    console.log('📊 RESUMEN GENERAL');
    console.log('========================================');
    
    const resumen = await client.query(`
      SELECT 
        (SELECT COUNT(*) FROM "Feria") as total_ferias,
        (SELECT COUNT(*) FROM "Feria" WHERE estado = 'Finalizado') as ferias_finalizadas,
        (SELECT COUNT(*) FROM "Proyecto") as total_proyectos,
        (SELECT COUNT(*) FROM "Proyecto" WHERE "estaAprobado" = true) as proyectos_aprobados,
        (SELECT COUNT(*) FROM certificados) as total_certificados,
        (SELECT COUNT(*) FROM certificados WHERE estado = 'oficial') as certificados_oficiales
    `);

    const stats = resumen.rows[0];
    console.log(`\n📈 Estadísticas:`);
    console.log(`   Total Ferias: ${stats.total_ferias}`);
    console.log(`   Ferias Finalizadas: ${stats.ferias_finalizadas}`);
    console.log(`   Total Proyectos: ${stats.total_proyectos}`);
    console.log(`   Proyectos Aprobados: ${stats.proyectos_aprobados}`);
    console.log(`   Total Certificados: ${stats.total_certificados}`);
    console.log(`   Certificados Oficiales: ${stats.certificados_oficiales}\n`);

    await client.end();

  } catch (err) {
    console.error('❌ Error:', err.message);
    console.error('Stack:', err.stack);
    process.exit(1);
  }
}

verDatos();
