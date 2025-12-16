# ================================================================================
# SCRIPT PARA DETENER TODOS LOS SERVICIOS
# ================================================================================
# Mata todos los procesos node.js relacionados con el proyecto
# ================================================================================

Write-Host "================================================================================" -ForegroundColor Red
Write-Host "  🛑 DETENIENDO TODOS LOS SERVICIOS" -ForegroundColor Red
Write-Host "================================================================================" -ForegroundColor Red
Write-Host ""

# Buscar procesos de Node.js
$nodeProcesses = Get-Process -Name node -ErrorAction SilentlyContinue

if ($nodeProcesses) {
    Write-Host "🔍 Procesos Node.js encontrados: $($nodeProcesses.Count)" -ForegroundColor Yellow
    Write-Host ""
    
    foreach ($process in $nodeProcesses) {
        try {
            $processPath = $process.Path
            Write-Host "   Deteniendo proceso: PID $($process.Id) - $processPath" -ForegroundColor Gray
            Stop-Process -Id $process.Id -Force
            Write-Host "   ✅ Detenido" -ForegroundColor Green
        } catch {
            Write-Host "   ⚠️  No se pudo detener el proceso $($process.Id)" -ForegroundColor Yellow
        }
    }
    
    Write-Host ""
    Write-Host "✅ Todos los servicios han sido detenidos" -ForegroundColor Green
} else {
    Write-Host "ℹ️  No se encontraron procesos Node.js en ejecución" -ForegroundColor Cyan
}

Write-Host ""
Write-Host "================================================================================" -ForegroundColor Red
Write-Host "Presiona cualquier tecla para cerrar..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
