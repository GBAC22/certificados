# Backend - Sistema de Certificados

Backend API REST para el sistema de certificados con blockchain.

## 🚀 Inicio Rápido

### 1. Instalar dependencias
```bash
npm install
```

### 2. Configurar variables de entorno
Copiar `.env.example` a `.env` y configurar:
```bash
cp .env.example .env
```

Editar `.env` con tus valores:
- **DATABASE**: Configuración de PostgreSQL
- **BLOCKCHAIN**: RPC URL y contract address (después del deploy)
- **APP**: URLs de frontend y verificación

### 3. Configurar PostgreSQL
Crear base de datos:
```bash
createdb certificados_db
```

O desde psql:
```sql
CREATE DATABASE certificados_db;
```

### 4. Inicializar base de datos
```bash
npm run init-db
```

Esto creará las tablas y datos de prueba.

### 5. Ejecutar servidor
```bash
# Desarrollo (con nodemon)
npm run dev

# Producción
npm start
```

Servidor corriendo en: http://localhost:3000

## 📁 Estructura

```
backend/
├── src/
│   ├── config/          # Configuraciones (DB, blockchain)
│   ├── controllers/     # Lógica de endpoints
│   ├── routes/          # Definición de rutas
│   ├── services/        # Servicios (PDF, blockchain)
│   ├── scripts/         # Scripts útiles (init DB)
│   └── index.js         # Entry point
├── storage/             # PDFs generados
│   └── certificados/
└── package.json
```

## 🔌 Endpoints Principales

### Ferias
- `GET /api/ferias` - Listar ferias
- `GET /api/ferias/:id` - Obtener feria
- `GET /api/ferias/:id/proyectos` - Proyectos de una feria

### Proyectos
- `GET /api/proyectos` - Listar proyectos
- `GET /api/proyectos/:id` - Obtener proyecto

### Certificados
- `POST /api/certificados/generar` - Generar certificado individual
- `POST /api/certificados/generar-lote` - Generar por lote
- `GET /api/certificados` - Listar certificados
- `GET /api/certificados/:id` - Obtener certificado
- `GET /api/certificados/:id/pdf` - Descargar PDF
- `PATCH /api/certificados/:id/revocar` - Revocar certificado

### Verificación
- `GET /api/verificar/:id` - Verificar por ID
- `GET /api/verificar/codigo/:codigo` - Verificar por código

## 🧪 Probar API

### Generar certificado de prueba
```bash
# Obtener lista de proyectos
curl http://localhost:3000/api/proyectos

# Generar certificado (usar ID de proyecto)
curl -X POST http://localhost:3000/api/certificados/generar \
  -H "Content-Type: application/json" \
  -d '{"proyectoId": "PROJECT_ID", "esBorrador": true}'
```

## 🔧 Configuración Blockchain

1. Desplegar smart contract (ver `/blockchain`)
2. Copiar dirección del contrato
3. Actualizar `CONTRACT_ADDRESS` en `.env`
4. Configurar `PRIVATE_KEY` de wallet con MATIC

## 📝 Notas

- Los PDFs se guardan en `storage/certificados/`
- Los borradores NO se registran en blockchain
- Los certificados oficiales SÍ se registran en blockchain
- Se requiere MATIC para transacciones en Polygon
