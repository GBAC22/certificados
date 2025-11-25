# Blockchain - Sistema de Certificados

Smart contracts para el registro de certificados en blockchain (Polygon).

## 🚀 Inicio Rápido

### 1. Instalar dependencias
```bash
npm install
```

### 2. Compilar contratos
```bash
npm run compile
```

### 3. Ejecutar tests
```bash
npm test
```

## 📦 Despliegue

### Requisitos previos
1. **Wallet con MATIC**: Necesitas una wallet con MATIC en Mumbai testnet
   - Obtén MATIC gratis en: https://faucet.polygon.technology/

2. **Configurar PRIVATE_KEY**: 
   - Exporta tu private key desde MetaMask
   - Agrégala en `backend/.env`:
   ```
   PRIVATE_KEY=tu_private_key_aqui
   ```

### Desplegar en Mumbai Testnet
```bash
npm run deploy:mumbai
```

Esto desplegará el contrato y te dará la dirección. Ejemplo:
```
✅ CertificadosFeria desplegado en: 0x1234567890abcdef...
```

### Copiar dirección del contrato
Copia la dirección y actualiza `backend/.env`:
```
CONTRACT_ADDRESS=0x1234567890abcdef...
```

### Verificar contrato (opcional)
```bash
npx hardhat verify --network mumbai <CONTRACT_ADDRESS>
```

### Desplegar en Polygon Mainnet (Producción)
```bash
npm run deploy:polygon
```

⚠️ **IMPORTANTE**: Mainnet requiere MATIC real. Asegúrate de tener suficiente balance (~$10-20 USD).

## 📝 Smart Contract

### CertificadosFeria.sol

**Funciones principales:**

```solidity
// Registrar un certificado
function registrarCertificado(
    string memory _certificadoId,
    bytes32 _hash,
    string memory _feriaId,
    string memory _proyectoId
) public onlyOwner

// Registrar múltiples certificados
function registrarCertificadosLote(
    string[] memory _certificadoIds,
    bytes32[] memory _hashes,
    string[] memory _feriaIds,
    string[] memory _proyectoIds
) public onlyOwner

// Verificar un certificado
function verificarCertificado(string memory _certificadoId)
    public view returns (
        bytes32 hash,
        uint256 timestamp,
        string memory feriaId,
        string memory proyectoId,
        bool existe,
        bool revocado
    )

// Revocar un certificado
function revocarCertificado(string memory _certificadoId) public onlyOwner
```

**Eventos:**
- `CertificadoRegistrado`: Se emite al registrar un certificado
- `CertificadoRevocado`: Se emite al revocar un certificado

## 🔧 Configuración

### hardhat.config.js

Configuración de redes:
- **hardhat**: Red local para testing
- **mumbai**: Polygon Mumbai Testnet (80001)
- **polygon**: Polygon Mainnet (137)

### RPC URLs
- Mumbai: https://rpc-mumbai.maticvigil.com
- Polygon: https://polygon-rpc.com

También puedes usar Alchemy o Infura:
- Alchemy: https://polygon-mumbai.g.alchemy.com/v2/YOUR-API-KEY
- Infura: https://polygon-mumbai.infura.io/v3/YOUR-API-KEY

## 🧪 Testing

El contrato incluye tests completos:
```bash
npm test
```

Tests incluyen:
- ✅ Registro de certificados
- ✅ Verificación de certificados
- ✅ Revocación de certificados
- ✅ Registro por lote
- ✅ Permisos de owner
- ✅ Casos de error

## 📊 Gas Estimado

Operaciones estimadas en Mumbai/Polygon:

| Operación | Gas Estimado | Costo aprox (MATIC) |
|-----------|--------------|---------------------|
| Deploy | ~1,500,000 | ~$0.01 |
| Registrar certificado | ~100,000 | ~$0.001 |
| Registrar lote (10) | ~800,000 | ~$0.008 |
| Verificar | 0 (lectura) | Gratis |
| Revocar | ~30,000 | ~$0.0003 |

*Precios basados en gas price de 30 gwei y MATIC a $0.80*

## 🔍 Ver en PolygonScan

Después del despliegue, puedes ver tu contrato en:
- Mumbai: https://mumbai.polygonscan.com/address/CONTRACT_ADDRESS
- Mainnet: https://polygonscan.com/address/CONTRACT_ADDRESS

## 📖 Recursos

- [Hardhat Documentation](https://hardhat.org/docs)
- [Polygon Documentation](https://docs.polygon.technology/)
- [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/)
- [Mumbai Faucet](https://faucet.polygon.technology/)
