import express from 'express';
import { 
  listarProyectos, 
  obtenerProyecto 
} from '../controllers/proyectosController.js';

const router = express.Router();

router.get('/', listarProyectos);
router.get('/:id', obtenerProyecto);

export default router;
