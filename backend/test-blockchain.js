import { ethers } from 'ethers';

async function testBlockchain() {
  try {
    console.log('🔍 Probando conexión a blockchain local...\n');
    
    const provider = new ethers.JsonRpcProvider('http://127.0.0.1:8545');
    
    // Obtener balance de la cuenta
    const wallet = new ethers.Wallet(
      '0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80',
      provider
    );
    
    const balance = await provider.getBalance(wallet.address);
    const balanceInEth = ethers.formatEther(balance);
    
    console.log('✅ Conexión exitosa');
    console.log(`📍 Dirección: ${wallet.address}`);
    console.log(`💰 Balance: ${balanceInEth} ETH`);
    
    // Verificar contrato
    const contractAddress = '0x5FbDB2315678afecb367f032d93F642f64180aa3';
    const code = await provider.getCode(contractAddress);
    
    if (code === '0x') {
      console.log(`\n⚠️  Contrato ${contractAddress} NO está desplegado`);
      console.log('   Solución: Ejecuta el script de deploy');
      console.log('   cd blockchain && npx hardhat run scripts/deploy.js --network localhost');
    } else {
      console.log(`\n✅ Contrato desplegado en: ${contractAddress}`);
      console.log(`   Tamaño del bytecode: ${(code.length - 2) / 2} bytes`);
    }
    
  } catch (error) {
    console.error('❌ Error:', error.message);
  }
}

testBlockchain();
