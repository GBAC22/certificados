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
export const generarPDF = async (datos, certificadoId) => {
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
      const leftMargin = 70;
      const rightMargin = 70;
      const contentWidth = pageWidth - leftMargin - rightMargin;

      // Header con logos
      doc.fontSize(10).text('🎓 UNIVERSIDAD', leftMargin, 40);
      doc.fontSize(10).text('FACULTAD 🏛️', pageWidth - rightMargin - 100, 40);

      // Título principal
      doc.fontSize(26)
         .font('Helvetica-Bold')
         .text('CERTIFICADO DE PARTICIPACIÓN', leftMargin, 100, {
           width: contentWidth,
           align: 'center'
         });

      doc.fontSize(18)
         .font('Helvetica')
         .text('FERIA DE INVESTIGACIÓN', leftMargin, 140, {
           width: contentWidth,
           align: 'center'
         });

      doc.fontSize(16)
         .text(feria.nombre, leftMargin, 170, {
           width: contentWidth,
           align: 'center'
         });
      
      doc.fontSize(14)
         .text(`${feria.semestre} - ${feria.año}`, leftMargin, 195, {
           width: contentWidth,
           align: 'center'
         });

      // Línea decorativa
      doc.moveTo(leftMargin + 50, 225).lineTo(pageWidth - rightMargin - 50, 225).stroke();

      // Estudiantes
      let currentY = 245;
      doc.fontSize(12)
         .font('Helvetica')
         .text('Se certifica que el/los estudiante(s):', leftMargin, currentY, {
           width: contentWidth
         });

      currentY += 25;
      doc.font('Helvetica-Bold');
      estudiantes.forEach(est => {
        const liderText = est.esLider ? ' (Líder)' : '';
        doc.text(`• ${est.nombre} ${est.apellido} - Código: ${est.codigo}${liderText}`, 
          leftMargin + 20, currentY, {
            width: contentWidth - 40
          });
        currentY += 20;
      });

      // Proyecto
      currentY += 10;
      doc.font('Helvetica')
         .text('Han participado con el proyecto:', leftMargin, currentY, {
           width: contentWidth
         });
      
      currentY += 25;
      doc.font('Helvetica-Bold')
         .fontSize(13)
         .text(`"${proyecto.nombre}"`, leftMargin, currentY, {
           width: contentWidth,
           align: 'center'
         });

      // Tutor
      currentY += 35;
      doc.font('Helvetica')
         .fontSize(12)
         .text('Bajo la tutoría de:', leftMargin, currentY, {
           width: contentWidth
         });
      
      currentY += 20;
      doc.font('Helvetica-Bold')
         .text(`${tutor.nombre} ${tutor.apellido} - Código: ${tutor.codigo}`, 
           leftMargin, currentY, {
             width: contentWidth,
             align: 'center'
           });

      // Materia
      if (materia) {
        currentY += 25;
        doc.font('Helvetica')
           .fontSize(11)
           .text(`Materia: ${materia.nombre} - Grupo: ${materia.grupo}`, 
             leftMargin, currentY, {
               width: contentWidth,
               align: 'center'
             });
      }

      // Línea decorativa
      currentY += 30;
      doc.moveTo(leftMargin + 50, currentY).lineTo(pageWidth - rightMargin - 50, currentY).stroke();

      // Footer
      currentY += 20;
      doc.fontSize(10)
         .text(`Fecha de emisión: ${new Date().toLocaleDateString('es-ES')}`, 
           leftMargin, currentY, {
             width: contentWidth / 2
           });

      doc.text(`Código: ${certificadoId}`, 
        pageWidth - rightMargin - contentWidth / 2, currentY, {
          width: contentWidth / 2,
          align: 'right'
        });

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
