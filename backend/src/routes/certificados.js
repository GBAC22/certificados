import express from 'express';
import { 
  generarCertificado,
  generarLote,
  listarCertificados,
  obtenerCertificado,
  descargarPDF,
  revocarCertificado,
  limpiarCertificadosPrueba
} from '../controllers/certificadosController.js';

const router = express.Router();

router.post('/generar', generarCertificado);
router.post('/generar-lote', generarLote);
router.delete('/limpiar-prueba/:feriaId', limpiarCertificadosPrueba);
router.get('/', listarCertificados);
router.get('/:id', obtenerCertificado);
router.get('/:id/pdf', descargarPDF);
router.patch('/:id/revocar', revocarCertificado);

export default router;
