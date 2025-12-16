import { useState } from 'react'
import { Search, CheckCircle, XCircle, AlertCircle, Shield, FileText, Link as LinkIcon, Award } from 'lucide-react'
import { verificarCertificado, verificarPorCodigo } from '../services/api'

export default function VerificarPublico() {
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
      let response
      if (query.includes('-')) {
        response = await verificarPorCodigo(query.trim())
      } else {
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
    <div className="min-h-screen bg-gradient-to-br from-blue-50 via-white to-green-50">
      {/* Header Público */}
      <div className="bg-white shadow-sm border-b border-gray-200">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <div className="bg-gradient-to-br from-blue-600 to-green-600 p-2 rounded-lg">
                <Award className="h-8 w-8 text-white" />
              </div>
              <div>
                <h1 className="text-2xl font-bold text-gray-900">Verificación de Certificados</h1>
                <p className="text-sm text-gray-600">Sistema de Certificación Blockchain - UAGRM</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Contenido Principal */}
      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        {/* Título y Descripción */}
        <div className="text-center mb-12">
          <h2 className="text-4xl font-bold text-gray-900 mb-4">
            Verificar Autenticidad del Certificado
          </h2>
          <p className="text-lg text-gray-600 max-w-2xl mx-auto">
            Ingrese el código o ID del certificado para verificar su autenticidad de forma inmediata
          </p>
        </div>

        {/* Formulario de Verificación */}
        <div className="bg-white rounded-2xl shadow-xl p-8 mb-8">
          <form onSubmit={handleVerificar} className="space-y-6">
            <div>
              <label htmlFor="query" className="block text-lg font-semibold text-gray-900 mb-3">
                Código o ID del Certificado
              </label>
              <div className="flex space-x-3">
                <input
                  id="query"
                  type="text"
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="Ejemplo: CERT-2024-2-001-123456 o UUID completo"
                  className="flex-1 px-6 py-4 text-lg border-2 border-gray-300 rounded-xl focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition-colors"
                />
                <button
                  type="submit"
                  disabled={loading || !query.trim()}
                  className="px-8 py-4 bg-gradient-to-r from-blue-600 to-green-600 text-white font-semibold rounded-xl hover:from-blue-700 hover:to-green-700 disabled:opacity-50 disabled:cursor-not-allowed transition-all shadow-lg hover:shadow-xl flex items-center space-x-2"
                >
                  <Search className="h-5 w-5" />
                  <span>{loading ? 'Verificando...' : 'Verificar'}</span>
                </button>
              </div>
              <p className="mt-3 text-sm text-gray-500 flex items-center">
                <Shield className="h-4 w-4 mr-2 text-blue-600" />
                Verificación segura mediante blockchain y base de datos
              </p>
            </div>
          </form>
        </div>

        {/* Error */}
        {error && (
          <div className="bg-red-50 border-2 border-red-200 rounded-2xl p-6 mb-8">
            <div className="flex items-start">
              <XCircle className="h-8 w-8 text-red-600 mr-4 flex-shrink-0" />
              <div>
                <h3 className="text-xl font-bold text-red-900 mb-2">Error de Verificación</h3>
                <p className="text-red-700">{error}</p>
              </div>
            </div>
          </div>
        )}

        {/* Resultado - Certificado Válido */}
        {resultado && resultado.valido && !resultado.revocado && (
          <div className="bg-gradient-to-br from-green-50 to-emerald-50 border-2 border-green-300 rounded-2xl p-8 shadow-xl">
            <div className="flex items-start mb-6">
              <div className="bg-green-600 p-3 rounded-full mr-4">
                <CheckCircle className="h-10 w-10 text-white" />
              </div>
              <div className="flex-1">
                <h2 className="text-3xl font-bold text-green-900 mb-2">
                  ✓ Certificado Válido y Auténtico
                </h2>
                <p className="text-lg text-green-700">
                  Este certificado ha sido verificado exitosamente
                </p>
              </div>
            </div>

            {/* Badge Blockchain */}
            <div className="flex items-center gap-3 mb-8">
              {resultado.data.txHash ? (
                <span className="inline-flex items-center px-6 py-3 rounded-full text-sm font-bold bg-emerald-600 text-white shadow-lg">
                  <Shield className="h-5 w-5 mr-2" />
                  REGISTRADO EN BLOCKCHAIN
                </span>
              ) : (
                <span className="inline-flex items-center px-6 py-3 rounded-full text-sm font-bold bg-amber-500 text-white shadow-lg">
                  <FileText className="h-5 w-5 mr-2" />
                  CERTIFICADO BORRADOR
                </span>
              )}
              <span className={`inline-flex items-center px-4 py-2 rounded-full text-sm font-semibold ${
                resultado.data.estado === 'oficial' 
                  ? 'bg-blue-100 text-blue-800'
                  : 'bg-yellow-100 text-yellow-800'
              }`}>
                {resultado.data.estado?.toUpperCase()}
              </span>
            </div>

            {/* Información del Certificado */}
            <div className="grid md:grid-cols-2 gap-6 mb-8">
              <div className="bg-white rounded-xl p-6 shadow-md">
                <h3 className="text-lg font-bold text-gray-900 mb-4 flex items-center">
                  <FileText className="h-5 w-5 mr-2 text-blue-600" />
                  Información del Certificado
                </h3>
                <dl className="space-y-3">
                  <div>
                    <dt className="text-sm font-semibold text-gray-600">Código:</dt>
                    <dd className="text-base text-gray-900 font-mono">{resultado.data.codigo}</dd>
                  </div>
                  <div>
                    <dt className="text-sm font-semibold text-gray-600">Fecha de Emisión:</dt>
                    <dd className="text-base text-gray-900">
                      {new Date(resultado.data.fechaEmision).toLocaleDateString('es-ES', {
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        hour: '2-digit',
                        minute: '2-digit'
                      })}
                    </dd>
                  </div>
                </dl>
              </div>

              {/* Proyecto */}
              {resultado.data.proyecto && (
                <div className="bg-white rounded-xl p-6 shadow-md">
                  <h3 className="text-lg font-bold text-gray-900 mb-4 flex items-center">
                    <Award className="h-5 w-5 mr-2 text-green-600" />
                    Proyecto
                  </h3>
                  <p className="text-base font-semibold text-gray-900 mb-3">
                    {resultado.data.proyecto.nombre}
                  </p>
                  
                  {resultado.data.proyecto.estudiantes && resultado.data.proyecto.estudiantes.length > 0 && (
                    <div className="space-y-2">
                      <p className="text-sm font-semibold text-gray-600">Estudiantes:</p>
                      <ul className="space-y-1">
                        {resultado.data.proyecto.estudiantes.map((est, idx) => (
                          <li key={idx} className="text-sm text-gray-900 flex items-center">
                            <span className="w-2 h-2 bg-blue-600 rounded-full mr-2"></span>
                            {est.nombre} {est.apellido}
                            {est.codigo && <span className="text-gray-500 ml-2">({est.codigo})</span>}
                          </li>
                        ))}
                      </ul>
                    </div>
                  )}

                  {resultado.data.proyecto.tutor && (
                    <div className="mt-3 pt-3 border-t">
                      <p className="text-sm font-semibold text-gray-600">Docente:</p>
                      <p className="text-sm text-gray-900">
                        {resultado.data.proyecto.tutor.nombre} {resultado.data.proyecto.tutor.apellido}
                      </p>
                    </div>
                  )}
                </div>
              )}
            </div>

            {/* Feria */}
            {resultado.data.feria && (
              <div className="bg-white rounded-xl p-6 shadow-md mb-8">
                <h3 className="text-lg font-bold text-gray-900 mb-3">Evento</h3>
                <p className="text-base text-gray-900">
                  {resultado.data.feria.nombre}
                </p>
                <p className="text-sm text-gray-600 mt-1">
                  Semestre {resultado.data.feria.semestre} - {resultado.data.feria.año}
                </p>
              </div>
            )}

            {/* Estado Blockchain */}
            <div className={`rounded-xl p-6 shadow-lg ${
              resultado.data.txHash 
                ? 'bg-gradient-to-r from-emerald-600 to-green-600' 
                : 'bg-gradient-to-r from-amber-500 to-yellow-500'
            }`}>
              <div className="flex items-start space-x-4 text-white">
                {resultado.data.txHash ? (
                  <>
                    <Shield className="h-10 w-10 flex-shrink-0" />
                    <div className="flex-1">
                      <h3 className="text-2xl font-bold mb-2">
                        🔐 Verificación Blockchain
                      </h3>
                      <p className="text-white/90 mb-4">
                        Este certificado está registrado de forma PERMANENTE e INMUTABLE en Polygon Amoy Testnet
                      </p>
                      
                      <div className="bg-white/10 rounded-lg p-4 mb-4 space-y-2 text-sm">
                        <div className="flex">
                          <span className="font-semibold w-32">Transaction:</span>
                          <span className="font-mono text-xs break-all">{resultado.data.txHash}</span>
                        </div>
                        <div className="flex">
                          <span className="font-semibold w-32">PDF Hash:</span>
                          <span className="font-mono text-xs break-all">{resultado.data.hash}</span>
                        </div>
                        {resultado.data.blockchain?.existe && (
                          <div className="flex">
                            <span className="font-semibold w-32">Registrado:</span>
                            <span>{new Date(resultado.data.blockchain.fecha).toLocaleString('es-ES')}</span>
                          </div>
                        )}
                      </div>

                      <div className="flex flex-wrap gap-3">
                        <a
                          href={`https://amoy.polygonscan.com/tx/${resultado.data.txHash}`}
                          target="_blank"
                          rel="noopener noreferrer"
                          className="inline-flex items-center px-5 py-3 bg-white text-green-700 font-semibold rounded-lg hover:bg-gray-100 transition-colors shadow-md"
                        >
                          <LinkIcon className="h-4 w-4 mr-2" />
                          Ver en PolygonScan
                        </a>
                        
                        {resultado.data.blockchainAddress && (
                          <a
                            href={`https://amoy.polygonscan.com/address/${resultado.data.blockchainAddress}`}
                            target="_blank"
                            rel="noopener noreferrer"
                            className="inline-flex items-center px-5 py-3 bg-white/20 border-2 border-white text-white font-semibold rounded-lg hover:bg-white/30 transition-colors"
                          >
                            Ver Smart Contract
                          </a>
                        )}
                      </div>
                    </div>
                  </>
                ) : (
                  <>
                    <FileText className="h-10 w-10 flex-shrink-0" />
                    <div className="flex-1">
                      <h3 className="text-2xl font-bold mb-2">
                        📄 Certificado Borrador
                      </h3>
                      <p className="text-white/90 mb-3">
                        Este certificado NO está registrado en blockchain
                      </p>
                      
                      <div className="bg-white/20 rounded-lg p-4">
                        <p className="text-sm mb-2"><strong>Esto significa:</strong></p>
                        <ul className="text-sm space-y-1 list-disc list-inside">
                          <li>Solo existe en la base de datos local</li>
                          <li>No tiene protección blockchain contra alteraciones</li>
                          <li>No es verificable públicamente en la red</li>
                        </ul>
                      </div>

                      {resultado.data.hash && (
                        <div className="mt-3 text-xs bg-white/10 rounded p-3">
                          <span className="font-semibold">Hash PDF:</span>
                          <p className="font-mono break-all mt-1">{resultado.data.hash}</p>
                        </div>
                      )}
                    </div>
                  </>
                )}
              </div>
            </div>

            {/* Descargar PDF */}
            {resultado.data.pdfUrl && (
              <div className="mt-8 text-center">
                <a
                  href={`http://localhost:3000${resultado.data.pdfUrl}`}
                  target="_blank"
                  rel="noopener noreferrer"
                  className="inline-flex items-center px-8 py-4 bg-blue-600 text-white font-bold rounded-xl hover:bg-blue-700 transition-colors shadow-lg hover:shadow-xl"
                >
                  <FileText className="h-5 w-5 mr-2" />
                  Descargar Certificado PDF
                </a>
              </div>
            )}
          </div>
        )}

        {/* Certificado Revocado */}
        {resultado && resultado.revocado && (
          <div className="bg-red-50 border-2 border-red-300 rounded-2xl p-8 shadow-xl">
            <div className="flex items-start">
              <div className="bg-red-600 p-3 rounded-full mr-4">
                <AlertCircle className="h-10 w-10 text-white" />
              </div>
              <div>
                <h2 className="text-3xl font-bold text-red-900 mb-2">
                  ⚠️ Certificado Revocado
                </h2>
                <p className="text-lg text-red-700 mb-4">{resultado.message}</p>
                {resultado.data && (
                  <div className="bg-white rounded-lg p-4">
                    <p className="text-sm text-gray-700">
                      <strong>Código:</strong> {resultado.data.codigo}
                    </p>
                    <p className="text-sm text-gray-700">
                      <strong>Fecha de emisión:</strong> {new Date(resultado.data.fechaEmision).toLocaleDateString('es-ES')}
                    </p>
                  </div>
                )}
              </div>
            </div>
          </div>
        )}

        {/* Certificado No Válido */}
        {resultado && !resultado.valido && !resultado.revocado && (
          <div className="bg-red-50 border-2 border-red-300 rounded-2xl p-8 shadow-xl">
            <div className="flex items-start">
              <div className="bg-red-600 p-3 rounded-full mr-4">
                <XCircle className="h-10 w-10 text-white" />
              </div>
              <div>
                <h2 className="text-3xl font-bold text-red-900 mb-2">
                  ❌ Certificado No Válido
                </h2>
                <p className="text-lg text-red-700">
                  {resultado.message || 'Este certificado no es válido o no existe en el sistema'}
                </p>
              </div>
            </div>
          </div>
        )}

        {/* Instrucciones */}
        {!resultado && !error && (
          <div className="bg-white rounded-2xl p-8 shadow-lg">
            <h3 className="text-xl font-bold text-gray-900 mb-4">📋 Instrucciones de Verificación</h3>
            <div className="space-y-4">
              <div className="flex items-start">
                <div className="bg-blue-100 text-blue-700 font-bold w-8 h-8 rounded-full flex items-center justify-center mr-3 flex-shrink-0">
                  1
                </div>
                <p className="text-gray-700">
                  <strong>Ingrese el código:</strong> Escriba el código del certificado (ej: CERT-2024-2-001-123456) o el ID UUID completo
                </p>
              </div>
              <div className="flex items-start">
                <div className="bg-blue-100 text-blue-700 font-bold w-8 h-8 rounded-full flex items-center justify-center mr-3 flex-shrink-0">
                  2
                </div>
                <p className="text-gray-700">
                  <strong>Haga clic en Verificar:</strong> El sistema buscará el certificado en la base de datos y blockchain
                </p>
              </div>
              <div className="flex items-start">
                <div className="bg-blue-100 text-blue-700 font-bold w-8 h-8 rounded-full flex items-center justify-center mr-3 flex-shrink-0">
                  3
                </div>
                <p className="text-gray-700">
                  <strong>Revise los resultados:</strong> Si es válido, verá toda la información del certificado y su estado en blockchain
                </p>
              </div>
            </div>

            <div className="mt-6 p-4 bg-blue-50 rounded-lg">
              <p className="text-sm text-blue-900">
                <strong>💡 Nota:</strong> Los certificados oficiales están registrados en Polygon Amoy Testnet, garantizando su inmutabilidad y verificación pública.
              </p>
            </div>
          </div>
        )}
      </div>

      {/* Footer */}
      <div className="bg-gray-900 text-white py-8 mt-16">
        <div className="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <p className="text-gray-400">
            Sistema de Certificación Blockchain © 2025 - Universidad Autónoma Gabriel René Moreno
          </p>
          <p className="text-sm text-gray-500 mt-2">
            Verificación segura mediante tecnología blockchain en Polygon Network
          </p>
        </div>
      </div>
    </div>
  )
}
