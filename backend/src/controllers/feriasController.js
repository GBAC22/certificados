import { query } from '../config/database.js';

/**
 * Obtener todas las ferias
 */
export const listarFerias = async (req, res) => {
  try {
    const result = await query(
      'SELECT * FROM ferias ORDER BY año DESC, semestre DESC'
    );

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

  try {
    const result = await query(
      'SELECT * FROM ferias WHERE id = $1',
      [id]
    );

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
 * Obtener proyectos de una feria
 */
export const obtenerProyectosDeFeria = async (req, res) => {
  const { id } = req.params;

  try {
    const result = await query(
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

    res.json({
      success: true,
      data: result.rows
    });

  } catch (error) {
    console.error('Error al obtener proyectos de feria:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al obtener proyectos de feria' 
    });
  }
};
