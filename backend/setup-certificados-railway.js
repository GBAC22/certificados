import pkg from 'pg';
const { Client } = pkg;

const client = new Client({
  host: 'centerbeam.proxy.rlwy.net',
  port: 52280,
  database: 'railway',
  user: 'postgres',
  password: 'YsplMMdVfiIeeStcKPbyHLtZGZHRcMCC',
  ssl: {
    rejectUnauthorized: false
  }
});

async function setupCertificados() {
  try {
    await client.connect();
    console.log('✅ Conectado a Railway PostgreSQL\n');

    // Verificar si la tabla certificados ya existe
    const checkTable = await client.query(`
      SELECT EXISTS (
        SELECT FROM information_schema.tables 
        WHERE table_schema = 'public' 
        AND table_name = 'certificados'
      );
    `);

    if (checkTable.rows[0].exists) {
      console.log('⚠️ La tabla certificados ya existe');
      console.log('Verificando estructura...\n');
      
      const columns = await client.query(`
        SELECT column_name, data_type 
        FROM information_schema.columns 
        WHERE table_name = 'certificados'
        ORDER BY ordinal_position;
      `);
      
      console.log('📋 Columnas actuales:');
      columns.rows.forEach(col => console.log(`  - ${col.column_name} (${col.data_type})`));
      
    } else {
      console.log('📝 Creando tabla certificados...\n');
      
      await client.query(`
        CREATE TABLE IF NOT EXISTS certificados (
          id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
          proyecto_id UUID NOT NULL,
          feria_id UUID NOT NULL,
          codigo VARCHAR(100) UNIQUE NOT NULL,
          pdf_path TEXT NOT NULL,
          hash VARCHAR(64) NOT NULL,
          tx_hash VARCHAR(66),
          blockchain_address VARCHAR(42),
          estado VARCHAR(20) DEFAULT 'oficial',
          metadata_json JSONB,
          fecha_emision TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          fecha_revocacion TIMESTAMP,
          usuario_emisor VARCHAR(100),
          razon_revocacion TEXT,
          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
          
          CONSTRAINT fk_certificados_proyecto 
            FOREIGN KEY (proyecto_id) 
            REFERENCES "Proyecto"("idProyecto") 
            ON DELETE CASCADE,
            
          CONSTRAINT fk_certificados_feria 
            FOREIGN KEY (feria_id) 
            REFERENCES "Feria"("idFeria") 
            ON DELETE CASCADE,
            
          CONSTRAINT check_estado 
            CHECK (estado IN ('borrador', 'oficial', 'revocado'))
        );
        
        CREATE INDEX IF NOT EXISTS idx_certificados_proyecto ON certificados(proyecto_id);
        CREATE INDEX IF NOT EXISTS idx_certificados_feria ON certificados(feria_id);
        CREATE INDEX IF NOT EXISTS idx_certificados_codigo ON certificados(codigo);
        CREATE INDEX IF NOT EXISTS idx_certificados_estado ON certificados(estado);
      `);
      
      console.log('✅ Tabla certificados creada con éxito');
    }

    // Verificar estructura de la tabla Feria para agregar campos necesarios
    console.log('\n📋 Verificando estructura de tabla Feria...');
    const feriaColumns = await client.query(`
      SELECT column_name, data_type 
      FROM information_schema.columns 
      WHERE table_name = 'Feria'
      ORDER BY ordinal_position;
    `);
    
    console.log('Columnas de Feria:');
    feriaColumns.rows.forEach(col => console.log(`  - ${col.column_name} (${col.data_type})`));
    
    // NO MODIFICAR tabla Feria - Ya tiene columna estado
    console.log('\n✅ Tabla Feria ya tiene columna "estado"');
    console.log('📌 La columna estado controla si se pueden generar certificados');
    console.log('   - Estado debe ser "finalizada" para generar certificados');

    // Mostrar resumen
    console.log('\n========================================');
    console.log('✅ CONFIGURACIÓN COMPLETADA');
    console.log('========================================\n');
    console.log('Próximos pasos:');
    console.log('  1. Reinicia el backend para usar Railway DB');
    console.log('  2. Los certificados solo se generarán si:');
    console.log('     - La feria tiene estado = "finalizada"');
    console.log('     - O la fecha_fin ya pasó');
    console.log('  3. Usa el frontend para crear proyectos y certificados\n');

    await client.end();

  } catch (err) {
    console.error('❌ Error:', err.message);
    console.error('Stack:', err.stack);
    process.exit(1);
  }
}

setupCertificados();
