const hre = require("hardhat");

async function main() {
  console.log("🚀 Desplegando contrato CertificadosFeria...");

  // Obtener la cuenta que despliega
  const [deployer] = await hre.ethers.getSigners();
  console.log("📝 Desplegando con la cuenta:", deployer.address);

  // Verificar balance
  const balance = await hre.ethers.provider.getBalance(deployer.address);
  console.log("💰 Balance:", hre.ethers.formatEther(balance), "MATIC");

  // Desplegar contrato
  const CertificadosFeria = await hre.ethers.getContractFactory("CertificadosFeria");
  const certificadosFeria = await CertificadosFeria.deploy();

  await certificadosFeria.waitForDeployment();

  const address = await certificadosFeria.getAddress();
  console.log("✅ CertificadosFeria desplegado en:", address);

  console.log("\n📋 Configuración para el backend:");
  console.log("CONTRACT_ADDRESS=" + address);

  console.log("\n🔍 Verificar contrato en PolygonScan:");
  console.log("npx hardhat verify --network mumbai", address);

  console.log("\n⚠️ IMPORTANTE:");
  console.log("1. Copia la dirección del contrato");
  console.log("2. Actualiza CONTRACT_ADDRESS en backend/.env");
  console.log("3. Guarda la dirección en un lugar seguro");
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
