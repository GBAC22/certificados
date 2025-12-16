# Script para configurar blockchain local con Hardhat
# Esto te da MATIC ilimitado para pruebas

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "🔧 CONFIGURACIÓN BLOCKCHAIN LOCAL" -ForegroundColor Cyan
Write-Host "========================================`n" -ForegroundColor Cyan

Write-Host "Esta opción te permite:" -ForegroundColor Yellow
Write-Host "  ✅ MATIC ilimitado para pruebas" -ForegroundColor Green
Write-Host "  ✅ Sin necesidad de faucets o compras" -ForegroundColor Green
Write-Host "  ✅ Transacciones instantáneas" -ForegroundColor Green
Write-Host "  ✅ Perfecto para desarrollo`n" -ForegroundColor Green

$confirmar = Read-Host "¿Quieres configurar blockchain local? (s/n)"

if ($confirmar -ne "s") {
    Write-Host "❌ Cancelado" -ForegroundColor Red
    exit
}

Write-Host "`n📦 Paso 1: Iniciando Hardhat node..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd 'blockchain'; Write-Host '🟣 BLOCKCHAIN LOCAL - Hardhat Node' -ForegroundColor Magenta; npx hardhat node" -WindowStyle Normal

Write-Host "⏳ Esperando 5 segundos a que inicie el nodo..." -ForegroundColor Yellow
Start-Sleep -Seconds 5

Write-Host "`n🚀 Paso 2: Desplegando contrato..." -ForegroundColor Cyan
cd blockchain
$deployOutput = npx hardhat run scripts/deploy.js --network localhost 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Contrato desplegado exitosamente" -ForegroundColor Green
    
    # Extraer dirección del contrato del output
    $contractAddress = ($deployOutput | Select-String "deployed to: (.+)" | ForEach-Object { $_.Matches.Groups[1].Value })
    
    if ($contractAddress) {
        Write-Host "`n📝 Actualizando archivo .env..." -ForegroundColor Cyan
        cd ..
        $envPath = "backend\.env"
        $envContent = Get-Content $envPath -Raw
        
        # Actualizar configuración
        $envContent = $envContent -replace 'BLOCKCHAIN_NETWORK=.*', 'BLOCKCHAIN_NETWORK=localhost'
        $envContent = $envContent -replace 'BLOCKCHAIN_RPC_URL=.*', 'BLOCKCHAIN_RPC_URL=http://127.0.0.1:8545'
        $envContent = $envContent -replace 'CONTRACT_ADDRESS=.*', "CONTRACT_ADDRESS=$contractAddress"
        
        Set-Content $envPath $envContent
        
        Write-Host "✅ Configuración actualizada" -ForegroundColor Green
        Write-Host "`n========================================" -ForegroundColor Green
        Write-Host "🎉 ¡BLOCKCHAIN LOCAL CONFIGURADA!" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "`nAhora tienes:" -ForegroundColor Yellow
        Write-Host "  • Blockchain corriendo en http://127.0.0.1:8545" -ForegroundColor White
        Write-Host "  • MATIC ilimitado en la cuenta de prueba" -ForegroundColor White
        Write-Host "  • Contrato desplegado en: $contractAddress" -ForegroundColor White
        Write-Host "`nPróximo paso:" -ForegroundColor Yellow
        Write-Host "  1. Ve al backend y reinícialo (Ctrl+C y 'npm run dev')" -ForegroundColor White
        Write-Host "  2. ¡Genera certificados sin límite!" -ForegroundColor White
    }
} else {
    Write-Host "❌ Error al desplegar contrato" -ForegroundColor Red
    Write-Host "Verifica que el nodo de Hardhat esté corriendo" -ForegroundColor Yellow
}
