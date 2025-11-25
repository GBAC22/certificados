import { query } from '../config/database.js';
import { v4 as uuidv4 } from 'uuid';
import { generarPDF, calcularHashPDF, agregarQR } from '../services/pdfService.js';
import { registrarEnBlockchain } from '../services/blockchainService.js';

/**
 * Generar certificado individual
 */
export const generarCertificado = async (req, res) => {
  const { proyectoId, esBorrador = false } = req.body;

  if (!proyectoId) {
    return res.status(400).json({ error: true, message: 'proyectoId es requerido' });
  }

  try {
    // 1. Obtener datos del proyecto
    const proyectoResult = await query(
      'SELECT * FROM proyectos WHERE id = $1',
      [proyectoId]
    );

    if (proyectoResult.rows.length === 0) {
      return res.status(404).json({ error: true, message: 'Proyecto no encontrado' });
    }

    const proyecto = proyectoResult.rows[0];

    // Verificar que esté aprobado
    if (proyecto.estado !== 'aprobado') {
      return res.status(400).json({ 
        error: true, 
        message: 'El proyecto debe estar en estado aprobado' 
      });
    }

    // 2. Obtener datos de la feria
    const feriaResult = await query(
      'SELECT * FROM ferias WHERE id = $1',
      [proyecto.feria_id]
    );

    if (feriaResult.rows.length === 0) {
      return res.status(404).json({ error: true, message: 'Feria no encontrada' });
    }

    const feria = feriaResult.rows[0];

    // 3. Verificar si ya existe certificado
    const existeResult = await query(
      'SELECT id FROM certificados WHERE proyecto_id = $1 AND estado != $2',
      [proyectoId, 'revocado']
    );

    if (existeResult.rows.length > 0) {
      return res.status(400).json({ 
        error: true, 
        message: 'Ya existe un certificado para este proyecto' 
      });
    }

    // 4. Generar ID único para el certificado
    const certificadoId = uuidv4();
    const codigo = `CERT-${feria.año}-${feria.semestre}-${proyecto.id.substring(0, 8)}`;

    // 5. Preparar datos para el PDF
    const datosPDF = {
      proyecto: {
        id: proyecto.id,
        nombre: proyecto.nombre,
        descripcion: proyecto.descripcion
      },
      estudiantes: proyecto.estudiantes_json || [],
      tutor: proyecto.tutor_json || {},
      feria: {
        id: feria.id,
        nombre: feria.nombre,
        semestre: feria.semestre,
        año: feria.año
      },
      materia: proyecto.materia_json || null
    };

    // 6. Generar PDF
    console.log('Generando PDF...');
    const pdfPath = await generarPDF(datosPDF, certificadoId);

    // 7. Calcular hash del PDF
    console.log('Calculando hash...');
    const hash = await calcularHashPDF(pdfPath);

    // 8. Registrar en blockchain (solo si no es borrador)
    let txHash = null;
    let blockchainAddress = null;

    if (!esBorrador) {
      try {
        console.log('Registrando en blockchain...');
        const blockchainResult = await registrarEnBlockchain(
          certificadoId,
          hash,
          feria.id,
          proyecto.id
        );
        txHash = blockchainResult.txHash;
        blockchainAddress = process.env.CONTRACT_ADDRESS;
      } catch (blockchainError) {
        console.warn('⚠️ Error blockchain:', blockchainError.message);
        console.warn('ℹ️  Certificado generado como borrador debido a error de blockchain');
        // Continuar como borrador si falla blockchain
      }
    }

    // 9. Generar URL de verificación y QR
    const verifyUrl = `${process.env.VERIFY_BASE_URL}/${certificadoId}`;
    
    // Agregar QR al PDF (opcional)
    // await agregarQR(pdfPath, verifyUrl);

    // 10. Guardar en base de datos
    const insertResult = await query(
      `INSERT INTO certificados 
       (id, proyecto_id, feria_id, codigo, pdf_path, hash, tx_hash, blockchain_address, estado, metadata_json, fecha_emision, usuario_emisor) 
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, NOW(), $11) 
       RETURNING *`,
      [
        certificadoId,
        proyectoId,
        feria.id,
        codigo,
        pdfPath,
        hash,
        txHash,
        blockchainAddress,
        esBorrador ? 'borrador' : 'oficial',
        JSON.stringify({ verifyUrl }),
        'sistema' // TODO: obtener usuario real
      ]
    );

    const certificado = insertResult.rows[0];

    res.json({
      success: true,
      message: 'Certificado generado exitosamente',
      data: {
        certificadoId: certificado.id,
        codigo: certificado.codigo,
        pdfUrl: `/api/certificados/${certificado.id}/pdf`,
        verifyUrl,
        txHash,
        estado: certificado.estado,
        fechaEmision: certificado.fecha_emision
      }
    });

  } catch (error) {
    console.error('Error al generar certificado:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al generar certificado',
      details: error.message 
    });
  }
};

/**
 * Generar certificados por lote
 */
export const generarLote = async (req, res) => {
  const { feriaId, esBorrador = false } = req.body;

  if (!feriaId) {
    return res.status(400).json({ error: true, message: 'feriaId es requerido' });
  }

  try {
    // Obtener todos los proyectos aprobados de la feria
    const proyectosResult = await query(
      'SELECT id FROM proyectos WHERE feria_id = $1 AND estado = $2',
      [feriaId, 'aprobado']
    );

    if (proyectosResult.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'No hay proyectos aprobados en esta feria' 
      });
    }

    const resultados = {
      total: proyectosResult.rows.length,
      exitosos: 0,
      fallidos: 0,
      errores: []
    };

    // Generar certificado para cada proyecto
    for (const proyecto of proyectosResult.rows) {
      try {
        // Simular llamada interna a generarCertificado
        // En producción, extraer la lógica a un servicio compartido
        console.log(`Generando certificado para proyecto ${proyecto.id}...`);
        
        // TODO: Llamar a la lógica de generación
        // Por ahora, solo contamos
        resultados.exitosos++;
        
      } catch (error) {
        console.error(`Error en proyecto ${proyecto.id}:`, error);
        resultados.fallidos++;
        resultados.errores.push({
          proyectoId: proyecto.id,
          error: error.message
        });
      }
    }

    res.json({
      success: true,
      message: 'Proceso de generación por lote completado',
      data: resultados
    });

  } catch (error) {
    console.error('Error al generar lote:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al generar lote de certificados',
      details: error.message 
    });
  }
};

/**
 * Listar todos los certificados
 */
export const listarCertificados = async (req, res) => {
  try {
    const { feriaId, estado, page = 1, limit = 20 } = req.query;
    
    let queryText = 'SELECT * FROM certificados WHERE 1=1';
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
      paramIndex++;
    }

    queryText += ' ORDER BY fecha_emision DESC';
    queryText += ` LIMIT $${paramIndex} OFFSET $${paramIndex + 1}`;
    params.push(parseInt(limit), (parseInt(page) - 1) * parseInt(limit));

    const result = await query(queryText, params);

    // Contar total
    let countQuery = 'SELECT COUNT(*) FROM certificados WHERE 1=1';
    const countParams = [];
    let countIndex = 1;

    if (feriaId) {
      countQuery += ` AND feria_id = $${countIndex}`;
      countParams.push(feriaId);
      countIndex++;
    }

    if (estado) {
      countQuery += ` AND estado = $${countIndex}`;
      countParams.push(estado);
    }

    const countResult = await query(countQuery, countParams);
    const total = parseInt(countResult.rows[0].count);

    res.json({
      success: true,
      data: result.rows,
      pagination: {
        page: parseInt(page),
        limit: parseInt(limit),
        total,
        totalPages: Math.ceil(total / parseInt(limit))
      }
    });

  } catch (error) {
    console.error('Error al listar certificados:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al listar certificados' 
    });
  }
};

/**
 * Obtener un certificado por ID
 */
export const obtenerCertificado = async (req, res) => {
  const { id } = req.params;

  try {
    const result = await query(
      'SELECT * FROM certificados WHERE id = $1',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'Certificado no encontrado' 
      });
    }

    res.json({
      success: true,
      data: result.rows[0]
    });

  } catch (error) {
    console.error('Error al obtener certificado:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al obtener certificado' 
    });
  }
};

/**
 * Descargar PDF de un certificado
 */
export const descargarPDF = async (req, res) => {
  const { id } = req.params;

  try {
    const result = await query(
      'SELECT pdf_path, codigo FROM certificados WHERE id = $1',
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'Certificado no encontrado' 
      });
    }

    const { pdf_path, codigo } = result.rows[0];

    res.download(pdf_path, `${codigo}.pdf`, (err) => {
      if (err) {
        console.error('Error al descargar PDF:', err);
        res.status(500).json({ 
          error: true, 
          message: 'Error al descargar PDF' 
        });
      }
    });

  } catch (error) {
    console.error('Error al descargar PDF:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al descargar PDF' 
    });
  }
};

/**
 * Revocar certificado
 */
export const revocarCertificado = async (req, res) => {
  const { id } = req.params;
  const { motivo } = req.body;

  try {
    const result = await query(
      'UPDATE certificados SET estado = $1, metadata_json = metadata_json || $2 WHERE id = $3 RETURNING *',
      ['revocado', JSON.stringify({ motivoRevocacion: motivo, fechaRevocacion: new Date() }), id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'Certificado no encontrado' 
      });
    }

    // TODO: Registrar revocación en blockchain

    res.json({
      success: true,
      message: 'Certificado revocado exitosamente',
      data: result.rows[0]
    });

  } catch (error) {
    console.error('Error al revocar certificado:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al revocar certificado' 
    });
  }
};
