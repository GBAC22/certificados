-- PostgreSQL database dump

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Drop existing tables if they exist
DROP TABLE IF EXISTS public.certificados CASCADE;
DROP TABLE IF EXISTS public.proyectos CASCADE;
DROP TABLE IF EXISTS public.ferias CASCADE;

-- Create ferias table
CREATE TABLE public.ferias (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    nombre character varying(255) NOT NULL,
    semestre integer NOT NULL,
    año integer NOT NULL,
    activa boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT ferias_pkey PRIMARY KEY (id)
);

-- Create proyectos table
CREATE TABLE public.proyectos (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    feria_id uuid,
    nombre character varying(255) NOT NULL,
    descripcion text,
    estado character varying(50) DEFAULT 'pendiente'::character varying,
    estudiantes_json jsonb,
    tutor_json jsonb,
    materia_json jsonb,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT proyectos_pkey PRIMARY KEY (id),
    CONSTRAINT proyectos_feria_id_fkey FOREIGN KEY (feria_id) REFERENCES public.ferias(id)
);

-- Create certificados table
CREATE TABLE public.certificados (
    id uuid NOT NULL,
    proyecto_id uuid,
    feria_id uuid,
    codigo character varying(100) NOT NULL,
    pdf_path character varying(500),
    hash character varying(64) NOT NULL,
    tx_hash character varying(100),
    blockchain_address character varying(100),
    estado character varying(50) DEFAULT 'oficial'::character varying,
    metadata_json jsonb,
    fecha_emision timestamp without time zone DEFAULT now(),
    usuario_emisor character varying(100),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    CONSTRAINT certificados_pkey PRIMARY KEY (id),
    CONSTRAINT certificados_codigo_key UNIQUE (codigo),
    CONSTRAINT certificados_feria_id_fkey FOREIGN KEY (feria_id) REFERENCES public.ferias(id),
    CONSTRAINT certificados_proyecto_id_fkey FOREIGN KEY (proyecto_id) REFERENCES public.proyectos(id)
);

-- Create indexes
CREATE INDEX idx_proyectos_feria_id ON public.proyectos USING btree (feria_id);
CREATE INDEX idx_certificados_proyecto_id ON public.certificados USING btree (proyecto_id);
CREATE INDEX idx_certificados_feria_id ON public.certificados USING btree (feria_id);
CREATE INDEX idx_certificados_codigo ON public.certificados USING btree (codigo);

-- Insert data for ferias
INSERT INTO public.ferias (id, nombre, semestre, año, activa) VALUES
('5f422512-1f0d-4f8a-b0a9-4493671f3379', 'Feria de Innovación Tecnológica', 2, 2024, true);

-- Insert data for proyectos
INSERT INTO public.proyectos (id, feria_id, nombre, descripcion, estado, estudiantes_json, tutor_json, materia_json) VALUES
('bdc4f184-7476-44f4-89d3-b4462e1b7a27', '5f422512-1f0d-4f8a-b0a9-4493671f3379', 'Sistema de Gestión Universitaria con IA', 'Plataforma web para gestión de estudiantes con inteligencia artificial', 'aprobado', '[{"codigo": "2020001", "nombre": "Juan", "esLider": true, "apellido": "Pérez"}, {"codigo": "2020002", "nombre": "María", "esLider": false, "apellido": "González"}, {"codigo": "2020003", "nombre": "Carlos", "esLider": false, "apellido": "López"}]', '{"codigo": "DOC001", "nombre": "Dr. Roberto", "apellido": "Martínez"}', '{"grupo": "SW-01", "nombre": "Ingeniería de Software II"}'),
('31e48ea9-a1e8-4883-895a-d3795db1f217', '5f422512-1f0d-4f8a-b0a9-4493671f3379', 'App Móvil para Telemedicina', 'Aplicación móvil para consultas médicas a distancia', 'aprobado', '[{"codigo": "2020004", "nombre": "Ana", "esLider": true, "apellido": "Rodríguez"}, {"codigo": "2020005", "nombre": "Luis", "esLider": false, "apellido": "Fernández"}]', '{"codigo": "DOC002", "nombre": "Ing. Patricia", "apellido": "Silva"}', '{"grupo": "DAM-02", "nombre": "Desarrollo de Aplicaciones Móviles"}'),
('b48f59f1-a08f-4513-ba18-92ddc49f6a9d', '5f422512-1f0d-4f8a-b0a9-4493671f3379', 'Blockchain para Trazabilidad Agrícola', 'Sistema blockchain para seguimiento de productos agrícolas', 'aprobado', '[{"codigo": "2020006", "nombre": "Pedro", "esLider": true, "apellido": "Ramírez"}, {"codigo": "2020007", "nombre": "Sofia", "esLider": false, "apellido": "Torres"}, {"codigo": "2020008", "nombre": "Diego", "esLider": false, "apellido": "Castro"}, {"codigo": "2020009", "nombre": "Laura", "esLider": false, "apellido": "Vargas"}]', '{"codigo": "DOC003", "nombre": "Dr. Javier", "apellido": "Mendoza"}', '{"grupo": "TE-01", "nombre": "Tecnologías Emergentes"}');
