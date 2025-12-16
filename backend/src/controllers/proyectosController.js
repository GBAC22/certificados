import { query } from '../config/database.js';

/**
 * Listar todos los proyectos
 */
export const listarProyectos = async (req, res) => {
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');
  
  try {
    const { feriaId, estado } = req.query;
    
    // Railway no soporta filtros dinámicos complejos con joins, retornar todos
    let queryText;
    let params = [];
    
    if (isRailway) {
      queryText = `
        SELECT 
          p."idProyecto" as id,
          p.nombre,
          p.descripcion,
          p."estaAprobado" as aprobado,
          p."fechaCreacion" as fecha_creacion,
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
        ORDER BY 
          CASE a.nombre 
            WHEN 'Avanzado' THEN 1
            WHEN 'Intermedio' THEN 2
            WHEN 'Básico' THEN 3
            ELSE 4
          END,
          cat.nombre,
          m.nombre,
          nota DESC NULLS LAST,
          p.nombre
      `;
    } else {
      queryText = 'SELECT * FROM proyectos WHERE 1=1';
      let paramIndex = 1;

      if (feriaId) {
        queryText += ` AND feria_id = $${paramIndex}`;
        params.push(feriaId);
        paramIndex++;
      }

      if (estado) {
        queryText += ` AND estado = $${paramIndex}`;
        params.push(estado);
      }

      queryText += ' ORDER BY nombre';
    }

    const result = await query(queryText, params);

    res.json({
      success: true,
      data: result.rows
    });

  } catch (error) {
    console.error('Error al listar proyectos:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al listar proyectos' 
    });
  }
};

/**
 * Obtener un proyecto por ID
 */
export const obtenerProyecto = async (req, res) => {
  const { id } = req.params;
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');

  try {
    let queryText;
    
    if (isRailway) {
      // Railway: Obtener proyecto con estudiantes mediante joins
      queryText = `
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
      `;
    } else {
      queryText = 'SELECT * FROM proyectos WHERE id = $1';
    }
    
    const result = await query(queryText, [id]);

    if (result.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'Proyecto no encontrado' 
      });
    }

    // Verificar si tiene certificado
    const certResult = await query(
      'SELECT id, codigo, estado, fecha_emision FROM certificados WHERE proyecto_id = $1 AND estado != $2',
      [id, 'revocado']
    );

    const proyecto = result.rows[0];
    const certificado = certResult.rows.length > 0 ? certResult.rows[0] : null;

    res.json({
      success: true,
      data: {
        ...proyecto,
        certificado
      }
    });

  } catch (error) {
    console.error('Error al obtener proyecto:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al obtener proyecto' 
    });
  }
};
