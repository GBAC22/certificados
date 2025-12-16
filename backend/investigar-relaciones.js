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

async function investigarRelaciones() {
  try {
    await client.connect();
    console.log('✅ Conectado\n');

    const feriaId = 'cca2e41e-b694-4e33-9e9f-0467a8b63678';

    // 1. Ver semestres de esta feria
    console.log('1️⃣ SEMESTRES de la feria:');
    const semestres = await client.query(`
      SELECT "idSemestre", numero
      FROM "Semestre"
      WHERE "idFeria" = $1
    `, [feriaId]);
    console.log(`   Encontrados: ${semestres.rows.length}`);
    semestres.rows.forEach(s => console.log(`   - ${s.idSemestre} (número: ${s.numero})`));

    if (semestres.rows.length > 0) {
      const semestreId = semestres.rows[0].idSemestre;
      
      // 2. Ver materias del semestre
      console.log(`\n2️⃣ MATERIAS del semestre ${semestreId}:`);
      const materias = await client.query(`
        SELECT "idMateria", nombre
        FROM "Materia"
        WHERE "idSemestre" = $1
      `, [semestreId]);
      console.log(`   Encontradas: ${materias.rows.length}`);
      
      if (materias.rows.length > 0) {
        const materiaId = materias.rows[0].idMateria;
        
        // 3. Ver grupos de la materia
        console.log(`\n3️⃣ GRUPOS DE MATERIA de materia ${materiaId}:`);
        const grupos = await client.query(`
          SELECT "idGrupoMateria", numero
          FROM "GrupoMateria"
          WHERE "idMateria" = $1
        `, [materiaId]);
        console.log(`   Encontrados: ${grupos.rows.length}`);
        
        if (grupos.rows.length > 0) {
          const grupoId = grupos.rows[0].idGrupoMateria;
          
          // 4. Ver proyectos del grupo
          console.log(`\n4️⃣ PROYECTOS del grupo ${grupoId}:`);
          const proyectos = await client.query(`
            SELECT "idProyecto", nombre, "estaAprobado"
            FROM "Proyecto"
            WHERE "idGrupoMateria" = $1
          `, [grupoId]);
          console.log(`   Encontrados: ${proyectos.rows.length}`);
          proyectos.rows.slice(0, 3).forEach(p => 
            console.log(`   - ${p.nombre} (${p.estaAprobado ? 'Aprobado' : 'No aprobado'})`)
          );
        }
      }
    }

    // Verificar si los 17 proyectos tienen idGrupoMateria
    console.log(`\n5️⃣ VERIFICACIÓN: Proyectos con/sin GrupoMateria:`);
    const proyectosCheck = await client.query(`
      SELECT 
        COUNT(*) FILTER (WHERE "idGrupoMateria" IS NOT NULL) as con_grupo,
        COUNT(*) FILTER (WHERE "idGrupoMateria" IS NULL) as sin_grupo,
        COUNT(*) as total
      FROM "Proyecto"
    `);
    console.log(`   Total: ${proyectosCheck.rows[0].total}`);
    console.log(`   Con GrupoMateria: ${proyectosCheck.rows[0].con_grupo}`);
    console.log(`   Sin GrupoMateria: ${proyectosCheck.rows[0].sin_grupo}`);

    // Ver algunos proyectos de muestra
    console.log(`\n6️⃣ MUESTRA de proyectos:`);
    const muestra = await client.query(`
      SELECT "idProyecto", nombre, "idGrupoMateria", "estaAprobado"
      FROM "Proyecto"
      LIMIT 5
    `);
    muestra.rows.forEach(p => {
      console.log(`   - ${p.nombre}`);
      console.log(`     GrupoMateria: ${p.idGrupoMateria || 'NULL'}`);
      console.log(`     Aprobado: ${p.estaAprobado}`);
    });

  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    await client.end();
  }
}

investigarRelaciones();
