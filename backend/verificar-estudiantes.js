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

async function verificarEstudiantes() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway\n');

    // 1. Ver estructura de EstudianteProyecto
    console.log('📋 Tabla EstudianteProyecto:');
    const estructuraEP = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'EstudianteProyecto'
      ORDER BY ordinal_position;
    `);
    estructuraEP.rows.forEach(col => console.log(`   ${col.column_name}: ${col.data_type}`));

    // 2. Ver estructura de Estudiante
    console.log('\n📋 Tabla Estudiante:');
    const estructuraE = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'Estudiante'
      ORDER BY ordinal_position;
    `);
    estructuraE.rows.forEach(col => console.log(`   ${col.column_name}: ${col.data_type}`));

    // 3. Tomar un proyecto de ejemplo
    const proyectoEjemplo = await client.query(`
      SELECT "idProyecto", nombre 
      FROM "Proyecto" 
      LIMIT 1
    `);

    if (proyectoEjemplo.rows.length > 0) {
      const proyecto = proyectoEjemplo.rows[0];
      console.log(`\n🔍 Proyecto ejemplo: "${proyecto.nombre}" (${proyecto.idProyecto})\n`);

      // 4. Buscar estudiantes de ese proyecto
      const estudiantes = await client.query(`
        SELECT 
          e."idEstudiante",
          e."nombre",
          e."apellidoPaterno",
          e."apellidoMaterno",
          e."codigo",
          ep."idEstudianteProyecto"
        FROM "EstudianteProyecto" ep
        INNER JOIN "Estudiante" e ON ep."idEstudiante" = e."idEstudiante"
        WHERE ep."idProyecto" = $1
      `, [proyecto.idProyecto]);

      console.log(`📊 Estudiantes en este proyecto: ${estudiantes.rows.length}`);
      if (estudiantes.rows.length > 0) {
        estudiantes.rows.forEach((est, idx) => {
          console.log(`   ${idx + 1}. ${est.nombre} ${est.apellidoPaterno} ${est.apellidoMaterno} (${est.codigo})`);
        });
      }

      // 5. Query completa que debería usar el backend
      console.log('\n✅ Query correcta para obtener proyecto con estudiantes:');
      console.log(`
SELECT 
  p."idProyecto" as id,
  p.nombre,
  p.descripcion,
  p."estaAprobado" as aprobado,
  json_agg(
    json_build_object(
      'id', e."idEstudiante",
      'nombre', e.nombre,
      'apellidoPaterno', e."apellidoPaterno",
      'apellidoMaterno', e."apellidoMaterno",
      'codigo', e.codigo
    )
  ) as estudiantes
FROM "Proyecto" p
LEFT JOIN "EstudianteProyecto" ep ON p."idProyecto" = ep."idProyecto"
LEFT JOIN "Estudiante" e ON ep."idEstudiante" = e."idEstudiante"
WHERE p."idProyecto" = '${proyecto.idProyecto}'
GROUP BY p."idProyecto", p.nombre, p.descripcion, p."estaAprobado"
      `);

      // 6. Probar esa query
      const proyectoCompleto = await client.query(`
        SELECT 
          p."idProyecto" as id,
          p.nombre,
          p.descripcion,
          p."estaAprobado" as aprobado,
          json_agg(
            json_build_object(
              'id', e."idEstudiante",
              'nombre', e.nombre,
              'apellidoPaterno', e."apellidoPaterno",
              'apellidoMaterno', e."apellidoMaterno",
              'codigo', e.codigo
            )
          ) FILTER (WHERE e."idEstudiante" IS NOT NULL) as estudiantes
        FROM "Proyecto" p
        LEFT JOIN "EstudianteProyecto" ep ON p."idProyecto" = ep."idProyecto"
        LEFT JOIN "Estudiante" e ON ep."idEstudiante" = e."idEstudiante"
        WHERE p."idProyecto" = $1
        GROUP BY p."idProyecto", p.nombre, p.descripcion, p."estaAprobado"
      `, [proyecto.idProyecto]);

      console.log('\n📦 Resultado de la query:');
      console.log(JSON.stringify(proyectoCompleto.rows[0], null, 2));
    }

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

verificarEstudiantes();
