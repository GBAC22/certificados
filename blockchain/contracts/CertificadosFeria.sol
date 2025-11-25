// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title CertificadosFeria
 * @dev Smart contract para registro de certificados de ferias de investigación en blockchain
 */
contract CertificadosFeria is Ownable {
    
    // Estructura de un certificado
    struct Certificado {
        bytes32 hash;           // Hash SHA-256 del PDF
        uint256 timestamp;      // Momento de registro
        string feriaId;         // ID de la feria
        string proyectoId;      // ID del proyecto
        bool existe;            // Marca si existe
        bool revocado;          // Marca si fue revocado
    }
    
    // Mapping de ID de certificado a Certificado
    mapping(string => Certificado) private certificados;
    
    // Array de IDs de certificados (para iterar)
    string[] private certificadoIds;
    
    // Eventos
    event CertificadoRegistrado(
        string indexed certificadoId,
        bytes32 hash,
        uint256 timestamp,
        string feriaId,
        string proyectoId
    );
    
    event CertificadoRevocado(
        string indexed certificadoId,
        uint256 timestamp
    );
    
    constructor() Ownable(msg.sender) {}
    
    /**
     * @dev Registrar un nuevo certificado
     * @param _certificadoId ID único del certificado
     * @param _hash Hash SHA-256 del PDF
     * @param _feriaId ID de la feria
     * @param _proyectoId ID del proyecto
     */
    function registrarCertificado(
        string memory _certificadoId,
        bytes32 _hash,
        string memory _feriaId,
        string memory _proyectoId
    ) public onlyOwner {
        require(!certificados[_certificadoId].existe, "Certificado ya existe");
        require(_hash != bytes32(0), "Hash invalido");
        require(bytes(_certificadoId).length > 0, "ID invalido");
        
        certificados[_certificadoId] = Certificado({
            hash: _hash,
            timestamp: block.timestamp,
            feriaId: _feriaId,
            proyectoId: _proyectoId,
            existe: true,
            revocado: false
        });
        
        certificadoIds.push(_certificadoId);
        
        emit CertificadoRegistrado(
            _certificadoId,
            _hash,
            block.timestamp,
            _feriaId,
            _proyectoId
        );
    }
    
    /**
     * @dev Registrar múltiples certificados en una sola transacción
     * @param _certificadoIds Array de IDs
     * @param _hashes Array de hashes
     * @param _feriaIds Array de IDs de ferias
     * @param _proyectoIds Array de IDs de proyectos
     */
    function registrarCertificadosLote(
        string[] memory _certificadoIds,
        bytes32[] memory _hashes,
        string[] memory _feriaIds,
        string[] memory _proyectoIds
    ) public onlyOwner {
        require(
            _certificadoIds.length == _hashes.length &&
            _hashes.length == _feriaIds.length &&
            _feriaIds.length == _proyectoIds.length,
            "Arrays deben tener la misma longitud"
        );
        
        for (uint i = 0; i < _certificadoIds.length; i++) {
            registrarCertificado(
                _certificadoIds[i],
                _hashes[i],
                _feriaIds[i],
                _proyectoIds[i]
            );
        }
    }
    
    /**
     * @dev Verificar un certificado
     * @param _certificadoId ID del certificado
     * @return hash Hash del certificado
     * @return timestamp Momento de registro
     * @return feriaId ID de la feria
     * @return proyectoId ID del proyecto
     * @return existe Si el certificado existe
     * @return revocado Si el certificado fue revocado
     */
    function verificarCertificado(string memory _certificadoId)
        public
        view
        returns (
            bytes32 hash,
            uint256 timestamp,
            string memory feriaId,
            string memory proyectoId,
            bool existe,
            bool revocado
        )
    {
        Certificado memory cert = certificados[_certificadoId];
        return (
            cert.hash,
            cert.timestamp,
            cert.feriaId,
            cert.proyectoId,
            cert.existe,
            cert.revocado
        );
    }
    
    /**
     * @dev Revocar un certificado
     * @param _certificadoId ID del certificado a revocar
     */
    function revocarCertificado(string memory _certificadoId) public onlyOwner {
        require(certificados[_certificadoId].existe, "Certificado no existe");
        require(!certificados[_certificadoId].revocado, "Certificado ya revocado");
        
        certificados[_certificadoId].revocado = true;
        
        emit CertificadoRevocado(_certificadoId, block.timestamp);
    }
    
    /**
     * @dev Obtener el total de certificados registrados
     * @return Total de certificados
     */
    function totalCertificados() public view returns (uint256) {
        return certificadoIds.length;
    }
    
    /**
     * @dev Obtener ID de certificado por índice
     * @param _index Índice en el array
     * @return ID del certificado
     */
    function obtenerCertificadoPorIndice(uint256 _index)
        public
        view
        returns (string memory)
    {
        require(_index < certificadoIds.length, "Indice fuera de rango");
        return certificadoIds[_index];
    }
}
