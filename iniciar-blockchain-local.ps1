# ============================================================================
# SCRIPT PARA INICIAR BLOCKCHAIN LOCAL (Hardhat) EN CONSOLA DEDICADA
# ============================================================================

# Obtener directorio del script
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptDir

Write-Host "========================================" -ForegroundColor Magenta
Write-Host "  INICIANDO BLOCKCHAIN LOCAL" -ForegroundColor Magenta
Write-Host "  Red: Hardhat Network (localhost)" -ForegroundColor Magenta
Write-Host "  Puerto: 8545" -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
Write-Host ""

# Ir al directorio blockchain
Set-Location blockchain

Write-Host "ℹ️  Esta red blockchain local es para DESARROLLO" -ForegroundColor Yellow
Write-Host "   - Los datos se borran al reiniciar" -ForegroundColor Yellow
Write-Host "   - No requiere MATIC real" -ForegroundColor Yellow
Write-Host "   - Útil para pruebas rápidas" -ForegroundColor Yellow
Write-Host ""
Write-Host "🌐 Para usar la red REAL (Polygon Amoy), configura:" -ForegroundColor Cyan
Write-Host "   BLOCKCHAIN_NETWORK=amoy" -ForegroundColor Cyan
Write-Host "   en backend/.env (ya configurado)" -ForegroundColor Cyan
Write-Host ""
Write-Host "Iniciando Hardhat Network..." -ForegroundColor Magenta
Write-Host "========================================" -ForegroundColor Magenta
Write-Host ""

# Iniciar red local
npx hardhat node
