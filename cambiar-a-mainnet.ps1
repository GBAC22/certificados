# ============================================================================
# CAMBIAR A POLYGON MAINNET (RED REAL CON MATIC REAL)
# ============================================================================

Write-Host "========================================" -ForegroundColor Red
Write-Host "  ⚠️  CAMBIO A POLYGON MAINNET" -ForegroundColor Red
Write-Host "========================================" -ForegroundColor Red
Write-Host ""
Write-Host "Esta operación cambiará la red de:" -ForegroundColor Yellow
Write-Host "  ❌ Amoy Testnet (pruebas, MATIC gratis)" -ForegroundColor Gray
Write-Host "A:" -ForegroundColor Yellow
Write-Host "  ✅ Polygon Mainnet (producción, MATIC REAL)" -ForegroundColor Green
Write-Host ""

$confirmacion = Read-Host "¿Estás seguro? Ya compraste MATIC real? (S/N)"

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
$envContent = $envContent -replace "BLOCKCHAIN_NETWORK=amoy", "BLOCKCHAIN_NETWORK=polygon"
$envContent = $envContent -replace "BLOCKCHAIN_RPC_URL=https://rpc-amoy.polygon.technology", "BLOCKCHAIN_RPC_URL=https://polygon-rpc.com"

# Guardar cambios
Set-Content -Path $envPath -Value $envContent

Write-Host "✅ Configuración actualizada" -ForegroundColor Green
Write-Host ""
Write-Host "🔄 IMPORTANTE: Reinicia el backend" -ForegroundColor Yellow
Write-Host "   1. Ve a la terminal del backend" -ForegroundColor White
Write-Host "   2. Presiona Ctrl+C para detener" -ForegroundColor White
Write-Host "   3. Ejecuta: npm run dev" -ForegroundColor White
Write-Host ""
Write-Host "🔍 Verifica tu balance en MAINNET:" -ForegroundColor Cyan
Write-Host "   https://polygonscan.com/address/0xc023CcdfBd9c3839c5F4c2825844375663bDF027" -ForegroundColor Gray
Write-Host ""
Write-Host "⚠️  RECUERDA: Cada transacción ahora usa MATIC REAL" -ForegroundColor Red
Write-Host ""
