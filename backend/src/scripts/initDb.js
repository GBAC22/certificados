import { query, getClient } from '../config/database.js';

/**
 * Script para inicializar la base de datos con tablas y datos de prueba
 */

const initDatabase = async () => {
  console.log('🚀 Inicializando base de datos...');

  const client = await getClient();

  try {
    await client.query('BEGIN');

    // Crear tabla ferias
    console.log('Creando tabla ferias...');
    await client.query(`
      CREATE TABLE IF NOT EXISTS ferias (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        nombre VARCHAR(255) NOT NULL,
        semestre INTEGER NOT NULL,
        año INTEGER NOT NULL,
        activa BOOLEAN DEFAULT false,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
      )
    `);

    // Crear tabla proyectos
    console.log('Creando tabla proyectos...');
    await client.query(`
      CREATE TABLE IF NOT EXISTS proyectos (
        id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
        feria_id UUID REFERENCES ferias(id),
        nombre VARCHAR(255) NOT NULL,
        descripcion TEXT,
        estado VARCHAR(50) DEFAULT 'pendiente',
        estudiantes_json JSONB,
        tutor_json JSONB,
        materia_json JSONB,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
      )
    `);

    // Crear tabla certificados
    console.log('Creando tabla certificados...');
    await client.query(`
      CREATE TABLE IF NOT EXISTS certificados (
        id UUID PRIMARY KEY,
        proyecto_id UUID REFERENCES proyectos(id),
        feria_id UUID REFERENCES ferias(id),
        codigo VARCHAR(100) UNIQUE NOT NULL,
        pdf_path VARCHAR(500),
        hash VARCHAR(64) NOT NULL,
        tx_hash VARCHAR(100),
        blockchain_address VARCHAR(100),
        estado VARCHAR(50) DEFAULT 'oficial',
        metadata_json JSONB,
        fecha_emision TIMESTAMP DEFAULT NOW(),
        usuario_emisor VARCHAR(100),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
      )
    `);

    // Crear índices
    console.log('Creando índices...');
    await client.query(`
      CREATE INDEX IF NOT EXISTS idx_certificados_proyecto_id ON certificados(proyecto_id);
      CREATE INDEX IF NOT EXISTS idx_certificados_feria_id ON certificados(feria_id);
      CREATE INDEX IF NOT EXISTS idx_certificados_codigo ON certificados(codigo);
      CREATE INDEX IF NOT EXISTS idx_proyectos_feria_id ON proyectos(feria_id);
    `);

    // Insertar datos de prueba
    console.log('Insertando datos de prueba...');

    // Feria de prueba
    const feriaResult = await client.query(`
      INSERT INTO ferias (nombre, semestre, año, activa)
      VALUES ('Feria de Innovación Tecnológica', 2, 2024, true)
      RETURNING id
    `);
    const feriaId = feriaResult.rows[0].id;
    console.log('✅ Feria creada:', feriaId);

    // Proyectos de prueba
    const proyectos = [
      {
        nombre: 'Sistema de Gestión Universitaria con IA',
        descripcion: 'Plataforma web para gestión de estudiantes con inteligencia artificial',
        estudiantes: [
          { nombre: 'Juan', apellido: 'Pérez', codigo: '2020001', esLider: true },
          { nombre: 'María', apellido: 'González', codigo: '2020002', esLider: false },
          { nombre: 'Carlos', apellido: 'López', codigo: '2020003', esLider: false }
        ],
        tutor: { nombre: 'Dr. Roberto', apellido: 'Martínez', codigo: 'DOC001' },
        materia: { nombre: 'Ingeniería de Software II', grupo: 'SW-01' }
      },
      {
        nombre: 'App Móvil para Telemedicina',
        descripcion: 'Aplicación móvil para consultas médicas a distancia',
        estudiantes: [
          { nombre: 'Ana', apellido: 'Rodríguez', codigo: '2020004', esLider: true },
          { nombre: 'Luis', apellido: 'Fernández', codigo: '2020005', esLider: false }
        ],
        tutor: { nombre: 'Ing. Patricia', apellido: 'Silva', codigo: 'DOC002' },
        materia: { nombre: 'Desarrollo de Aplicaciones Móviles', grupo: 'DAM-02' }
      },
      {
        nombre: 'Blockchain para Trazabilidad Agrícola',
        descripcion: 'Sistema blockchain para seguimiento de productos agrícolas',
        estudiantes: [
          { nombre: 'Pedro', apellido: 'Ramírez', codigo: '2020006', esLider: true },
          { nombre: 'Sofia', apellido: 'Torres', codigo: '2020007', esLider: false },
          { nombre: 'Diego', apellido: 'Castro', codigo: '2020008', esLider: false },
          { nombre: 'Laura', apellido: 'Vargas', codigo: '2020009', esLider: false }
        ],
        tutor: { nombre: 'Dr. Javier', apellido: 'Mendoza', codigo: 'DOC003' },
        materia: { nombre: 'Tecnologías Emergentes', grupo: 'TE-01' }
      }
    ];

    for (const proyecto of proyectos) {
      await client.query(`
        INSERT INTO proyectos (
          feria_id, nombre, descripcion, estado, 
          estudiantes_json, tutor_json, materia_json
        )
        VALUES ($1, $2, $3, $4, $5, $6, $7)
      `, [
        feriaId,
        proyecto.nombre,
        proyecto.descripcion,
        'aprobado',
        JSON.stringify(proyecto.estudiantes),
        JSON.stringify(proyecto.tutor),
        JSON.stringify(proyecto.materia)
      ]);
    }
    console.log(`✅ ${proyectos.length} proyectos creados`);

    await client.query('COMMIT');
    console.log('✅ Base de datos inicializada correctamente');

  } catch (error) {
    await client.query('ROLLBACK');
    console.error('❌ Error al inicializar base de datos:', error);
    throw error;
  } finally {
    client.release();
  }
};

// Ejecutar
initDatabase()
  .then(() => {
    console.log('✅ Script completado');
    process.exit(0);
  })
  .catch((error) => {
    console.error('❌ Script falló:', error);
    process.exit(1);
  });
