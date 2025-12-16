# ================================================================================
# SCRIPT DE INICIO AUTOMÁTICO - Sistema de Certificados con Blockchain
# ================================================================================
# Este script levanta Backend + Frontend + Blockchain simultáneamente
# Cada servicio se ejecuta en su propia ventana de PowerShell
# ================================================================================

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "  🚀 INICIANDO SISTEMA DE CERTIFICADOS CON BLOCKCHAIN" -ForegroundColor Cyan
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host ""

$projectRoot = "c:\Ingenieria en sistemas\2-2025\sw2\Proyecto\proyecto certificados"

# Verificar que las carpetas existen
Write-Host "📁 Verificando estructura del proyecto..." -ForegroundColor Yellow

$backendPath = Join-Path $projectRoot "backend"
$frontendPath = Join-Path $projectRoot "frontend"
$blockchainPath = Join-Path $projectRoot "blockchain"

if (-not (Test-Path $backendPath)) {
    Write-Host "❌ ERROR: No se encuentra la carpeta backend" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $frontendPath)) {
    Write-Host "❌ ERROR: No se encuentra la carpeta frontend" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $blockchainPath)) {
    Write-Host "❌ ERROR: No se encuentra la carpeta blockchain" -ForegroundColor Red
    exit 1
}

Write-Host "✅ Estructura del proyecto verificada" -ForegroundColor Green
Write-Host ""

# Verificar PostgreSQL
Write-Host "🗄️  Verificando PostgreSQL..." -ForegroundColor Yellow
$pgRunning = pg_isready 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ PostgreSQL está corriendo" -ForegroundColor Green
} else {
    Write-Host "❌ ERROR: PostgreSQL no está corriendo" -ForegroundColor Red
    Write-Host "   Por favor inicia PostgreSQL antes de continuar" -ForegroundColor Yellow
    exit 1
}
Write-Host ""

# Verificar dependencias
Write-Host "📦 Verificando dependencias instaladas..." -ForegroundColor Yellow

$backendNodeModules = Test-Path (Join-Path $backendPath "node_modules")
$frontendNodeModules = Test-Path (Join-Path $frontendPath "node_modules")
$blockchainNodeModules = Test-Path (Join-Path $blockchainPath "node_modules")

if (-not $backendNodeModules) {
    Write-Host "⚠️  Backend: dependencias no instaladas. Instalando..." -ForegroundColor Yellow
    Push-Location $backendPath
    npm install
    Pop-Location
}

if (-not $frontendNodeModules) {
    Write-Host "⚠️  Frontend: dependencias no instaladas. Instalando..." -ForegroundColor Yellow
    Push-Location $frontendPath
    npm install
    Pop-Location
}

if (-not $blockchainNodeModules) {
    Write-Host "⚠️  Blockchain: dependencias no instaladas. Instalando..." -ForegroundColor Yellow
    Push-Location $blockchainPath
    npm install
    Pop-Location
}

Write-Host "✅ Todas las dependencias están instaladas" -ForegroundColor Green
Write-Host ""

# ================================================================================
# INICIAR SERVICIOS EN VENTANAS SEPARADAS
# ================================================================================

Write-Host "🚀 Iniciando servicios..." -ForegroundColor Cyan
Write-Host ""

# 1. Iniciar Backend
Write-Host "▶️  Iniciando Backend (http://localhost:3000)..." -ForegroundColor Green
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command",
    "cd '$backendPath'; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Green; Write-Host '  🟢 BACKEND - Puerto 3000' -ForegroundColor Green; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Green; Write-Host ''; npm start"
)
Start-Sleep -Seconds 2

# 2. Iniciar Frontend
Write-Host "▶️  Iniciando Frontend (http://localhost:5173)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command",
    "cd '$frontendPath'; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Cyan; Write-Host '  🔵 FRONTEND - Puerto 5173' -ForegroundColor Cyan; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Cyan; Write-Host ''; npm run dev"
)
Start-Sleep -Seconds 2

# 3. Iniciar Blockchain (red local para testing)
Write-Host "▶️  Iniciando Blockchain Local (http://localhost:8545)..." -ForegroundColor Magenta
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command",
    "cd '$blockchainPath'; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Magenta; Write-Host '  🟣 BLOCKCHAIN - Puerto 8545' -ForegroundColor Magenta; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Magenta; Write-Host ''; npx hardhat node"
)

Write-Host ""
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "  ✅ TODOS LOS SERVICIOS SE ESTÁN INICIANDO" -ForegroundColor Green
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 URLs de acceso:" -ForegroundColor Yellow
Write-Host "   🟢 Backend:     http://localhost:3000" -ForegroundColor Green
Write-Host "   🔵 Frontend:    http://localhost:5173" -ForegroundColor Cyan
Write-Host "   🟣 Blockchain:  http://localhost:8545" -ForegroundColor Magenta
Write-Host ""
Write-Host "⏱️  Espera 5-10 segundos para que todos los servicios terminen de iniciar" -ForegroundColor Yellow
Write-Host ""
Write-Host "🌐 Luego abre tu navegador en: http://localhost:5173" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  Para detener todos los servicios:" -ForegroundColor Red
Write-Host "   - Cierra las 3 ventanas de PowerShell que se abrieron" -ForegroundColor Red
Write-Host "   - O presiona Ctrl+C en cada ventana" -ForegroundColor Red
Write-Host ""
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "Presiona cualquier tecla para cerrar esta ventana..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
