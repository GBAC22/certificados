import express from 'express';
import { 
  listarFerias, 
  obtenerFeria, 
  obtenerProyectosDeFeria 
} from '../controllers/feriasController.js';

const router = express.Router();

router.get('/', listarFerias);
router.get('/:id', obtenerFeria);
router.get('/:id/proyectos', obtenerProyectosDeFeria);

export default router;
