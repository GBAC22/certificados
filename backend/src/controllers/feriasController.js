import { query } from '../config/database.js';

/**
 * Obtener todas las ferias
 */
export const listarFerias = async (req, res) => {
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');
  
  try {
    const queryText = isRailway
      ? 'SELECT "idFeria" as id, nombre, semestre, año, estado, "fechaCreacion" as fecha_creacion FROM "Feria" ORDER BY año DESC, semestre DESC'
      : 'SELECT * FROM ferias ORDER BY año DESC, semestre DESC';
    
    const result = await query(queryText);

    res.json({
      success: true,
      data: result.rows
    });

  } catch (error) {
    console.error('Error al listar ferias:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al listar ferias' 
    });
  }
};

/**
 * Obtener una feria por ID
 */
export const obtenerFeria = async (req, res) => {
  const { id } = req.params;
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');

  try {
    const feriaQuery = isRailway
      ? 'SELECT "idFeria" as id, nombre, semestre, año, estado, "fechaCreacion" as fecha_creacion FROM "Feria" WHERE "idFeria" = $1'
      : 'SELECT * FROM ferias WHERE id = $1';
    
    const result = await query(feriaQuery, [id]);

    if (result.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'Feria no encontrada' 
      });
    }

    // Obtener estadísticas de certificados
    const statsResult = await query(
      `SELECT 
        COUNT(*) as total_certificados,
        COUNT(CASE WHEN estado = 'oficial' THEN 1 END) as oficiales,
        COUNT(CASE WHEN estado = 'borrador' THEN 1 END) as borradores
       FROM certificados 
       WHERE feria_id = $1`,
      [id]
    );

    const feria = result.rows[0];
    const stats = statsResult.rows[0];

    res.json({
      success: true,
      data: {
        ...feria,
        estadisticas: {
          totalCertificados: parseInt(stats.total_certificados),
          oficiales: parseInt(stats.oficiales),
          borradores: parseInt(stats.borradores)
        }
      }
    });

  } catch (error) {
    console.error('Error al obtener feria:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al obtener feria' 
    });
  }
};

/**
 * Obtener proyectos de una feria - Agrupados por nivel y materia
 */
export const obtenerProyectosDeFeria = async (req, res) => {
  const { id } = req.params;
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');

  try {
    let result;
    
    if (isRailway) {
      // Railway: Obtener proyectos con nivel (Area), materia, categoría, calificaciones y estudiantes
      result = await query(
        `SELECT 
          p."idProyecto" as id,
          p.nombre,
          p.descripcion,
          p."estaAprobado" as aprobado,
          p."fechaCreacion" as fecha_creacion,
          a.nombre as nivel,
          a."idArea" as nivel_id,
          m.nombre as materia,
          m."idMateria" as materia_id,
          cat.nombre as categoria,
          cat."idCategoria" as categoria_id,
          CASE WHEN c.id IS NOT NULL THEN true ELSE false END as tiene_certificado,
          c.id as certificado_id,
          c.estado as certificado_estado,
          (
            SELECT 
              ROUND(CAST((SUM(cal."puntajeObtenido") / SUM(sc."maximoPuntaje")) * 100 AS numeric), 2)
            FROM "DocenteProyecto" dp
            JOIN "Calificacion" cal ON dp."idDocenteProyecto" = cal."idDocenteProyecto"
            JOIN "SubCalificacion" sc ON cal."idSubCalificacion" = sc."idSubCalificacion"
            WHERE dp."idProyecto" = p."idProyecto" AND cal.calificado = true
          ) as nota,
          (
            SELECT COUNT(*)
            FROM "EstudianteProyecto" ep
            WHERE ep."idProyecto" = p."idProyecto"
          ) as cantidad_estudiantes,
          (
            SELECT json_agg(
              json_build_object(
                'id', e."idEstudiante",
                'nombre', u.nombre,
                'apellido', u.apellido,
                'codigo', e."codigoEstudiante"
              )
            )
            FROM "EstudianteProyecto" ep
            JOIN "Estudiante" e ON ep."idEstudiante" = e."idEstudiante"
            JOIN "Usuario" u ON e."idUsuario" = u."idUsuario"
            WHERE ep."idProyecto" = p."idProyecto"
          ) as estudiantes
         FROM "Proyecto" p
         LEFT JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
         LEFT JOIN "Materia" m ON gm."idMateria" = m."idMateria"
         LEFT JOIN "AreaCategoria" ac ON m."idAreaCategoria" = ac."idAreaCategoria"
         LEFT JOIN "Area" a ON ac."idArea" = a."idArea"
         LEFT JOIN "Categoria" cat ON ac."idCategoria" = cat."idCategoria"
         LEFT JOIN certificados c ON p."idProyecto" = c.proyecto_id AND c.estado != 'revocado'
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
           p.nombre`,
        []
      );
    } else {
      // Local: Direct feria_id relationship
      result = await query(
        `SELECT 
          p.*,
          CASE WHEN c.id IS NOT NULL THEN true ELSE false END as tiene_certificado,
          c.id as certificado_id,
          c.estado as certificado_estado
         FROM proyectos p
         LEFT JOIN certificados c ON p.id = c.proyecto_id AND c.estado != 'revocado'
         WHERE p.feria_id = $1
         ORDER BY p.nombre`,
        [id]
      );
    }

    // Agrupar proyectos por nivel y categoría (solo en Railway)
    if (isRailway) {
      const proyectosAgrupados = {};
      
      result.rows.forEach(proyecto => {
        const nivel = proyecto.nivel || 'Sin nivel';
        const categoria = proyecto.categoria || 'Sin categoría';
        
        if (!proyectosAgrupados[nivel]) {
          proyectosAgrupados[nivel] = {};
        }
        
        if (!proyectosAgrupados[nivel][categoria]) {
          proyectosAgrupados[nivel][categoria] = [];
        }
        
        proyectosAgrupados[nivel][categoria].push({
          id: proyecto.id,
          nombre: proyecto.nombre,
          descripcion: proyecto.descripcion,
          aprobado: proyecto.aprobado,
          fecha_creacion: proyecto.fecha_creacion,
          nivel: proyecto.nivel,
          nivel_id: proyecto.nivel_id,
          categoria: proyecto.categoria,
          categoria_id: proyecto.categoria_id,
          materia: proyecto.materia,
          materia_id: proyecto.materia_id,
          nota: proyecto.nota ? parseFloat(proyecto.nota) : null,
          tiene_certificado: proyecto.tiene_certificado,
          certificado_id: proyecto.certificado_id,
          certificado_estado: proyecto.certificado_estado,
          cantidad_estudiantes: parseInt(proyecto.cantidad_estudiantes) || 0,
          estudiantes: proyecto.estudiantes || []
        });
      });

      res.json({
        success: true,
        data: result.rows, // Lista plana para compatibilidad
        agrupado: proyectosAgrupados, // Agrupado por nivel y categoría
        niveles: ['Avanzado', 'Intermedio', 'Básico', 'Sin nivel']
      });
    } else {
      res.json({
        success: true,
        data: result.rows
      });
    }

  } catch (error) {
    console.error('Error al obtener proyectos de feria:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al obtener proyectos de feria' 
    });
  }
};

/**
 * Finalizar una feria (cambiar estado a 'finalizada')
 */
export const finalizarFeria = async (req, res) => {
  const { id } = req.params;
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');

  try {
    // Verificar que la feria existe
    const feriaQuery = isRailway
      ? 'SELECT "idFeria" as id, estado FROM "Feria" WHERE "idFeria" = $1'
      : 'SELECT * FROM ferias WHERE id = $1';
    
    const feriaResult = await query(feriaQuery, [id]);

    if (feriaResult.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'Feria no encontrada' 
      });
    }

    const feria = feriaResult.rows[0];
    const estadoActual = isRailway ? feria.estado : feria.estado;

    // Verificar si ya está finalizada
    if (estadoActual === 'Finalizado' || estadoActual === 'finalizada') {
      return res.status(400).json({ 
        error: true, 
        message: 'La feria ya está finalizada' 
      });
    }

    // Actualizar estado a 'Finalizado' (Railway) o 'finalizada' (local)
    const nuevoEstado = isRailway ? 'Finalizado' : 'finalizada';
    const updateQuery = isRailway
      ? 'UPDATE "Feria" SET estado = $1, "fechaActualizacion" = CURRENT_TIMESTAMP WHERE "idFeria" = $2 RETURNING *'
      : 'UPDATE ferias SET estado = $1, updated_at = CURRENT_TIMESTAMP WHERE id = $2 RETURNING *';
    
    const result = await query(updateQuery, [nuevoEstado, id]);

    console.log(`✅ Feria ${id} finalizada exitosamente`);

    res.json({
      success: true,
      message: 'Feria finalizada exitosamente. Ahora se pueden generar certificados.',
      data: result.rows[0]
    });

  } catch (error) {
    console.error('Error al finalizar feria:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al finalizar feria: ' + error.message 
    });
  }
};
