-- ============================================================================
-- SCRIPT DE DATOS DE PRUEBA PARA CERTIFICADOS
-- Base de datos: semilleros_db
-- ============================================================================

-- Limpiar datos existentes (opcional - comentar si no quieres borrar)
-- TRUNCATE TABLE certificados CASCADE;
-- TRUNCATE TABLE proyectos CASCADE;
-- TRUNCATE TABLE ferias CASCADE;

-- ============================================================================
-- 1. INSERTAR FERIAS
-- ============================================================================

INSERT INTO ferias (id, nombre, semestre, año, fecha_inicio, fecha_fin, estado, created_at, updated_at)
VALUES 
    (gen_random_uuid(), 'Feria de Investigación 2024-2', '2', 2024, '2024-10-01', '2024-10-15', 'activa', NOW(), NOW()),
    (gen_random_uuid(), 'Feria de Investigación 2025-1', '1', 2025, '2025-03-01', '2025-03-15', 'activa', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 2. INSERTAR PROYECTOS DE PRUEBA
-- ============================================================================

-- Obtener ID de una feria para asignar a los proyectos
DO $$
DECLARE
    feria_id_var UUID;
BEGIN
    -- Obtener el ID de la primera feria
    SELECT id INTO feria_id_var FROM ferias LIMIT 1;
    
    -- Insertar proyectos de prueba
    INSERT INTO proyectos (
        id, 
        nombre, 
        descripcion, 
        feria_id, 
        estado,
        estudiantes_json,
        tutor_json,
        materia_json,
        created_at, 
        updated_at
    )
    VALUES 
    -- Proyecto 1: Sistema de Gestión Académica
    (
        gen_random_uuid(),
        'Sistema de Gestión Académica con IA',
        'Plataforma web para gestión de estudiantes, calificaciones y asistencia utilizando inteligencia artificial para predicción de rendimiento académico.',
        feria_id_var,
        'aprobado',
        '[
            {
                "nombre": "Juan Carlos",
                "apellido": "Pérez García",
                "codigo": "2020001",
                "esLider": true
            },
            {
                "nombre": "María José",
                "apellido": "López Ramírez",
                "codigo": "2020002",
                "esLider": false
            }
        ]'::jsonb,
        '{
            "nombre": "Dr. Roberto",
            "apellido": "Martínez Silva",
            "codigo": "DOC001"
        }'::jsonb,
        '{
            "nombre": "Ingeniería de Software II",
            "grupo": "A"
        }'::jsonb,
        NOW(),
        NOW()
    ),
    
    -- Proyecto 2: App Móvil de Turismo
    (
        gen_random_uuid(),
        'App Móvil de Turismo Inteligente',
        'Aplicación móvil para dispositivos Android e iOS que facilita la exploración turística mediante realidad aumentada y recomendaciones personalizadas.',
        feria_id_var,
        'aprobado',
        '[
            {
                "nombre": "Carlos Alberto",
                "apellido": "Rodríguez Sánchez",
                "codigo": "2020003",
                "esLider": true
            },
            {
                "nombre": "Ana Patricia",
                "apellido": "Fernández Díaz",
                "codigo": "2020004",
                "esLider": false
            },
            {
                "nombre": "Luis Fernando",
                "apellido": "González Torres",
                "codigo": "2020005",
                "esLider": false
            }
        ]'::jsonb,
        '{
            "nombre": "Ing. Laura",
            "apellido": "Gutiérrez Morales",
            "codigo": "DOC002"
        }'::jsonb,
        '{
            "nombre": "Desarrollo de Aplicaciones Móviles",
            "grupo": "B"
        }'::jsonb,
        NOW(),
        NOW()
    ),
    
    -- Proyecto 3: Plataforma IoT
    (
        gen_random_uuid(),
        'Plataforma IoT para Smart Cities',
        'Sistema de monitoreo y control de dispositivos IoT para ciudades inteligentes, incluye sensores de calidad del aire, tráfico y iluminación pública.',
        feria_id_var,
        'aprobado',
        '[
            {
                "nombre": "Diego Alejandro",
                "apellido": "Vargas Castillo",
                "codigo": "2020006",
                "esLider": true
            },
            {
                "nombre": "Valentina",
                "apellido": "Ruiz Herrera",
                "codigo": "2020007",
                "esLider": false
            }
        ]'::jsonb,
        '{
            "nombre": "Dr. Miguel",
            "apellido": "Ángel Ortiz",
            "codigo": "DOC003"
        }'::jsonb,
        '{
            "nombre": "Internet de las Cosas",
            "grupo": "A"
        }'::jsonb,
        NOW(),
        NOW()
    ),
    
    -- Proyecto 4: Sistema Blockchain
    (
        gen_random_uuid(),
        'Sistema de Trazabilidad con Blockchain',
        'Plataforma descentralizada para trazabilidad de productos agrícolas desde el campo hasta el consumidor, garantizando transparencia en la cadena de suministro.',
        feria_id_var,
        'aprobado',
        '[
            {
                "nombre": "Sofía Isabel",
                "apellido": "Mendoza Reyes",
                "codigo": "2020008",
                "esLider": true
            },
            {
                "nombre": "Andrés Felipe",
                "apellido": "Castro Jiménez",
                "codigo": "2020009",
                "esLider": false
            },
            {
                "nombre": "Camila Andrea",
                "apellido": "Paredes Luna",
                "codigo": "2020010",
                "esLider": false
            }
        ]'::jsonb,
        '{
            "nombre": "Ing. Patricia",
            "apellido": "Solano Vega",
            "codigo": "DOC004"
        }'::jsonb,
        '{
            "nombre": "Tecnologías Emergentes",
            "grupo": "C"
        }'::jsonb,
        NOW(),
        NOW()
    ),
    
    -- Proyecto 5: Chatbot con IA
    (
        gen_random_uuid(),
        'Chatbot Educativo con IA Generativa',
        'Asistente virtual basado en inteligencia artificial para apoyo académico, responde preguntas de estudiantes y proporciona material de estudio personalizado.',
        feria_id_var,
        'aprobado',
        '[
            {
                "nombre": "Santiago",
                "apellido": "Moreno Cruz",
                "codigo": "2020011",
                "esLider": true
            }
        ]'::jsonb,
        '{
            "nombre": "Dr. Fernando",
            "apellido": "Salazar Mejía",
            "codigo": "DOC005"
        }'::jsonb,
        '{
            "nombre": "Inteligencia Artificial",
            "grupo": "A"
        }'::jsonb,
        NOW(),
        NOW()
    )
    ON CONFLICT DO NOTHING;
    
END $$;

-- ============================================================================
-- 3. VERIFICAR DATOS INSERTADOS
-- ============================================================================

-- Mostrar ferias
SELECT 
    id,
    nombre,
    semestre,
    año,
    estado
FROM ferias
ORDER BY año DESC, semestre DESC;

-- Mostrar proyectos
SELECT 
    p.id,
    p.nombre,
    p.estado,
    f.nombre as feria,
    (p.estudiantes_json->0->>'nombre') || ' ' || (p.estudiantes_json->0->>'apellido') as lider
FROM proyectos p
JOIN ferias f ON p.feria_id = f.id
ORDER BY p.created_at DESC;

-- ============================================================================
-- 4. QUERY PARA OBTENER IDs DE PROYECTOS APROBADOS
-- ============================================================================

SELECT 
    p.id as proyecto_id,
    p.nombre as proyecto_nombre,
    p.estado,
    f.nombre as feria_nombre,
    jsonb_array_length(p.estudiantes_json) as num_estudiantes
FROM proyectos p
JOIN ferias f ON p.feria_id = f.id
WHERE p.estado = 'aprobado'
ORDER BY p.created_at DESC;

-- ============================================================================
-- NOTAS DE USO
-- ============================================================================

/*
CÓMO USAR ESTE SCRIPT:

1. Desde PowerShell (con PostgreSQL):
   psql -U postgres -d semilleros_db -f datos-prueba.sql

2. Desde pgAdmin:
   - Abrir Query Tool
   - Pegar el contenido de este archivo
   - Ejecutar (F5)

3. Obtener IDs de proyectos para pruebas:
   - Ejecutar la última query (sección 4)
   - Copiar el UUID del proyecto_id
   - Usar en el endpoint: POST /api/certificados/generar
   
4. Ejemplo de request para generar certificado:
   
   POST http://localhost:3000/api/certificados/generar
   Content-Type: application/json
   
   {
     "proyectoId": "UUID-DEL-PROYECTO-AQUI",
     "esBorrador": false
   }

5. Para borrador (sin blockchain):
   
   {
     "proyectoId": "UUID-DEL-PROYECTO-AQUI",
     "esBorrador": true
   }
*/
