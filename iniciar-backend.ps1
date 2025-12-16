# ============================================================================
# SCRIPT PARA INICIAR BACKEND EN CONSOLA DEDICADA
# ============================================================================

# Obtener directorio del script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

Write-Host "========================================" -ForegroundColor Green
Write-Host "  INICIANDO BACKEND (Puerto 3000)" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Liberar puerto 3000 si está ocupado
Write-Host "🔍 Verificando puerto 3000..." -ForegroundColor Yellow
$processOnPort = Get-NetTCPConnection -LocalPort 3000 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -First 1
if ($processOnPort) {
    Write-Host "⚠️  Puerto 3000 ocupado por proceso $processOnPort, liberando..." -ForegroundColor Yellow
    Stop-Process -Id $processOnPort -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Write-Host "✅ Puerto 3000 liberado" -ForegroundColor Green
} else {
    Write-Host "✅ Puerto 3000 disponible" -ForegroundColor Green
}
Write-Host ""

# Verificar PostgreSQL
Write-Host "🔍 Verificando PostgreSQL..." -ForegroundColor Yellow
$pgStatus = pg_isready 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ PostgreSQL está corriendo" -ForegroundColor Green
} else {
    Write-Host "❌ PostgreSQL no está corriendo" -ForegroundColor Red
    Write-Host "   Inicia PostgreSQL antes de continuar" -ForegroundColor Red
    Read-Host "Presiona Enter para salir"
    exit 1
}

# Ir al directorio backend
Set-Location backend

Write-Host ""
Write-Host "Iniciando servidor backend..." -ForegroundColor Cyan
Write-Host "Logs detallados a continuación:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Iniciar backend
npm run dev
