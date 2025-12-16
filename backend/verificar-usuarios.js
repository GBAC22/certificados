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

async function verificarUsuarios() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway\n');

    // Ver estructura de Usuario
    console.log('📋 Tabla Usuario:');
    const estructuraU = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'Usuario'
      ORDER BY ordinal_position;
    `);
    estructuraU.rows.forEach(col => console.log(`   ${col.column_name}: ${col.data_type}`));

    // Tomar un proyecto de ejemplo
    const proyectoEjemplo = await client.query(`
      SELECT "idProyecto", nombre 
      FROM "Proyecto" 
      LIMIT 1
    `);

    if (proyectoEjemplo.rows.length > 0) {
      const proyecto = proyectoEjemplo.rows[0];
      console.log(`\n🔍 Proyecto ejemplo: "${proyecto.nombre}"\n`);

      // Query correcta con Usuario
      const proyectoCompleto = await client.query(`
        SELECT 
          p."idProyecto" as id,
          p.nombre,
          p.descripcion,
          p."estaAprobado" as aprobado,
          json_agg(
            json_build_object(
              'id', e."idEstudiante",
              'codigo', e."codigoEstudiante",
              'nombre', u.nombre,
              'apellido', u.apellido,
              'email', u.correo
            )
          ) FILTER (WHERE e."idEstudiante" IS NOT NULL) as estudiantes
        FROM "Proyecto" p
        LEFT JOIN "EstudianteProyecto" ep ON p."idProyecto" = ep."idProyecto"
        LEFT JOIN "Estudiante" e ON ep."idEstudiante" = e."idEstudiante"
        LEFT JOIN "Usuario" u ON e."idUsuario" = u."idUsuario"
        WHERE p."idProyecto" = $1
        GROUP BY p."idProyecto", p.nombre, p.descripcion, p."estaAprobado"
      `, [proyecto.idProyecto]);

      console.log('📦 Proyecto con estudiantes:');
      console.log(JSON.stringify(proyectoCompleto.rows[0], null, 2));

      if (proyectoCompleto.rows[0].estudiantes) {
        console.log(`\n✅ Total estudiantes: ${proyectoCompleto.rows[0].estudiantes.length}`);
      }

      console.log('\n✅ QUERY CORRECTA para proyectosController.js:');
      console.log(`
SELECT 
  p."idProyecto" as id,
  p.nombre,
  p.descripcion,
  p."estaAprobado" as aprobado,
  p."fechaCreacion" as fecha_creacion,
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
      `);
    }

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

verificarUsuarios();
