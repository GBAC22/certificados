import { ethers } from 'ethers';
import dotenv from 'dotenv';

dotenv.config();

async function verificarSaldoMatic() {
  try {
    console.log('\n========================================');
    console.log('💰 VERIFICACIÓN DE SALDO MATIC');
    console.log('========================================\n');

    // Configurar provider
    const provider = new ethers.JsonRpcProvider(process.env.POLYGON_RPC_URL);
    console.log(`🔗 Red: ${process.env.POLYGON_RPC_URL}`);
    
    // Obtener wallet
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
    console.log(`📍 Dirección Wallet: ${wallet.address}\n`);

    // Obtener saldo
    const balance = await provider.getBalance(wallet.address);
    const balanceInMatic = ethers.formatEther(balance);
    
    console.log('========================================');
    console.log(`💵 SALDO ACTUAL: ${balanceInMatic} MATIC`);
    console.log('========================================\n');

    // Obtener precio actual del gas
    const feeData = await provider.getFeeData();
    const gasPrice = feeData.gasPrice;
    const gasPriceInGwei = ethers.formatUnits(gasPrice, 'gwei');
    
    console.log('⛽ INFORMACIÓN DE GAS:');
    console.log(`   Gas Price: ${gasPriceInGwei} Gwei`);
    console.log(`   Gas Price (wei): ${gasPrice.toString()}\n`);

    // Estimar gas para una transacción típica de certificado
    // Basado en experiencia previa, una transacción de certificado usa aprox 100,000 - 150,000 gas
    const gasEstimadoPorCertificado = 150000n; // Usamos 150k para estar seguros
    const costoGasPorCertificado = gasEstimadoPorCertificado * gasPrice;
    const costoEnMaticPorCertificado = ethers.formatEther(costoGasPorCertificado);

    console.log('📊 ESTIMACIÓN POR CERTIFICADO:');
    console.log(`   Gas estimado: ${gasEstimadoPorCertificado.toString()} units`);
    console.log(`   Costo por certificado: ${costoEnMaticPorCertificado} MATIC\n`);

    // Calcular cuántos certificados se pueden generar
    const certificadosPosibles = balance / costoGasPorCertificado;
    
    console.log('========================================');
    console.log('🎯 CAPACIDAD DE GENERACIÓN:');
    console.log('========================================');
    console.log(`✅ Puedes generar aproximadamente: ${certificadosPosibles.toString()} certificados`);
    console.log(`   (Con el saldo actual de ${balanceInMatic} MATIC)\n`);

    // Recomendaciones
    if (certificadosPosibles < 1n) {
      console.log('❌ SALDO INSUFICIENTE');
      console.log('   No tienes suficiente MATIC para generar certificados.\n');
      console.log('💡 SOLUCIONES:');
      console.log('   1. Obtén MATIC gratis del faucet:');
      console.log('      → https://faucet.polygon.technology/');
      console.log('   2. O usa el modo PRUEBA (blockchain local) con el botón "Generar Prueba"');
    } else if (certificadosPosibles < 10n) {
      console.log('⚠️  SALDO BAJO');
      console.log('   Considera recargar MATIC para generar más certificados.\n');
      console.log('💡 RECOMENDACIÓN:');
      console.log('   Obtén más MATIC del faucet: https://faucet.polygon.technology/');
    } else if (certificadosPosibles < 50n) {
      console.log('✅ SALDO ADECUADO');
      console.log('   Tienes suficiente para generar varios certificados.');
    } else {
      console.log('🎉 SALDO EXCELENTE');
      console.log('   Tienes suficiente MATIC para muchos certificados.');
    }

    console.log('\n========================================');
    console.log('📝 NOTAS IMPORTANTES:');
    console.log('========================================');
    console.log('• El costo real puede variar según la congestión de la red');
    console.log('• Precio del gas fluctúa constantemente');
    console.log('• Se recomienda mantener un margen de seguridad del 20%');
    console.log('• Para pruebas, usa el modo "Generar Prueba" (blockchain local gratis)');
    console.log('========================================\n');

    // Información adicional de la red
    const network = await provider.getNetwork();
    console.log('🌐 INFORMACIÓN DE LA RED:');
    console.log(`   Chain ID: ${network.chainId}`);
    console.log(`   Nombre: ${network.name}`);
    
    const blockNumber = await provider.getBlockNumber();
    console.log(`   Último bloque: ${blockNumber}`);
    console.log('========================================\n');

  } catch (error) {
    console.error('\n❌ ERROR AL VERIFICAR SALDO:');
    console.error(`   Tipo: ${error.name}`);
    console.error(`   Mensaje: ${error.message}\n`);
    
    if (error.message.includes('could not detect network')) {
      console.error('💡 SOLUCIÓN:');
      console.error('   Verifica que POLYGON_RPC_URL esté correctamente configurado en .env');
      console.error('   Ejemplo: POLYGON_RPC_URL=https://rpc-amoy.polygon.technology/\n');
    } else if (error.message.includes('invalid private key')) {
      console.error('💡 SOLUCIÓN:');
      console.error('   Verifica que PRIVATE_KEY esté correctamente configurado en .env\n');
    }
  }
}

// Ejecutar
verificarSaldoMatic();
