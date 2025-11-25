const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("CertificadosFeria", function () {
  let certificadosFeria;
  let owner;
  let addr1;

  beforeEach(async function () {
    [owner, addr1] = await ethers.getSigners();
    const CertificadosFeria = await ethers.getContractFactory("CertificadosFeria");
    certificadosFeria = await CertificadosFeria.deploy();
    await certificadosFeria.waitForDeployment();
  });

  describe("Registro de certificados", function () {
    it("Debe registrar un certificado correctamente", async function () {
      const certificadoId = "cert-001";
      const hash = ethers.keccak256(ethers.toUtf8Bytes("test-pdf"));
      const feriaId = "feria-001";
      const proyectoId = "proyecto-001";

      await certificadosFeria.registrarCertificado(
        certificadoId,
        hash,
        feriaId,
        proyectoId
      );

      const [hashResult, timestamp, feriaIdResult, proyectoIdResult, existe, revocado] = 
        await certificadosFeria.verificarCertificado(certificadoId);

      expect(existe).to.be.true;
      expect(revocado).to.be.false;
      expect(hashResult).to.equal(hash);
      expect(feriaIdResult).to.equal(feriaId);
      expect(proyectoIdResult).to.equal(proyectoId);
    });

    it("No debe permitir registrar certificado duplicado", async function () {
      const certificadoId = "cert-002";
      const hash = ethers.keccak256(ethers.toUtf8Bytes("test-pdf"));

      await certificadosFeria.registrarCertificado(
        certificadoId,
        hash,
        "feria-001",
        "proyecto-001"
      );

      await expect(
        certificadosFeria.registrarCertificado(
          certificadoId,
          hash,
          "feria-001",
          "proyecto-001"
        )
      ).to.be.revertedWith("Certificado ya existe");
    });

    it("Solo el owner puede registrar certificados", async function () {
      const certificadoId = "cert-003";
      const hash = ethers.keccak256(ethers.toUtf8Bytes("test-pdf"));

      await expect(
        certificadosFeria.connect(addr1).registrarCertificado(
          certificadoId,
          hash,
          "feria-001",
          "proyecto-001"
        )
      ).to.be.revertedWithCustomError(certificadosFeria, "OwnableUnauthorizedAccount");
    });
  });

  describe("Verificación de certificados", function () {
    it("Debe retornar existe=false para certificado inexistente", async function () {
      const [hash, timestamp, feriaId, proyectoId, existe, revocado] = 
        await certificadosFeria.verificarCertificado("cert-inexistente");

      expect(existe).to.be.false;
    });
  });

  describe("Revocación de certificados", function () {
    it("Debe revocar un certificado correctamente", async function () {
      const certificadoId = "cert-004";
      const hash = ethers.keccak256(ethers.toUtf8Bytes("test-pdf"));

      await certificadosFeria.registrarCertificado(
        certificadoId,
        hash,
        "feria-001",
        "proyecto-001"
      );

      await certificadosFeria.revocarCertificado(certificadoId);

      const [hashResult, timestamp, feriaId, proyectoId, existe, revocado] = 
        await certificadosFeria.verificarCertificado(certificadoId);

      expect(revocado).to.be.true;
    });

    it("Solo el owner puede revocar certificados", async function () {
      const certificadoId = "cert-005";
      const hash = ethers.keccak256(ethers.toUtf8Bytes("test-pdf"));

      await certificadosFeria.registrarCertificado(
        certificadoId,
        hash,
        "feria-001",
        "proyecto-001"
      );

      await expect(
        certificadosFeria.connect(addr1).revocarCertificado(certificadoId)
      ).to.be.revertedWithCustomError(certificadosFeria, "OwnableUnauthorizedAccount");
    });
  });

  describe("Registro por lote", function () {
    it("Debe registrar múltiples certificados", async function () {
      const ids = ["cert-lote-1", "cert-lote-2", "cert-lote-3"];
      const hashes = ids.map(id => ethers.keccak256(ethers.toUtf8Bytes(id)));
      const feriaIds = ["feria-001", "feria-001", "feria-001"];
      const proyectoIds = ["proyecto-001", "proyecto-002", "proyecto-003"];

      await certificadosFeria.registrarCertificadosLote(
        ids,
        hashes,
        feriaIds,
        proyectoIds
      );

      const total = await certificadosFeria.totalCertificados();
      expect(total).to.equal(3);
    });
  });
});
