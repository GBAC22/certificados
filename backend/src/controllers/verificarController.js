import { query } from '../config/database.js';
import { verificarEnBlockchain } from '../services/blockchainService.js';
import { calcularHashPDF } from '../services/pdfService.js';

/**
 * Verificar certificado por ID
 */
export const verificarPorId = async (req, res) => {
  const { id } = req.params;
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');

  try {
    // Buscar en BD local
    let result;
    
    if (isRailway) {
      result = await query(
        `SELECT c.*, 
                p.nombre as proyecto_nombre,
                p.descripcion as proyecto_descripcion,
                a.nombre as proyecto_nivel,
                m.nombre as proyecto_materia,
                cat.nombre as proyecto_categoria,
                f.nombre as feria_nombre,
                f.semestre,
                f.año,
                (
                  SELECT ROUND(CAST((SUM(cal."puntajeObtenido") / SUM(sc."maximoPuntaje")) * 100 AS numeric), 2)
                  FROM "DocenteProyecto" dp
                  JOIN "Calificacion" cal ON dp."idDocenteProyecto" = cal."idDocenteProyecto"
                  JOIN "SubCalificacion" sc ON cal."idSubCalificacion" = sc."idSubCalificacion"
                  WHERE dp."idProyecto" = p."idProyecto" AND cal.calificado = true
                ) as proyecto_nota
         FROM certificados c
         JOIN "Proyecto" p ON c.proyecto_id = p."idProyecto"
         LEFT JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
         LEFT JOIN "Materia" m ON gm."idMateria" = m."idMateria"
         LEFT JOIN "AreaCategoria" ac ON m."idAreaCategoria" = ac."idAreaCategoria"
         LEFT JOIN "Area" a ON ac."idArea" = a."idArea"
         LEFT JOIN "Categoria" cat ON ac."idCategoria" = cat."idCategoria"
         JOIN "Feria" f ON c.feria_id = f."idFeria"
         WHERE c.id = $1`,
        [id]
      );
    } else {
      result = await query(
        `SELECT c.*, 
                p.nombre as proyecto_nombre,
                p.estudiantes_json,
                p.tutor_json,
                f.nombre as feria_nombre,
                f.semestre,
                f.año
         FROM certificados c
         JOIN proyectos p ON c.proyecto_id = p.id
         JOIN ferias f ON c.feria_id = f.id
         WHERE c.id = $1`,
        [id]
      );
    }

    if (result.rows.length === 0) {
      return res.status(404).json({ 
        error: true,
        valido: false,
        message: 'Certificado no encontrado' 
      });
    }

    const certificado = result.rows[0];

    // Si está revocado
    if (certificado.estado === 'revocado') {
      return res.json({
        valido: false,
        revocado: true,
        message: 'Este certificado ha sido revocado',
        data: {
          codigo: certificado.codigo,
          fechaEmision: certificado.fecha_emision,
          motivoRevocacion: certificado.metadata_json?.motivoRevocacion
        }
      });
    }

    // Verificar hash del PDF si existe el archivo
    let hashValido = true;
    try {
      const hashActual = await calcularHashPDF(certificado.pdf_path);
      hashValido = hashActual === certificado.hash;
    } catch (error) {
      console.warn('No se pudo verificar hash del PDF:', error.message);
    }

    // Verificar en blockchain si no es borrador
    let blockchainInfo = null;
    if (certificado.estado === 'oficial' && certificado.tx_hash) {
      try {
        blockchainInfo = await verificarEnBlockchain(certificado.id);
      } catch (error) {
        console.error('Error al verificar en blockchain:', error);
      }
    }

    res.json({
      valido: true,
      hashValido,
      data: {
        codigo: certificado.codigo,
        estado: certificado.estado,
        fechaEmision: certificado.fecha_emision,
        hash: certificado.hash,
        proyecto: {
          nombre: certificado.proyecto_nombre,
          descripcion: certificado.proyecto_descripcion,
          nivel: certificado.proyecto_nivel,
          materia: certificado.proyecto_materia,
          categoria: certificado.proyecto_categoria,
          nota: certificado.proyecto_nota,
          estudiantes: certificado.estudiantes_json,
          tutor: certificado.tutor_json
        },
        feria: {
          nombre: certificado.feria_nombre,
          semestre: certificado.semestre,
          año: certificado.año
        },
        blockchain: blockchainInfo,
        txHash: certificado.tx_hash,
        blockchainAddress: certificado.blockchain_address,
        pdfUrl: `/api/certificados/${certificado.id}/pdf`
      }
    });

  } catch (error) {
    console.error('Error al verificar certificado:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al verificar certificado',
      details: error.message 
    });
  }
};

/**
 * Verificar certificado por código
 */
export const verificarPorCodigo = async (req, res) => {
  const { codigo } = req.params;

  try {
    const result = await query(
      'SELECT id FROM certificados WHERE codigo = $1',
      [codigo]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ 
        error: true,
        valido: false,
        message: 'Certificado no encontrado con ese código' 
      });
    }

    // Redirigir a verificación por ID
    req.params.id = result.rows[0].id;
    return verificarPorId(req, res);

  } catch (error) {
    console.error('Error al verificar por código:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al verificar certificado' 
    });
  }
};
