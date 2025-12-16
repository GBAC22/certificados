import pkg from 'pg';
const { Client } = pkg;

// Verificar datos del proyecto para generar certificado
async function verificarDatosParaCertificado() {
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

  try {
    await client.connect();
    console.log('🔌 Conectado a Railway PostgreSQL\n');

    // Obtener un proyecto aprobado de ejemplo
    const proyecto = await client.query(`
      SELECT p."idProyecto" as id, p.nombre, p."estaAprobado" as aprobado
      FROM "Proyecto" p
      WHERE p."estaAprobado" = true
      LIMIT 1
    `);

    if (proyecto.rows.length === 0) {
      console.log('❌ No hay proyectos aprobados');
      return;
    }

    const proyectoId = proyecto.rows[0].id;
    console.log('📋 Proyecto seleccionado:');
    console.log(`   ID: ${proyectoId}`);
    console.log(`   Nombre: ${proyecto.rows[0].nombre}`);
    console.log(`   Aprobado: ${proyecto.rows[0].aprobado}`);

    // Simular la query que usa generarCertificado
    console.log('\n🔍 Ejecutando query de certificado (con estudiantes)...');
    const result = await client.query(`
      SELECT 
        p."idProyecto" as id,
        p.nombre,
        p.descripcion,
        p."estaAprobado" as aprobado,
        p."idGrupoMateria",
        json_agg(
          json_build_object(
            'id', e."idEstudiante",
            'codigo', e."codigoEstudiante",
            'nombre', u.nombre,
            'apellido', u.apellido,
            'email', u.correo
          )
        ) FILTER (WHERE e."idEstudiante" IS NOT NULL) as estudiantes_json
      FROM "Proyecto" p
      LEFT JOIN "EstudianteProyecto" ep ON p."idProyecto" = ep."idProyecto"
      LEFT JOIN "Estudiante" e ON ep."idEstudiante" = e."idEstudiante"
      LEFT JOIN "Usuario" u ON e."idUsuario" = u."idUsuario"
      WHERE p."idProyecto" = $1
      GROUP BY p."idProyecto"
    `, [proyectoId]);

    console.log('\n✅ Datos obtenidos:');
    console.log(JSON.stringify(result.rows[0], null, 2));

    // Verificar campos necesarios para el PDF
    const datos = result.rows[0];
    console.log('\n📊 Validación de campos:');
    console.log(`   ✓ ID: ${datos.id ? '✅' : '❌'}`);
    console.log(`   ✓ Nombre: ${datos.nombre ? '✅' : '❌'}`);
    console.log(`   ✓ Descripción: ${datos.descripcion ? '✅' : '❌'}`);
    console.log(`   ✓ Aprobado: ${datos.aprobado ? '✅' : '❌'}`);
    console.log(`   ✓ Estudiantes: ${datos.estudiantes_json && datos.estudiantes_json.length > 0 ? `✅ (${datos.estudiantes_json.length})` : '❌'}`);

    if (datos.estudiantes_json && datos.estudiantes_json.length > 0) {
      console.log('\n👨‍🎓 Estudiantes encontrados:');
      datos.estudiantes_json.forEach((est, idx) => {
        console.log(`   ${idx + 1}. ${est.nombre} ${est.apellido} (${est.codigo})`);
      });
    }

    // Verificar feria del proyecto
    console.log('\n🎪 Buscando feria asociada...');
    const feria = await client.query(`
      SELECT f.* 
      FROM "Feria" f
      JOIN "Semestre" s ON s."idFeria" = f."idFeria"
      JOIN "Materia" m ON m."idSemestre" = s."idSemestre"
      JOIN "GrupoMateria" gm ON gm."idMateria" = m."idMateria"
      WHERE gm."idGrupoMateria" = $1
      LIMIT 1
    `, [datos.idGrupoMateria]);

    if (feria.rows.length > 0) {
      console.log('   ✅ Feria encontrada:');
      console.log(`      Nombre: ${feria.rows[0].nombre}`);
      console.log(`      Semestre: ${feria.rows[0].semestre}`);
      console.log(`      Año: ${feria.rows[0].año}`);
      console.log(`      Estado: ${feria.rows[0].estado}`);
    } else {
      console.log('   ❌ No se encontró feria asociada');
    }

  } catch (error) {
    console.error('❌ Error:', error.message);
    console.error(error);
  } finally {
    await client.end();
  }
}

verificarDatosParaCertificado();
