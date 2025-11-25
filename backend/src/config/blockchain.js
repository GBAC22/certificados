import { ethers } from 'ethers';
import dotenv from 'dotenv';

dotenv.config();

// Configuración del provider
const provider = new ethers.JsonRpcProvider(
  process.env.BLOCKCHAIN_RPC_URL || 'https://rpc-mumbai.maticvigil.com'
);

// Wallet para firmar transacciones
let wallet = null;
if (process.env.PRIVATE_KEY && process.env.PRIVATE_KEY.length >= 64 && !process.env.PRIVATE_KEY.includes('your_private_key')) {
  try {
    wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
    console.log('✅ Wallet configurada:', wallet.address);
  } catch (error) {
    console.warn('⚠️ PRIVATE_KEY inválida:', error.message);
    console.warn('ℹ️  Continuando sin blockchain - solo certificados borrador disponibles');
  }
} else {
  console.warn('⚠️ Blockchain no configurado - solo certificados borrador disponibles');
}

// ABI del contrato (simplificado)
const CONTRACT_ABI = [
  "function registrarCertificado(string memory _certificadoId, bytes32 _hash, string memory _feriaId, string memory _proyectoId) public",
  "function verificarCertificado(string memory _certificadoId) public view returns (bytes32, uint256, string memory, string memory, bool, bool)",
  "event CertificadoRegistrado(string certificadoId, bytes32 hash, uint256 timestamp)"
];

// Instancia del contrato
let contract = null;
if (process.env.CONTRACT_ADDRESS && process.env.CONTRACT_ADDRESS.length > 10 && wallet) {
  try {
    contract = new ethers.Contract(
      process.env.CONTRACT_ADDRESS,
      CONTRACT_ABI,
      wallet
    );
    console.log('✅ Contrato configurado:', process.env.CONTRACT_ADDRESS);
  } catch (error) {
    console.warn('⚠️ Error al configurar contrato:', error.message);
  }
} else {
  console.warn('⚠️ CONTRACT_ADDRESS no configurado - solo modo borrador disponible');
}

export { provider, wallet, contract };
