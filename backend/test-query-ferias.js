import { query } from './src/config/database.js';
import dotenv from 'dotenv';

dotenv.config();

async function testListarFerias() {
  try {
    console.log('🔍 Probando listarFerias()...\n');
    
    const isRailway = process.env.DB_HOST?.includes('rlwy.net');
    console.log(`Detectando Railway: ${isRailway}`);
    console.log(`DB_HOST: ${process.env.DB_HOST}\n`);

    const queryText = isRailway
      ? 'SELECT "idFeria" as id, nombre, semestre, año, estado, "fechaCreacion" as fecha_creacion FROM "Feria" ORDER BY año DESC, semestre DESC'
      : 'SELECT * FROM ferias ORDER BY año DESC, semestre DESC';
    
    console.log('Query SQL:');
    console.log(queryText);
    console.log();

    console.log('Ejecutando query...');
    const result = await query(queryText);
    
    console.log(`\n✅ Query exitosa: ${result.rows.length} feria(s) encontrada(s)\n`);
    
    if (result.rows.length > 0) {
      console.log('📋 Datos:');
      result.rows.forEach((f, idx) => {
        console.log(`${idx + 1}. ${f.nombre} (${f.estado}) - ${f.año}/${f.semestre}`);
      });
    }

    process.exit(0);

  } catch (error) {
    console.error('\n❌ ERROR:', error.message);
    console.error('\nStack:', error.stack);
    process.exit(1);
  }
}

testListarFerias();
