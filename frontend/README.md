# Frontend - Sistema de Certificados

Interfaz web de administración para el sistema de certificados con blockchain.

## 🚀 Inicio Rápido

### 1. Instalar dependencias
```bash
npm install
```

### 2. Configurar variables de entorno (opcional)
Crear `.env` si necesitas cambiar la URL de la API:
```
VITE_API_URL=http://localhost:3000/api
```

### 3. Ejecutar en desarrollo
```bash
npm run dev
```

La aplicación se abrirá en: http://localhost:5173

### 4. Compilar para producción
```bash
npm run build
```

Los archivos compilados estarán en la carpeta `dist/`.

## 📁 Estructura

```
frontend/
├── public/              # Archivos estáticos
├── src/
│   ├── components/      # Componentes reutilizables
│   │   ├── Layout.jsx   # Layout principal con navegación
│   │   ├── Card.jsx     # Componente de tarjeta
│   │   └── Button.jsx   # Componente de botón
│   ├── pages/           # Páginas de la aplicación
│   │   ├── Dashboard.jsx
│   │   ├── Ferias.jsx
│   │   ├── FeriaDetalle.jsx
│   │   ├── ProyectoDetalle.jsx
│   │   ├── Certificados.jsx
│   │   ├── CertificadoDetalle.jsx
│   │   └── Verificar.jsx
│   ├── services/        # Servicios de API
│   │   └── api.js       # Cliente de API REST
│   ├── App.jsx          # Componente principal
│   ├── main.jsx         # Entry point
│   └── index.css        # Estilos globales
└── package.json
```

## 🎨 Tecnologías

- **React 18** - Framework de UI
- **Vite** - Build tool y dev server
- **React Router** - Enrutamiento
- **TailwindCSS** - Estilos
- **Axios** - HTTP client
- **Lucide React** - Iconos

## 📱 Páginas

### Dashboard (/)
- Vista general del sistema
- Estadísticas de certificados
- Acceso rápido a ferias

### Ferias (/ferias)
- Lista de todas las ferias
- Tarjetas con información básica

### Detalle de Feria (/ferias/:id)
- Información completa de la feria
- Lista de proyectos
- Botón para generar certificados por lote
- Estadísticas de certificados

### Detalle de Proyecto (/proyectos/:id)
- Información del proyecto
- Lista de estudiantes
- Información del tutor
- Botones para generar certificado (borrador u oficial)

### Certificados (/certificados)
- Lista de certificados generados
- Filtros por estado
- Acceso a detalles y descarga

### Detalle de Certificado (/certificados/:id)
- Información completa del certificado
- Datos de blockchain
- Descarga de PDF
- Opción de revocar

### Verificar (/verificar)
- Verificación pública de certificados
- Ingreso por código o ID
- Muestra validez y datos

## 🔌 API Endpoints

El frontend se comunica con el backend a través de:

```
GET    /api/ferias
GET    /api/ferias/:id
GET    /api/ferias/:id/proyectos
GET    /api/proyectos/:id
POST   /api/certificados/generar
POST   /api/certificados/generar-lote
GET    /api/certificados
GET    /api/certificados/:id
GET    /api/certificados/:id/pdf
PATCH  /api/certificados/:id/revocar
GET    /api/verificar/:id
GET    /api/verificar/codigo/:codigo
```

## 🎨 Personalización

### Colores
Edita `tailwind.config.js` para cambiar los colores del tema.

### Componentes
Los componentes en `src/components/` son reutilizables y personalizables.

## 🐛 Troubleshooting

### El frontend no se conecta al backend
- Asegúrate de que el backend esté corriendo en `http://localhost:3000`
- Verifica la configuración del proxy en `vite.config.js`

### Error de CORS
- El backend debe tener CORS configurado para aceptar requests desde `http://localhost:5173`
