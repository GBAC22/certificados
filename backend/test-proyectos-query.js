import { query } from './src/config/database.js';
import dotenv from 'dotenv';

dotenv.config();

async function testProyectosQuery() {
  try {
    console.log('🔍 Probando query de proyectos...\n');
    
    const feriaId = 'cca2e41e-b694-4e33-9e9f-0467a8b63678';
    const isRailway = true;

    console.log('Query SQL:');
    const sql = `SELECT 
      p."idProyecto" as id,
      p.nombre,
      p.descripcion,
      p."estaAprobado" as aprobado,
      p."fechaCreacion" as fecha_creacion,
      CASE WHEN c.id IS NOT NULL THEN true ELSE false END as tiene_certificado,
      c.id as certificado_id,
      c.estado as certificado_estado
     FROM "Proyecto" p
     INNER JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
     INNER JOIN "Materia" m ON gm."idMateria" = m."idMateria"
     INNER JOIN "Semestre" s ON m."idSemestre" = s."idSemestre"
     LEFT JOIN certificados c ON p."idProyecto" = c.proyecto_id AND c.estado != 'revocado'
     WHERE s."idFeria" = $1
     ORDER BY p.nombre`;
    
    console.log(sql);
    console.log(`\nParametro: ${feriaId}\n`);

    console.log('Ejecutando query...');
    const result = await query(sql, [feriaId]);
    
    console.log(`\n✅ Query exitosa: ${result.rows.length} proyecto(s) encontrado(s)\n`);
    
    if (result.rows.length > 0) {
      console.log('📋 Primeros 5 proyectos:');
      result.rows.slice(0, 5).forEach((p, idx) => {
        console.log(`${idx + 1}. ${p.nombre}`);
        console.log(`   - ID: ${p.id}`);
        console.log(`   - Aprobado: ${p.aprobado}`);
        console.log(`   - Tiene certificado: ${p.tiene_certificado}`);
      });
    } else {
      console.log('⚠️ No se encontraron proyectos');
      console.log('\nVerificando si el problema es el JOIN...\n');
      
      // Probar query más simple
      const simpleResult = await query(
        'SELECT COUNT(*) as total FROM "Proyecto"'
      );
      console.log(`Total proyectos en DB: ${simpleResult.rows[0].total}`);
      
      // Verificar si el idFeria existe
      const feriaCheck = await query(
        'SELECT "idFeria", nombre FROM "Feria" WHERE "idFeria" = $1',
        [feriaId]
      );
      console.log(`Feria encontrada: ${feriaCheck.rows.length > 0 ? 'SÍ' : 'NO'}`);
      
      // Verificar joins
      const joinCheck = await query(`
        SELECT COUNT(*) as total
        FROM "Proyecto" p
        INNER JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
        INNER JOIN "Materia" m ON gm."idMateria" = m."idMateria"
        INNER JOIN "Semestre" s ON m."idSemestre" = s."idSemestre"
        WHERE s."idFeria" = $1
      `, [feriaId]);
      
      console.log(`Proyectos vinculados a la feria (con joins): ${joinCheck.rows[0].total}`);
    }

    process.exit(0);

  } catch (error) {
    console.error('\n❌ ERROR:', error.message);
    console.error('\nStack:', error.stack);
    process.exit(1);
  }
}

testProyectosQuery();
