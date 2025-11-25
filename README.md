# Sistema de Certificados con Blockchain

Sistema completo para emitir y verificar certificados digitales utilizando blockchain (Polygon).

## 🎯 Características

- ✅ Generación de certificados en PDF
- ✅ Registro inmutable en blockchain (Polygon)
- ✅ Verificación pública de autenticidad
- ✅ Interfaz web de administración
- ✅ QR codes para verificación rápida
- ✅ Generación por lotes
- ✅ Sistema de revocación

## 🏗️ Arquitectura

```
┌─────────────────────────────────────────────┐
│         Frontend (React + Vite)             │
│         Panel de Administración             │
└──────────────────┬──────────────────────────┘
                   │
                   ↓
┌─────────────────────────────────────────────┐
│      Backend (Node.js + Express)            │
│         API REST                            │
└──┬──────────┬──────────┬────────────────────┘
   │          │          │          
   ↓          ↓          ↓          
┌──────┐  ┌────────┐ ┌──────────┐  
│ Post │  │ PDF    │ │ Polygon  │  
│ greSQL│  │ Gen    │ │ Blockchain│  
└──────┘  └────────┘ └──────────┘  
```

## 📦 Estructura del Proyecto

```
proyecto-certificados/
├── backend/              # API REST (Node.js + Express)
│   ├── src/
│   │   ├── config/       # Configuración (DB, blockchain)
│   │   ├── controllers/  # Lógica de endpoints
│   │   ├── routes/       # Rutas API
│   │   ├── services/     # Servicios (PDF, blockchain)
│   │   └── index.js
│   └── package.json
│
├── frontend/             # Panel Admin (React + Vite)
│   ├── src/
│   │   ├── components/   # Componentes React
│   │   ├── pages/        # Páginas
│   │   ├── services/     # API client
│   │   └── App.jsx
│   └── package.json
│
├── blockchain/           # Smart Contracts (Hardhat)
│   ├── contracts/        # Contratos Solidity
│   ├── scripts/          # Scripts de deploy
│   ├── test/             # Tests
│   └── hardhat.config.js
│
└── README.md
```

## 🚀 Inicio Rápido

### Prerrequisitos

- Node.js 18+ ([Descargar](https://nodejs.org/))
- PostgreSQL 14+ ([Descargar](https://www.postgresql.org/download/))
- MetaMask (para blockchain) ([Instalar](https://metamask.io/))

### 1. Clonar o descargar el proyecto

### 2. Configurar Base de Datos

Crear base de datos PostgreSQL:
```bash
createdb certificados_db
```

O desde psql:
```sql
CREATE DATABASE certificados_db;
```

### 3. Backend

```bash
cd backend

# Instalar dependencias
npm install

# Configurar variables de entorno
cp .env.example .env
# Editar .env con tus valores

# Inicializar base de datos
npm run init-db

# Ejecutar servidor
npm run dev
```

El backend estará en: http://localhost:3000

### 4. Blockchain (Opcional para empezar)

```bash
cd blockchain

# Instalar dependencias
npm install

# Compilar contratos
npm run compile

# Ejecutar tests
npm test

# Desplegar en Mumbai testnet (requiere MATIC)
npm run deploy:mumbai
# Copiar CONTRACT_ADDRESS y actualizar en backend/.env
```

### 5. Frontend

```bash
cd frontend

# Instalar dependencias
npm install

# Ejecutar en desarrollo
npm run dev
```

El frontend estará en: http://localhost:5173

## 📖 Documentación Detallada

Cada carpeta tiene su propio README con instrucciones detalladas:

- [Backend README](./backend/README.md)
- [Frontend README](./frontend/README.md)
- [Blockchain README](./blockchain/README.md)

## 🔑 Configuración de Variables de Entorno

### backend/.env

```bash
# Server
PORT=3000
NODE_ENV=development

# Database
DB_HOST=localhost
DB_PORT=5432
DB_NAME=certificados_db
DB_USER=postgres
DB_PASSWORD=tu_password

# Blockchain
BLOCKCHAIN_NETWORK=mumbai
BLOCKCHAIN_RPC_URL=https://rpc-mumbai.maticvigil.com
CONTRACT_ADDRESS=0x... # Después del deploy
PRIVATE_KEY=tu_private_key # Para firmar transacciones

# App
FRONTEND_URL=http://localhost:5173
VERIFY_BASE_URL=http://localhost:3000/api/verificar
```

## 🎮 Uso del Sistema

### 1. Acceder al Panel de Admin
Abre http://localhost:5173 en tu navegador

### 2. Ver Ferias
- Ve a "Ferias" en el menú
- Verás las ferias de prueba creadas
- Click en una feria para ver detalles

### 3. Generar Certificado Individual
- Entra a una feria
- Click en un proyecto
- Click en "Generar Certificado"
- Elige "Borrador" (para pruebas) u "Oficial" (se registra en blockchain)

### 4. Generar Certificados por Lote
- Entra a una feria
- Click en "Generar Lote"
- Confirma la generación
- Espera a que termine el proceso

### 5. Verificar Certificado
- Ve a "Verificar" en el menú
- Ingresa el código del certificado (ej: CERT-2024-2-001)
- Click en "Verificar"
- Verás si el certificado es válido y sus datos

## 🧪 Testing

### Backend
```bash
cd backend
# No incluye tests por defecto en versión simplificada
```

### Blockchain
```bash
cd blockchain
npm test
```

### Frontend
```bash
cd frontend
# No incluye tests por defecto en versión simplificada
```

## 📊 Endpoints API

### Ferias
- `GET /api/ferias` - Listar ferias
- `GET /api/ferias/:id` - Obtener feria
- `GET /api/ferias/:id/proyectos` - Proyectos de una feria

### Certificados
- `POST /api/certificados/generar` - Generar certificado individual
- `POST /api/certificados/generar-lote` - Generar por lote
- `GET /api/certificados` - Listar certificados
- `GET /api/certificados/:id` - Obtener certificado
- `GET /api/certificados/:id/pdf` - Descargar PDF

### Verificación
- `GET /api/verificar/:id` - Verificar por ID
- `GET /api/verificar/codigo/:codigo` - Verificar por código

## 🔐 Seguridad

- ✅ Variables sensibles en `.env` (no en código)
- ✅ Rate limiting en API
- ✅ CORS configurado
- ✅ Helmet para headers de seguridad
- ✅ Solo owner puede registrar en blockchain
- ✅ Validación de inputs

## 🐛 Troubleshooting

### Error: No se puede conectar a PostgreSQL
- Verifica que PostgreSQL esté corriendo
- Verifica credenciales en `.env`
- Verifica que la base de datos exista

### Error: CORS
- Verifica que `FRONTEND_URL` en backend/.env sea correcto
- Por defecto: `http://localhost:5173`

### Error: Blockchain no configurado
- Es normal si no has desplegado el contrato
- Los certificados se pueden generar como "borrador" sin blockchain
- Para producción, debes desplegar el contrato en Polygon

### Frontend no se conecta al backend
- Verifica que el backend esté corriendo en puerto 3000
- Verifica el proxy en `frontend/vite.config.js`

## 💰 Costos Estimados

### Desarrollo (Testnet)
- ✅ Gratis (MATIC de prueba gratis)

### Producción (Mainnet)
- Deploy de contrato: ~$0.01 USD
- Por certificado: ~$0.001 USD
- 1000 certificados: ~$1-10 USD

### Infraestructura
- VPS básico: $5-10/mes
- Base de datos: $0-15/mes (incluido en VPS o managed)
- Total estimado: $10-35/mes

## 🚀 Siguientes Pasos

1. ✅ **Probar localmente**: Ejecuta todo y genera certificados de prueba
2. ✅ **Personalizar plantilla PDF**: Edita `backend/src/services/pdfService.js`
3. ✅ **Agregar logos**: Incluye los logos de tu institución en el PDF
4. ✅ **Desplegar en testnet**: Practica con Mumbai testnet
5. ✅ **Desplegar en producción**: Cuando estés listo, despliega en Polygon mainnet
6. ✅ **Configurar dominio**: Registra un dominio para tu sistema
7. ✅ **Agregar autenticación**: Implementa login para admins

## 📝 Licencia

MIT

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor abre un issue primero para discutir los cambios.

## 📧 Soporte

Para preguntas o problemas, abre un issue en el repositorio.

---

Hecho con ❤️ para ferias de investigación
