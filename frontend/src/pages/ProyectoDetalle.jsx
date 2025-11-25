import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { ArrowLeft, Users, User, FileText, AlertCircle } from 'lucide-react'
import Card from '../components/Card'
import Button from '../components/Button'
import { getProyecto, generarCertificado } from '../services/api'

export default function ProyectoDetalle() {
  const { id } = useParams()
  const navigate = useNavigate()
  const [proyecto, setProyecto] = useState(null)
  const [loading, setLoading] = useState(true)
  const [generando, setGenerando] = useState(false)
  const [mensaje, setMensaje] = useState(null)

  useEffect(() => {
    loadProyecto()
  }, [id])

  const loadProyecto = async () => {
    try {
      const response = await getProyecto(id)
      setProyecto(response.data.data)
    } catch (error) {
      console.error('Error al cargar proyecto:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleGenerarCertificado = async (esBorrador) => {
    if (!confirm(`¿Generar certificado ${esBorrador ? 'borrador' : 'oficial'} para este proyecto?`)) {
      return
    }

    setGenerando(true)
    setMensaje(null)

    try {
      const response = await generarCertificado({ 
        proyectoId: id, 
        esBorrador 
      })
      setMensaje({ 
        type: 'success', 
        text: 'Certificado generado exitosamente' 
      })
      loadProyecto() // Recargar datos
    } catch (error) {
      setMensaje({ 
        type: 'error', 
        text: 'Error al generar certificado: ' + (error.response?.data?.message || error.message) 
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

  if (!proyecto) {
    return (
      <div className="text-center py-12">
        <AlertCircle className="mx-auto h-12 w-12 text-red-500" />
        <h3 className="mt-2 text-sm font-medium text-gray-900">Proyecto no encontrado</h3>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <button
          onClick={() => navigate(-1)}
          className="flex items-center text-sm text-gray-600 hover:text-gray-900 mb-4"
        >
          <ArrowLeft className="h-4 w-4 mr-1" />
          Volver
        </button>
        <div className="flex justify-between items-start">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">{proyecto.nombre}</h1>
            <p className="mt-1 text-sm text-gray-500">{proyecto.descripcion}</p>
          </div>
          <span className={`px-3 py-1 text-sm font-medium rounded-full ${
            proyecto.estado === 'aprobado' 
              ? 'bg-green-100 text-green-800'
              : 'bg-gray-100 text-gray-800'
          }`}>
            {proyecto.estado}
          </span>
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

      {/* Certificado Existente */}
      {proyecto.certificado && (
        <Card className="border-blue-200 bg-blue-50">
          <div className="flex items-center justify-between">
            <div className="flex items-center">
              <FileText className="h-8 w-8 text-blue-600 mr-3" />
              <div>
                <h3 className="font-semibold text-gray-900">Certificado Generado</h3>
                <p className="text-sm text-gray-600">
                  Código: {proyecto.certificado.codigo} - Estado: {proyecto.certificado.estado}
                </p>
              </div>
            </div>
            <Button 
              onClick={() => navigate(`/certificados/${proyecto.certificado.id}`)}
              variant="primary"
              size="sm"
            >
              Ver Certificado
            </Button>
          </div>
        </Card>
      )}

      {/* Acciones */}
      {proyecto.estado === 'aprobado' && !proyecto.certificado && (
        <Card>
          <h3 className="text-lg font-semibold text-gray-900 mb-4">Generar Certificado</h3>
          <div className="flex space-x-4">
            <Button 
              onClick={() => handleGenerarCertificado(true)}
              disabled={generando}
              variant="secondary"
            >
              {generando ? 'Generando...' : 'Generar Borrador'}
            </Button>
            <Button 
              onClick={() => handleGenerarCertificado(false)}
              disabled={generando}
              variant="primary"
            >
              {generando ? 'Generando...' : 'Generar Oficial'}
            </Button>
          </div>
          <p className="text-sm text-gray-500 mt-3">
            <strong>Borrador:</strong> Para pruebas, no se registra en blockchain.<br />
            <strong>Oficial:</strong> Se registra en blockchain y no se puede modificar.
          </p>
        </Card>
      )}

      {/* Estudiantes */}
      <Card>
        <h2 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
          <Users className="h-5 w-5 mr-2" />
          Estudiantes ({proyecto.estudiantes_json?.length || 0})
        </h2>
        <div className="space-y-3">
          {proyecto.estudiantes_json?.map((estudiante, index) => (
            <div key={index} className="p-3 rounded-lg border">
              <div className="flex justify-between items-start">
                <div>
                  <p className="font-medium text-gray-900">
                    {estudiante.nombre} {estudiante.apellido}
                  </p>
                  <p className="text-sm text-gray-500">Código: {estudiante.codigo}</p>
                </div>
                {estudiante.esLider && (
                  <span className="px-2 py-1 text-xs font-medium rounded-full bg-purple-100 text-purple-800">
                    Líder
                  </span>
                )}
              </div>
            </div>
          ))}
        </div>
      </Card>

      {/* Tutor */}
      {proyecto.tutor_json && (
        <Card>
          <h2 className="text-lg font-semibold text-gray-900 mb-4 flex items-center">
            <User className="h-5 w-5 mr-2" />
            Docente Tutor
          </h2>
          <div className="p-3 rounded-lg border">
            <p className="font-medium text-gray-900">
              {proyecto.tutor_json.nombre} {proyecto.tutor_json.apellido}
            </p>
            <p className="text-sm text-gray-500">Código: {proyecto.tutor_json.codigo}</p>
          </div>
        </Card>
      )}

      {/* Materia */}
      {proyecto.materia_json && (
        <Card>
          <h2 className="text-lg font-semibold text-gray-900 mb-4">Materia</h2>
          <div className="p-3 rounded-lg border">
            <p className="font-medium text-gray-900">{proyecto.materia_json.nombre}</p>
            <p className="text-sm text-gray-500">Grupo: {proyecto.materia_json.grupo}</p>
          </div>
        </Card>
      )}
    </div>
  )
}
