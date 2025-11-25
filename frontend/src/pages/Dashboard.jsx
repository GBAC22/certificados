import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Award, FileText, TrendingUp, Clock } from 'lucide-react'
import Card from '../components/Card'
import { getFerias, getCertificados } from '../services/api'

export default function Dashboard() {
  const [stats, setStats] = useState({
    totalFerias: 0,
    totalCertificados: 0,
    certificadosHoy: 0,
    ultimaFeria: null
  })
  const [loading, setLoading] = useState(true)
  const [recentFerias, setRecentFerias] = useState([])

  useEffect(() => {
    loadData()
  }, [])

  const loadData = async () => {
    try {
      const [feriasRes, certificadosRes] = await Promise.all([
        getFerias(),
        getCertificados({ limit: 100 })
      ])

      const ferias = feriasRes.data.data
      const certificados = certificadosRes.data.data

      // Calcular certificados de hoy
      const hoy = new Date().toDateString()
      const certificadosHoy = certificados.filter(
        c => new Date(c.fecha_emision).toDateString() === hoy
      ).length

      setStats({
        totalFerias: ferias.length,
        totalCertificados: certificados.length,
        certificadosHoy,
        ultimaFeria: ferias[0]
      })

      setRecentFerias(ferias.slice(0, 5))
    } catch (error) {
      console.error('Error al cargar datos:', error)
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
      <div>
        <h1 className="text-3xl font-bold text-gray-900">Dashboard</h1>
        <p className="mt-1 text-sm text-gray-500">
          Resumen general del sistema de certificados
        </p>
      </div>

      {/* Stats */}
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
        <Card>
          <div className="flex items-center">
            <div className="p-3 rounded-full bg-blue-100">
              <Award className="h-6 w-6 text-blue-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-500">Total Ferias</p>
              <p className="text-2xl font-bold text-gray-900">{stats.totalFerias}</p>
            </div>
          </div>
        </Card>

        <Card>
          <div className="flex items-center">
            <div className="p-3 rounded-full bg-green-100">
              <FileText className="h-6 w-6 text-green-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-500">Certificados</p>
              <p className="text-2xl font-bold text-gray-900">{stats.totalCertificados}</p>
            </div>
          </div>
        </Card>

        <Card>
          <div className="flex items-center">
            <div className="p-3 rounded-full bg-purple-100">
              <TrendingUp className="h-6 w-6 text-purple-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-500">Hoy</p>
              <p className="text-2xl font-bold text-gray-900">{stats.certificadosHoy}</p>
            </div>
          </div>
        </Card>

        <Card>
          <div className="flex items-center">
            <div className="p-3 rounded-full bg-orange-100">
              <Clock className="h-6 w-6 text-orange-600" />
            </div>
            <div className="ml-4">
              <p className="text-sm font-medium text-gray-500">Última Feria</p>
              <p className="text-sm font-bold text-gray-900">
                {stats.ultimaFeria ? stats.ultimaFeria.nombre.substring(0, 20) : 'N/A'}
              </p>
            </div>
          </div>
        </Card>
      </div>

      {/* Recent Ferias */}
      <Card>
        <div className="flex justify-between items-center mb-4">
          <h2 className="text-lg font-semibold text-gray-900">Ferias Recientes</h2>
          <Link 
            to="/ferias" 
            className="text-sm text-blue-600 hover:text-blue-700 font-medium"
          >
            Ver todas →
          </Link>
        </div>
        <div className="space-y-3">
          {recentFerias.map(feria => (
            <Link
              key={feria.id}
              to={`/ferias/${feria.id}`}
              className="block p-4 rounded-lg border hover:bg-gray-50 transition-colors"
            >
              <div className="flex justify-between items-start">
                <div>
                  <h3 className="font-medium text-gray-900">{feria.nombre}</h3>
                  <p className="text-sm text-gray-500 mt-1">
                    Semestre {feria.semestre} - {feria.año}
                  </p>
                </div>
                {feria.activa && (
                  <span className="px-2 py-1 text-xs font-medium rounded-full bg-green-100 text-green-800">
                    Activa
                  </span>
                )}
              </div>
            </Link>
          ))}
          {recentFerias.length === 0 && (
            <p className="text-gray-500 text-center py-4">
              No hay ferias registradas
            </p>
          )}
        </div>
      </Card>

      {/* Quick Actions */}
      <Card>
        <h2 className="text-lg font-semibold text-gray-900 mb-4">Acciones Rápidas</h2>
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
          <Link
            to="/ferias"
            className="p-4 rounded-lg border-2 border-dashed border-gray-300 hover:border-blue-500 hover:bg-blue-50 transition-colors text-center"
          >
            <Award className="h-8 w-8 mx-auto mb-2 text-gray-400" />
            <p className="font-medium text-gray-700">Ver Ferias</p>
          </Link>
          <Link
            to="/certificados"
            className="p-4 rounded-lg border-2 border-dashed border-gray-300 hover:border-blue-500 hover:bg-blue-50 transition-colors text-center"
          >
            <FileText className="h-8 w-8 mx-auto mb-2 text-gray-400" />
            <p className="font-medium text-gray-700">Ver Certificados</p>
          </Link>
          <Link
            to="/verificar"
            className="p-4 rounded-lg border-2 border-dashed border-gray-300 hover:border-blue-500 hover:bg-blue-50 transition-colors text-center"
          >
            <Award className="h-8 w-8 mx-auto mb-2 text-gray-400" />
            <p className="font-medium text-gray-700">Verificar Certificado</p>
          </Link>
        </div>
      </Card>
    </div>
  )
}
