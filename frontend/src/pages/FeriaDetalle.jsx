import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { ArrowLeft, Users, Award, AlertCircle, FileText, CheckCircle, Trash2, TestTube, Printer } from 'lucide-react'
import Card from '../components/Card'
import Button from '../components/Button'
import { getFeria, getProyectosDeFeria, generarLote, finalizarFeria, limpiarCertificadosPrueba, descargarIndiceImpresion } from '../services/api'

export default function FeriaDetalle() {
  const { id } = useParams()
  const navigate = useNavigate()
  const [feria, setFeria] = useState(null)
  const [proyectos, setProyectos] = useState([])
  const [loading, setLoading] = useState(true)
  const [generando, setGenerando] = useState(false)
  const [finalizando, setFinalizando] = useState(false)
  const [limpiando, setLimpiando] = useState(false)
  const [mensaje, setMensaje] = useState(null)

  useEffect(() => {
    loadData()
  }, [id])

  const loadData = async () => {
    try {
      const [feriaRes, proyectosRes] = await Promise.all([
        getFeria(id),
        getProyectosDeFeria(id)
      ])
      setFeria(feriaRes.data.data)
      
      // Log para depuración
      console.log('Respuesta proyectos completa:', proyectosRes.data)
      console.log('Proyectos data:', proyectosRes.data.data)
      console.log('Cantidad de proyectos:', proyectosRes.data.data?.length)
      
      // Backend devuelve tanto data (lista plana) como agrupado (objeto por nivel/categoría)
      const proyectosData = proyectosRes.data.data || []
      console.log('Proyectos a mostrar:', proyectosData)
      setProyectos(proyectosData)
    } catch (error) {
      console.error('Error al cargar datos:', error)
      setMensaje({ type: 'error', text: 'Error al cargar la feria' })
    } finally {
      setLoading(false)
    }
  }

  const handleFinalizarFeria = async () => {
    if (!confirm('¿Está seguro de finalizar esta feria? Una vez finalizada, se podrán generar certificados pero no se podrá revertir esta acción.')) {
      return
    }

    setFinalizando(true)
    setMensaje(null)

    try {
      const response = await finalizarFeria(id)
      setMensaje({ 
        type: 'success', 
        text: response.data.message || 'Feria finalizada exitosamente' 
      })
      loadData() // Recargar datos
    } catch (error) {
      setMensaje({ 
        type: 'error', 
        text: 'Error al finalizar feria: ' + (error.response?.data?.message || error.message) 
      })
    } finally {
      setFinalizando(false)
    }
  }

  const handleGenerarLote = async () => {
    // Verificar si la feria está finalizada (Railway: 'Finalizado', local: 'finalizada')
    const estaFinalizada = feria.estado === 'Finalizado' || feria.estado === 'finalizada';
    if (!estaFinalizada) {
      setMensaje({ 
        type: 'error', 
        text: 'Debe finalizar la feria antes de generar certificados' 
      })
      return
    }

    const cantidadAprobados = proyectos.filter(p => p.estado === 'aprobado' || p.aprobado === true).length;
    if (!confirm(`¿Generar certificados para todos los proyectos aprobados? (${cantidadAprobados} proyectos)`)) {
      return
    }

    setGenerando(true)
    setMensaje(null)

    try {
      const response = await generarLote({ feriaId: id, esBorrador: false })
      setMensaje({ 
        type: 'success', 
        text: `Generación completada: ${response.data.data.exitosos} exitosos, ${response.data.data.fallidos} fallidos` 
      })
      loadData() // Recargar datos
    } catch (error) {
      setMensaje({ 
        type: 'error', 
        text: 'Error al generar certificados: ' + (error.response?.data?.message || error.message) 
      })
    } finally {
      setGenerando(false)
    }
  }

  const handleGenerarPrueba = async () => {
    const cantidadAprobados = proyectos.filter(p => p.estado === 'aprobado' || p.aprobado === true).length;
    if (!confirm(`🧪 MODO PRUEBA\n\n¿Generar certificados de prueba para ${cantidadAprobados} proyectos aprobados?\n\n✅ Sin restricciones de feria finalizada\n✅ Usa blockchain LOCAL (Hardhat)\n✅ Marca de agua "PRUEBA" en PDF\n✅ Código: PRUEBA-XXXX`)) {
      return
    }

    setGenerando(true)
    setMensaje(null)

    try {
      const response = await generarLote({ feriaId: id, esBorrador: true })
      const certificados = response.data.data.certificados || []
      
      // Crear mensaje con links a PDFs
      setMensaje({ 
        type: 'success', 
        text: `✅ Prueba completada: ${response.data.data.exitosos} certificados generados`,
        certificados: certificados
      })
      loadData()
    } catch (error) {
      setMensaje({ 
        type: 'error', 
        text: '❌ Error: ' + (error.response?.data?.message || error.message) 
      })
    } finally {
      setGenerando(false)
    }
  }

  const handleLimpiarPruebas = async () => {
    // Preguntar al usuario qué tipo de eliminación desea
    const opciones = [
      '🧹 Solo certificados de PRUEBA (borrador)',
      '🗑️ TODOS los certificados (prueba + oficiales)'
    ];
    
    const seleccion = confirm(
      '¿Qué deseas eliminar?\n\n' +
      '✅ ACEPTAR → Solo certificados de PRUEBA (borrador)\n' +
      '❌ CANCELAR → Elegir eliminar TODOS\n\n'
    );
    
    let tipo = 'prueba';
    
    if (seleccion) {
      // Usuario eligió eliminar solo pruebas
      tipo = 'prueba';
    } else {
      // Preguntar si realmente quiere eliminar todos
      const confirmarTodos = confirm(
        '⚠️ ¿Eliminar TODOS los certificados?\n\n' +
        'Esto eliminará:\n' +
        '- Certificados de prueba (borrador)\n' +
        '- Certificados oficiales\n\n' +
        '⚠️ Esta acción NO se puede deshacer.\n\n' +
        '¿Estás seguro?'
      );
      
      if (!confirmarTodos) {
        return;
      }
      tipo = 'todos';
    }

    setLimpiando(true)
    setMensaje(null)

    try {
      const response = await limpiarCertificadosPrueba(id, tipo)
      const { totalEliminados, certificadosPrueba, certificadosOficiales } = response.data.data
      
      let mensajeExito = `✅ ${response.data.message}`
      if (tipo === 'todos' && (certificadosPrueba > 0 || certificadosOficiales > 0)) {
        mensajeExito += `\n📊 Detalles: ${certificadosPrueba} prueba + ${certificadosOficiales} oficiales = ${totalEliminados} total`
      }
      
      setMensaje({ 
        type: 'success', 
        text: mensajeExito
      })
      loadData()
    } catch (error) {
      setMensaje({ 
        type: 'error', 
        text: '❌ Error al limpiar: ' + (error.response?.data?.message || error.message) 
      })
    } finally {
      setLimpiando(false)
    }
  }

  if (loading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    )
  }

  if (!feria) {
    return (
      <div className="text-center py-12">
        <AlertCircle className="mx-auto h-12 w-12 text-red-500" />
        <h3 className="mt-2 text-sm font-medium text-gray-900">Feria no encontrada</h3>
      </div>
    )
  }

  // Railway usa 'aprobado' (boolean), local usa 'estado' (string)
  const proyectosAprobados = proyectos.filter(p => p.estado === 'aprobado' || p.aprobado === true)
  const proyectosConCertificado = proyectos.filter(p => p.tiene_certificado)

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <button
          onClick={() => navigate('/ferias')}
          className="flex items-center text-sm text-gray-600 hover:text-gray-900 mb-4"
        >
          <ArrowLeft className="h-4 w-4 mr-1" />
          Volver a ferias
        </button>
        <div className="flex justify-between items-start">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">{feria.nombre}</h1>
            <p className="mt-1 text-sm text-gray-500">
              Semestre {feria.semestre} - {feria.año}
            </p>
          </div>
          <div className="flex items-center gap-2">
            <span className={`px-3 py-1 text-sm font-medium rounded-full ${
              (feria.estado === 'Finalizado' || feria.estado === 'finalizada')
                ? 'bg-blue-100 text-blue-800' 
                : 'bg-green-100 text-green-800'
            }`}>
              {(feria.estado === 'Finalizado' || feria.estado === 'finalizada') ? 'Finalizada' : 'En curso'}
            </span>
          </div>
        </div>
      </div>

      {/* Mensaje */}
      {mensaje && (
        <div className={`p-4 rounded-md ${
          mensaje.type === 'success' ? 'bg-green-50 text-green-800' : 'bg-red-50 text-red-800'
        }`}>
          <p className="font-medium">{mensaje.text}</p>
          
          {/* Mostrar links a PDFs si existen */}
          {mensaje.certificados && mensaje.certificados.length > 0 && (
            <div className="mt-4 space-y-2">
              <p className="text-sm font-semibold">📄 PDFs Generados:</p>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-2">
                {mensaje.certificados.map((cert, idx) => (
                  <a
                    key={cert.certificadoId}
                    href={`http://localhost:3000${cert.pdfUrl}`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="flex items-center gap-2 px-3 py-2 bg-white rounded border border-green-200 hover:bg-green-100 transition-colors text-sm"
                  >
                    <FileText className="h-4 w-4" />
                    <span className="truncate">{cert.codigo}</span>
                  </a>
                ))}
              </div>
            </div>
          )}
        </div>
      )}

      {/* Estadísticas */}
      <div className="grid grid-cols-1 md:grid-cols-4 gap-4">
        <Card>
          <div className="text-center">
            <p className="text-2xl font-bold text-gray-900">{proyectos.length}</p>
            <p className="text-sm text-gray-500">Total Proyectos</p>
          </div>
        </Card>
        <Card>
          <div className="text-center">
            <p className="text-2xl font-bold text-green-600">{proyectosAprobados.length}</p>
            <p className="text-sm text-gray-500">Aprobados</p>
          </div>
        </Card>
        <Card>
          <div className="text-center">
            <p className="text-2xl font-bold text-blue-600">{proyectosConCertificado.length}</p>
            <p className="text-sm text-gray-500">Con Certificado</p>
          </div>
        </Card>
        <Card>
          <div className="text-center">
            <p className="text-2xl font-bold text-orange-600">{proyectosAprobados.length - proyectosConCertificado.length}</p>
            <p className="text-sm text-gray-500">Pendientes</p>
          </div>
        </Card>
      </div>

      {/* Acciones */}
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        {/* Finalizar Feria */}
        {(feria.estado !== 'Finalizado' && feria.estado !== 'finalizada') && (
          <Card>
            <div className="flex justify-between items-center">
              <div>
                <h3 className="text-lg font-semibold text-gray-900">Finalizar Feria</h3>
                <p className="text-sm text-gray-500 mt-1">
                  Marca la feria como finalizada para habilitar la generación de certificados
                </p>
              </div>
              <Button 
                onClick={handleFinalizarFeria}
                disabled={finalizando}
                variant="secondary"
                className="flex items-center gap-2"
              >
                <CheckCircle className="h-4 w-4" />
                {finalizando ? 'Finalizando...' : 'Finalizar'}
              </Button>
            </div>
          </Card>
        )}

        {/* Generar Certificados */}
        <Card className={(feria.estado !== 'Finalizado' && feria.estado !== 'finalizada') ? 'md:col-span-2' : ''}>
          <div className="flex justify-between items-start">
            <div>
              <h3 className="text-lg font-semibold text-gray-900">Generar Certificados</h3>
              <p className="text-sm text-gray-500 mt-1">
                {(feria.estado === 'Finalizado' || feria.estado === 'finalizada')
                  ? 'Generar certificados para todos los proyectos aprobados'
                  : '⚠️ Primero debe finalizar la feria'}
              </p>
            </div>
            <div className="flex gap-2">
              <Button 
                onClick={handleLimpiarPruebas}
                disabled={limpiando || proyectosConCertificado.length === 0}
                variant="secondary"
                className="flex items-center gap-2 bg-red-50 hover:bg-red-100 text-red-700"
              >
                <Trash2 className="h-4 w-4" />
                {limpiando ? 'Limpiando...' : 'Limpiar'}
              </Button>
              <Button 
                onClick={() => {
                  const url = descargarIndiceImpresion(id);
                  window.open(url, '_blank');
                }}
                disabled={proyectosConCertificado.length === 0}
                variant="secondary"
                className="flex items-center gap-2 bg-purple-50 hover:bg-purple-100 text-purple-700"
                title="Descargar índice de certificados para impresión por lote"
              >
                <Printer className="h-4 w-4" />
                Índice Impresión
              </Button>
              <Button 
                onClick={handleGenerarLote}
                disabled={generando || proyectosAprobados.length === 0 || (feria.estado !== 'Finalizado' && feria.estado !== 'finalizada')}
                variant="primary"
                className="flex items-center gap-2"
              >
                <FileText className="h-4 w-4" />
                {generando ? 'Generando...' : 'Generar Lote'}
              </Button>
              <Button 
                onClick={handleGenerarPrueba}
                disabled={generando || proyectosAprobados.length === 0}
                variant="secondary"
                className="flex items-center gap-2"
              >
                <TestTube className="h-4 w-4" />
                {generando ? 'Generando...' : 'Generar Prueba'}
              </Button>

            </div>
          </div>
        </Card>
      </div>

      {/* Proyectos Agrupados por Nivel y Categoría */}
      <div className="space-y-6">
        <h2 className="text-lg font-semibold text-gray-900">
          Proyectos ({proyectos?.length || 0})
        </h2>

      {/* Debug info */}
      {/* {proyectos && proyectos.length > 0 && (
        <div className="text-xs text-gray-400 bg-gray-50 p-2 rounded">
          Debug: {proyectos.length} proyectos encontrados. 
          Primero: {proyectos[0]?.nombre} (Nivel: {proyectos[0]?.nivel || 'Sin nivel'})
        </div>
      )} */}

        {proyectos && proyectos.length > 0 ? (
          <>
            {/* Agrupar proyectos por nivel */}
            {(() => {
              // Obtener niveles únicos de los proyectos y ordenarlos
              const nivelesUnicos = [...new Set(proyectos.map(p => p.nivel || 'Sin nivel'))]
              
              // Ordenar: primero los niveles conocidos, luego los demás alfabéticamente
              const nivelesOrdenados = nivelesUnicos.sort((a, b) => {
                const orden = { 'Avanzado': 1, 'Intermedio': 2, 'Básico': 3 }
                const ordenA = orden[a] || 999
                const ordenB = orden[b] || 999
                if (ordenA !== ordenB) return ordenA - ordenB
                return a.localeCompare(b)
              })
              
              return nivelesOrdenados.map(nivel => {
                const proyectosNivel = proyectos.filter(p => (p.nivel || 'Sin nivel') === nivel)
                if (proyectosNivel.length === 0) return null

                // Agrupar por categoría dentro del nivel
                const categorias = [...new Set(proyectosNivel.map(p => p.categoria || 'Sin categoría'))]

                return (
                  <Card key={nivel} className="overflow-hidden">
                    {/* Header del Nivel */}
                    <div className={`px-6 py-4 ${
                      nivel === 'Avanzado' ? 'bg-purple-50 border-l-4 border-purple-500' :
                      nivel === 'Intermedio' ? 'bg-blue-50 border-l-4 border-blue-500' :
                      nivel === 'Básico' ? 'bg-green-50 border-l-4 border-green-500' :
                      'bg-indigo-50 border-l-4 border-indigo-500'
                    }`}>
                      <h3 className={`text-xl font-bold flex items-center gap-2 ${
                        nivel === 'Avanzado' ? 'text-purple-900' :
                        nivel === 'Intermedio' ? 'text-blue-900' :
                        nivel === 'Básico' ? 'text-green-900' :
                        'text-indigo-900'
                      }`}>
                        🎓 {nivel === 'Sin nivel' ? 'Sin Nivel Asignado' : nivel}
                        <span className="text-sm font-normal">({proyectosNivel.length} proyectos)</span>
                      </h3>
                    </div>

                    {/* Proyectos por Categoría */}
                    <div className="p-6 space-y-6">
                      {categorias.map(categoria => {
                        const proyectosCategoria = proyectosNivel
                          .filter(p => (p.categoria || 'Sin categoría') === categoria)
                          .sort((a, b) => (b.nota || 0) - (a.nota || 0)) // Ordenar por nota descendente

                        return (
                          <div key={`${nivel}-${categoria}`}>
                            <h4 className="text-md font-semibold text-gray-800 mb-3 flex items-center gap-2">
                              🏷️ {categoria}
                              <span className="text-sm font-normal text-gray-500">
                                ({proyectosCategoria.length})
                              </span>
                            </h4>
                            
                            <div className="space-y-2">
                              {proyectosCategoria.map((proyecto, idx) => (
                                <Link
                                  key={proyecto.id}
                                  to={`/proyectos/${proyecto.id}`}
                                  className="block p-4 rounded-lg border hover:bg-gray-50 transition-colors relative"
                                >
                                  {/* Número de posición */}
                                  <div className="absolute top-2 left-2 w-8 h-8 rounded-full bg-gradient-to-br from-blue-500 to-blue-600 text-white flex items-center justify-center font-bold text-sm shadow-md">
                                    {idx + 1}
                                  </div>

                                  <div className="flex justify-between items-start ml-10">
                                    <div className="flex-1">
                                      <h3 className="font-medium text-gray-900">{proyecto.nombre}</h3>
                                      
                                      {/* Información académica */}
                                      <div className="mt-2 flex flex-wrap gap-2 text-sm">
                                        {proyecto.materia && (
                                          <span className="flex items-center px-2 py-1 bg-blue-100 text-blue-800 rounded-md">
                                            📚 {proyecto.materia}
                                          </span>
                                        )}
                                        {proyecto.nota != null && (
                                          <span className="flex items-center px-2 py-1 bg-yellow-100 text-yellow-800 rounded-md font-semibold">
                                            📊 {proyecto.nota}/100
                                          </span>
                                        )}
                                        {!proyecto.nota && (
                                          <span className="flex items-center px-2 py-1 bg-gray-100 text-gray-600 rounded-md text-xs">
                                            Sin calificar
                                          </span>
                                        )}
                                      </div>

                                      {/* Estado y estudiantes */}
                                      <div className="flex items-center mt-2 space-x-4 text-sm text-gray-500">
                                        <span className="flex items-center">
                                          <Users className="h-4 w-4 mr-1" />
                                          {proyecto.cantidad_estudiantes || proyecto.estudiantes?.length || proyecto.estudiantes_json?.length || 0} estudiantes
                                        </span>
                                        <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${
                                          (proyecto.estado === 'aprobado' || proyecto.aprobado === true)
                                            ? 'bg-green-100 text-green-800'
                                            : 'bg-gray-100 text-gray-800'
                                        }`}>
                                          {proyecto.estado || (proyecto.aprobado ? 'aprobado' : 'pendiente')}
                                        </span>
                                      </div>
                                    </div>

                                    {/* Certificado badge */}
                                    {proyecto.tiene_certificado && (
                                      <div className="flex items-center text-blue-600 text-sm ml-4">
                                        <FileText className="h-4 w-4 mr-1" />
                                        Certificado
                                      </div>
                                    )}
                                  </div>
                                </Link>
                              ))}
                            </div>
                          </div>
                        )
                      })}
                    </div>
                  </Card>
                )
              })
            })()}
          </>
        ) : (
          <Card>
            <p className="text-gray-500 text-center py-8">
              No hay proyectos en esta feria
            </p>
          </Card>
        )}
      </div>
    </div>
  )
}
