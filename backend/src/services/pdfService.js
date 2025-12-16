import PDFDocument from 'pdfkit';
import fs from 'fs';
import path from 'path';
import crypto from 'crypto';
import QRCode from 'qrcode';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const STORAGE_PATH = path.join(__dirname, '../../storage/certificados');

// Asegurar que existe el directorio
if (!fs.existsSync(STORAGE_PATH)) {
  fs.mkdirSync(STORAGE_PATH, { recursive: true });
}

/**
 * Generar certificado en PDF
 */
export const generarPDF = async (datos, certificadoId, verifyUrl = null) => {
  const { proyecto, estudiantes, tutor, feria, materia } = datos;
  
  const fileName = `${certificadoId}.pdf`;
  const filePath = path.join(STORAGE_PATH, fileName);
  
  return new Promise(async (resolve, reject) => {
    try {
      // Crear documento PDF en formato horizontal (landscape)
      const doc = new PDFDocument({
        size: 'A4',
        layout: 'landscape',
        margins: { top: 50, bottom: 50, left: 70, right: 70 }
      });

      // Stream hacia archivo
      const stream = fs.createWriteStream(filePath);
      doc.pipe(stream);

      const pageWidth = doc.page.width;
      const pageHeight = doc.page.height;
      const leftMargin = 70;
      const rightMargin = 70;
      const contentWidth = pageWidth - leftMargin - rightMargin;

      // Colores institucionales UAGRM
      const UAGRM_AZUL = '#003366';      // Azul oscuro institucional
      const UAGRM_VERDE = '#00A651';     // Verde institucional
      const UAGRM_DORADO = '#D4AF37';    // Dorado/amarillo
      const GRIS_OSCURO = '#333333';     // Texto principal
      const GRIS_CLARO = '#666666';      // Texto secundario

      // Borde decorativo superior (franja azul)
      doc.rect(0, 0, pageWidth, 15).fill(UAGRM_AZUL);
      
      // Franja verde delgada
      doc.rect(0, 15, pageWidth, 3).fill(UAGRM_VERDE);

      // Marco decorativo dorado
      doc.rect(leftMargin - 20, 40, contentWidth + 40, pageHeight - 100)
         .lineWidth(3)
         .strokeColor(UAGRM_DORADO)
         .stroke();

      // Línea interna decorativa
      doc.rect(leftMargin - 15, 45, contentWidth + 30, pageHeight - 110)
         .lineWidth(1)
         .strokeColor(UAGRM_AZUL)
         .stroke();

      // Header institucional
      doc.fontSize(11)
         .fillColor(UAGRM_AZUL)
         .font('Helvetica-Bold')
         .text('UNIVERSIDAD AUTÓNOMA', leftMargin, 55, {
           width: contentWidth,
           align: 'center'
         });

      doc.fontSize(13)
         .text('GABRIEL RENÉ MORENO', leftMargin, 72, {
           width: contentWidth,
           align: 'center'
         });

      // Título principal con estilo
      doc.fontSize(32)
         .font('Helvetica-Bold')
         .fillColor(UAGRM_AZUL)
         .text('CERTIFICADO', leftMargin, 105, {
           width: contentWidth,
           align: 'center'
         });

      doc.fontSize(20)
         .fillColor(UAGRM_VERDE)
         .text('DE PARTICIPACIÓN', leftMargin, 145, {
           width: contentWidth,
           align: 'center'
         });

      // Línea decorativa dorada
      const lineY = 175;
      doc.moveTo(leftMargin + 100, lineY)
         .lineTo(pageWidth - rightMargin - 100, lineY)
         .lineWidth(2)
         .strokeColor(UAGRM_DORADO)
         .stroke();

      // Información de la feria
      doc.fontSize(15)
         .fillColor(GRIS_OSCURO)
         .font('Helvetica-Bold')
         .text(feria.nombre, leftMargin, 185, {
           width: contentWidth,
           align: 'center'
         });
      
      doc.fontSize(12)
         .fillColor(GRIS_CLARO)
         .font('Helvetica')
         .text(`${feria.semestre} - ${feria.año}`, leftMargin, 203, {
           width: contentWidth,
           align: 'center'
         });

      // Estudiantes - compacto con espaciado dinámico
      let currentY = 220;
      
      // Calcular espaciado dinámico basado en número de estudiantes
      const numEstudiantes = estudiantes.length;
      const espaciadoNombre = numEstudiantes > 5 ? 9 : 10;
      const espaciadoCodigo = numEstudiantes > 5 ? 9 : 11;
      
      doc.fontSize(10)
         .fillColor(UAGRM_AZUL)
         .font('Helvetica')
         .text('Se certifica que:', leftMargin, currentY, {
           width: contentWidth,
           align: 'center',
           lineBreak: false
         });

      currentY += 14;
      doc.font('Helvetica-Bold')
         .fontSize(10)
         .fillColor(GRIS_OSCURO);
      
      // Limitar altura de estudiantes con espaciado compacto
      for (const est of estudiantes) {
        const liderBadge = est.esLider ? ' (Lider)' : '';
        doc.text(`${est.nombre} ${est.apellido}${liderBadge}`, 
          leftMargin + 40, currentY, {
            width: contentWidth - 80,
            align: 'center',
            lineBreak: false
          });
        currentY += espaciadoNombre;
        doc.fontSize(8)
           .fillColor(GRIS_CLARO)
           .font('Helvetica')
           .text(`${est.codigo}`, 
             leftMargin + 40, currentY, {
               width: contentWidth - 80,
               align: 'center',
               lineBreak: false
             });
        currentY += espaciadoCodigo;
        doc.fontSize(10).fillColor(GRIS_OSCURO).font('Helvetica-Bold');
      }

      // Proyecto con fondo verde claro
      currentY += 2;
      const proyectoBoxY = currentY - 2;
      doc.rect(leftMargin + 30, proyectoBoxY, contentWidth - 60, 36)
         .fillOpacity(0.1)
         .fill(UAGRM_VERDE)
         .fillOpacity(1);

      doc.fontSize(9)
         .fillColor(UAGRM_VERDE)
         .font('Helvetica')
         .text('Ha(n) participado con el proyecto:', leftMargin, currentY, {
           width: contentWidth,
           align: 'center'
         });
      
      currentY += 13;
      doc.font('Helvetica-Bold')
         .fontSize(11)
         .fillColor(GRIS_OSCURO)
         .text(`"${proyecto.nombre}"`, leftMargin + 40, currentY, {
           width: contentWidth - 80,
           align: 'center'
         });

      // Información Académica: Materia, Nivel, Categoría
      currentY += 12;
      const infoAcademica = [];
      
      if (datos.materia) {
        const materiaNombre = typeof datos.materia === 'object' ? datos.materia.nombre : datos.materia;
        infoAcademica.push(materiaNombre);
      }
      
      if (datos.nivel) {
        infoAcademica.push(`Nivel ${datos.nivel}`);
      }
      
      if (datos.categoria) {
        const categoriaNombre = typeof datos.categoria === 'object' ? datos.categoria.nombre : datos.categoria;
        infoAcademica.push(`Cat: ${categoriaNombre}`);
      }
      
      if (infoAcademica.length > 0) {
        doc.font('Helvetica-Bold')
           .fontSize(8)
           .fillColor(UAGRM_AZUL)
           .text(infoAcademica.join(' | '), leftMargin, currentY, {
             width: contentWidth,
             align: 'center',
             lineBreak: false
           });
        currentY += 11;
      }

      // Nota y Lugar del proyecto (en línea separada, más destacado)
      const rendimiento = [];
      
      if (datos.nota) {
        rendimiento.push(`Nota: ${datos.nota}/100`);
      }
      
      if (datos.lugar) {
        const lugarTexto = datos.lugar === 1 ? '1er Lugar' : 
                           datos.lugar === 2 ? '2do Lugar' : 
                           datos.lugar === 3 ? '3er Lugar' : 
                           `${datos.lugar} Lugar`;
        rendimiento.push(lugarTexto);
      }
      
      if (rendimiento.length > 0) {
        doc.font('Helvetica-Bold')
           .fontSize(11)
           .fillColor(UAGRM_DORADO)
           .text(rendimiento.join('  |  '), leftMargin, currentY, {
             width: contentWidth,
             align: 'center',
             lineBreak: false
           });
        currentY += 13;
      }

      // Tutor/Docente
      if (tutor && tutor.nombre && tutor.apellido) {
        currentY += 8;
        doc.font('Helvetica')
           .fontSize(9)
           .fillColor(UAGRM_AZUL)
           .text('Bajo la direccion de:', leftMargin, currentY, {
             width: contentWidth,
             align: 'center'
           });
        
        currentY += 11;
        doc.font('Helvetica-Bold')
           .fontSize(10)
           .fillColor(GRIS_OSCURO)
           .text(`${tutor.nombre} ${tutor.apellido}`, 
             leftMargin, currentY, {
               width: contentWidth,
               align: 'center'
             });

        currentY += 11;
      } else {
        currentY += 8;
      }

      // Materia
      if (materia) {
        currentY += 11;
        const materiaTexto = materia.grupo 
          ? `${materia.nombre} | Grupo: ${materia.grupo}`
          : materia.nombre;
        
        doc.font('Helvetica')
           .fontSize(8)
           .fillColor(GRIS_CLARO)
           .text(materiaTexto, 
             leftMargin, currentY, {
               width: contentWidth,
               align: 'center',
               lineBreak: false
             });
        currentY += 10;
      }

      // Posiciones fijas para elementos del footer (absolute positioning)
      const footerY = pageHeight - 95;  // Posición fija para el footer principal
      const qrY = pageHeight - 170;      // Posición fija para QR
      const blockchainY = pageHeight - 165;  // Posición fija para blockchain info
      
      // Asegurar que el contenido no se superponga con el footer
      // Si currentY está muy cerca del footer, no agregamos espacio adicional
      if (currentY < footerY - 30) {
        currentY += 20;
      }
      
      // Fecha
      doc.fontSize(8)
         .fillColor(GRIS_CLARO)
         .font('Helvetica')
         .text(`Emisión: ${new Date().toLocaleDateString('es-ES', { 
           day: 'numeric', 
           month: 'long', 
           year: 'numeric' 
         })}`, 
           leftMargin, footerY, {
             width: contentWidth / 3,
             lineBreak: false
           });

      // Ciudad
      doc.text('Santa Cruz - Bolivia', 
        leftMargin + contentWidth / 3, footerY, {
          width: contentWidth / 3,
          align: 'center',
          lineBreak: false
        });

      // Código del certificado
      doc.fillColor(UAGRM_AZUL)
         .font('Helvetica-Bold')
         .text(`Nº ${certificadoId.substring(0, 8).toUpperCase()}`, 
           leftMargin + (contentWidth / 3) * 2, footerY, {
             width: contentWidth / 3,
             align: 'right',
             lineBreak: false
           });

      // Generar y agregar QR code si se proporciona URL de verificación
      if (verifyUrl) {
        try {
          // Generar QR code como buffer con colores UAGRM
          const qrBuffer = await QRCode.toBuffer(verifyUrl, {
            errorCorrectionLevel: 'H',
            margin: 1,
            width: 150,
            color: {
              dark: '#003366',  // Azul UAGRM
              light: '#FFFFFF'
            }
          });

          // Posición del QR (esquina inferior derecha, posición absoluta)
          const qrSize = 80;
          const qrX = pageWidth - rightMargin - qrSize - 20;
          // qrY ya está definido arriba como posición fija

          // Marco decorativo para el QR
          doc.rect(qrX - 6, qrY - 6, qrSize + 12, qrSize + 12)
             .lineWidth(1.5)
             .strokeColor(UAGRM_DORADO)
             .stroke();

          doc.rect(qrX - 4, qrY - 4, qrSize + 8, qrSize + 8)
             .lineWidth(0.5)
             .strokeColor(UAGRM_AZUL)
             .stroke();

          // Insertar QR code
          doc.image(qrBuffer, qrX, qrY, {
            width: qrSize,
            height: qrSize
          });

          // Texto decorativo debajo del QR (reducido)
          doc.fontSize(5.5)
             .fillColor(UAGRM_VERDE)
             .font('Helvetica-Bold')
             .text('VERIFICACION', qrX - 5, qrY + qrSize + 4, {
               width: qrSize + 10,
               align: 'center',
               lineBreak: false
             });

        } catch (qrError) {
          console.warn('⚠️ No se pudo agregar QR al PDF:', qrError.message);
          // Continuar sin QR si falla
        }
      }

      // Información del blockchain (esquina inferior izquierda, posición absoluta)
      if (datos.blockchain) {
        const blockchainX = leftMargin;
        // blockchainY ya está definido arriba como posición fija

        // Título
        doc.fontSize(6.5)
           .fillColor(UAGRM_AZUL)
           .font('Helvetica-Bold')
           .text('Verificación Blockchain', blockchainX, blockchainY, { lineBreak: false });

        // Red
        doc.fontSize(5.5)
           .fillColor(GRIS_OSCURO)
           .font('Helvetica')
           .text(`Red: ${datos.blockchain.network}`, blockchainX, blockchainY + 9, { lineBreak: false });

        // Transaction Hash (truncado)
        const txHashDisplay = datos.blockchain.txHash.length > 20 
          ? `${datos.blockchain.txHash.substring(0, 10)}...${datos.blockchain.txHash.substring(datos.blockchain.txHash.length - 8)}`
          : datos.blockchain.txHash;
        
        doc.fontSize(5)
           .text(`TX: ${txHashDisplay}`, blockchainX, blockchainY + 17, { lineBreak: false });

        // Block Number y Gas en una línea
        const blockGasText = datos.blockchain.gasUsed 
          ? `Bloque: ${datos.blockchain.blockNumber || 'N/A'} | Gas: ${datos.blockchain.gasUsed}`
          : `Bloque: ${datos.blockchain.blockNumber || 'N/A'}`;
        
        doc.fontSize(5.5)
           .text(blockGasText, blockchainX, blockchainY + 25, { lineBreak: false });

        // Timestamp
        if (datos.blockchain.timestamp) {
          const fecha = new Date(datos.blockchain.timestamp);
          const fechaFormateada = fecha.toLocaleString('es-BO', {
            day: '2-digit',
            month: '2-digit',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
          });
          
          doc.fontSize(5)
             .fillColor(GRIS_CLARO)
             .text(fechaFormateada, blockchainX, blockchainY + 33, { lineBreak: false });
        }
      }

      // Franja inferior verde
      doc.rect(0, pageHeight - 18, pageWidth, 3).fill(UAGRM_VERDE);
      
      // Franja inferior azul
      doc.rect(0, pageHeight - 15, pageWidth, 15).fill(UAGRM_AZUL);

      // Finalizar documento
      doc.end();

      stream.on('finish', () => {
        resolve(filePath);
      });

      stream.on('error', (error) => {
        reject(error);
      });

    } catch (error) {
      reject(error);
    }
  });
};

/**
 * Agregar QR code al PDF existente
 */
export const agregarQR = async (filePath, qrData) => {
  try {
    // Generar QR code como buffer
    const qrBuffer = await QRCode.toBuffer(qrData, {
      errorCorrectionLevel: 'H',
      margin: 1,
      width: 150
    });

    // Leer el PDF existente y agregar QR
    // Por simplicidad, vamos a crear una función que agregue el QR en una nueva página
    // En producción, se puede usar pdf-lib para modificar el PDF existente
    
    // Por ahora, retornamos el path del PDF sin modificar
    // TODO: Implementar inserción de QR con pdf-lib
    
    return filePath;
  } catch (error) {
    console.error('Error al agregar QR:', error);
    throw error;
  }
};

/**
 * Calcular hash SHA-256 de un archivo
 */
export const calcularHashPDF = (filePath) => {
  return new Promise((resolve, reject) => {
    const hash = crypto.createHash('sha256');
    const stream = fs.createReadStream(filePath);

    stream.on('data', (data) => {
      hash.update(data);
    });

    stream.on('end', () => {
      resolve(hash.digest('hex'));
    });

    stream.on('error', (error) => {
      reject(error);
    });
  });
};

/**
 * Eliminar archivo PDF
 */
export const eliminarPDF = (filePath) => {
  if (fs.existsSync(filePath)) {
    fs.unlinkSync(filePath);
  }
};
