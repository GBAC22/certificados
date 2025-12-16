import pg from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const { Client } = pg;

const client = new Client({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  ssl: { rejectUnauthorized: false },
  connectionTimeoutMillis: 10000,
  query_timeout: 10000
});

async function probarConsultaNueva() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway\n');

    console.log('═'.repeat(80));
    console.log('📊 PRUEBA: Proyectos con Nivel, Materia y Nota (Promedio sobre 100)');
    console.log('═'.repeat(80));

    const result = await client.query(`
      SELECT 
        p."idProyecto" as id,
        p.nombre,
        a.nombre as nivel,
        m.nombre as materia,
        cat.nombre as categoria,
        (
          SELECT 
            ROUND(CAST((SUM(cal."puntajeObtenido") / SUM(sc."maximoPuntaje")) * 100 AS numeric), 2)
          FROM "DocenteProyecto" dp
          JOIN "Calificacion" cal ON dp."idDocenteProyecto" = cal."idDocenteProyecto"
          JOIN "SubCalificacion" sc ON cal."idSubCalificacion" = sc."idSubCalificacion"
          WHERE dp."idProyecto" = p."idProyecto" AND cal.calificado = true
        ) as nota
      FROM "Proyecto" p
      LEFT JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
      LEFT JOIN "Materia" m ON gm."idMateria" = m."idMateria"
      LEFT JOIN "AreaCategoria" ac ON m."idAreaCategoria" = ac."idAreaCategoria"
      LEFT JOIN "Area" a ON ac."idArea" = a."idArea"
      LEFT JOIN "Categoria" cat ON ac."idCategoria" = cat."idCategoria"
      WHERE p."estaAprobado" = true
      ORDER BY 
        CASE a.nombre 
          WHEN 'Avanzado' THEN 1
          WHEN 'Intermedio' THEN 2
          WHEN 'Básico' THEN 3
          ELSE 4
        END,
        cat.nombre,
        m.nombre,
        nota DESC NULLS LAST
      LIMIT 10
    `);

    console.log(`\n✅ Encontrados ${result.rows.length} proyectos\n`);

    // Agrupar por nivel
    const porNivel = {};
    result.rows.forEach(p => {
      const nivel = p.nivel || 'Sin nivel';
      if (!porNivel[nivel]) porNivel[nivel] = [];
      porNivel[nivel].push(p);
    });

    // Mostrar agrupado
    Object.keys(porNivel).forEach(nivel => {
      console.log('─'.repeat(80));
      console.log(`🎓 NIVEL: ${nivel.toUpperCase()}`);
      console.log('─'.repeat(80));

      // Agrupar por categoría dentro del nivel
      const porCategoria = {};
      porNivel[nivel].forEach(p => {
        const categoria = p.categoria || 'Sin categoría';
        if (!porCategoria[categoria]) porCategoria[categoria] = [];
        porCategoria[categoria].push(p);
      });

      Object.keys(porCategoria).forEach(categoria => {
        console.log(`\n  🏷️  Categoría: ${categoria}`);
        porCategoria[categoria].forEach((p, idx) => {
          const nota = p.nota ? `${p.nota}/100` : 'Sin calificar';
          console.log(`     ${idx + 1}. ${p.nombre}`);
          console.log(`        Materia: ${p.materia || 'N/A'}`);
          console.log(`        Nota: ${nota}`);
        });
      });
      console.log('');
    });

    console.log('\n' + '═'.repeat(80));
    console.log('✅ PRUEBA COMPLETADA - Las consultas funcionan correctamente');
    console.log('═'.repeat(80));

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

probarConsultaNueva();
