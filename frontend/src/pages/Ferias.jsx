import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Award, Calendar, Users } from 'lucide-react'
import Card from '../components/Card'
import { getFerias } from '../services/api'

export default function Ferias() {
  const [ferias, setFerias] = useState([])
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    loadFerias()
  }, [])

  const loadFerias = async () => {
    try {
      const response = await getFerias()
      setFerias(response.data.data)
    } catch (error) {
      console.error('Error al cargar ferias:', error)
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
          <h1 className="text-3xl font-bold text-gray-900">Ferias</h1>
          <p className="mt-1 text-sm text-gray-500">
            Gestiona las ferias de investigación
          </p>
        </div>
      </div>

      {ferias.length === 0 ? (
        <Card>
          <div className="text-center py-12">
            <Award className="mx-auto h-12 w-12 text-gray-400" />
            <h3 className="mt-2 text-sm font-medium text-gray-900">No hay ferias</h3>
            <p className="mt-1 text-sm text-gray-500">
              No se encontraron ferias registradas en el sistema
            </p>
          </div>
        </Card>
      ) : (
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {ferias.map(feria => (
            <Link key={feria.id} to={`/ferias/${feria.id}`}>
              <Card className="h-full hover:shadow-md transition-shadow cursor-pointer">
                <div className="flex items-start justify-between">
                  <div className="flex-1">
                    <h3 className="text-lg font-semibold text-gray-900 mb-2">
                      {feria.nombre}
                    </h3>
                    <div className="space-y-2">
                      <div className="flex items-center text-sm text-gray-600">
                        <Calendar className="h-4 w-4 mr-2" />
                        Semestre {feria.semestre} - {feria.año}
                      </div>
                    </div>
                  </div>
                  {feria.activa && (
                    <span className="px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800">
                      Activa
                    </span>
                  )}
                </div>
                <div className="mt-4 pt-4 border-t">
                  <div className="flex items-center justify-between text-sm">
                    <span className="text-gray-500">Ver proyectos</span>
                    <span className="text-blue-600 font-medium">→</span>
                  </div>
                </div>
              </Card>
            </Link>
          ))}
        </div>
      )}
    </div>
  )
}
