# ============================================================================
# SCRIPT PARA INICIAR FRONTEND EN CONSOLA DEDICADA
# ============================================================================

# Obtener directorio del script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  INICIANDO FRONTEND (Puerto 5173)" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Liberar puerto 5173 si está ocupado
Write-Host "🔍 Verificando puerto 5173..." -ForegroundColor Yellow
$processOnPort = Get-NetTCPConnection -LocalPort 5173 -ErrorAction SilentlyContinue | Select-Object -ExpandProperty OwningProcess -First 1
if ($processOnPort) {
    Write-Host "⚠️  Puerto 5173 ocupado por proceso $processOnPort, liberando..." -ForegroundColor Yellow
    Stop-Process -Id $processOnPort -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Write-Host "✅ Puerto 5173 liberado" -ForegroundColor Green
} else {
    Write-Host "✅ Puerto 5173 disponible" -ForegroundColor Green
}
Write-Host ""

# Ir al directorio frontend
Set-Location frontend

Write-Host "Iniciando servidor de desarrollo Vite..." -ForegroundColor Cyan
Write-Host ""

# Iniciar frontend
npm run dev
