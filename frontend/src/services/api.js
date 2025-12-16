import axios from 'axios';

const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  timeout: 30000,
  headers: {
    'Content-Type': 'application/json'
  }
});

// Interceptor para errores
api.interceptors.response.use(
  response => response,
  error => {
    console.error('API Error:', error);
    return Promise.reject(error);
  }
);

// Ferias
export const getFerias = () => api.get('/ferias');
export const getFeria = (id) => api.get(`/ferias/${id}`);
export const getProyectosDeFeria = (id) => api.get(`/ferias/${id}/proyectos`);
export const finalizarFeria = (id) => api.post(`/ferias/${id}/finalizar`);

// Proyectos
export const getProyectos = (params) => api.get('/proyectos', { params });
export const getProyecto = (id) => api.get(`/proyectos/${id}`);

// Certificados
export const getCertificados = (params) => api.get('/certificados', { params });
export const getCertificado = (id) => api.get(`/certificados/${id}`);
export const generarCertificado = (data) => api.post('/certificados/generar', data);
export const generarLote = (data) => api.post('/certificados/generar-lote', data);
export const limpiarCertificadosPrueba = (feriaId) => api.delete(`/certificados/limpiar-prueba/${feriaId}`);
export const revocarCertificado = (id, motivo) => api.patch(`/certificados/${id}/revocar`, { motivo });
export const descargarPDF = (id) => `${API_BASE_URL}/certificados/${id}/pdf`;

// Verificar
export const verificarCertificado = (id) => api.get(`/verificar/${id}`);
export const verificarPorCodigo = (codigo) => api.get(`/verificar/codigo/${codigo}`);

export default api;
