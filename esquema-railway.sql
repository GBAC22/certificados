-- ============================================
-- ESQUEMA COMPLETO BASE DE DATOS RAILWAY
-- Sistema de Certificados Blockchain - UAGRM
-- Solo estructura, sin datos
-- ============================================

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

-- ============================================
-- TABLAS PRINCIPALES
-- ============================================

-- 1. Usuario - Información base de personas
CREATE TABLE "Usuario" (
    "idUsuario" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    "fechaCreacion" TIMESTAMP DEFAULT NOW()
);

-- 2. Estudiante - Datos académicos de estudiantes
CREATE TABLE "Estudiante" (
    "idEstudiante" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idUsuario" UUID NOT NULL,
    "codigoEstudiante" VARCHAR(20) UNIQUE NOT NULL,
    CONSTRAINT fk_estudiante_usuario FOREIGN KEY ("idUsuario") 
        REFERENCES "Usuario"("idUsuario") ON DELETE CASCADE
);

-- 3. Docente - Datos de profesores
CREATE TABLE "Docente" (
    "idDocente" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idUsuario" UUID NOT NULL,
    CONSTRAINT fk_docente_usuario FOREIGN KEY ("idUsuario") 
        REFERENCES "Usuario"("idUsuario") ON DELETE CASCADE
);

-- 4. Area - Áreas de conocimiento
CREATE TABLE "Area" (
    "idArea" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL UNIQUE
    -- Ejemplos: "Desarrollo de Software", "Matemáticas y Física", "Redes y Comunicaciones"
);

-- 5. Categoria - Niveles de dificultad
CREATE TABLE "Categoria" (
    "idCategoria" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(50) NOT NULL UNIQUE
    -- Ejemplos: "Avanzado", "Intermedio", "Básico"
);

-- 6. AreaCategoria - Relación N:M entre Area y Categoria
CREATE TABLE "AreaCategoria" (
    "idAreaCategoria" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idArea" UUID NOT NULL,
    "idCategoria" UUID NOT NULL,
    CONSTRAINT fk_areacategoria_area FOREIGN KEY ("idArea") 
        REFERENCES "Area"("idArea") ON DELETE CASCADE,
    CONSTRAINT fk_areacategoria_categoria FOREIGN KEY ("idCategoria") 
        REFERENCES "Categoria"("idCategoria") ON DELETE CASCADE,
    CONSTRAINT uk_area_categoria UNIQUE ("idArea", "idCategoria")
);

-- 7. Feria - Eventos académicos
CREATE TABLE "Feria" (
    "idFeria" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(200) NOT NULL,
    semestre INTEGER NOT NULL CHECK (semestre IN (1, 2)),
    año INTEGER NOT NULL CHECK (año >= 2020),
    estado VARCHAR(50) DEFAULT 'activa' CHECK (estado IN ('activa', 'finalizada', 'cancelada')),
    "fechaCreacion" TIMESTAMP DEFAULT NOW()
);

-- 8. Semestre - Períodos académicos dentro de una feria
CREATE TABLE "Semestre" (
    "idSemestre" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idFeria" UUID NOT NULL,
    numero INTEGER NOT NULL,
    CONSTRAINT fk_semestre_feria FOREIGN KEY ("idFeria") 
        REFERENCES "Feria"("idFeria") ON DELETE CASCADE
);

-- 9. Materia - Asignaturas del semestre
CREATE TABLE "Materia" (
    "idMateria" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idSemestre" UUID NOT NULL,
    "idAreaCategoria" UUID NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    CONSTRAINT fk_materia_semestre FOREIGN KEY ("idSemestre") 
        REFERENCES "Semestre"("idSemestre") ON DELETE CASCADE,
    CONSTRAINT fk_materia_areacategoria FOREIGN KEY ("idAreaCategoria") 
        REFERENCES "AreaCategoria"("idAreaCategoria") ON DELETE RESTRICT
);

-- 10. GrupoMateria - Grupos/secciones de una materia con docente asignado
CREATE TABLE "GrupoMateria" (
    "idGrupoMateria" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idMateria" UUID NOT NULL,
    "idDocente" UUID,
    grupo VARCHAR(10),
    CONSTRAINT fk_grupomateria_materia FOREIGN KEY ("idMateria") 
        REFERENCES "Materia"("idMateria") ON DELETE CASCADE,
    CONSTRAINT fk_grupomateria_docente FOREIGN KEY ("idDocente") 
        REFERENCES "Docente"("idDocente") ON DELETE SET NULL
);

-- 11. Proyecto - Trabajos presentados en la feria
CREATE TABLE "Proyecto" (
    "idProyecto" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idGrupoMateria" UUID NOT NULL,
    nombre VARCHAR(200) NOT NULL,
    descripcion TEXT,
    "estaAprobado" BOOLEAN DEFAULT FALSE,
    "fechaCreacion" TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_proyecto_grupomateria FOREIGN KEY ("idGrupoMateria") 
        REFERENCES "GrupoMateria"("idGrupoMateria") ON DELETE CASCADE
);

-- 12. EstudianteProyecto - Relación N:M entre Estudiante y Proyecto
CREATE TABLE "EstudianteProyecto" (
    "idEstudianteProyecto" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idProyecto" UUID NOT NULL,
    "idEstudiante" UUID NOT NULL,
    "esLider" BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_estudianteproyecto_proyecto FOREIGN KEY ("idProyecto") 
        REFERENCES "Proyecto"("idProyecto") ON DELETE CASCADE,
    CONSTRAINT fk_estudianteproyecto_estudiante FOREIGN KEY ("idEstudiante") 
        REFERENCES "Estudiante"("idEstudiante") ON DELETE CASCADE,
    CONSTRAINT uk_estudiante_proyecto UNIQUE ("idProyecto", "idEstudiante")
);

-- 13. DocenteProyecto - Evaluadores asignados a proyectos
CREATE TABLE "DocenteProyecto" (
    "idDocenteProyecto" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idProyecto" UUID NOT NULL,
    "idDocente" UUID NOT NULL,
    CONSTRAINT fk_docenteproyecto_proyecto FOREIGN KEY ("idProyecto") 
        REFERENCES "Proyecto"("idProyecto") ON DELETE CASCADE,
    CONSTRAINT fk_docenteproyecto_docente FOREIGN KEY ("idDocente") 
        REFERENCES "Docente"("idDocente") ON DELETE CASCADE,
    CONSTRAINT uk_docente_proyecto UNIQUE ("idProyecto", "idDocente")
);

-- 14. SubCalificacion - Criterios de evaluación (rúbrica)
CREATE TABLE "SubCalificacion" (
    "idSubCalificacion" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nombre VARCHAR(100) NOT NULL,
    "maximoPuntaje" INTEGER NOT NULL CHECK ("maximoPuntaje" > 0)
    -- Ejemplos: "Originalidad (50pts)", "Funcionalidad (100pts)", "Presentación (50pts)"
);

-- 15. Calificacion - Puntajes asignados por evaluadores
CREATE TABLE "Calificacion" (
    "idCalificacion" UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    "idDocenteProyecto" UUID NOT NULL,
    "idSubCalificacion" UUID NOT NULL,
    "puntajeObtenido" INTEGER NOT NULL CHECK ("puntajeObtenido" >= 0),
    calificado BOOLEAN DEFAULT FALSE,
    CONSTRAINT fk_calificacion_docenteproyecto FOREIGN KEY ("idDocenteProyecto") 
        REFERENCES "DocenteProyecto"("idDocenteProyecto") ON DELETE CASCADE,
    CONSTRAINT fk_calificacion_subcalificacion FOREIGN KEY ("idSubCalificacion") 
        REFERENCES "SubCalificacion"("idSubCalificacion") ON DELETE RESTRICT,
    CONSTRAINT uk_docente_subcalificacion UNIQUE ("idDocenteProyecto", "idSubCalificacion")
);

-- 16. certificados - Certificados emitidos con blockchain
CREATE TABLE certificados (
    id UUID PRIMARY KEY,
    proyecto_id UUID NOT NULL,
    feria_id UUID NOT NULL,
    codigo VARCHAR(100) UNIQUE NOT NULL,
    pdf_path VARCHAR(500),
    hash VARCHAR(64) NOT NULL,
    tx_hash VARCHAR(100),
    blockchain_address VARCHAR(100),
    estado VARCHAR(50) DEFAULT 'oficial' CHECK (estado IN ('borrador', 'oficial', 'revocado')),
    metadata_json JSONB,
    fecha_emision TIMESTAMP DEFAULT NOW(),
    usuario_emisor VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_certificado_proyecto FOREIGN KEY (proyecto_id) 
        REFERENCES "Proyecto"("idProyecto") ON DELETE RESTRICT,
    CONSTRAINT fk_certificado_feria FOREIGN KEY (feria_id) 
        REFERENCES "Feria"("idFeria") ON DELETE RESTRICT
);

-- ============================================
-- ÍNDICES PARA OPTIMIZACIÓN DE CONSULTAS
-- ============================================

-- Índices para Proyecto
CREATE INDEX idx_proyecto_grupomateria ON "Proyecto"("idGrupoMateria");
CREATE INDEX idx_proyecto_aprobado ON "Proyecto"("estaAprobado");
CREATE INDEX idx_proyecto_fecha ON "Proyecto"("fechaCreacion");

-- Índices para EstudianteProyecto
CREATE INDEX idx_estudianteproyecto_proyecto ON "EstudianteProyecto"("idProyecto");
CREATE INDEX idx_estudianteproyecto_estudiante ON "EstudianteProyecto"("idEstudiante");
CREATE INDEX idx_estudianteproyecto_lider ON "EstudianteProyecto"("esLider");

-- Índices para DocenteProyecto
CREATE INDEX idx_docenteproyecto_proyecto ON "DocenteProyecto"("idProyecto");
CREATE INDEX idx_docenteproyecto_docente ON "DocenteProyecto"("idDocente");

-- Índices para Calificacion
CREATE INDEX idx_calificacion_docenteproyecto ON "Calificacion"("idDocenteProyecto");
CREATE INDEX idx_calificacion_subcalificacion ON "Calificacion"("idSubCalificacion");
CREATE INDEX idx_calificacion_calificado ON "Calificacion"(calificado);

-- Índices para GrupoMateria
CREATE INDEX idx_grupomateria_materia ON "GrupoMateria"("idMateria");
CREATE INDEX idx_grupomateria_docente ON "GrupoMateria"("idDocente");

-- Índices para Materia
CREATE INDEX idx_materia_semestre ON "Materia"("idSemestre");
CREATE INDEX idx_materia_areacategoria ON "Materia"("idAreaCategoria");

-- Índices para Feria
CREATE INDEX idx_feria_estado ON "Feria"(estado);
CREATE INDEX idx_feria_anio_semestre ON "Feria"(año, semestre);

-- Índices para certificados
CREATE INDEX idx_certificados_codigo ON certificados(codigo);
CREATE INDEX idx_certificados_proyecto ON certificados(proyecto_id);
CREATE INDEX idx_certificados_feria ON certificados(feria_id);
CREATE INDEX idx_certificados_estado ON certificados(estado);
CREATE INDEX idx_certificados_fecha ON certificados(fecha_emision);
CREATE INDEX idx_certificados_hash ON certificados(hash);

-- Índices para Usuario
CREATE INDEX idx_usuario_correo ON "Usuario"(correo);

-- Índices para Estudiante
CREATE INDEX idx_estudiante_codigo ON "Estudiante"("codigoEstudiante");
CREATE INDEX idx_estudiante_usuario ON "Estudiante"("idUsuario");

-- ============================================
-- COMENTARIOS DE DOCUMENTACIÓN
-- ============================================

COMMENT ON TABLE "Usuario" IS 'Información base de todas las personas (estudiantes y docentes)';
COMMENT ON TABLE "Estudiante" IS 'Datos académicos específicos de estudiantes';
COMMENT ON TABLE "Docente" IS 'Datos específicos de profesores/evaluadores';
COMMENT ON TABLE "Area" IS 'Áreas de conocimiento (Ej: Desarrollo de Software, Matemáticas)';
COMMENT ON TABLE "Categoria" IS 'Niveles de dificultad (Básico, Intermedio, Avanzado)';
COMMENT ON TABLE "AreaCategoria" IS 'Combinación de área y categoría para clasificar materias';
COMMENT ON TABLE "Feria" IS 'Eventos académicos donde se presentan proyectos';
COMMENT ON TABLE "Semestre" IS 'Períodos académicos dentro de una feria';
COMMENT ON TABLE "Materia" IS 'Asignaturas del plan de estudios';
COMMENT ON TABLE "GrupoMateria" IS 'Grupos/secciones de una materia con docente tutor';
COMMENT ON TABLE "Proyecto" IS 'Trabajos/proyectos presentados por estudiantes';
COMMENT ON TABLE "EstudianteProyecto" IS 'Relación entre estudiantes y proyectos (equipo)';
COMMENT ON TABLE "DocenteProyecto" IS 'Evaluadores asignados a cada proyecto';
COMMENT ON TABLE "SubCalificacion" IS 'Criterios de evaluación (rúbrica)';
COMMENT ON TABLE "Calificacion" IS 'Puntajes otorgados por evaluadores según criterios';
COMMENT ON TABLE certificados IS 'Certificados digitales emitidos con registro blockchain';

COMMENT ON COLUMN "Proyecto"."estaAprobado" IS 'Indica si el proyecto fue aprobado para generar certificado';
COMMENT ON COLUMN certificados.hash IS 'Hash SHA-256 del PDF del certificado';
COMMENT ON COLUMN certificados.tx_hash IS 'Transaction hash del registro en blockchain';
COMMENT ON COLUMN certificados.blockchain_address IS 'Dirección del contrato inteligente';
COMMENT ON COLUMN certificados.estado IS 'borrador (prueba) u oficial (producción)';

-- ============================================
-- DIAGRAMA DE RELACIONES (Comentado)
-- ============================================

/*
JERARQUÍA DE RELACIONES:

1. PERSONAS:
   Usuario → Estudiante → EstudianteProyecto → Proyecto
   Usuario → Docente → GrupoMateria (tutor)
                    → DocenteProyecto (evaluador) → Calificacion → SubCalificacion

2. ESTRUCTURA ACADÉMICA:
   Feria → Semestre → Materia → GrupoMateria → Proyecto
                      ↓
                 AreaCategoria ← Area + Categoria

3. CERTIFICACIÓN:
   Proyecto → certificados ← Feria
   
CÁLCULO DE NOTA:
   nota = (SUM(puntajeObtenido) / SUM(maximoPuntaje)) * 100
   
CÁLCULO DE LUGAR (por materia + categoría):
   ROW_NUMBER() OVER (PARTITION BY materia, categoria ORDER BY nota DESC)
   Solo los primeros 3 lugares se muestran en certificados
*/
