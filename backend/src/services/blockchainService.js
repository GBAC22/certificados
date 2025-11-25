import { contract, provider } from '../config/blockchain.js';
import { ethers } from 'ethers';

/**
 * Registrar certificado en blockchain
 */
export const registrarEnBlockchain = async (certificadoId, hash, feriaId, proyectoId) => {
  try {
    if (!contract) {
      throw new Error('Blockchain no configurado. Use modo borrador o configure CONTRACT_ADDRESS y PRIVATE_KEY en .env');
    }

    // Convertir hash a bytes32
    const hashBytes32 = '0x' + hash;

    console.log('Registrando en blockchain:', {
      certificadoId,
      hash: hashBytes32,
      feriaId,
      proyectoId
    });

    // Ejecutar transacción
    const tx = await contract.registrarCertificado(
      certificadoId,
      hashBytes32,
      feriaId.toString(),
      proyectoId.toString()
    );

    console.log('Transacción enviada:', tx.hash);

    // Esperar confirmación
    const receipt = await tx.wait();

    console.log('Transacción confirmada:', receipt.hash);

    return {
      txHash: receipt.hash,
      blockNumber: receipt.blockNumber,
      gasUsed: receipt.gasUsed.toString()
    };

  } catch (error) {
    console.error('Error al registrar en blockchain:', error);
    throw new Error(`Error blockchain: ${error.message}`);
  }
};

/**
 * Verificar certificado en blockchain
 */
export const verificarEnBlockchain = async (certificadoId) => {
  try {
    if (!contract) {
      throw new Error('Blockchain no configurado');
    }

    const resultado = await contract.verificarCertificado(certificadoId);

    // El resultado es un array: [hash, timestamp, feriaId, proyectoId, existe, revocado]
    const [hash, timestamp, feriaId, proyectoId, existe, revocado] = resultado;

    if (!existe) {
      return {
        existe: false,
        mensaje: 'Certificado no encontrado en blockchain'
      };
    }

    return {
      existe: true,
      hash: hash,
      timestamp: Number(timestamp),
      feriaId,
      proyectoId,
      revocado,
      fecha: new Date(Number(timestamp) * 1000).toISOString()
    };

  } catch (error) {
    console.error('Error al verificar en blockchain:', error);
    throw new Error(`Error blockchain: ${error.message}`);
  }
};

/**
 * Obtener balance de MATIC
 */
export const obtenerBalance = async (address) => {
  try {
    const balance = await provider.getBalance(address);
    return ethers.formatEther(balance);
  } catch (error) {
    console.error('Error al obtener balance:', error);
    throw error;
  }
};
