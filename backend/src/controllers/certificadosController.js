import { query } from '../config/database.js';
import { v4 as uuidv4 } from 'uuid';
import crypto from 'crypto';
import { generarPDF, calcularHashPDF, agregarQR } from '../services/pdfService.js';
import { registrarEnBlockchain } from '../services/blockchainService.js';

/**
 * Generar certificado individual
 */
export const generarCertificado = async (req, res) => {
  const { proyectoId, feriaId, esBorrador = false } = req.body;

  if (!proyectoId) {
    return res.status(400).json({ error: true, message: 'proyectoId es requerido' });
  }

  try {
    // Detectar si estamos usando Railway (tablas con mayúsculas) o local
    const isRailway = process.env.DB_HOST?.includes('rlwy.net');
    
    // 1. Obtener datos del proyecto CON estudiantes
    let proyectoQuery;
    if (isRailway) {
      // Railway: Obtener proyecto con estudiantes mediante joins
      proyectoQuery = `
        SELECT 
          p."idProyecto" as id,
          p.nombre,
          p.descripcion,
          p."estaAprobado" as aprobado,
          p."idGrupoMateria",
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
      // Local: Obtener proyecto con estudiantes (asumiendo schema similar a Railway)
      proyectoQuery = `
        SELECT 
          p.*,
          json_agg(
            json_build_object(
              'id', e.id,
              'codigo', e.codigo_estudiante,
              'nombre', u.nombre,
              'apellido', u.apellido,
              'email', u.correo
            )
          ) FILTER (WHERE e.id IS NOT NULL) as estudiantes_json
        FROM proyectos p
        LEFT JOIN estudiante_proyecto ep ON p.id = ep.proyecto_id
        LEFT JOIN estudiantes e ON ep.estudiante_id = e.id
        LEFT JOIN usuarios u ON e.usuario_id = u.id
        WHERE p.id = $1
        GROUP BY p.id
      `;
    }
    
    const proyectoResult = await query(proyectoQuery, [proyectoId]);

    if (proyectoResult.rows.length === 0) {
      return res.status(404).json({ error: true, message: 'Proyecto no encontrado' });
    }

    const proyecto = proyectoResult.rows[0];
    
    // Normalizar nombres de columnas
    const proyectoNormalizado = isRailway ? {
      id: proyecto.id,
      nombre: proyecto.nombre,
      descripcion: proyecto.descripcion,
      estaAprobado: proyecto.aprobado,
      idGrupoMateria: proyecto.idGrupoMateria,
      estudiantes_json: proyecto.estudiantes_json
    } : proyecto;

    // Verificar que esté aprobado (SIEMPRE, tanto Railway como local)
    if (!proyectoNormalizado.estaAprobado) {
      return res.status(400).json({ 
        error: true, 
        message: 'El proyecto debe estar aprobado para generar certificado' 
      });
    }

    // Obtener calificaciones del proyecto (si existen) - Calcular promedio sobre 100
    let notaPromedio = null;
    if (isRailway) {
      try {
        const calificacionesQuery = `
          SELECT 
            SUM(c."puntajeObtenido") as nota_obtenida,
            SUM(sc."maximoPuntaje") as nota_maxima
          FROM "DocenteProyecto" dp
          JOIN "Calificacion" c ON dp."idDocenteProyecto" = c."idDocenteProyecto"
          JOIN "SubCalificacion" sc ON c."idSubCalificacion" = sc."idSubCalificacion"
          WHERE dp."idProyecto" = $1 AND c.calificado = true
          GROUP BY dp."idProyecto"
        `;
        const calificacionResult = await query(calificacionesQuery, [proyectoId]);
        
        if (calificacionResult.rows.length > 0 && calificacionResult.rows[0].nota_obtenida) {
          const notaObtenida = parseFloat(calificacionResult.rows[0].nota_obtenida);
          const notaMaxima = parseFloat(calificacionResult.rows[0].nota_maxima);
          // Calcular promedio sobre 100
          notaPromedio = (notaObtenida / notaMaxima) * 100;
          console.log(`📊 Calificación: ${notaObtenida}/${notaMaxima} → Promedio: ${notaPromedio.toFixed(2)}/100`);
        }
      } catch (error) {
        console.log('⚠️ No se pudo obtener calificaciones (puede que no existan aún)');
      }
    }

    // Obtener nivel (Area), materia y docente desde la estructura correcta
    let nivelProyecto = null;
    let materiaInfo = null;
    let categoriaInfo = null;
    let docenteInfo = null;
    if (isRailway && proyectoNormalizado.idGrupoMateria) {
      try {
        const infoProyectoQuery = `
          SELECT 
            a.nombre as nivel,
            m.nombre as materia_nombre,
            m."idMateria" as materia_id,
            c.nombre as categoria_nombre,
            c."idCategoria" as categoria_id,
            u.nombre as docente_nombre,
            u.apellido as docente_apellido
          FROM "GrupoMateria" gm
          JOIN "Materia" m ON gm."idMateria" = m."idMateria"
          JOIN "AreaCategoria" ac ON m."idAreaCategoria" = ac."idAreaCategoria"
          JOIN "Area" a ON ac."idArea" = a."idArea"
          JOIN "Categoria" c ON ac."idCategoria" = c."idCategoria"
          LEFT JOIN "Docente" d ON gm."idDocente" = d."idDocente"
          LEFT JOIN "Usuario" u ON d."idUsuario" = u."idUsuario"
          WHERE gm."idGrupoMateria" = $1
        `;
        const infoResult = await query(infoProyectoQuery, [proyectoNormalizado.idGrupoMateria]);
        
        if (infoResult.rows.length > 0) {
          nivelProyecto = infoResult.rows[0].nivel;
          materiaInfo = {
            nombre: infoResult.rows[0].materia_nombre,
            id: infoResult.rows[0].materia_id
          };
          categoriaInfo = {
            nombre: infoResult.rows[0].categoria_nombre,
            id: infoResult.rows[0].categoria_id
          };
          if (infoResult.rows[0].docente_nombre && infoResult.rows[0].docente_apellido) {
            docenteInfo = {
              nombre: infoResult.rows[0].docente_nombre,
              apellido: infoResult.rows[0].docente_apellido
            };
            console.log(`👨‍🏫 Docente: ${docenteInfo.nombre} ${docenteInfo.apellido}`);
          }
          console.log(`📚 Nivel: ${nivelProyecto} | Materia: ${materiaInfo.nombre} | Categoría: ${categoriaInfo.nombre}`);
        }
      } catch (error) {
        console.log('⚠️ No se pudo obtener información de nivel/materia/categoría');
      }
    }

    // Calcular lugar del proyecto (1ro, 2do, 3ro) basado en la nota, por materia y categoria (nivel)
    let lugarProyecto = null;
    if (isRailway && notaPromedio !== null && materiaInfo && categoriaInfo) {
      try {
        const rankingQuery = `
          WITH ProyectosConNota AS (
            SELECT 
              p."idProyecto",
              ROUND(CAST((SUM(c."puntajeObtenido") / NULLIF(SUM(sc."maximoPuntaje"), 0)) * 100 AS numeric), 2) as nota_promedio
            FROM "Proyecto" p
            JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
            JOIN "Materia" m ON gm."idMateria" = m."idMateria"
            JOIN "AreaCategoria" ac ON m."idAreaCategoria" = ac."idAreaCategoria"
            JOIN "Categoria" cat ON ac."idCategoria" = cat."idCategoria"
            JOIN "DocenteProyecto" dp ON p."idProyecto" = dp."idProyecto"
            JOIN "Calificacion" c ON dp."idDocenteProyecto" = c."idDocenteProyecto" AND c.calificado = true
            JOIN "SubCalificacion" sc ON c."idSubCalificacion" = sc."idSubCalificacion"
            WHERE 
              p."estaAprobado" = true 
              AND m."idMateria" = $1
              AND cat."idCategoria" = $2
            GROUP BY p."idProyecto"
            HAVING SUM(sc."maximoPuntaje") > 0
          ),
          RankingProyectos AS (
            SELECT 
              "idProyecto",
              nota_promedio,
              ROW_NUMBER() OVER (ORDER BY nota_promedio DESC) as lugar
            FROM ProyectosConNota
          )
          SELECT lugar
          FROM RankingProyectos
          WHERE "idProyecto" = $3
        `;
        
        const rankingResult = await query(rankingQuery, [materiaInfo.id, categoriaInfo.id, proyectoId]);
        
        if (rankingResult.rows.length > 0) {
          const lugar = parseInt(rankingResult.rows[0].lugar);
          // Solo asignar lugar si está en los primeros 3 puestos
          if (lugar <= 3) {
            lugarProyecto = lugar;
            console.log(`🏆 Lugar: ${lugar}º (${categoriaInfo.nombre} - ${materiaInfo.nombre})`);
          } else {
            console.log(`📊 Posición: ${lugar}º (no se muestra en certificado, solo top 3)`);
          }
        }
      } catch (error) {
        console.log('⚠️ No se pudo calcular el lugar del proyecto:', error.message);
      }
    }

    // 2. Obtener datos de la feria
    let feria;
    let feriaIdToUse = feriaId;

    // Si no se proporcionó feriaId, intentar obtenerlo desde el proyecto (solo para modo local)
    if (!feriaIdToUse && !isRailway) {
      feriaIdToUse = proyectoNormalizado.feria_id;
    }

    // Si aún no tenemos feriaId (Railway sin parámetro), intentar buscar por GrupoMateria
    if (!feriaIdToUse && isRailway) {
      const feriaQueryByGrupo = await query(`
        SELECT f."idFeria" 
        FROM "Feria" f
        JOIN "Semestre" s ON s."idFeria" = f."idFeria"
        JOIN "Materia" m ON m."idSemestre" = s."idSemestre"
        JOIN "GrupoMateria" gm ON gm."idMateria" = m."idMateria"
        WHERE gm."idGrupoMateria" = $1
        LIMIT 1
      `, [proyectoNormalizado.idGrupoMateria]);
      
      if (feriaQueryByGrupo.rows.length > 0) {
        feriaIdToUse = feriaQueryByGrupo.rows[0].idFeria;
      }
    }

    // Verificar que tengamos feriaId
    if (!feriaIdToUse) {
      return res.status(400).json({ 
        error: true, 
        message: 'No se pudo determinar la feria del proyecto. Por favor proporciona feriaId.' 
      });
    }

    // Obtener datos completos de la feria
    const feriaQuery = isRailway
      ? 'SELECT "idFeria" as id, nombre, semestre, año, estado FROM "Feria" WHERE "idFeria" = $1'
      : 'SELECT * FROM ferias WHERE id = $1';
    
    const feriaResult = await query(feriaQuery, [feriaIdToUse]);

    if (feriaResult.rows.length === 0) {
      return res.status(404).json({ error: true, message: 'Feria no encontrada' });
    }

    feria = feriaResult.rows[0];

    // Verificar que la feria esté finalizada (solo si NO es borrador/prueba)
    if (!esBorrador && feria.estado !== 'Finalizado' && feria.estado !== 'finalizada') {
      return res.status(400).json({ 
        error: true, 
        message: 'Solo se pueden generar certificados cuando la feria está finalizada' 
      });
    }

    // 3. Verificar si ya existe certificado (solo si NO es borrador/prueba)
    if (!esBorrador) {
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
    }

    // 4. Generar ID único para el certificado
    const certificadoId = uuidv4();
    const timestamp = Date.now().toString().slice(-6); // Últimos 6 dígitos del timestamp
    const prefijo = esBorrador ? 'PRUEBA' : 'CERT';
    const codigo = `${prefijo}-${feria.año}-${feria.semestre}-${proyectoNormalizado.id.substring(0, 8)}-${timestamp}`;

    // 5. Preparar datos para el PDF
    const datosPDF = {
      proyecto: {
        id: proyectoNormalizado.id,
        nombre: proyectoNormalizado.nombre,
        descripcion: proyectoNormalizado.descripcion
      },
      estudiantes: proyectoNormalizado.estudiantes_json || [],
      tutor: docenteInfo || proyectoNormalizado.tutor_json || {},
      feria: {
        id: feria.id,
        nombre: feria.nombre,
        semestre: feria.semestre,
        año: feria.año
      },
      materia: materiaInfo || proyectoNormalizado.materia_json || null,
      nivel: nivelProyecto || proyectoNormalizado.nivel || null,
      categoria: categoriaInfo || null,
      nota: notaPromedio ? `${notaPromedio.toFixed(2)}` : null,
      notaDetallada: notaPromedio ? { promedio: notaPromedio, sobre: 100 } : null,
      lugar: lugarProyecto, // Usar el lugar calculado (solo si está en top 3)
      esPrueba: esBorrador // Marcar si es certificado de prueba
    };

    console.log('\n========================================');
    console.log(esBorrador ? '🧪 GENERACIÓN DE CERTIFICADO DE PRUEBA' : '🎓 INICIANDO GENERACIÓN DE CERTIFICADO');
    console.log('========================================');
    console.log(`📋 Proyecto ID: ${proyectoId}`);
    console.log(`📛 Proyecto: ${proyectoNormalizado.nombre}`);
    console.log(`🎪 Feria: ${feria.nombre} ${esBorrador ? '(Sin verificar finalización)' : ''}`);
    console.log(`📅 Semestre: ${feria.semestre} - ${feria.año}`);
    console.log(`🆔 Certificado ID: ${certificadoId}`);
    console.log(`📝 Código: ${codigo}`);
    console.log(`⚙️ Modo: ${esBorrador ? '🧪 PRUEBA (Blockchain local, sin validaciones)' : 'OFICIAL (Polygon Amoy)'}`);

    // 6. Generar URL de verificación (para QR code)
    const verifyUrl = `${process.env.VERIFY_BASE_URL}/${certificadoId}`;
    console.log(`🔗 URL Verificación: ${verifyUrl}`);

    // 7. Calcular hash preliminar para registrar en blockchain
    console.log('\n🔐 PASO 1/5: Calculando hash preliminar...');
    const hashPreliminar = crypto.createHash('sha256').update(JSON.stringify(datosPDF)).digest('hex');
    console.log(`✅ Hash preliminar: ${hashPreliminar}`);

    // 8. Registrar en blockchain (SIEMPRE, incluso en modo prueba usa blockchain local)
    let txHash = null;
    let blockchainAddress = null;
    let blockNumber = null;
    let gasUsed = null;

    try {
      console.log('\n⛓️ PASO 2/5: Registrando en blockchain...');
      if (esBorrador) {
        console.log('🔄 Enviando transacción a blockchain LOCAL (Hardhat)...');
      } else {
        console.log('🔄 Enviando transacción a Polygon Amoy...');
      }
      console.log(`📍 Contrato: ${process.env.CONTRACT_ADDRESS}`);
      
      const blockchainResult = await registrarEnBlockchain(
        certificadoId,
        hashPreliminar,
        feria.id,
        proyectoNormalizado.id
      );
      
      txHash = blockchainResult.txHash;
      blockchainAddress = process.env.CONTRACT_ADDRESS;
      blockNumber = blockchainResult.blockNumber;
      gasUsed = blockchainResult.gasUsed;
      
      console.log(`✅ Transacción confirmada: ${txHash}`);
      console.log(`📦 Bloque: ${blockNumber}`);
      console.log(`⛽ Gas usado: ${gasUsed}`);
      if (esBorrador) {
        console.log(`🔗 Blockchain local: http://127.0.0.1:8545`);
      } else {
        console.log(`🔗 Ver en PolygonScan: https://amoy.polygonscan.com/tx/${txHash}`);
      }

      // Agregar información del blockchain a los datos del PDF
      datosPDF.blockchain = {
        txHash,
        contractAddress: blockchainAddress,
        blockNumber,
        gasUsed,
        network: esBorrador ? 'Hardhat Local' : 'Polygon Amoy Testnet',
        timestamp: new Date().toISOString()
      };
    } catch (blockchainError) {
      console.error('\n❌ ERROR EN BLOCKCHAIN:');
      console.error(`   Tipo: ${blockchainError.name}`);
      console.error(`   Mensaje: ${blockchainError.message}`);
      
      if (blockchainError.message.includes('insufficient funds')) {
        console.error('💰 ERROR: Saldo insuficiente de MATIC en la wallet');
        if (esBorrador) {
          console.error('   Solución: Asegúrate de que Hardhat node esté corriendo (npm run hardhat)');
        } else {
          console.error('   Solución: Obtén más MATIC de https://faucet.polygon.technology/');
        }
      } else if (blockchainError.message.includes('nonce')) {
        console.error('🔢 ERROR: Problema con el nonce de la transacción');
        console.error('   Solución: Espera unos segundos y vuelve a intentar');
      } else if (blockchainError.message.includes('network') || blockchainError.message.includes('connection')) {
        console.error('🌐 ERROR: Problema de conexión con la red blockchain');
        if (esBorrador) {
          console.error('   Solución: Inicia Hardhat con: cd blockchain && npx hardhat node');
        } else {
          console.error('   Solución: Verifica tu conexión a internet');
        }
      }
      
      // No continuar si falla blockchain
      throw blockchainError;
    }

    // 9. Generar PDF con información del blockchain
    console.log('\n📄 PASO 3/5: Generando PDF con información del blockchain...');
    const pdfPath = await generarPDF(datosPDF, certificadoId, verifyUrl);
    console.log(`✅ PDF generado: ${pdfPath}`);

    // 10. Calcular hash final del PDF
    console.log('\n🔐 PASO 4/5: Calculando hash SHA-256 final del PDF...');
    const hash = await calcularHashPDF(pdfPath);
    console.log(`✅ Hash final: ${hash}`);

    // 11. Guardar en base de datos
    console.log('\n💾 PASO 5/5: Guardando en base de datos...');
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
        esBorrador || !txHash ? 'borrador' : 'oficial',
        JSON.stringify({ verifyUrl }),
        'sistema' // TODO: obtener usuario real
      ]
    );

    const certificado = insertResult.rows[0];
    console.log(`✅ Certificado guardado en DB con estado: ${certificado.estado}`);

    console.log('\n🎉 PASO 5/5: Certificado generado exitosamente!');
    console.log('========================================');
    console.log('📊 RESUMEN:');
    console.log(`   Estado: ${certificado.estado.toUpperCase()}`);
    console.log(`   Código: ${certificado.codigo}`);
    console.log(`   PDF: ${pdfPath}`);
    console.log(`   Hash: ${hash}`);
    if (txHash) {
      console.log(`   ⛓️ Blockchain: SÍ`);
      console.log(`   TX Hash: ${txHash}`);
      console.log(`   Contrato: ${blockchainAddress}`);
    } else {
      console.log(`   ⛓️ Blockchain: NO (borrador)`);
    }
    console.log(`   🔗 Verificar: ${verifyUrl}`);
    console.log('========================================\n');

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
    console.error('\n❌❌❌ ERROR CRÍTICO AL GENERAR CERTIFICADO ❌❌❌');
    console.error('========================================');
    console.error(`Tipo de error: ${error.name}`);
    console.error(`Mensaje: ${error.message}`);
    console.error(`Stack: ${error.stack}`);
    console.error('========================================\n');
    
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
  const isRailway = process.env.DB_HOST?.includes('rlwy.net');

  if (!feriaId) {
    return res.status(400).json({ error: true, message: 'feriaId es requerido' });
  }

  try {
    // Verificar que la feria esté finalizada
    const feriaQuery = isRailway
      ? 'SELECT estado FROM "Feria" WHERE "idFeria" = $1'
      : 'SELECT estado FROM ferias WHERE id = $1';
    
    const feriaResult = await query(feriaQuery, [feriaId]);

    if (feriaResult.rows.length === 0) {
      return res.status(404).json({ 
        error: true, 
        message: 'Feria no encontrada' 
      });
    }

    const feriaEstado = feriaResult.rows[0].estado;
    // Solo verificar si está finalizada cuando NO es borrador/prueba
    if (!esBorrador && feriaEstado !== 'Finalizado' && feriaEstado !== 'finalizada') {
      return res.status(400).json({ 
        error: true, 
        message: 'La feria debe estar finalizada para generar certificados' 
      });
    }

    // Obtener todos los proyectos aprobados de la feria
    let proyectosResult;
    
    if (isRailway) {
      // Railway: NOTA - No se puede filtrar por feria porque Semestres no están vinculados
      // Generar para TODOS los proyectos aprobados (sin filtro de feria)
      proyectosResult = await query(
        `SELECT p."idProyecto" as id 
         FROM "Proyecto" p
         WHERE p."estaAprobado" = true`,
        []
      );
    } else {
      // Local: Direct relationship
      proyectosResult = await query(
        'SELECT id FROM proyectos WHERE feria_id = $1 AND estado = $2',
        [feriaId, 'aprobado']
      );
    }

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
      certificados: [],
      errores: []
    };

    console.log(`\n🎓 Generando ${resultados.total} certificados...`);

    // Generar certificado para cada proyecto
    for (const proyecto of proyectosResult.rows) {
      try {
        console.log(`\n📋 Procesando proyecto ${proyecto.id}...`);
        
        // Simular una petición interna para generarCertificado
        const mockReq = {
          body: {
            proyectoId: proyecto.id,
            feriaId: feriaId,
            esBorrador
          }
        };

        let certificadoData = null;

        // Crear un mock response para capturar el resultado
        const mockRes = {
          json: (data) => {
            if (data.success) {
              certificadoData = data.data;
            }
          },
          status: () => mockRes,
          download: () => {}
        };

        // Llamar a la función generarCertificado
        await generarCertificado(mockReq, mockRes);

        if (certificadoData) {
          resultados.exitosos++;
          resultados.certificados.push({
            proyectoId: proyecto.id,
            certificadoId: certificadoData.certificadoId,
            codigo: certificadoData.codigo,
            pdfUrl: certificadoData.pdfUrl
          });
        } else {
          throw new Error('No se pudo generar el certificado');
        }
        
      } catch (error) {
        console.error(`❌ Error en proyecto ${proyecto.id}:`, error.message);
        resultados.fallidos++;
        resultados.errores.push({
          proyectoId: proyecto.id,
          error: error.message
        });
      }
    }

    console.log(`\n✅ Lote completado: ${resultados.exitosos}/${resultados.total} exitosos\n`);

    res.json({
      success: true,
      message: `Generación por lote completada: ${resultados.exitosos}/${resultados.total} exitosos`,
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

/**
 * Limpiar certificados de prueba
 */
export const limpiarCertificadosPrueba = async (req, res) => {
  const { feriaId } = req.params;

  try {
    console.log(`\n🧹 Limpiando certificados de prueba de feria ${feriaId}...`);

    // Eliminar certificados con estado 'borrador' de esta feria
    const result = await query(
      `DELETE FROM certificados 
       WHERE feria_id = $1 AND estado = 'borrador'
       RETURNING id, codigo`,
      [feriaId]
    );

    console.log(`✅ Eliminados ${result.rows.length} certificados de prueba`);

    res.json({
      success: true,
      message: `${result.rows.length} certificados de prueba eliminados`,
      data: {
        eliminados: result.rows.length,
        certificados: result.rows
      }
    });

  } catch (error) {
    console.error('Error al limpiar certificados de prueba:', error);
    res.status(500).json({ 
      error: true, 
      message: 'Error al limpiar certificados de prueba' 
    });
  }
};
