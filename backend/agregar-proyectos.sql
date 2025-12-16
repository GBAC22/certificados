-- Script para agregar proyectos de ejemplo
DO $$
DECLARE
    v_feria_id UUID;
BEGIN
    SELECT id INTO v_feria_id FROM ferias LIMIT 1;
    
    IF v_feria_id IS NOT NULL THEN
        -- Proyecto 1: IA y Machine Learning
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'Sistema de Reconocimiento Facial con IA',
            'Desarrollo de un sistema de reconocimiento facial usando redes neuronales convolucionales para seguridad universitaria',
            'aprobado',
            '[{"nombre": "Carlos", "apellido": "Mendoza", "codigo": "218045678", "esLider": true}, {"nombre": "Ana", "apellido": "Torres", "codigo": "218045679", "esLider": false}]'::jsonb,
            '{"nombre": "Dr. Roberto", "apellido": "Vargas", "codigo": "DOC-001"}'::jsonb,
            '{"nombre": "Inteligencia Artificial", "grupo": "A"}'::jsonb
        );

        -- Proyecto 2: IoT
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'Sistema de Riego Inteligente con IoT',
            'Automatización de sistemas de riego agrícola usando sensores IoT y control remoto',
            'aprobado',
            '[{"nombre": "María", "apellido": "Gonzales", "codigo": "218045680", "esLider": true}]'::jsonb,
            '{"nombre": "Ing. Patricia", "apellido": "Suarez", "codigo": "DOC-002"}'::jsonb,
            '{"nombre": "Internet de las Cosas", "grupo": "B"}'::jsonb
        );

        -- Proyecto 3: Blockchain
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'Plataforma de Certificados Digitales Blockchain',
            'Sistema de emisión y verificación de certificados usando tecnología blockchain',
            'aprobado',
            '[{"nombre": "Luis", "apellido": "Perez", "codigo": "218045681", "esLider": true}, {"nombre": "Sandra", "apellido": "Rojas", "codigo": "218045682", "esLider": false}, {"nombre": "Pedro", "apellido": "Vega", "codigo": "218045683", "esLider": false}]'::jsonb,
            '{"nombre": "Dr. Miguel", "apellido": "Castro", "codigo": "DOC-003"}'::jsonb,
            '{"nombre": "Desarrollo de Software II", "grupo": "A"}'::jsonb
        );

        -- Proyecto 4: App Móvil
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'App Móvil para Transporte Universitario',
            'Aplicación móvil para gestión y seguimiento del transporte público universitario',
            'aprobado',
            '[{"nombre": "Javier", "apellido": "Morales", "codigo": "218045684", "esLider": true}, {"nombre": "Lucia", "apellido": "Fernandez", "codigo": "218045685", "esLider": false}]'::jsonb,
            '{"nombre": "Ing. Carmen", "apellido": "Lopez", "codigo": "DOC-004"}'::jsonb,
            '{"nombre": "Programación Móvil", "grupo": "C"}'::jsonb
        );

        -- Proyecto 5: Realidad Virtual
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'Laboratorio Virtual de Química en VR',
            'Entorno de realidad virtual para prácticas de laboratorio de química',
            'aprobado',
            '[{"nombre": "Diego", "apellido": "Ramirez", "codigo": "218045686", "esLider": true}]'::jsonb,
            '{"nombre": "Dr. Fernando", "apellido": "Silva", "codigo": "DOC-005"}'::jsonb,
            '{"nombre": "Computación Gráfica", "grupo": "A"}'::jsonb
        );

        -- Proyecto 6: Big Data
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'Análisis Predictivo de Deserción Estudiantil',
            'Sistema de análisis de big data para predecir y prevenir la deserción universitaria',
            'aprobado',
            '[{"nombre": "Gabriela", "apellido": "Ortiz", "codigo": "218045687", "esLider": true}, {"nombre": "Roberto", "apellido": "Chavez", "codigo": "218045688", "esLider": false}]'::jsonb,
            '{"nombre": "Dr. Alberto", "apellido": "Medina", "codigo": "DOC-006"}'::jsonb,
            '{"nombre": "Minería de Datos", "grupo": "B"}'::jsonb
        );

        -- Proyecto 7: Ciberseguridad
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'Sistema de Detección de Intrusiones',
            'Herramienta de ciberseguridad para detectar y prevenir ataques informáticos',
            'aprobado',
            '[{"nombre": "Ricardo", "apellido": "Gutierrez", "codigo": "218045689", "esLider": true}]'::jsonb,
            '{"nombre": "Ing. Sofia", "apellido": "Paredes", "codigo": "DOC-007"}'::jsonb,
            '{"nombre": "Seguridad Informática", "grupo": "A"}'::jsonb
        );

        -- Proyecto 8: E-commerce
        INSERT INTO proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json)
        VALUES (
            gen_random_uuid(),
            v_feria_id,
            'Marketplace para Productos Locales',
            'Plataforma e-commerce para comercialización de productos de emprendedores locales',
            'aprobado',
            '[{"nombre": "Valeria", "apellido": "Quispe", "codigo": "218045690", "esLider": true}, {"nombre": "Eduardo", "apellido": "Flores", "codigo": "218045691", "esLider": false}]'::jsonb,
            '{"nombre": "Ing. Jorge", "apellido": "Ramos", "codigo": "DOC-008"}'::jsonb,
            '{"nombre": "E-Business", "grupo": "B"}'::jsonb
        );

        RAISE NOTICE '✅ Se agregaron 8 proyectos de ejemplo exitosamente';
    ELSE
        RAISE NOTICE '❌ No se encontró ninguna feria en la base de datos';
    END IF;
END;
$$;

-- Verificar proyectos agregados
SELECT COUNT(*) as total_proyectos FROM proyectos;
SELECT nombre, estado FROM proyectos ORDER BY nombre;
