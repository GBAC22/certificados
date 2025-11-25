import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import rateLimit from 'express-rate-limit';
import dotenv from 'dotenv';
import feriasRoutes from './routes/ferias.js';
import proyectosRoutes from './routes/proyectos.js';
import certificadosRoutes from './routes/certificados.js';
import verificarRoutes from './routes/verificar.js';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Middlewares
app.use(helmet());
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:5173'
}));
app.use(express.json());

// Rate limiting
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutos
  max: 100 // límite de 100 requests por ventana
});
app.use('/api/', limiter);

// Routes
app.get('/', (req, res) => {
  res.json({ 
    message: 'API de Certificados con Blockchain',
    version: '1.0.0',
    endpoints: [
      '/api/ferias',
      '/api/proyectos',
      '/api/certificados',
      '/api/verificar'
    ]
  });
});

app.use('/api/ferias', feriasRoutes);
app.use('/api/proyectos', proyectosRoutes);
app.use('/api/certificados', certificadosRoutes);
app.use('/api/verificar', verificarRoutes);

// Error handler
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ 
    error: true,
    message: 'Error interno del servidor',
    details: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

// 404 handler
app.use((req, res) => {
  res.status(404).json({ 
    error: true,
    message: 'Endpoint no encontrado' 
  });
});

app.listen(PORT, () => {
  console.log(`✅ Servidor ejecutándose en http://localhost:${PORT}`);
  console.log(`📝 Modo: ${process.env.NODE_ENV || 'development'}`);
});
