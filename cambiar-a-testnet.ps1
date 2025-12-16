# ============================================================================
# VOLVER A POLYGON AMOY TESTNET (RED DE PRUEBAS)
# ============================================================================

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  CAMBIO A POLYGON AMOY TESTNET" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Esta operación cambiará la red de:" -ForegroundColor Yellow
Write-Host "  ❌ Polygon Mainnet (producción, MATIC real)" -ForegroundColor Gray
Write-Host "A:" -ForegroundColor Yellow
Write-Host "  ✅ Amoy Testnet (pruebas, MATIC gratis)" -ForegroundColor Green
Write-Host ""

$confirmacion = Read-Host "¿Confirmar cambio? (S/N)"

if ($confirmacion -ne "S" -and $confirmacion -ne "s") {
    Write-Host ""
    Write-Host "❌ Operación cancelada" -ForegroundColor Yellow
    Write-Host ""
    exit
}

Write-Host ""
Write-Host "📝 Actualizando backend/.env..." -ForegroundColor Cyan

# Leer el archivo .env
$envPath = "backend\.env"
$envContent = Get-Content $envPath -Raw

# Reemplazar valores
$envContent = $envContent -replace "BLOCKCHAIN_NETWORK=polygon", "BLOCKCHAIN_NETWORK=amoy"
$envContent = $envContent -replace "BLOCKCHAIN_RPC_URL=https://polygon-rpc.com", "BLOCKCHAIN_RPC_URL=https://rpc-amoy.polygon.technology"

# Guardar cambios
Set-Content -Path $envPath -Value $envContent

Write-Host "✅ Configuración actualizada" -ForegroundColor Green
Write-Host ""
Write-Host "🔄 IMPORTANTE: Reinicia el backend" -ForegroundColor Yellow
Write-Host "   1. Ve a la terminal del backend" -ForegroundColor White
Write-Host "   2. Presiona Ctrl+C para detener" -ForegroundColor White
Write-Host "   3. Ejecuta: npm run dev" -ForegroundColor White
Write-Host ""
Write-Host "🔍 Verifica tu balance en TESTNET:" -ForegroundColor Cyan
Write-Host "   https://amoy.polygonscan.com/address/0xc023CcdfBd9c3839c5F4c2825844375663bDF027" -ForegroundColor Gray
Write-Host ""
Write-Host "💡 Para obtener MATIC gratis:" -ForegroundColor Magenta
Write-Host "   https://faucet.polygon.technology/" -ForegroundColor Gray
Write-Host ""
