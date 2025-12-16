================================================================================
SCRIPTS DE AUTOMATIZACIÓN - Sistema de Certificados con Blockchain
================================================================================

Se han creado 3 scripts PowerShell para facilitar el manejo del proyecto:

================================================================================
1. iniciar-proyecto.ps1 - INICIO COMPLETO
================================================================================

Descripción:
  Inicia todos los servicios del proyecto (Backend + Frontend + Blockchain local)
  en ventanas separadas de PowerShell.

Uso:
  1. Clic derecho en "iniciar-proyecto.ps1"
  2. Seleccionar "Ejecutar con PowerShell"
  
  O desde terminal:
  .\iniciar-proyecto.ps1

Servicios que inicia:
  🟢 Backend      → http://localhost:3000
  🔵 Frontend     → http://localhost:5173
  🟣 Blockchain   → http://localhost:8545 (red local Hardhat)

Prerequisitos:
  ✅ PostgreSQL debe estar corriendo
  ✅ Dependencias npm instaladas (el script las instala si faltan)

Resultado:
  - Se abren 3 ventanas de PowerShell (una por servicio)
  - Cada ventana muestra los logs de su servicio
  - Para detener: cerrar las 3 ventanas o usar Ctrl+C en cada una


================================================================================
2. iniciar-simple.ps1 - INICIO BÁSICO (Recomendado para desarrollo)
================================================================================

Descripción:
  Inicia solo Backend + Frontend (sin blockchain local).
  Útil cuando trabajas sin blockchain o usas Mumbai testnet.

Uso:
  1. Clic derecho en "iniciar-simple.ps1"
  2. Seleccionar "Ejecutar con PowerShell"
  
  O desde terminal:
  .\iniciar-simple.ps1

Servicios que inicia:
  🟢 Backend   → http://localhost:3000
  🔵 Frontend  → http://localhost:5173

Modo Blockchain:
  - Si CONTRACT_ADDRESS está vacío: Modo borrador (sin blockchain)
  - Si CONTRACT_ADDRESS está configurado: Usa Mumbai testnet

Resultado:
  - Se abren 2 ventanas de PowerShell
  - Más ligero y rápido que iniciar-proyecto.ps1


================================================================================
3. detener-proyecto.ps1 - DETENER TODOS LOS SERVICIOS
================================================================================

Descripción:
  Detiene todos los procesos Node.js del sistema.
  Útil cuando las ventanas se cierran pero los procesos siguen corriendo.

Uso:
  1. Clic derecho en "detener-proyecto.ps1"
  2. Seleccionar "Ejecutar con PowerShell"
  
  O desde terminal:
  .\detener-proyecto.ps1

Acción:
  - Busca todos los procesos node.exe
  - Los detiene forzadamente (kill)
  - Libera los puertos 3000, 5173, 8545

⚠️ ADVERTENCIA:
  Este script detendrá TODOS los procesos Node.js del sistema,
  no solo los del proyecto. Úsalo solo si no tienes otros
  proyectos Node.js corriendo.


================================================================================
FLUJO DE TRABAJO RECOMENDADO
================================================================================

PRIMER USO (Setup inicial):
────────────────────────────
1. Ejecutar: iniciar-simple.ps1
   (Instalará dependencias si faltan)

2. Esperar a que ambos servicios estén listos:
   - Backend mostrará: "✅ Servidor corriendo en puerto 3000"
   - Frontend mostrará: "➜ Local: http://localhost:5173/"

3. Abrir navegador en: http://localhost:5173

4. Trabajar normalmente

5. Al terminar: Cerrar las 2 ventanas de PowerShell
   O ejecutar: detener-proyecto.ps1


USO DIARIO (Desarrollo sin blockchain):
────────────────────────────────────────
1. Ejecutar: iniciar-simple.ps1
2. Abrir: http://localhost:5173
3. Los certificados se generan en "modo borrador"
4. Al terminar: Cerrar ventanas


TESTING CON BLOCKCHAIN LOCAL:
──────────────────────────────
1. Ejecutar: iniciar-proyecto.ps1
2. Esperar a que Hardhat Network inicie (ventana morada)
3. En otra terminal, desplegar contrato:
   cd blockchain
   npx hardhat run scripts/deploy.js --network localhost
4. Copiar CONTRACT_ADDRESS al .env
5. Reiniciar backend
6. Ahora los certificados usan blockchain local


PRODUCCIÓN CON MUMBAI TESTNET:
───────────────────────────────
1. Configurar PRIVATE_KEY en backend/.env
2. Compilar contrato: cd blockchain && npm run compile
3. Desplegar a Mumbai: npm run deploy:mumbai
4. Copiar CONTRACT_ADDRESS al backend/.env
5. Ejecutar: iniciar-simple.ps1
6. Los certificados se registran en Mumbai testnet


================================================================================
SOLUCIÓN DE PROBLEMAS
================================================================================

Error: "Puerto 3000 ya en uso"
──────────────────────────────
Solución: 
  .\detener-proyecto.ps1
  Luego vuelve a ejecutar el script de inicio

Error: "PostgreSQL no está corriendo"
─────────────────────────────────────
Solución:
  - Windows: Iniciar servicio PostgreSQL desde Servicios
  - O desde terminal: pg_ctl start -D "C:\Program Files\PostgreSQL\14\data"

Error: "Cannot find module..."
─────────────────────────────
Solución:
  El script instala dependencias automáticamente, pero si falla:
  cd backend && npm install
  cd frontend && npm install
  cd blockchain && npm install

Scripts no se ejecutan (política de ejecución)
───────────────────────────────────────────────
Solución:
  Abrir PowerShell como Administrador:
  Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
  Luego volver a intentar ejecutar el script


================================================================================
ATAJOS DE TECLADO EN LAS VENTANAS
================================================================================

Ctrl + C       → Detener el servicio en esa ventana
Ctrl + L       → Limpiar la consola
Ctrl + Rueda   → Zoom in/out del texto
Alt + Enter    → Pantalla completa


================================================================================
ESTRUCTURA DE ARCHIVOS GENERADOS
================================================================================

proyecto certificados/
├── iniciar-proyecto.ps1      ← Script completo (Backend + Frontend + Blockchain)
├── iniciar-simple.ps1         ← Script básico (Backend + Frontend)
├── detener-proyecto.ps1       ← Script para detener todo
├── SCRIPTS-README.txt         ← Este archivo (documentación)
├── backend/
│   ├── node_modules/
│   ├── src/
│   └── .env
├── frontend/
│   ├── node_modules/
│   └── src/
└── blockchain/
    ├── node_modules/
    ├── contracts/
    └── artifacts/


================================================================================
PRÓXIMOS PASOS
================================================================================

Ahora que tienes los scripts:

1. ✅ Prueba iniciar-simple.ps1 para verificar que todo funciona

2. ✅ Crea algunas ferias, proyectos y certificados de prueba

3. ✅ Cuando estés listo para blockchain:
   - Sigue la guía en PASOS-ACTIVAR-BLOCKCHAIN.txt
   - Obtén MATIC de testnet
   - Despliega el contrato
   - Actualiza CONTRACT_ADDRESS

4. ✅ Para producción:
   - Despliega backend en servidor (AWS, Heroku, etc.)
   - Despliega frontend en Vercel/Netlify
   - Despliega contrato en Polygon mainnet


================================================================================
FIN DE LA DOCUMENTACIÓN
================================================================================

¿Necesitas ayuda? Revisa:
  - README.md (raíz del proyecto)
  - PASOS-ACTIVAR-BLOCKCHAIN.txt (configuración blockchain)
  - backend/README.md (API documentation)
  - frontend/README.md (componentes React)
  - blockchain/README.md (smart contracts)
