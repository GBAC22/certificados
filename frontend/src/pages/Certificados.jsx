import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { FileText, Filter, Download } from 'lucide-react'
import Card from '../components/Card'
import { getCertificados } from '../services/api'

export default function Certificados() {
  const [certificados, setCertificados] = useState([])
  const [loading, setLoading] = useState(true)
  const [filtros, setFiltros] = useState({
    estado: ''
  })

  useEffect(() => {
    loadCertificados()
  }, [filtros])

  const loadCertificados = async () => {
    try {
      const params = {}
      if (filtros.estado) params.estado = filtros.estado

      const response = await getCertificados(params)
      setcertificados(response.data.data)
    } catch (error) {
      console.error('Error al cargar certificados:', error)
    } finally {
      setLoading(false)
    }
  }

  if (loading) {
    return (
      <div className="flex justify-center items-center h-64">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-blue-600"></div>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div className="flex justify-between items-center">
        <div>
          <h1 className="text-3xl font-bold text-gray-900">Certificados</h1>
          <p className="mt-1 text-sm text-gray-500">
            Lista de todos los certificados generados
          </p>
        </div>
      </div>

      {/* Filtros */}
      <Card>
        <div className="flex items-center space-x-4">
          <Filter className="h-5 w-5 text-gray-400" />
          <div className="flex-1">
            <label className="block text-sm font-medium text-gray-700 mb-1">
              Estado
            </label>
            <select
              value={filtros.estado}
              onChange={(e) => setFiltros({ ...filtros, estado: e.target.value })}
              className="block w-full md:w-48 rounded-md border-gray-300 shadow-sm focus:border-blue-500 focus:ring-blue-500"
            >
              <option value="">Todos</option>
              <option value="oficial">Oficial</option>
              <option value="borrador">Borrador</option>
              <option value="revocado">Revocado</option>
            </select>
          </div>
        </div>
      </Card>

      {/* Lista de certificados */}
      {certificados.length === 0 ? (
        <Card>
          <div className="text-center py-12">
            <FileText className="mx-auto h-12 w-12 text-gray-400" />
            <h3 className="mt-2 text-sm font-medium text-gray-900">No hay certificados</h3>
            <p className="mt-1 text-sm text-gray-500">
              No se encontraron certificados con los filtros seleccionados
            </p>
          </div>
        </Card>
      ) : (
        <div className="space-y-4">
          {certificados.map(cert => (
            <Card key={cert.id} className="hover:shadow-md transition-shadow">
              <div className="flex items-center justify-between">
                <div className="flex-1">
                  <div className="flex items-center space-x-3">
                    <FileText className="h-5 w-5 text-blue-600" />
                    <div>
                      <Link 
                        to={`/certificados/${cert.id}`}
                        className="font-medium text-gray-900 hover:text-blue-600"
                      >
                        {cert.codigo}
                      </Link>
                      <p className="text-sm text-gray-500">
                        Emitido: {new Date(cert.fecha_emision).toLocaleDateString('es-ES')}
                      </p>
                    </div>
                  </div>
                </div>
                <div className="flex items-center space-x-4">
                  <span className={`px-3 py-1 text-xs font-medium rounded-full ${
                    cert.estado === 'oficial' 
                      ? 'bg-green-100 text-green-800'
                      : cert.estado === 'borrador'
                      ? 'bg-yellow-100 text-yellow-800'
                      : 'bg-red-100 text-red-800'
                  }`}>
                    {cert.estado}
                  </span>
                  <a
                    href={`http://localhost:3000/api/certificados/${cert.id}/pdf`}
                    target="_blank"
                    rel="noopener noreferrer"
                    className="text-gray-400 hover:text-gray-600"
                  >
                    <Download className="h-5 w-5" />
                  </a>
                </div>
              </div>
            </Card>
          ))}
        </div>
      )}
    </div>
  )
}
