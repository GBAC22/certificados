import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import { ArrowLeft, FileText, Download, AlertCircle, CheckCircle, Link as LinkIcon } from 'lucide-react'
import Card from '../components/Card'
import Button from '../components/Button'
import { getCertificado, revocarCertificado, descargarPDF } from '../services/api'

export default function CertificadoDetalle() {
  const { id } = useParams()
  const navigate = useNavigate()
  const [certificado, setCertificado] = useState(null)
  const [loading, setLoading] = useState(true)
  const [revocando, setRevocando] = useState(false)
  const [mensaje, setMensaje] = useState(null)

  useEffect(() => {
    loadCertificado()
  }, [id])

  const loadCertificado = async () => {
    try {
      const response = await getCertificado(id)
      setCertificado(response.data.data)
    } catch (error) {
      console.error('Error al cargar certificado:', error)
    } finally {
      setLoading(false)
    }
  }

  const handleRevocar = async () => {
    const motivo = prompt('Ingrese el motivo de la revocación:')
    if (!motivo) return

    setRevocando(true)
    setMensaje(null)

    try {
      await revocarCertificado(id, motivo)
      setMensaje({ type: 'success', text: 'Certificado revocado exitosamente' })
      loadCertificado()
    } catch (error) {
      setMensaje({ 
        type: 'error', 
        text: 'Error al revocar certificado: ' + (error.response?.data?.message || error.message) 
      })
    } finally {
      setRevocando(false)
    }
  }

  if (loading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    )
  }

  if (!certificado) {
    return (
      <div className="text-center py-12">
        <AlertCircle className="mx-auto h-12 w-12 text-red-500" />
        <h3 className="mt-2 text-sm font-medium text-gray-900">Certificado no encontrado</h3>
      </div>
    )
  }

  const pdfUrl = descargarPDF(id)

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <button
          onClick={() => navigate('/certificados')}
          className="flex items-center text-sm text-gray-600 hover:text-gray-900 mb-4"
        >
          <ArrowLeft className="h-4 w-4 mr-1" />
          Volver a certificados
        </button>
        <div className="flex justify-between items-start">
          <div>
            <h1 className="text-3xl font-bold text-gray-900">{certificado.codigo}</h1>
            <p className="mt-1 text-sm text-gray-500">
              Emitido: {new Date(certificado.fecha_emision).toLocaleDateString('es-ES', {
                year: 'numeric',
                month: 'long',
                day: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
              })}
            </p>
          </div>
          <span className={`px-3 py-1 text-sm font-medium rounded-full ${
            certificado.estado === 'oficial' 
              ? 'bg-green-100 text-green-800'
              : certificado.estado === 'borrador'
              ? 'bg-yellow-100 text-yellow-800'
              : 'bg-red-100 text-red-800'
          }`}>
            {certificado.estado}
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

      {/* Acciones */}
      <Card>
        <div className="flex space-x-4">
          <a href={pdfUrl} target="_blank" rel="noopener noreferrer">
            <Button variant="primary">
              <Download className="h-4 w-4 mr-2 inline" />
              Descargar PDF
            </Button>
          </a>
          {certificado.estado !== 'revocado' && (
            <Button 
              onClick={handleRevocar}
              disabled={revocando}
              variant="danger"
            >
              {revocando ? 'Revocando...' : 'Revocar Certificado'}
            </Button>
          )}
        </div>
      </Card>

      {/* Información del certificado */}
      <Card>
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Información del Certificado</h2>
        <dl className="grid grid-cols-1 md:grid-cols-2 gap-4">
          <div>
            <dt className="text-sm font-medium text-gray-500">ID</dt>
            <dd className="mt-1 text-sm text-gray-900 font-mono">{certificado.id}</dd>
          </div>
          <div>
            <dt className="text-sm font-medium text-gray-500">Código</dt>
            <dd className="mt-1 text-sm text-gray-900">{certificado.codigo}</dd>
          </div>
          <div>
            <dt className="text-sm font-medium text-gray-500">Estado</dt>
            <dd className="mt-1">
              <span className={`px-2 py-1 text-xs font-medium rounded-full ${
                certificado.estado === 'oficial' 
                  ? 'bg-green-100 text-green-800'
                  : certificado.estado === 'borrador'
                  ? 'bg-yellow-100 text-yellow-800'
                  : 'bg-red-100 text-red-800'
              }`}>
                {certificado.estado}
              </span>
            </dd>
          </div>
          <div>
            <dt className="text-sm font-medium text-gray-500">Fecha de Emisión</dt>
            <dd className="mt-1 text-sm text-gray-900">
              {new Date(certificado.fecha_emision).toLocaleString('es-ES')}
            </dd>
          </div>
        </dl>
      </Card>

      {/* Blockchain Info */}
      {certificado.tx_hash && (
        <Card className="border-blue-200 bg-blue-50">
          <div className="flex items-start">
            <CheckCircle className="h-6 w-6 text-blue-600 mr-3 flex-shrink-0 mt-0.5" />
            <div className="flex-1">
              <h3 className="text-lg font-semibold text-gray-900 mb-2">
                Registrado en Blockchain
              </h3>
              <dl className="space-y-2">
                <div>
                  <dt className="text-sm font-medium text-gray-700">Transaction Hash</dt>
                  <dd className="mt-1 text-sm text-gray-900 font-mono break-all">
                    {certificado.tx_hash}
                  </dd>
                </div>
                <div>
                  <dt className="text-sm font-medium text-gray-700">Contract Address</dt>
                  <dd className="mt-1 text-sm text-gray-900 font-mono break-all">
                    {certificado.blockchain_address}
                  </dd>
                </div>
                <div>
                  <dt className="text-sm font-medium text-gray-700">Hash del Certificado</dt>
                  <dd className="mt-1 text-sm text-gray-900 font-mono break-all">
                    {certificado.hash}
                  </dd>
                </div>
              </dl>
              <a
                href={`https://mumbai.polygonscan.com/tx/${certificado.tx_hash}`}
                target="_blank"
                rel="noopener noreferrer"
                className="inline-flex items-center mt-3 text-sm text-blue-600 hover:text-blue-700 font-medium"
              >
                <LinkIcon className="h-4 w-4 mr-1" />
                Ver en PolygonScan
              </a>
            </div>
          </div>
        </Card>
      )}

      {/* URL de Verificación */}
      <Card>
        <h3 className="text-lg font-semibold text-gray-900 mb-3">URL de Verificación</h3>
        <div className="flex items-center space-x-2">
          <input
            type="text"
            readOnly
            value={certificado.metadata_json?.verifyUrl || `http://localhost:3000/api/verificar/${certificado.id}`}
            className="flex-1 px-3 py-2 border border-gray-300 rounded-md bg-gray-50 text-sm"
          />
          <Button
            onClick={() => {
              navigator.clipboard.writeText(certificado.metadata_json?.verifyUrl || `http://localhost:3000/api/verificar/${certificado.id}`)
              alert('URL copiada al portapapeles')
            }}
            variant="secondary"
            size="sm"
          >
            Copiar
          </Button>
        </div>
      </Card>
    </div>
  )
}
