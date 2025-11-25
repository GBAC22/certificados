import { useState } from 'react'
import { Search, CheckCircle, XCircle, AlertCircle } from 'lucide-react'
import Card from '../components/Card'
import Button from '../components/Button'
import { verificarCertificado, verificarPorCodigo } from '../services/api'

export default function Verificar() {
  const [query, setQuery] = useState('')
  const [resultado, setResultado] = useState(null)
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState(null)

  const handleVerificar = async (e) => {
    e.preventDefault()
    if (!query.trim()) return

    setLoading(true)
    setError(null)
    setResultado(null)

    try {
      // Intentar verificar por ID o código
      let response
      if (query.includes('-')) {
        // Es un código (formato CERT-XXXX-X-XXX)
        response = await verificarPorCodigo(query.trim())
      } else {
        // Es un UUID
        response = await verificarCertificado(query.trim())
      }

      setResultado(response.data)
    } catch (err) {
      setError(err.response?.data?.message || 'Error al verificar certificado')
    } finally {
      setLoading(false)
    }
  }

  return (
    <div className="max-w-4xl mx-auto space-y-6">
      <div className="text-center">
        <h1 className="text-3xl font-bold text-gray-900">Verificar Certificado</h1>
        <p className="mt-2 text-sm text-gray-500">
          Ingrese el código o ID del certificado para verificar su autenticidad
        </p>
      </div>

      {/* Formulario de búsqueda */}
      <Card>
        <form onSubmit={handleVerificar} className="space-y-4">
          <div>
            <label htmlFor="query" className="block text-sm font-medium text-gray-700 mb-2">
              Código o ID del Certificado
            </label>
            <div className="flex space-x-2">
              <input
                id="query"
                type="text"
                value={query}
                onChange={(e) => setQuery(e.target.value)}
                placeholder="Ej: CERT-2024-2-001 o UUID completo"
                className="flex-1 px-4 py-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500"
              />
              <Button 
                type="submit" 
                disabled={loading || !query.trim()}
                variant="primary"
              >
                <Search className="h-4 w-4 mr-2 inline" />
                {loading ? 'Verificando...' : 'Verificar'}
              </Button>
            </div>
          </div>
          <p className="text-xs text-gray-500">
            💡 Puedes ingresar el código completo (ej: CERT-2024-2-001) o el ID del certificado
          </p>
        </form>
      </Card>

      {/* Error */}
      {error && (
        <Card className="border-red-200 bg-red-50">
          <div className="flex items-start">
            <XCircle className="h-6 w-6 text-red-600 mr-3 flex-shrink-0" />
            <div>
              <h3 className="text-lg font-semibold text-red-900">Error</h3>
              <p className="mt-1 text-sm text-red-700">{error}</p>
            </div>
          </div>
        </Card>
      )}

      {/* Resultado */}
      {resultado && (
        <>
          {/* Certificado Válido */}
          {resultado.valido && !resultado.revocado && (
            <Card className="border-green-200 bg-green-50">
              <div className="flex items-start">
                <CheckCircle className="h-8 w-8 text-green-600 mr-3 flex-shrink-0" />
                <div className="flex-1">
                  <h2 className="text-xl font-bold text-green-900 mb-2">
                    ✓ Certificado Válido
                  </h2>
                  <p className="text-sm text-green-700">
                    Este certificado es auténtico y está registrado en blockchain
                  </p>

                  {/* Información del certificado */}
                  <div className="mt-4 space-y-4">
                    <div>
                      <h3 className="font-semibold text-gray-900 mb-2">Información del Certificado</h3>
                      <dl className="space-y-2">
                        <div className="flex">
                          <dt className="w-32 text-sm font-medium text-gray-700">Código:</dt>
                          <dd className="text-sm text-gray-900">{resultado.data.codigo}</dd>
                        </div>
                        <div className="flex">
                          <dt className="w-32 text-sm font-medium text-gray-700">Estado:</dt>
                          <dd>
                            <span className={`px-2 py-1 text-xs font-medium rounded-full ${
                              resultado.data.estado === 'oficial' 
                                ? 'bg-green-100 text-green-800'
                                : 'bg-yellow-100 text-yellow-800'
                            }`}>
                              {resultado.data.estado}
                            </span>
                          </dd>
                        </div>
                        <div className="flex">
                          <dt className="w-32 text-sm font-medium text-gray-700">Fecha:</dt>
                          <dd className="text-sm text-gray-900">
                            {new Date(resultado.data.fechaEmision).toLocaleDateString('es-ES', {
                              year: 'numeric',
                              month: 'long',
                              day: 'numeric'
                            })}
                          </dd>
                        </div>
                      </dl>
                    </div>

                    {/* Proyecto */}
                    {resultado.data.proyecto && (
                      <div>
                        <h3 className="font-semibold text-gray-900 mb-2">Proyecto</h3>
                        <p className="text-sm text-gray-900">{resultado.data.proyecto.nombre}</p>
                        
                        {/* Estudiantes */}
                        {resultado.data.proyecto.estudiantes && (
                          <div className="mt-2">
                            <p className="text-sm font-medium text-gray-700 mb-1">Estudiantes:</p>
                            <ul className="list-disc list-inside space-y-1">
                              {resultado.data.proyecto.estudiantes.map((est, idx) => (
                                <li key={idx} className="text-sm text-gray-900">
                                  {est.nombre} {est.apellido} - {est.codigo}
                                  {est.esLider && ' (Líder)'}
                                </li>
                              ))}
                            </ul>
                          </div>
                        )}

                        {/* Tutor */}
                        {resultado.data.proyecto.tutor && (
                          <div className="mt-2">
                            <p className="text-sm font-medium text-gray-700">Tutor:</p>
                            <p className="text-sm text-gray-900">
                              {resultado.data.proyecto.tutor.nombre} {resultado.data.proyecto.tutor.apellido}
                            </p>
                          </div>
                        )}
                      </div>
                    )}

                    {/* Feria */}
                    {resultado.data.feria && (
                      <div>
                        <h3 className="font-semibold text-gray-900 mb-2">Feria</h3>
                        <p className="text-sm text-gray-900">
                          {resultado.data.feria.nombre} - Semestre {resultado.data.feria.semestre} {resultado.data.feria.año}
                        </p>
                      </div>
                    )}

                    {/* Blockchain */}
                    {resultado.data.blockchain && resultado.data.blockchain.existe && (
                      <div>
                        <h3 className="font-semibold text-gray-900 mb-2">Verificación Blockchain</h3>
                        <div className="flex items-center text-sm text-green-700">
                          <CheckCircle className="h-4 w-4 mr-2" />
                          Registrado en blockchain el {new Date(resultado.data.blockchain.fecha).toLocaleDateString('es-ES')}
                        </div>
                        {resultado.data.txHash && (
                          <a
                            href={`https://mumbai.polygonscan.com/tx/${resultado.data.txHash}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="inline-block mt-2 text-sm text-blue-600 hover:text-blue-700 underline"
                          >
                            Ver en PolygonScan →
                          </a>
                        )}
                      </div>
                    )}

                    {/* Descargar PDF */}
                    {resultado.data.pdfUrl && (
                      <div className="pt-4 border-t">
                        <a
                          href={`http://localhost:3000${resultado.data.pdfUrl}`}
                          target="_blank"
                          rel="noopener noreferrer"
                        >
                          <Button variant="primary" size="sm">
                            Descargar Certificado PDF
                          </Button>
                        </a>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </Card>
          )}

          {/* Certificado Revocado */}
          {resultado.revocado && (
            <Card className="border-red-200 bg-red-50">
              <div className="flex items-start">
                <AlertCircle className="h-8 w-8 text-red-600 mr-3 flex-shrink-0" />
                <div>
                  <h2 className="text-xl font-bold text-red-900 mb-2">
                    Certificado Revocado
                  </h2>
                  <p className="text-sm text-red-700">{resultado.message}</p>
                  {resultado.data && (
                    <div className="mt-3">
                      <p className="text-sm text-gray-700">Código: {resultado.data.codigo}</p>
                      <p className="text-sm text-gray-700">
                        Fecha de emisión: {new Date(resultado.data.fechaEmision).toLocaleDateString('es-ES')}
                      </p>
                    </div>
                  )}
                </div>
              </div>
            </Card>
          )}

          {/* Certificado No Válido */}
          {!resultado.valido && !resultado.revocado && (
            <Card className="border-red-200 bg-red-50">
              <div className="flex items-start">
                <XCircle className="h-8 w-8 text-red-600 mr-3 flex-shrink-0" />
                <div>
                  <h2 className="text-xl font-bold text-red-900 mb-2">
                    Certificado No Válido
                  </h2>
                  <p className="text-sm text-red-700">
                    {resultado.message || 'Este certificado no es válido o no existe'}
                  </p>
                </div>
              </div>
            </Card>
          )}
        </>
      )}

      {/* Instrucciones */}
      {!resultado && !error && (
        <Card>
          <h3 className="font-semibold text-gray-900 mb-3">¿Cómo verificar?</h3>
          <ul className="space-y-2 text-sm text-gray-600">
            <li className="flex items-start">
              <span className="font-bold mr-2">1.</span>
              <span>Ingrese el código del certificado (ej: CERT-2024-2-001) o el ID completo</span>
            </li>
            <li className="flex items-start">
              <span className="font-bold mr-2">2.</span>
              <span>Haga clic en "Verificar"</span>
            </li>
            <li className="flex items-start">
              <span className="font-bold mr-2">3.</span>
              <span>Si el certificado es válido, verá toda la información registrada en blockchain</span>
            </li>
          </ul>
        </Card>
      )}
    </div>
  )
}
