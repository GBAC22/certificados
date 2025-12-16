# ================================================================================
# SCRIPT DE INICIO SIMPLE - Solo Backend + Frontend
# ================================================================================
# Versión ligera sin blockchain local (usa Mumbai testnet si está configurado)
# ================================================================================

Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "  🚀 INICIANDO SISTEMA (Backend + Frontend)" -ForegroundColor Cyan
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host ""

$projectRoot = "c:\Ingenieria en sistemas\2-2025\sw2\Proyecto\proyecto certificados"
$backendPath = Join-Path $projectRoot "backend"
$frontendPath = Join-Path $projectRoot "frontend"

# Verificar PostgreSQL
Write-Host "🗄️  Verificando PostgreSQL..." -ForegroundColor Yellow
$pgRunning = pg_isready 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ PostgreSQL está corriendo" -ForegroundColor Green
} else {
    Write-Host "❌ ERROR: PostgreSQL no está corriendo" -ForegroundColor Red
    exit 1
}
Write-Host ""

# Iniciar Backend
Write-Host "▶️  Iniciando Backend (http://localhost:3000)..." -ForegroundColor Green
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command",
    "cd '$backendPath'; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Green; Write-Host '  🟢 BACKEND - Puerto 3000' -ForegroundColor Green; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Green; Write-Host ''; npm start"
)
Start-Sleep -Seconds 2

# Iniciar Frontend
Write-Host "▶️  Iniciando Frontend (http://localhost:5173)..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList @(
    "-NoExit",
    "-Command",
    "cd '$frontendPath'; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Cyan; Write-Host '  🔵 FRONTEND - Puerto 5173' -ForegroundColor Cyan; Write-Host '═══════════════════════════════════════════════════' -ForegroundColor Cyan; Write-Host ''; npm run dev"
)

Write-Host ""
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "  ✅ SERVICIOS INICIADOS" -ForegroundColor Green
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 URLs de acceso:" -ForegroundColor Yellow
Write-Host "   🟢 Backend:  http://localhost:3000" -ForegroundColor Green
Write-Host "   🔵 Frontend: http://localhost:5173" -ForegroundColor Cyan
Write-Host ""
Write-Host "🌐 Abre tu navegador en: http://localhost:5173" -ForegroundColor Green
Write-Host ""
Write-Host "⚠️  Blockchain: Modo borrador (sin blockchain) o Mumbai testnet si está configurado" -ForegroundColor Yellow
Write-Host ""
Write-Host "================================================================================" -ForegroundColor Cyan
Write-Host "Presiona cualquier tecla para cerrar esta ventana..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
