import { useEffect, useState } from 'react'
import { useParams, useNavigate, Link } from 'react-router-dom'
import { ArrowLeft, Users, Award, AlertCircle, FileText } from 'lucide-react'
import Card from '../components/Card'
import Button from '../components/Button'
import { getFeria, getProyectosDeFeria, generarLote } from '../services/api'

export default function FeriaDetalle() {
  const { id } = useParams()
  const navigate = useNavigate()
  const [feria, setFeria] = useState(null)
  const [proyectos, setProyectos] = useState([])
  const [loading, setLoading] = useState(true)
  const [generando, setGenerando] = useState(false)
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
      setProyectos(proyectosRes.data.data)
    } catch (error) {
      console.error('Error al cargar datos:', error)
      setMensaje({ type: 'error', text: 'Error al cargar la feria' })
    } finally {
      setLoading(false)
    }
  }

  const handleGenerarLote = async () => {
    if (!confirm(`¿Generar certificados para todos los proyectos aprobados? (${proyectos.filter(p => p.estado === 'aprobado').length} proyectos)`)) {
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

  const proyectosAprobados = proyectos.filter(p => p.estado === 'aprobado')
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
          {feria.activa && (
            <span className="px-3 py-1 text-sm font-medium rounded-full bg-green-100 text-green-800">
              Activa
            </span>
          )}
        </div>
      </div>

      {/* Mensaje */}
      {mensaje && (
        <div className={`p-4 rounded-md ${
          mensaje.type === 'success' ? 'bg-green-50 text-green-800' : 'bg-red-50 text-red-800'
        }`}>
          {mensaje.text}
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
      <Card>
        <div className="flex justify-between items-center">
          <div>
            <h3 className="text-lg font-semibold text-gray-900">Generar Certificados</h3>
            <p className="text-sm text-gray-500 mt-1">
              Generar certificados para todos los proyectos aprobados de esta feria
            </p>
          </div>
          <Button 
            onClick={handleGenerarLote}
            disabled={generando || proyectosAprobados.length === 0}
            variant="primary"
          >
            {generando ? 'Generando...' : 'Generar Lote'}
          </Button>
        </div>
      </Card>

      {/* Proyectos */}
      <Card>
        <h2 className="text-lg font-semibold text-gray-900 mb-4">
          Proyectos ({proyectos.length})
        </h2>
        <div className="space-y-3">
          {proyectos.map(proyecto => (
            <Link
              key={proyecto.id}
              to={`/proyectos/${proyecto.id}`}
              className="block p-4 rounded-lg border hover:bg-gray-50 transition-colors"
            >
              <div className="flex justify-between items-start">
                <div className="flex-1">
                  <h3 className="font-medium text-gray-900">{proyecto.nombre}</h3>
                  <div className="flex items-center mt-2 space-x-4 text-sm text-gray-500">
                    <span className="flex items-center">
                      <Users className="h-4 w-4 mr-1" />
                      {proyecto.estudiantes_json?.length || 0} estudiantes
                    </span>
                    <span className={`px-2 py-0.5 rounded-full text-xs font-medium ${
                      proyecto.estado === 'aprobado' 
                        ? 'bg-green-100 text-green-800'
                        : 'bg-gray-100 text-gray-800'
                    }`}>
                      {proyecto.estado}
                    </span>
                  </div>
                </div>
                {proyecto.tiene_certificado && (
                  <div className="flex items-center text-blue-600 text-sm">
                    <FileText className="h-4 w-4 mr-1" />
                    Con certificado
                  </div>
                )}
              </div>
            </Link>
          ))}
          {proyectos.length === 0 && (
            <p className="text-gray-500 text-center py-8">
              No hay proyectos en esta feria
            </p>
          )}
        </div>
      </Card>
    </div>
  )
}
