-- ============================================
-- ESQUEMA REAL DE BASE DE DATOS RAILWAY
-- Extraído automáticamente: 15/12/2025, 9:42:58 p. m.
-- Sistema de Certificados Blockchain - UAGRM
-- ============================================

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;


-- Tabla: Administrativo
CREATE TABLE "Administrativo" (
    "idAdministrativo" UUID NOT NULL,
    "codigoAdministrativo" VARCHAR(20) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idUsuario" UUID NOT NULL,
    CONSTRAINT Administrativo_pkey PRIMARY KEY ("idAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key1 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key10 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key100 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key101 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key102 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key103 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key104 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key105 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key11 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key12 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key13 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key14 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key15 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key16 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key17 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key18 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key19 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key2 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key20 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key21 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key22 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key23 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key24 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key25 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key26 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key27 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key28 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key29 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key3 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key30 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key31 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key32 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key33 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key34 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key35 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key36 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key37 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key38 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key39 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key4 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key40 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key41 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key42 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key43 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key44 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key45 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key46 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key47 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key48 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key49 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key5 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key50 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key51 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key52 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key53 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key54 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key55 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key56 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key57 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key58 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key59 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key6 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key60 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key61 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key62 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key63 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key64 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key65 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key66 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key67 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key68 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key69 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key7 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key70 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key71 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key72 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key73 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key74 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key75 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key76 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key77 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key78 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key79 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key8 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key80 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key81 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key82 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key83 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key84 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key85 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key86 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key87 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key88 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key89 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key9 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key90 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key91 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key92 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key93 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key94 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key95 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key96 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key97 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key98 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_codigoAdministrativo_key99 UNIQUE ("codigoAdministrativo"),
    CONSTRAINT Administrativo_idUsuario_fkey FOREIGN KEY ("idUsuario")
        REFERENCES "Usuario"("idUsuario") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX Administrativo_codigoAdministrativo_key ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key1 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key10 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key100 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key101 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key102 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key103 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key104 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key105 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key11 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key12 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key13 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key14 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key15 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key16 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key17 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key18 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key19 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key2 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key20 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key21 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key22 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key23 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key24 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key25 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key26 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key27 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key28 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key29 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key3 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key30 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key31 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key32 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key33 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key34 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key35 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key36 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key37 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key38 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key39 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key4 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key40 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key41 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key42 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key43 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key44 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key45 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key46 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key47 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key48 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key49 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key5 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key50 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key51 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key52 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key53 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key54 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key55 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key56 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key57 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key58 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key59 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key6 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key60 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key61 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key62 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key63 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key64 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key65 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key66 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key67 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key68 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key69 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key7 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key70 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key71 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key72 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key73 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key74 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key75 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key76 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key77 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key78 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key79 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key8 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key80 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key81 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key82 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key83 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key84 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key85 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key86 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key87 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key88 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key89 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key9 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key90 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key91 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key92 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key93 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key94 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key95 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key96 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key97 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key98 ON "Administrativo" ("codigoAdministrativo");
CREATE INDEX Administrativo_codigoAdministrativo_key99 ON "Administrativo" ("codigoAdministrativo");

-- Tabla: Archivo
CREATE TABLE "Archivo" (
    "idArchivo" UUID NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "formato" VARCHAR(10) NOT NULL,
    "tamano" DOUBLE PRECISION NOT NULL,
    "url" VARCHAR(500) NOT NULL,
    "tipo" ENUM_ARCHIVO_TIPO NOT NULL DEFAULT 'contenido'::"enum_Archivo_tipo",
    "idProyecto" UUID,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    CONSTRAINT Archivo_pkey PRIMARY KEY ("idArchivo"),
    CONSTRAINT Archivo_idProyecto_fkey FOREIGN KEY ("idProyecto")
        REFERENCES "Proyecto"("idProyecto") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Area
CREATE TABLE "Area" (
    "idArea" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT Area_pkey PRIMARY KEY ("idArea"),
    CONSTRAINT Area_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Area_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: AreaCategoria
CREATE TABLE "AreaCategoria" (
    "idAreaCategoria" UUID NOT NULL,
    "idArea" UUID NOT NULL,
    "idCategoria" UUID NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT AreaCategoria_pkey PRIMARY KEY ("idAreaCategoria"),
    CONSTRAINT AreaCategoria_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT AreaCategoria_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT AreaCategoria_idArea_fkey FOREIGN KEY ("idArea")
        REFERENCES "Area"("idArea") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT AreaCategoria_idCategoria_fkey FOREIGN KEY ("idCategoria")
        REFERENCES "Categoria"("idCategoria") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Calificacion
CREATE TABLE "Calificacion" (
    "idCalificacion" UUID NOT NULL,
    "puntajeObtenido" DOUBLE PRECISION NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idSubCalificacion" UUID NOT NULL,
    "idDocenteProyecto" UUID NOT NULL,
    "calificado" BOOLEAN NOT NULL DEFAULT false,
    CONSTRAINT Calificacion_pkey PRIMARY KEY ("idCalificacion"),
    CONSTRAINT Calificacion_idDocenteProyecto_fkey FOREIGN KEY ("idDocenteProyecto")
        REFERENCES "DocenteProyecto"("idDocenteProyecto") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Calificacion_idSubCalificacion_fkey FOREIGN KEY ("idSubCalificacion")
        REFERENCES "SubCalificacion"("idSubCalificacion") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Categoria
CREATE TABLE "Categoria" (
    "idCategoria" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT Categoria_pkey PRIMARY KEY ("idCategoria"),
    CONSTRAINT Categoria_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Categoria_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: Docente
CREATE TABLE "Docente" (
    "idDocente" UUID NOT NULL,
    "codigoDocente" VARCHAR(20) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idUsuario" UUID NOT NULL,
    CONSTRAINT Docente_pkey PRIMARY KEY ("idDocente"),
    CONSTRAINT Docente_codigoDocente_key UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key1 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key10 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key100 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key101 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key102 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key103 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key104 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key105 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key106 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key107 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key108 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key109 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key11 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key110 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key111 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key112 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key113 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key114 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key115 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key116 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key117 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key118 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key119 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key12 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key120 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key121 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key122 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key123 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key124 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key125 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key126 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key127 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key128 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key129 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key13 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key130 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key131 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key132 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key133 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key134 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key135 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key136 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key137 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key138 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key139 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key14 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key140 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key141 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key142 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key143 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key144 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key145 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key146 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key147 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key148 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key149 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key15 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key150 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key151 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key152 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key153 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key154 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key155 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key156 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key157 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key158 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key159 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key16 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key160 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key161 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key162 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key163 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key164 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key165 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key166 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key167 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key168 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key169 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key17 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key170 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key171 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key172 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key173 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key174 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key175 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key176 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key177 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key178 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key179 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key18 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key180 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key181 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key182 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key183 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key184 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key185 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key186 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key187 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key188 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key189 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key19 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key190 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key191 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key192 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key193 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key194 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key195 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key196 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key197 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key198 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key199 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key2 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key20 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key200 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key201 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key202 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key203 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key204 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key205 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key206 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key207 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key208 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key209 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key21 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key210 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key211 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key212 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key213 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key214 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key215 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key216 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key217 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key218 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key219 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key22 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key220 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key221 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key222 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key223 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key224 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key225 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key226 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key227 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key228 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key229 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key23 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key230 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key231 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key232 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key233 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key234 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key235 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key236 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key237 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key238 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key239 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key24 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key240 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key241 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key242 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key243 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key244 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key245 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key246 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key247 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key248 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key249 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key25 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key250 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key251 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key252 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key253 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key254 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key255 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key256 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key257 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key258 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key259 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key26 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key260 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key261 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key262 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key263 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key264 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key265 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key266 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key267 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key268 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key269 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key27 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key270 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key271 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key272 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key28 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key29 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key3 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key30 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key31 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key32 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key33 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key34 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key35 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key36 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key37 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key38 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key39 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key4 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key40 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key41 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key42 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key43 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key44 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key45 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key46 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key47 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key48 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key49 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key5 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key50 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key51 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key52 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key53 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key54 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key55 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key56 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key57 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key58 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key59 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key6 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key60 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key61 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key62 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key63 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key64 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key65 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key66 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key67 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key68 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key69 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key7 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key70 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key71 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key72 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key73 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key74 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key75 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key76 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key77 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key78 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key79 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key8 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key80 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key81 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key82 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key83 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key84 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key85 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key86 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key87 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key88 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key89 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key9 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key90 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key91 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key92 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key93 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key94 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key95 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key96 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key97 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key98 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_codigoDocente_key99 UNIQUE ("codigoDocente"),
    CONSTRAINT Docente_idUsuario_fkey FOREIGN KEY ("idUsuario")
        REFERENCES "Usuario"("idUsuario") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX Docente_codigoDocente_key ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key1 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key10 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key100 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key101 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key102 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key103 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key104 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key105 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key106 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key107 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key108 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key109 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key11 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key110 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key111 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key112 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key113 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key114 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key115 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key116 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key117 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key118 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key119 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key12 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key120 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key121 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key122 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key123 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key124 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key125 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key126 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key127 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key128 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key129 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key13 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key130 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key131 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key132 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key133 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key134 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key135 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key136 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key137 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key138 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key139 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key14 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key140 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key141 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key142 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key143 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key144 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key145 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key146 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key147 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key148 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key149 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key15 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key150 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key151 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key152 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key153 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key154 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key155 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key156 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key157 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key158 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key159 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key16 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key160 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key161 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key162 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key163 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key164 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key165 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key166 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key167 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key168 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key169 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key17 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key170 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key171 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key172 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key173 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key174 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key175 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key176 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key177 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key178 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key179 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key18 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key180 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key181 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key182 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key183 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key184 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key185 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key186 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key187 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key188 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key189 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key19 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key190 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key191 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key192 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key193 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key194 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key195 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key196 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key197 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key198 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key199 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key2 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key20 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key200 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key201 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key202 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key203 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key204 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key205 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key206 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key207 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key208 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key209 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key21 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key210 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key211 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key212 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key213 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key214 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key215 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key216 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key217 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key218 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key219 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key22 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key220 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key221 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key222 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key223 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key224 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key225 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key226 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key227 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key228 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key229 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key23 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key230 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key231 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key232 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key233 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key234 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key235 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key236 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key237 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key238 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key239 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key24 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key240 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key241 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key242 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key243 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key244 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key245 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key246 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key247 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key248 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key249 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key25 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key250 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key251 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key252 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key253 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key254 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key255 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key256 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key257 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key258 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key259 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key26 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key260 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key261 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key262 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key263 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key264 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key265 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key266 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key267 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key268 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key269 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key27 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key270 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key271 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key272 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key28 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key29 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key3 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key30 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key31 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key32 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key33 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key34 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key35 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key36 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key37 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key38 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key39 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key4 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key40 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key41 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key42 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key43 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key44 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key45 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key46 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key47 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key48 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key49 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key5 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key50 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key51 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key52 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key53 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key54 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key55 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key56 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key57 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key58 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key59 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key6 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key60 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key61 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key62 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key63 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key64 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key65 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key66 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key67 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key68 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key69 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key7 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key70 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key71 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key72 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key73 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key74 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key75 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key76 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key77 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key78 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key79 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key8 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key80 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key81 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key82 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key83 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key84 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key85 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key86 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key87 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key88 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key89 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key9 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key90 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key91 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key92 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key93 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key94 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key95 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key96 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key97 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key98 ON "Docente" ("codigoDocente");
CREATE INDEX Docente_codigoDocente_key99 ON "Docente" ("codigoDocente");

-- Tabla: DocenteProyecto
CREATE TABLE "DocenteProyecto" (
    "idDocenteProyecto" UUID NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idDocente" UUID NOT NULL,
    "idProyecto" UUID NOT NULL,
    CONSTRAINT DocenteProyecto_pkey PRIMARY KEY ("idDocenteProyecto"),
    CONSTRAINT DocenteProyecto_idDocente_fkey FOREIGN KEY ("idDocente")
        REFERENCES "Docente"("idDocente") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT DocenteProyecto_idProyecto_fkey FOREIGN KEY ("idProyecto")
        REFERENCES "Proyecto"("idProyecto") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Estudiante
CREATE TABLE "Estudiante" (
    "idEstudiante" UUID NOT NULL,
    "codigoEstudiante" VARCHAR(20) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idUsuario" UUID NOT NULL,
    CONSTRAINT Estudiante_pkey PRIMARY KEY ("idEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key1 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key10 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key100 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key101 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key102 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key103 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key104 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key105 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key106 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key107 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key108 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key109 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key11 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key110 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key111 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key112 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key113 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key114 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key115 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key116 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key117 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key118 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key119 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key12 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key120 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key121 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key122 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key123 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key124 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key125 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key126 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key127 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key128 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key129 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key13 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key130 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key131 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key132 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key133 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key134 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key135 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key136 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key137 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key138 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key139 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key14 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key140 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key141 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key142 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key143 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key144 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key145 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key146 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key147 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key148 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key149 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key15 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key150 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key151 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key152 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key153 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key154 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key155 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key156 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key157 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key158 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key159 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key16 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key160 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key161 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key162 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key163 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key164 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key165 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key166 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key167 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key168 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key169 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key17 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key170 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key171 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key172 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key173 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key174 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key175 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key176 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key177 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key178 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key179 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key18 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key180 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key181 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key182 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key183 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key184 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key185 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key186 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key187 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key188 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key189 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key19 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key190 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key191 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key192 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key193 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key194 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key195 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key196 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key197 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key198 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key199 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key2 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key20 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key200 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key201 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key202 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key203 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key204 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key205 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key206 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key207 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key208 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key209 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key21 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key210 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key211 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key212 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key213 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key214 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key215 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key216 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key217 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key218 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key219 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key22 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key220 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key221 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key222 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key223 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key224 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key225 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key226 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key227 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key228 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key229 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key23 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key230 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key231 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key232 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key233 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key234 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key235 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key236 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key237 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key238 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key239 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key24 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key240 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key241 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key242 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key243 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key244 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key245 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key246 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key247 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key248 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key249 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key25 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key250 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key251 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key252 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key253 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key254 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key255 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key256 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key257 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key258 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key259 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key26 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key260 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key261 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key262 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key263 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key264 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key265 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key266 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key267 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key268 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key269 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key27 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key270 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key271 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key272 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key28 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key29 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key3 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key30 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key31 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key32 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key33 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key34 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key35 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key36 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key37 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key38 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key39 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key4 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key40 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key41 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key42 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key43 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key44 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key45 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key46 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key47 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key48 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key49 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key5 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key50 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key51 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key52 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key53 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key54 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key55 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key56 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key57 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key58 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key59 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key6 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key60 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key61 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key62 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key63 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key64 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key65 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key66 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key67 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key68 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key69 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key7 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key70 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key71 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key72 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key73 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key74 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key75 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key76 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key77 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key78 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key79 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key8 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key80 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key81 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key82 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key83 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key84 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key85 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key86 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key87 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key88 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key89 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key9 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key90 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key91 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key92 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key93 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key94 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key95 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key96 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key97 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key98 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_codigoEstudiante_key99 UNIQUE ("codigoEstudiante"),
    CONSTRAINT Estudiante_idUsuario_fkey FOREIGN KEY ("idUsuario")
        REFERENCES "Usuario"("idUsuario") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX Estudiante_codigoEstudiante_key ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key1 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key10 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key100 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key101 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key102 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key103 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key104 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key105 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key106 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key107 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key108 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key109 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key11 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key110 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key111 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key112 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key113 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key114 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key115 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key116 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key117 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key118 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key119 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key12 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key120 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key121 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key122 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key123 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key124 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key125 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key126 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key127 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key128 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key129 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key13 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key130 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key131 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key132 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key133 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key134 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key135 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key136 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key137 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key138 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key139 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key14 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key140 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key141 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key142 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key143 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key144 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key145 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key146 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key147 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key148 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key149 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key15 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key150 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key151 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key152 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key153 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key154 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key155 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key156 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key157 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key158 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key159 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key16 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key160 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key161 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key162 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key163 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key164 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key165 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key166 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key167 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key168 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key169 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key17 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key170 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key171 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key172 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key173 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key174 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key175 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key176 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key177 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key178 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key179 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key18 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key180 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key181 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key182 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key183 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key184 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key185 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key186 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key187 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key188 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key189 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key19 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key190 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key191 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key192 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key193 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key194 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key195 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key196 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key197 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key198 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key199 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key2 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key20 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key200 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key201 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key202 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key203 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key204 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key205 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key206 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key207 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key208 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key209 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key21 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key210 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key211 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key212 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key213 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key214 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key215 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key216 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key217 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key218 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key219 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key22 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key220 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key221 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key222 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key223 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key224 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key225 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key226 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key227 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key228 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key229 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key23 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key230 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key231 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key232 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key233 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key234 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key235 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key236 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key237 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key238 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key239 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key24 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key240 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key241 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key242 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key243 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key244 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key245 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key246 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key247 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key248 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key249 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key25 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key250 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key251 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key252 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key253 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key254 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key255 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key256 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key257 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key258 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key259 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key26 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key260 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key261 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key262 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key263 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key264 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key265 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key266 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key267 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key268 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key269 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key27 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key270 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key271 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key272 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key28 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key29 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key3 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key30 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key31 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key32 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key33 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key34 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key35 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key36 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key37 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key38 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key39 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key4 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key40 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key41 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key42 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key43 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key44 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key45 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key46 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key47 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key48 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key49 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key5 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key50 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key51 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key52 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key53 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key54 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key55 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key56 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key57 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key58 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key59 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key6 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key60 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key61 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key62 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key63 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key64 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key65 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key66 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key67 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key68 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key69 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key7 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key70 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key71 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key72 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key73 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key74 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key75 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key76 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key77 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key78 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key79 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key8 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key80 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key81 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key82 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key83 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key84 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key85 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key86 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key87 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key88 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key89 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key9 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key90 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key91 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key92 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key93 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key94 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key95 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key96 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key97 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key98 ON "Estudiante" ("codigoEstudiante");
CREATE INDEX Estudiante_codigoEstudiante_key99 ON "Estudiante" ("codigoEstudiante");

-- Tabla: EstudianteEvento
CREATE TABLE "EstudianteEvento" (
    "idEstudianteEvento" UUID NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idEstudiante" UUID NOT NULL,
    "idEvento" UUID NOT NULL,
    CONSTRAINT EstudianteEvento_pkey PRIMARY KEY ("idEstudianteEvento"),
    CONSTRAINT EstudianteEvento_idEstudiante_fkey FOREIGN KEY ("idEstudiante")
        REFERENCES "Estudiante"("idEstudiante") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT EstudianteEvento_idEvento_fkey FOREIGN KEY ("idEvento")
        REFERENCES "Evento"("idEvento") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: EstudianteProyecto
CREATE TABLE "EstudianteProyecto" (
    "idEstudianteProyecto" UUID NOT NULL,
    "esLider" BOOLEAN DEFAULT false,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idProyecto" UUID NOT NULL,
    "idEstudiante" UUID NOT NULL,
    "invitacion" BOOLEAN,
    CONSTRAINT EstudianteProyecto_pkey PRIMARY KEY ("idEstudianteProyecto"),
    CONSTRAINT EstudianteProyecto_idEstudiante_fkey FOREIGN KEY ("idEstudiante")
        REFERENCES "Estudiante"("idEstudiante") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT EstudianteProyecto_idProyecto_fkey FOREIGN KEY ("idProyecto")
        REFERENCES "Proyecto"("idProyecto") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Evento
CREATE TABLE "Evento" (
    "idEvento" UUID NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "descripcion" VARCHAR(500),
    "fechaProgramada" TIMESTAMP WITH TIME ZONE NOT NULL,
    "estaActivo" BOOLEAN NOT NULL DEFAULT true,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "capacidadMaxima" INTEGER,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT Evento_pkey PRIMARY KEY ("idEvento"),
    CONSTRAINT Evento_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Evento_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: Feria
CREATE TABLE "Feria" (
    "idFeria" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "semestre" INTEGER NOT NULL,
    "año" INTEGER NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idTipoCalificacion" UUID,
    "ganadores" JSONB,
    "estado" ENUM_FERIA_ESTADO NOT NULL DEFAULT 'Activo'::"enum_Feria_estado",
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT Feria_pkey PRIMARY KEY ("idFeria"),
    CONSTRAINT Feria_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Feria_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Feria_idTipoCalificacion_fkey FOREIGN KEY ("idTipoCalificacion")
        REFERENCES "TipoCalificacion"("idTipoCalificacion") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: Grupo
CREATE TABLE "Grupo" (
    "idGrupo" UUID NOT NULL,
    "sigla" VARCHAR(10) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    CONSTRAINT Grupo_pkey PRIMARY KEY ("idGrupo")
);

-- Tabla: GrupoMateria
CREATE TABLE "GrupoMateria" (
    "idGrupoMateria" UUID NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idDocente" UUID NOT NULL,
    "idGrupo" UUID NOT NULL,
    "idMateria" UUID NOT NULL,
    CONSTRAINT GrupoMateria_pkey PRIMARY KEY ("idGrupoMateria"),
    CONSTRAINT GrupoMateria_idDocente_fkey FOREIGN KEY ("idDocente")
        REFERENCES "Docente"("idDocente") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT GrupoMateria_idGrupo_fkey FOREIGN KEY ("idGrupo")
        REFERENCES "Grupo"("idGrupo") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT GrupoMateria_idMateria_fkey FOREIGN KEY ("idMateria")
        REFERENCES "Materia"("idMateria") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Materia
CREATE TABLE "Materia" (
    "idMateria" UUID NOT NULL,
    "sigla" VARCHAR(50) NOT NULL,
    "nombre" VARCHAR(255) NOT NULL,
    "idAreaCategoria" UUID NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idSemestre" UUID NOT NULL,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT Materia_pkey PRIMARY KEY ("idMateria"),
    CONSTRAINT Materia_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Materia_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Materia_idAreaCategoria_fkey FOREIGN KEY ("idAreaCategoria")
        REFERENCES "AreaCategoria"("idAreaCategoria") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Materia_idSemestre_fkey FOREIGN KEY ("idSemestre")
        REFERENCES "Semestre"("idSemestre") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Permiso
CREATE TABLE "Permiso" (
    "idPermiso" UUID NOT NULL,
    "descripcion" VARCHAR(255) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    CONSTRAINT Permiso_pkey PRIMARY KEY ("idPermiso")
);

-- Tabla: Proyecto
CREATE TABLE "Proyecto" (
    "idProyecto" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT NOT NULL,
    "contenido" TEXT,
    "estaAprobado" BOOLEAN,
    "esFinal" BOOLEAN,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idGrupoMateria" UUID NOT NULL,
    "esPublico" BOOLEAN DEFAULT false,
    "estaAprobadoTutor" BOOLEAN,
    CONSTRAINT Proyecto_pkey PRIMARY KEY ("idProyecto"),
    CONSTRAINT Proyecto_idGrupoMateria_fkey FOREIGN KEY ("idGrupoMateria")
        REFERENCES "GrupoMateria"("idGrupoMateria") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Revision
CREATE TABLE "Revision" (
    "idRevision" UUID NOT NULL,
    "puntaje" DOUBLE PRECISION,
    "comentario" TEXT,
    "revisado" BOOLEAN NOT NULL DEFAULT false,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idProyecto" UUID NOT NULL,
    "idTarea" UUID NOT NULL,
    "enviadoPor" UUID,
    "revisadoPor" UUID,
    CONSTRAINT Revision_pkey PRIMARY KEY ("idRevision"),
    CONSTRAINT Revision_enviadoPor_fkey FOREIGN KEY ("enviadoPor")
        REFERENCES "Estudiante"("idEstudiante") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Revision_idProyecto_fkey FOREIGN KEY ("idProyecto")
        REFERENCES "Proyecto"("idProyecto") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Revision_idTarea_fkey FOREIGN KEY ("idTarea")
        REFERENCES "Tarea"("idTarea") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT Revision_revisadoPor_fkey FOREIGN KEY ("revisadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: Rol
CREATE TABLE "Rol" (
    "idRol" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    CONSTRAINT Rol_pkey PRIMARY KEY ("idRol"),
    CONSTRAINT Rol_nombre_key UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key1 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key10 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key100 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key101 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key102 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key103 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key104 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key105 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key106 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key107 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key108 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key109 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key11 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key110 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key111 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key112 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key113 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key114 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key115 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key116 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key117 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key118 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key119 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key12 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key120 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key121 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key122 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key123 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key124 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key125 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key126 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key127 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key128 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key129 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key13 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key130 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key131 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key132 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key133 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key134 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key135 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key136 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key137 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key138 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key139 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key14 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key140 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key141 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key142 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key143 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key144 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key145 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key146 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key147 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key148 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key149 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key15 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key150 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key151 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key152 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key153 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key154 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key155 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key156 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key157 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key158 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key159 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key16 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key160 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key161 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key162 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key163 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key164 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key165 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key166 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key167 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key168 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key169 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key17 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key170 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key171 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key172 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key173 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key174 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key175 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key176 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key177 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key178 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key179 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key18 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key180 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key181 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key182 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key183 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key184 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key185 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key186 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key187 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key188 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key189 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key19 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key190 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key191 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key192 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key193 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key194 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key195 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key196 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key197 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key198 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key199 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key2 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key20 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key200 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key201 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key202 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key203 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key204 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key205 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key206 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key207 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key208 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key209 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key21 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key210 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key211 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key212 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key213 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key214 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key215 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key216 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key217 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key218 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key219 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key22 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key220 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key221 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key222 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key223 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key224 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key225 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key226 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key227 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key228 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key229 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key23 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key230 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key231 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key232 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key233 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key234 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key235 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key236 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key237 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key238 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key239 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key24 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key240 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key241 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key242 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key243 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key244 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key245 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key246 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key247 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key248 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key249 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key25 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key250 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key251 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key252 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key253 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key254 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key255 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key256 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key257 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key258 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key259 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key26 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key260 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key261 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key262 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key263 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key264 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key265 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key266 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key267 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key268 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key269 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key27 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key270 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key271 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key272 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key28 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key29 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key3 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key30 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key31 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key32 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key33 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key34 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key35 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key36 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key37 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key38 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key39 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key4 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key40 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key41 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key42 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key43 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key44 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key45 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key46 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key47 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key48 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key49 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key5 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key50 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key51 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key52 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key53 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key54 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key55 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key56 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key57 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key58 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key59 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key6 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key60 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key61 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key62 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key63 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key64 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key65 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key66 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key67 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key68 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key69 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key7 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key70 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key71 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key72 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key73 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key74 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key75 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key76 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key77 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key78 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key79 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key8 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key80 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key81 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key82 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key83 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key84 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key85 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key86 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key87 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key88 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key89 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key9 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key90 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key91 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key92 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key93 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key94 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key95 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key96 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key97 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key98 UNIQUE ("nombre"),
    CONSTRAINT Rol_nombre_key99 UNIQUE ("nombre")
);
CREATE INDEX Rol_nombre_key ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key1 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key10 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key100 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key101 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key102 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key103 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key104 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key105 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key106 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key107 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key108 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key109 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key11 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key110 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key111 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key112 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key113 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key114 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key115 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key116 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key117 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key118 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key119 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key12 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key120 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key121 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key122 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key123 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key124 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key125 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key126 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key127 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key128 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key129 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key13 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key130 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key131 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key132 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key133 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key134 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key135 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key136 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key137 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key138 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key139 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key14 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key140 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key141 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key142 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key143 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key144 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key145 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key146 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key147 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key148 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key149 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key15 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key150 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key151 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key152 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key153 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key154 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key155 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key156 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key157 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key158 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key159 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key16 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key160 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key161 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key162 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key163 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key164 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key165 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key166 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key167 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key168 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key169 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key17 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key170 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key171 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key172 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key173 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key174 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key175 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key176 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key177 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key178 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key179 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key18 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key180 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key181 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key182 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key183 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key184 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key185 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key186 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key187 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key188 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key189 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key19 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key190 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key191 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key192 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key193 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key194 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key195 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key196 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key197 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key198 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key199 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key2 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key20 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key200 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key201 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key202 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key203 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key204 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key205 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key206 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key207 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key208 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key209 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key21 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key210 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key211 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key212 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key213 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key214 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key215 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key216 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key217 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key218 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key219 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key22 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key220 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key221 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key222 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key223 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key224 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key225 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key226 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key227 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key228 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key229 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key23 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key230 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key231 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key232 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key233 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key234 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key235 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key236 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key237 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key238 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key239 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key24 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key240 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key241 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key242 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key243 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key244 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key245 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key246 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key247 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key248 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key249 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key25 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key250 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key251 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key252 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key253 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key254 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key255 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key256 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key257 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key258 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key259 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key26 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key260 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key261 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key262 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key263 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key264 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key265 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key266 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key267 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key268 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key269 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key27 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key270 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key271 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key272 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key28 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key29 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key3 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key30 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key31 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key32 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key33 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key34 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key35 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key36 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key37 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key38 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key39 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key4 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key40 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key41 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key42 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key43 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key44 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key45 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key46 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key47 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key48 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key49 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key5 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key50 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key51 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key52 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key53 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key54 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key55 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key56 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key57 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key58 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key59 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key6 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key60 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key61 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key62 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key63 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key64 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key65 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key66 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key67 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key68 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key69 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key7 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key70 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key71 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key72 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key73 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key74 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key75 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key76 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key77 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key78 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key79 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key8 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key80 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key81 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key82 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key83 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key84 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key85 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key86 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key87 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key88 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key89 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key9 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key90 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key91 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key92 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key93 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key94 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key95 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key96 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key97 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key98 ON "Rol" ("nombre");
CREATE INDEX Rol_nombre_key99 ON "Rol" ("nombre");

-- Tabla: RolPermiso
CREATE TABLE "RolPermiso" (
    "idRolPermiso" UUID NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idRol" UUID NOT NULL,
    "idPermiso" UUID NOT NULL,
    CONSTRAINT RolPermiso_pkey PRIMARY KEY ("idRolPermiso"),
    CONSTRAINT RolPermiso_idPermiso_fkey FOREIGN KEY ("idPermiso")
        REFERENCES "Permiso"("idPermiso") ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT RolPermiso_idRol_fkey FOREIGN KEY ("idRol")
        REFERENCES "Rol"("idRol") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Semestre
CREATE TABLE "Semestre" (
    "idSemestre" UUID NOT NULL,
    "numero" VARCHAR(10) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idFeria" UUID,
    CONSTRAINT Semestre_pkey PRIMARY KEY ("idSemestre"),
    CONSTRAINT Semestre_idFeria_fkey FOREIGN KEY ("idFeria")
        REFERENCES "Feria"("idFeria") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: SubCalificacion
CREATE TABLE "SubCalificacion" (
    "idSubCalificacion" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "maximoPuntaje" DOUBLE PRECISION NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idTipoCalificacion" UUID NOT NULL,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT SubCalificacion_pkey PRIMARY KEY ("idSubCalificacion"),
    CONSTRAINT SubCalificacion_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT SubCalificacion_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT SubCalificacion_idTipoCalificacion_fkey FOREIGN KEY ("idTipoCalificacion")
        REFERENCES "TipoCalificacion"("idTipoCalificacion") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Tarea
CREATE TABLE "Tarea" (
    "idTarea" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "descripcion" TEXT,
    "fechaLimite" TIMESTAMP WITH TIME ZONE NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "orden" INTEGER NOT NULL DEFAULT 0,
    "idFeria" UUID NOT NULL,
    "esFinal" BOOLEAN NOT NULL DEFAULT false,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT Tarea_pkey PRIMARY KEY ("idTarea"),
    CONSTRAINT Tarea_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Tarea_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Tarea_idFeria_fkey FOREIGN KEY ("idFeria")
        REFERENCES "Feria"("idFeria") ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: TipoCalificacion
CREATE TABLE "TipoCalificacion" (
    "idTipoCalificacion" UUID NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT TipoCalificacion_pkey PRIMARY KEY ("idTipoCalificacion"),
    CONSTRAINT TipoCalificacion_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT TipoCalificacion_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL
);

-- Tabla: Usuario
CREATE TABLE "Usuario" (
    "idUsuario" UUID NOT NULL,
    "ci" VARCHAR(20) NOT NULL,
    "nombre" VARCHAR(100) NOT NULL,
    "apellido" VARCHAR(100) NOT NULL,
    "correo" VARCHAR(255) NOT NULL,
    "instagram" VARCHAR(255),
    "linkedin" VARCHAR(255),
    "github" VARCHAR(255),
    "bio" TEXT,
    "contrasena" VARCHAR(255) NOT NULL,
    "idFotoPerfil" UUID,
    "estaActivo" BOOLEAN DEFAULT true,
    "fechaCreacion" TIMESTAMP WITH TIME ZONE,
    "fechaActualizacion" TIMESTAMP WITH TIME ZONE,
    "idRol" UUID NOT NULL,
    "creadoPor" UUID,
    "actualizadoPor" UUID,
    CONSTRAINT Usuario_pkey PRIMARY KEY ("idUsuario"),
    CONSTRAINT Usuario_correo_key UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key1 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key10 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key100 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key101 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key102 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key103 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key104 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key105 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key106 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key107 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key108 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key109 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key11 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key110 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key111 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key112 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key113 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key114 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key115 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key116 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key117 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key118 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key119 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key12 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key120 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key121 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key122 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key123 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key124 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key125 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key126 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key127 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key128 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key129 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key13 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key130 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key131 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key132 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key133 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key134 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key135 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key136 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key137 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key138 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key139 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key14 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key140 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key141 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key142 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key143 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key144 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key145 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key146 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key147 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key148 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key149 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key15 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key150 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key151 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key152 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key153 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key154 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key155 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key156 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key157 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key158 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key159 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key16 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key160 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key161 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key162 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key163 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key164 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key165 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key166 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key167 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key168 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key169 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key17 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key170 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key171 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key172 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key173 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key174 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key175 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key176 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key177 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key178 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key179 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key18 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key180 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key181 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key182 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key183 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key184 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key185 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key186 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key187 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key188 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key189 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key19 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key190 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key191 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key192 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key193 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key194 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key195 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key196 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key197 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key198 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key199 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key2 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key20 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key200 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key201 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key202 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key203 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key204 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key205 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key206 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key207 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key208 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key209 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key21 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key210 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key211 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key212 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key213 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key214 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key215 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key216 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key217 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key218 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key219 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key22 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key220 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key221 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key222 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key223 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key224 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key225 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key226 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key227 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key228 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key229 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key23 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key230 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key231 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key232 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key233 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key234 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key235 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key236 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key237 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key238 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key239 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key24 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key240 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key241 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key242 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key243 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key244 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key245 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key246 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key247 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key248 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key249 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key25 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key250 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key251 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key252 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key253 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key254 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key255 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key256 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key257 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key258 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key259 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key26 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key260 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key261 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key262 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key263 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key264 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key265 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key266 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key267 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key268 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key269 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key27 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key270 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key271 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key272 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key28 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key29 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key3 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key30 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key31 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key32 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key33 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key34 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key35 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key36 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key37 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key38 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key39 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key4 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key40 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key41 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key42 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key43 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key44 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key45 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key46 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key47 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key48 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key49 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key5 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key50 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key51 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key52 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key53 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key54 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key55 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key56 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key57 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key58 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key59 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key6 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key60 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key61 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key62 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key63 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key64 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key65 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key66 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key67 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key68 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key69 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key7 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key70 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key71 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key72 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key73 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key74 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key75 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key76 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key77 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key78 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key79 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key8 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key80 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key81 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key82 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key83 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key84 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key85 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key86 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key87 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key88 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key89 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key9 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key90 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key91 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key92 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key93 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key94 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key95 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key96 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key97 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key98 UNIQUE ("correo"),
    CONSTRAINT Usuario_correo_key99 UNIQUE ("correo"),
    CONSTRAINT Usuario_actualizadoPor_fkey FOREIGN KEY ("actualizadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Usuario_creadoPor_fkey FOREIGN KEY ("creadoPor")
        REFERENCES "Administrativo"("idAdministrativo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Usuario_idFotoPerfil_fkey FOREIGN KEY ("idFotoPerfil")
        REFERENCES "Archivo"("idArchivo") ON UPDATE CASCADE ON DELETE SET NULL,
    CONSTRAINT Usuario_idRol_fkey FOREIGN KEY ("idRol")
        REFERENCES "Rol"("idRol") ON UPDATE CASCADE ON DELETE CASCADE
);
CREATE INDEX Usuario_correo_key ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key1 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key10 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key100 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key101 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key102 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key103 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key104 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key105 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key106 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key107 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key108 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key109 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key11 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key110 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key111 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key112 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key113 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key114 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key115 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key116 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key117 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key118 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key119 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key12 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key120 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key121 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key122 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key123 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key124 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key125 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key126 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key127 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key128 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key129 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key13 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key130 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key131 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key132 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key133 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key134 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key135 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key136 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key137 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key138 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key139 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key14 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key140 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key141 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key142 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key143 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key144 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key145 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key146 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key147 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key148 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key149 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key15 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key150 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key151 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key152 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key153 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key154 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key155 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key156 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key157 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key158 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key159 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key16 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key160 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key161 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key162 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key163 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key164 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key165 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key166 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key167 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key168 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key169 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key17 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key170 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key171 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key172 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key173 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key174 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key175 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key176 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key177 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key178 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key179 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key18 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key180 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key181 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key182 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key183 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key184 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key185 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key186 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key187 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key188 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key189 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key19 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key190 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key191 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key192 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key193 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key194 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key195 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key196 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key197 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key198 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key199 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key2 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key20 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key200 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key201 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key202 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key203 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key204 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key205 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key206 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key207 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key208 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key209 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key21 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key210 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key211 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key212 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key213 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key214 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key215 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key216 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key217 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key218 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key219 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key22 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key220 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key221 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key222 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key223 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key224 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key225 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key226 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key227 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key228 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key229 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key23 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key230 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key231 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key232 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key233 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key234 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key235 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key236 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key237 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key238 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key239 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key24 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key240 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key241 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key242 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key243 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key244 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key245 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key246 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key247 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key248 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key249 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key25 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key250 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key251 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key252 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key253 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key254 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key255 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key256 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key257 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key258 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key259 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key26 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key260 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key261 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key262 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key263 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key264 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key265 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key266 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key267 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key268 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key269 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key27 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key270 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key271 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key272 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key28 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key29 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key3 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key30 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key31 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key32 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key33 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key34 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key35 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key36 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key37 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key38 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key39 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key4 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key40 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key41 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key42 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key43 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key44 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key45 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key46 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key47 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key48 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key49 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key5 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key50 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key51 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key52 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key53 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key54 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key55 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key56 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key57 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key58 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key59 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key6 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key60 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key61 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key62 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key63 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key64 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key65 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key66 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key67 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key68 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key69 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key7 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key70 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key71 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key72 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key73 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key74 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key75 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key76 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key77 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key78 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key79 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key8 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key80 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key81 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key82 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key83 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key84 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key85 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key86 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key87 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key88 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key89 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key9 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key90 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key91 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key92 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key93 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key94 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key95 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key96 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key97 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key98 ON "Usuario" ("correo");
CREATE INDEX Usuario_correo_key99 ON "Usuario" ("correo");

-- Tabla: certificados
CREATE TABLE "certificados" (
    "id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "proyecto_id" UUID NOT NULL,
    "feria_id" UUID NOT NULL,
    "codigo" VARCHAR(100) NOT NULL,
    "pdf_path" TEXT NOT NULL,
    "hash" VARCHAR(64) NOT NULL,
    "tx_hash" VARCHAR(66),
    "blockchain_address" VARCHAR(42),
    "estado" VARCHAR(20) DEFAULT 'oficial'::character varying,
    "metadata_json" JSONB,
    "fecha_emision" TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "fecha_revocacion" TIMESTAMP WITHOUT TIME ZONE,
    "usuario_emisor" VARCHAR(100),
    "razon_revocacion" TEXT,
    "created_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP WITHOUT TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT certificados_pkey PRIMARY KEY ("id"),
    CONSTRAINT certificados_codigo_key UNIQUE ("codigo"),
    CONSTRAINT fk_certificados_feria FOREIGN KEY ("feria_id")
        REFERENCES "Feria"("idFeria") ON DELETE CASCADE,
    CONSTRAINT fk_certificados_proyecto FOREIGN KEY ("proyecto_id")
        REFERENCES "Proyecto"("idProyecto") ON DELETE CASCADE
);
CREATE INDEX certificados_codigo_key ON "certificados" ("codigo");
CREATE INDEX idx_certificados_codigo ON "certificados" ("codigo");
CREATE INDEX idx_certificados_estado ON "certificados" ("estado");
CREATE INDEX idx_certificados_feria ON "certificados" ("feria_id");
CREATE INDEX idx_certificados_proyecto ON "certificados" ("proyecto_id");
