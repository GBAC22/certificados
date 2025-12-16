-- ============================================================================
-- CONSULTAS SQL PARA VERIFICAR CERTIFICADOS EN BLOCKCHAIN
-- ============================================================================

-- 1. Ver todos los certificados y su estado blockchain
SELECT 
    codigo,
    estado,
    CASE 
        WHEN tx_hash IS NOT NULL THEN '✅ EN BLOCKCHAIN'
        ELSE '❌ SOLO DB'
    END as blockchain_status,
    tx_hash,
    fecha_emision
FROM certificados
ORDER BY fecha_emision DESC;


-- 2. Contar certificados por tipo
SELECT 
    estado,
    COUNT(*) as total,
    COUNT(tx_hash) as en_blockchain
FROM certificados
GROUP BY estado;


-- 3. Ver certificados oficiales con datos blockchain
SELECT 
    codigo,
    estado,
    hash as pdf_hash,
    tx_hash as blockchain_tx,
    blockchain_address as contrato,
    fecha_emision
FROM certificados
WHERE estado = 'oficial'
ORDER BY fecha_emision DESC;


-- 4. Verificar si un certificado específico está en blockchain
SELECT 
    id,
    codigo,
    estado,
    CASE 
        WHEN tx_hash IS NOT NULL THEN 'SÍ - Transacción: ' || tx_hash
        ELSE 'NO - Solo en base de datos'
    END as en_blockchain
FROM certificados
WHERE codigo = 'CERT-2024-2-001'; -- Cambiar por el código que quieras verificar
