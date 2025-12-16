# 📊 ANÁLISIS COMPLETO DE LA BASE DE DATOS RAILWAY

## ✅ RESPUESTA DIRECTA A TU PREGUNTA

**¿La tabla Proyecto tiene el campo "nota"?**
**NO**, la tabla `Proyecto` **NO tiene** un campo llamado "nota", "nivel" o "lugar".

## 📋 COLUMNAS REALES DE LA TABLA PROYECTO

```
1.  idProyecto            (uuid, NOT NULL)
2.  nombre                (varchar, NOT NULL)
3.  descripcion           (text, NOT NULL)
4.  contenido             (text, NULL)
5.  estaAprobado          (boolean, NULL)
6.  esFinal               (boolean, NULL)
7.  fechaCreacion         (timestamp, NULL)
8.  fechaActualizacion    (timestamp, NULL)
9.  idGrupoMateria        (uuid, NOT NULL)
10. esPublico             (boolean, NULL, default: false)
11. estaAprobadoTutor     (boolean, NULL)
```

## 🎯 PERO SÍ EXISTE SISTEMA DE CALIFICACIONES

Tienes razón en que **existe un sistema de calificaciones para jurados**, pero **NO está directamente en la tabla Proyecto**. Está en tablas separadas:

### 📊 Sistema de Calificaciones (4 tablas relacionadas):

```
1. TipoCalificacion
   └─ idTipoCalificacion (uuid)
   └─ nombre (varchar) - Ejemplo: "Criterios de Evaluación"

2. SubCalificacion
   ├─ idSubCalificacion (uuid)
   ├─ nombre (varchar) - Ejemplo: "Metodología", "Originalidad", "Presentación"
   ├─ maximoPuntaje (double) - Ejemplo: 30, 25, 20
   └─ idTipoCalificacion → TipoCalificacion

3. DocenteProyecto (tabla intermedia)
   ├─ idDocenteProyecto (uuid)
   ├─ idDocente (uuid) → Docente (jurado)
   └─ idProyecto (uuid) → Proyecto

4. Calificacion
   ├─ idCalificacion (uuid)
   ├─ puntajeObtenido (double) - AQUÍ ESTÁ LA NOTA
   ├─ calificado (boolean)
   ├─ idSubCalificacion → SubCalificacion
   └─ idDocenteProyecto → DocenteProyecto
```

### 🔗 Flujo de Relaciones:

```
Proyecto
   ↓ (idProyecto)
DocenteProyecto ← (vincula proyecto con jurado)
   ↓ (idDocenteProyecto)
Calificacion ← (AQUÍ está el puntajeObtenido)
   ↓ (idSubCalificacion)
SubCalificacion ← (criterio: Metodología, Originalidad, etc.)
   ↓ (idTipoCalificacion)
TipoCalificacion ← ("Criterios de Evaluación")
```

## 📊 DATOS REALES ENCONTRADOS

Sí hay calificaciones registradas en la base de datos:

```
Proyecto: "La Ruta Más Corta"
  ✓ Metodología:    30/30 puntos
  ✓ Originalidad:   25/25 puntos
  ✓ Presentación:   20/20 puntos
  ✓ Sustentación:   20/25 puntos
  ─────────────────────────
  TOTAL:            95/100 puntos

Proyecto: "Curvas en el Arte"
  ✓ Metodología:    30/30 puntos
  (... más criterios)
```

## 💡 CÓMO OBTENER LA NOTA FINAL DE UN PROYECTO

Para calcular la nota final, necesitas sumar todos los `puntajeObtenido`:

```sql
SELECT 
  p.nombre as proyecto,
  SUM(c."puntajeObtenido") as nota_total,
  SUM(sc."maximoPuntaje") as nota_maxima
FROM "Proyecto" p
JOIN "DocenteProyecto" dp ON p."idProyecto" = dp."idProyecto"
JOIN "Calificacion" c ON dp."idDocenteProyecto" = c."idDocenteProyecto"
JOIN "SubCalificacion" sc ON c."idSubCalificacion" = sc."idSubCalificacion"
WHERE c.calificado = true
  AND p."idProyecto" = 'UUID_DEL_PROYECTO'
GROUP BY p."idProyecto", p.nombre;
```

Resultado ejemplo:
```
Proyecto: "La Ruta Más Corta"
nota_total:  95 puntos
nota_maxima: 100 puntos
```

## 🚫 CAMPOS QUE NO EXISTEN

Estos campos **NO existen** en ninguna tabla de Railway:

❌ `nota` - No está en Proyecto (está calculada desde Calificacion)
❌ `nivel` - No existe
❌ `lugar` - No existe (1er lugar, 2do lugar, 3er lugar)

## ✅ LO QUE SÍ PUEDES HACER

### Opción 1: Calcular nota desde calificaciones existentes
```javascript
// En certificadosController.js - agregar consulta:
const notaQuery = await client.query(`
  SELECT 
    SUM(c."puntajeObtenido") as nota_obtenida,
    SUM(sc."maximoPuntaje") as nota_maxima
  FROM "DocenteProyecto" dp
  JOIN "Calificacion" c ON dp."idDocenteProyecto" = c."idDocenteProyecto"
  JOIN "SubCalificacion" sc ON c."idSubCalificacion" = sc."idSubCalificacion"
  WHERE dp."idProyecto" = $1 AND c.calificado = true
  GROUP BY dp."idProyecto"
`, [proyecto.idProyecto]);

const nota = notaQuery.rows[0] 
  ? `${notaQuery.rows[0].nota_obtenida}/${notaQuery.rows[0].nota_maxima}` 
  : null;

datosPDF.nota = nota; // Ejemplo: "95/100"
```

### Opción 2: Nivel desde GrupoMateria
```javascript
// El idGrupoMateria puede tener información de nivel
const grupoQuery = await client.query(`
  SELECT 
    gm.*,
    m.nombre as nombre_materia
  FROM "GrupoMateria" gm
  JOIN "Materia" m ON gm."idMateria" = m."idMateria"
  WHERE gm."idGrupoMateria" = $1
`, [proyecto.idGrupoMateria]);

datosPDF.nivel = grupoQuery.rows[0]?.grupo; // Si existe campo grupo
```

### Opción 3: Lugar (ranking) - NECESITA AGREGARSE
Para tener "1er lugar", "2do lugar", etc., necesitarías:
1. Calcular nota total de todos los proyectos de la feria
2. Ordenarlos por puntaje
3. Asignar posición (rank)

Esto **NO está implementado** en la base de datos actual.

## 🎨 CÓDIGO YA PREPARADO EN pdfService.js

El código del PDF **YA está preparado** para mostrar esta información **SI existe**:

```javascript
// Líneas 188-218 en pdfService.js
const detallesProyecto = [];
if (datos.nivel) detallesProyecto.push(`Nivel: ${datos.nivel}`);
if (datos.nota) detallesProyecto.push(`Nota: ${datos.nota}`);
if (datos.lugar) {
  const lugarTexto = datos.lugar === 1 ? '1er Lugar' : 
                     datos.lugar === 2 ? '2do Lugar' : 
                     datos.lugar === 3 ? '3er Lugar' : 
                     `${datos.lugar}º Lugar`;
  detallesProyecto.push(`🏆 ${lugarTexto}`);
}

if (detallesProyecto.length > 0) {
  doc.fontSize(9)
     .fillColor(UAGRM_DORADO)
     .font(fontBold)
     .text(detallesProyecto.join(' | '), 50, currentY, { 
       width: pageWidth - 100, 
       lineBreak: false 
     });
}
```

Si pasas `datos.nota = "95/100"`, se mostrará en el PDF automáticamente.

## 📌 RESUMEN FINAL

1. ✅ **SÍ existe sistema de calificaciones** (tablas Calificacion, SubCalificacion, TipoCalificacion)
2. ✅ **SÍ hay datos reales** de calificaciones por jurados
3. ❌ **NO existe campo "nota"** directamente en tabla Proyecto
4. ❌ **NO existe campo "nivel"** en tabla Proyecto
5. ❌ **NO existe campo "lugar"** (ranking) en ninguna tabla
6. ✅ **Puedes calcular la nota** sumando puntajes de Calificacion
7. ✅ **El código del PDF ya está preparado** para mostrar estos datos

## 🔧 PRÓXIMOS PASOS SUGERIDOS

Si quieres mostrar la nota en los certificados:

1. **Modificar certificadosController.js** para calcular nota desde Calificacion
2. **Pasar el dato calculado** a pdfService.js
3. **El PDF lo mostrará automáticamente** (código ya existe)

Para "lugar" (ranking), necesitarías implementar lógica adicional o agregar ese campo a la base de datos (pero dijiste que no modifique la BD).

---

📁 **Archivos de verificación creados:**
- `consultar-columnas-proyecto.js` - Lista todas las columnas de Proyecto
- `consultar-estructura-calificaciones.js` - Muestra estructura de tablas de evaluación
- `analizar-sistema-calificaciones.js` - Analiza relaciones completas y datos reales

Puedes ejecutarlos cuando quieras verificar la estructura.
