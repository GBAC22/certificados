# ============================================================================
# SCRIPT MAESTRO - INICIA TODOS LOS SERVICIOS EN CONSOLAS SEPARADAS
# ============================================================================
# Uso: .\iniciar-todos-consolas.ps1
# Este script abre 3 ventanas de PowerShell independientes:
#   - Backend (Verde): Puerto 3000 con logs detallados
#   - Frontend (Cyan): Puerto 5173 (Vite)
#   - Blockchain (Magenta): Puerto 8545 (Hardhat Local - OPCIONAL)
# ============================================================================

Write-Host "========================================" -ForegroundColor White
Write-Host "  INICIANDO TODOS LOS SERVICIOS" -ForegroundColor White
Write-Host "========================================" -ForegroundColor White
Write-Host ""

# Obtener ruta base del proyecto
$projectPath = $PSScriptRoot

Write-Host "✅ Backend iniciándose en consola VERDE..." -ForegroundColor Green
Start-Process powershell -ArgumentList "-NoExit", "-File", "$projectPath\iniciar-backend.ps1"

Start-Sleep -Seconds 2

Write-Host "✅ Frontend iniciándose en consola CYAN..." -ForegroundColor Cyan
Start-Process powershell -ArgumentList "-NoExit", "-File", "$projectPath\iniciar-frontend.ps1"

Write-Host ""
Write-Host "========================================" -ForegroundColor Yellow
Write-Host "  IMPORTANTE: Red Blockchain" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "Tu configuración actual usa:" -ForegroundColor White
Write-Host "  🌐 Polygon Amoy Testnet" -ForegroundColor Cyan
Write-Host "  📝 Contrato: 0x30FA78539Ee2e33f55A8909397bfb2b376898041" -ForegroundColor Cyan
Write-Host ""
Write-Host "¿Quieres iniciar blockchain LOCAL también? (Opcional)" -ForegroundColor Yellow
Write-Host "  La red local es útil para:" -ForegroundColor White
Write-Host "  - Pruebas sin gastar MATIC" -ForegroundColor White
Write-Host "  - Desarrollo sin conexión a internet" -ForegroundColor White
Write-Host "  - Testing rápido de smart contracts" -ForegroundColor White
Write-Host ""
Write-Host "NOTA: Si usas red local, debes cambiar BLOCKCHAIN_NETWORK=localhost" -ForegroundColor Red
Write-Host "      en backend/.env (actualmente está en 'amoy')" -ForegroundColor Red
Write-Host ""

$respuesta = Read-Host "¿Iniciar blockchain local? (S/N)"

if ($respuesta -eq "S" -or $respuesta -eq "s") {
    Write-Host ""
    Write-Host "✅ Blockchain Local iniciándose en consola MAGENTA..." -ForegroundColor Magenta
    Start-Process powershell -ArgumentList "-NoExit", "-File", "$projectPath\iniciar-blockchain-local.ps1"
    Start-Sleep -Seconds 1
    Write-Host ""
    Write-Host "⚠️  RECUERDA: Cambia BLOCKCHAIN_NETWORK=localhost en backend/.env" -ForegroundColor Red
    Write-Host "   y reinicia el backend para usar la red local" -ForegroundColor Red
} else {
    Write-Host ""
    Write-Host "✅ Continuando solo con Backend y Frontend" -ForegroundColor Green
    Write-Host "   Usarás Polygon Amoy (configuración actual)" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "========================================" -ForegroundColor White
Write-Host "  SERVICIOS INICIADOS" -ForegroundColor White
Write-Host "========================================" -ForegroundColor White
Write-Host ""
Write-Host "📊 Monitorea los logs en cada consola:" -ForegroundColor White
Write-Host "  🟢 Backend: Logs detallados de certificados (5 fases)" -ForegroundColor Green
Write-Host "  🔵 Frontend: Vite dev server" -ForegroundColor Cyan
if ($respuesta -eq "S" -or $respuesta -eq "s") {
    Write-Host "  🟣 Blockchain: Red Hardhat local" -ForegroundColor Magenta
}
Write-Host ""
Write-Host "🌐 URLs de acceso:" -ForegroundColor White
Write-Host "  Backend:  http://localhost:3000" -ForegroundColor White
Write-Host "  Frontend: http://localhost:5173" -ForegroundColor White
if ($respuesta -eq "S" -or $respuesta -eq "s") {
    Write-Host "  Blockchain: http://localhost:8545" -ForegroundColor White
}
Write-Host ""
Write-Host "Para detener todo: Cierra las consolas o ejecuta .\detener-proyecto.ps1" -ForegroundColor Yellow
Write-Host ""
