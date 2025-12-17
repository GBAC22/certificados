import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import PDFDocument from 'pdfkit';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/**
 * Combinar múltiples PDFs en uno solo
 * Nota: Usamos una solución simple que genera un índice y enlaces,
 * ya que combinar PDFs requiere librerías adicionales
 */
export const combinarPDFs = async (certificadosPaths, feriaInfo) => {
  try {
    console.log(`📄 Combinando ${certificadosPaths.length} certificados...`);
    
    // Crear un PDF índice con información
    const doc = new PDFDocument({
      size: 'LETTER',
      margins: { top: 50, bottom: 50, left: 50, right: 50 }
    });

    // Array para almacenar chunks
    const chunks = [];
    doc.on('data', chunk => chunks.push(chunk));

    // Portada
    doc.fontSize(24)
       .font('Helvetica-Bold')
       .fillColor('#003366')
       .text('CERTIFICADOS - LOTE DE IMPRESIÓN', { align: 'center' });
    
    doc.moveDown(2);
    
    doc.fontSize(16)
       .font('Helvetica')
       .fillColor('#000000')
       .text(feriaInfo.nombre, { align: 'center' });
    
    doc.fontSize(12)
       .fillColor('#666666')
       .text(`Semestre ${feriaInfo.semestre} - ${feriaInfo.año}`, { align: 'center' });
    
    doc.moveDown(2);
    
    doc.fontSize(14)
       .fillColor('#000000')
       .text(`Total de certificados: ${certificadosPaths.length}`, { align: 'center' });
    
    doc.moveDown(1);
    
    doc.fontSize(10)
       .fillColor('#666666')
       .text(`Generado: ${new Date().toLocaleString('es-ES')}`, { align: 'center' });
    
    // Nueva página con índice
    doc.addPage();
    
    doc.fontSize(18)
       .font('Helvetica-Bold')
       .fillColor('#003366')
       .text('ÍNDICE DE CERTIFICADOS', { align: 'center' });
    
    doc.moveDown(2);
    
    // Listar certificados
    doc.fontSize(10).font('Helvetica');
    
    certificadosPaths.forEach((cert, index) => {
      if (doc.y > 700) {
        doc.addPage();
      }
      
      doc.fillColor('#000000')
         .text(`${index + 1}. `, { continued: true })
         .font('Helvetica-Bold')
         .text(cert.proyecto, { continued: true })
         .font('Helvetica')
         .text(` - ${cert.codigo}`);
      
      doc.moveDown(0.5);
    });

    // Instrucciones de impresión
    doc.addPage();
    
    doc.fontSize(16)
       .font('Helvetica-Bold')
       .fillColor('#003366')
       .text('INSTRUCCIONES DE IMPRESIÓN', { align: 'center' });
    
    doc.moveDown(2);
    
    doc.fontSize(11)
       .font('Helvetica')
       .fillColor('#000000');
    
    const instrucciones = [
      '1. Este es un índice de los certificados a imprimir.',
      '',
      '2. Los certificados individuales están ubicados en la carpeta:',
      '   storage/certificados/',
      '',
      '3. Para imprimir los certificados:',
      '   - Opción A: Descargue cada certificado desde la interfaz web',
      '   - Opción B: Acceda a la carpeta del servidor y combine los PDFs',
      '',
      '4. Listado de archivos a imprimir:'
    ];
    
    instrucciones.forEach(linea => {
      if (doc.y > 700) {
        doc.addPage();
      }
      doc.text(linea);
      doc.moveDown(0.5);
    });
    
    doc.moveDown(1);
    doc.fontSize(9).fillColor('#666666');
    
    certificadosPaths.forEach((cert, index) => {
      if (doc.y > 700) {
        doc.addPage();
      }
      doc.text(`   ${index + 1}. ${cert.filename}`);
      doc.moveDown(0.3);
    });

    doc.end();

    // Esperar a que termine de generar
    await new Promise((resolve, reject) => {
      doc.on('end', resolve);
      doc.on('error', reject);
    });

    console.log('✅ PDF índice generado correctamente');
    return Buffer.concat(chunks);

  } catch (error) {
    console.error('Error al combinar PDFs:', error);
    throw error;
  }
};
