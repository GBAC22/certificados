import express from 'express';
import { 
  listarFerias, 
  obtenerFeria, 
  obtenerProyectosDeFeria,
  finalizarFeria 
} from '../controllers/feriasController.js';

const router = express.Router();

router.get('/', listarFerias);
router.get('/:id', obtenerFeria);
router.get('/:id/proyectos', obtenerProyectosDeFeria);
router.post('/:id/finalizar', finalizarFeria);

export default router;
