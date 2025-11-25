import express from 'express';
import { 
  verificarPorId,
  verificarPorCodigo
} from '../controllers/verificarController.js';

const router = express.Router();

router.get('/:id', verificarPorId);
router.get('/codigo/:codigo', verificarPorCodigo);

export default router;
