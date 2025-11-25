import { query } from '../config/database.js';
import { verificarEnBlockchain } from '../services/blockchainService.js';
import { calcularHashPDF } from '../services/pdfService.js';

/**
 * Verificar certificado por ID
 */
export const verificarPorId = async (req, res) => {
  const { id } = req.params;

  try {
    // Buscar en BD local
    const result = await query(
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
        proyecto: {
          nombre: certificado.proyecto_nombre,
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
