import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';
import { PDFDocument } from 'pdf-lib';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

/**
 * Combinar múltiples PDFs en uno solo
 */
export const combinarPDFs = async (certificadosPaths, feriaInfo) => {
  try {
    console.log(`📄 Combinando ${certificadosPaths.length} certificados en un solo PDF...`);
    
    // Crear un nuevo documento PDF
    const mergedPdf = await PDFDocument.create();

    // Leer y combinar cada certificado
    for (let i = 0; i < certificadosPaths.length; i++) {
      const cert = certificadosPaths[i];
      console.log(`   [${i + 1}/${certificadosPaths.length}] Agregando: ${cert.proyecto}`);
      
      try {
        // Construir ruta absoluta al PDF
        const pdfPath = path.join(process.cwd(), cert.pdf_path);
        
        // Verificar que el archivo existe
        if (!fs.existsSync(pdfPath)) {
          console.warn(`   ⚠️ Archivo no encontrado: ${pdfPath}`);
          continue;
        }

        // Leer el PDF
        const pdfBytes = fs.readFileSync(pdfPath);
        const pdfDoc = await PDFDocument.load(pdfBytes);

        // Copiar todas las páginas del PDF
        const copiedPages = await mergedPdf.copyPages(pdfDoc, pdfDoc.getPageIndices());
        copiedPages.forEach((page) => {
          mergedPdf.addPage(page);
        });

      } catch (error) {
        console.error(`   ❌ Error al procesar ${cert.proyecto}:`, error.message);
        continue;
      }
    }

    // Guardar el PDF combinado
    const pdfBytes = await mergedPdf.save();
    
    console.log(`✅ PDF combinado generado correctamente con ${mergedPdf.getPageCount()} páginas`);
    
    return Buffer.from(pdfBytes);

  } catch (error) {
    console.error('Error al combinar PDFs:', error);
    throw error;
  }
};
