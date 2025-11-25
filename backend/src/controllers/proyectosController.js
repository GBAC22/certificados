import { query } from '../config/database.js';

/**
 * Listar todos los proyectos
 */
export const listarProyectos = async (req, res) => {
  try {
    const { feriaId, estado } = req.query;
    
    let queryText = 'SELECT * FROM proyectos WHERE 1=1';
    const params = [];
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

  try {
    const result = await query(
      'SELECT * FROM proyectos WHERE id = $1',
      [id]
    );

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
