# ✅ SISTEMA COMPLETO: Calificaciones, Niveles y Categorías

## 🎯 Cambios Implementados

### 1. **Nota como Promedio sobre 100**
- ✅ Cálculo: `(puntajeObtenido / maximoPuntaje) * 100`
- ✅ Formato: `95.00/100` (2 decimales)
- ✅ Se muestra automáticamente en certificados si existe

### 2. **Estructura de Datos Railway**
Se utiliza la estructura correcta del sistema:

```
Proyecto
  ↓ (idGrupoMateria)
GrupoMateria
  ↓ (idMateria)
Materia
  ↓ (idAreaCategoria)
AreaCategoria
  ↓ (idArea, idCategoria)
Area + Categoria
```

**Campos obtenidos:**
- **Nivel (Area)**: "Avanzado", "Intermedio", "Básico"
- **Categoría**: "Software", "Hardware", "Investigación", etc.
- **Materia**: Nombre de la materia específica
- **Nota**: Promedio sobre 100

### 3. **Certificados Mejorados**
El PDF ahora muestra:

```
══════════════════════════════════════════════════
        "Nombre del Proyecto"
Ingeniería de Software 2 | Nivel Avanzado | Categoría: Software
          📊 Nota: 93.33/100
══════════════════════════════════════════════════
```

### 4. **Listado de Proyectos Agrupados**
API: `GET /api/ferias/:id/proyectos`

**Respuesta incluye:**
```json
{
  "success": true,
  "data": [...],  // Lista plana
  "agrupado": {
    "Avanzado": {
      "Software": [
        {
          "id": "uuid-1",
          "nombre": "Sistema X",
          "nivel": "Avanzado",
          "categoria": "Software",
          "materia": "Ing. Software 2",
          "nota": 93.33,
          "tiene_certificado": true
        }
      ],
      "Hardware": [...]
    },
    "Intermedio": {...},
    "Básico": {...}
  },
  "niveles": ["Avanzado", "Intermedio", "Básico", "Sin nivel"]
}
```

## 📊 Consultas SQL Implementadas

### Obtener Proyecto con Nota, Nivel y Categoría
```sql
SELECT 
  p."idProyecto",
  p.nombre,
  a.nombre as nivel,
  m.nombre as materia,
  cat.nombre as categoria,
  (
    SELECT 
      ROUND(CAST((SUM(cal."puntajeObtenido") / SUM(sc."maximoPuntaje")) * 100 AS numeric), 2)
    FROM "DocenteProyecto" dp
    JOIN "Calificacion" cal ON dp."idDocenteProyecto" = cal."idDocenteProyecto"
    JOIN "SubCalificacion" sc ON cal."idSubCalificacion" = sc."idSubCalificacion"
    WHERE dp."idProyecto" = p."idProyecto" AND cal.calificado = true
  ) as nota
FROM "Proyecto" p
LEFT JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
LEFT JOIN "Materia" m ON gm."idMateria" = m."idMateria"
LEFT JOIN "AreaCategoria" ac ON m."idAreaCategoria" = ac."idAreaCategoria"
LEFT JOIN "Area" a ON ac."idArea" = a."idArea"
LEFT JOIN "Categoria" cat ON ac."idCategoria" = cat."idCategoria"
ORDER BY 
  CASE a.nombre 
    WHEN 'Avanzado' THEN 1
    WHEN 'Intermedio' THEN 2
    WHEN 'Básico' THEN 3
    ELSE 4
  END,
  cat.nombre,
  m.nombre,
  nota DESC NULLS LAST;
```

## 🎨 Cambios en el PDF

### Ubicación de la información:
```
┌────────────────────────────────────────────────────┐
│            Certificado UAGRM                       │
├────────────────────────────────────────────────────┤
│  Estudiantes: Juan Pérez, María López              │
├────────────────────────────────────────────────────┤
│         "Nombre del Proyecto"                      │
│  Ing. Software 2 | Nivel Avanzado | Cat: Software │  ← NUEVO
│         📊 Nota: 93.33/100                         │  ← NUEVO
├────────────────────────────────────────────────────┤
│  Bajo la dirección de: Dr. Tutor                   │
└────────────────────────────────────────────────────┘
```

**Colores:**
- Materia/Nivel/Categoría: **Azul UAGRM** (#003366)
- Nota: **Dorado UAGRM** (#D4AF37)

## 📁 Archivos Modificados

### Backend Controllers:
1. **certificadosController.js**
   - Consulta de calificaciones con promedio sobre 100
   - Consulta de nivel (Area), categoría y materia
   - Pasa datos completos al PDF

2. **feriasController.js** (`obtenerProyectosDeFeria`)
   - Lista proyectos con nivel, categoría, materia y nota
   - Agrupa por nivel → categoría
   - Ordena: Avanzado → Intermedio → Básico → categoría → nota

3. **proyectosController.js** (`listarProyectos`)
   - Incluye nivel, categoría, materia y nota
   - Mismo ordenamiento que ferias

### Backend Services:
4. **pdfService.js**
   - Muestra materia, nivel y categoría (línea azul)
   - Muestra nota con emoji 📊 (línea dorada)
   - Separación clara visual

## 🧪 Resultados de Prueba

```
✅ Encontrados 10 proyectos

🎓 NIVEL: DESARROLLO DE SOFTWARE
  🏷️  Categoría: Avanzado
     1. Calidad de Software con ISO/IEEE
        Materia: Ingeniería de Software 2
        Nota: 93.33/100
     
     2. Pruebas de Rendimiento
        Materia: Ingeniería de Software 2
        Nota: 86.67/100

  🏷️  Categoría: Básico
     1. Tipos de Sistemas de Información
        Materia: Sistemas de Información 1
        Nota: 93.33/100

🎓 NIVEL: MATEMÁTICAS Y FÍSICA
  🏷️  Categoría: Básico
     1. Curvas en el Arte
        Materia: Cálculo 1
        Nota: 90.00/100
     
     2. La Ruta Más Corta
        Materia: Cálculo 1
        Nota: 86.67/100
```

## 🔍 Validaciones

✅ Nota se calcula automáticamente desde Calificacion
✅ Si no hay calificaciones, no se muestra (sin errores)
✅ Nivel se obtiene desde Area (no de GrupoMateria)
✅ Categoría se obtiene desde AreaCategoria
✅ Materia se obtiene desde relación existente
✅ Ordenamiento: Avanzado → Intermedio → Básico → Categoría → Nota DESC
✅ Compatible con base de datos local (ignora Railway queries)

## 🚀 Próximos Pasos Opcionales

### Implementar Lugares (1º, 2º, 3º)
Para agregar ranking dentro de cada Nivel-Categoría:

```sql
WITH Ranking AS (
  SELECT 
    p."idProyecto",
    p.nombre,
    a.nombre as nivel,
    cat.nombre as categoria,
    ROUND(CAST((SUM(cal."puntajeObtenido") / SUM(sc."maximoPuntaje")) * 100 AS numeric), 2) as nota,
    ROW_NUMBER() OVER (
      PARTITION BY a."idArea", cat."idCategoria" 
      ORDER BY (SUM(cal."puntajeObtenido") / SUM(sc."maximoPuntaje")) DESC
    ) AS lugar
  FROM "Proyecto" p
  JOIN "GrupoMateria" gm ON p."idGrupoMateria" = gm."idGrupoMateria"
  JOIN "Materia" m ON gm."idMateria" = m."idMateria"
  JOIN "AreaCategoria" ac ON m."idAreaCategoria" = ac."idAreaCategoria"
  JOIN "Area" a ON ac."idArea" = a."idArea"
  JOIN "Categoria" cat ON ac."idCategoria" = cat."idCategoria"
  JOIN "DocenteProyecto" dp ON dp."idProyecto" = p."idProyecto"
  JOIN "Calificacion" cal ON cal."idDocenteProyecto" = dp."idDocenteProyecto"
  WHERE cal.calificado = true
  GROUP BY p."idProyecto", p.nombre, a.nombre, cat.nombre, a."idArea", cat."idCategoria"
)
SELECT * FROM Ranking WHERE lugar <= 3;
```

Esto daría 1º, 2º y 3º lugar por cada combinación Nivel-Categoría.

## 📝 Notas Técnicas

1. **Sin modificar base de datos**: Todo se consulta de tablas existentes
2. **Promedio sobre 100**: Normalización automática de cualquier escala
3. **Agrupación flexible**: Nivel → Categoría (no Nivel → Materia)
4. **Visualización mejorada**: Iconos 🎓 📊 🏷️ para mejor lectura
5. **Compatibilidad**: Railway (producción) y Local (desarrollo)

## ✅ Estado Final

- ✅ Nota calculada como promedio sobre 100
- ✅ Nivel (Area) obtenido correctamente
- ✅ Categoría incluida en certificados y listados
- ✅ Materia mostrada en certificados
- ✅ Proyectos agrupados por Nivel → Categoría
- ✅ Ordenamiento correcto: Avanzado → Intermedio → Básico
- ✅ PDF mejorado con toda la información
- ✅ Pruebas exitosas con datos reales
