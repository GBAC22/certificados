import { Link, Outlet, useLocation, useNavigate } from 'react-router-dom'
import { Home, Award, FileText, CheckCircle, Menu, User, LogOut, Settings } from 'lucide-react'
import { useState } from 'react'

export default function Layout() {
  const location = useLocation()
  const navigate = useNavigate()
  const [menuOpen, setMenuOpen] = useState(false)
  const [userMenuOpen, setUserMenuOpen] = useState(false)

  // Usuario simulado
  const usuario = {
    nombre: 'Administrativo',
    rol: 'Administrador',
    email: 'admin@uagrm.edu.bo'
  }

  const navigation = [
    { name: 'Dashboard', path: '/', icon: Home },
    { name: 'Ferias', path: '/ferias', icon: Award },
    { name: 'Certificados', path: '/certificados', icon: FileText },
    { name: 'Verificar', path: '/verificar', icon: CheckCircle },
  ]

  const isActive = (path) => {
    if (path === '/') return location.pathname === '/'
    return location.pathname.startsWith(path)
  }

  const handleLogout = () => {
    if (confirm('¿Está seguro que desea cerrar sesión?')) {
      // Simular cierre de sesión
      alert('Sesión cerrada exitosamente')
      navigate('/')
    }
  }

  return (
    <div className="min-h-screen bg-gray-50">
      {/* Header */}
      <header className="bg-white shadow-sm border-b">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex justify-between items-center h-16">
            <div className="flex items-center">
              <Award className="h-8 w-8 text-blue-600" />
              <span className="ml-2 text-xl font-bold text-gray-900">
                Certificados Blockchain
              </span>
            </div>

            {/* Desktop Navigation */}
            <div className="hidden md:flex items-center space-x-4">
              <nav className="flex space-x-4">
                {navigation.map((item) => {
                  const Icon = item.icon
                  return (
                    <Link
                      key={item.path}
                      to={item.path}
                      className={`flex items-center px-3 py-2 rounded-md text-sm font-medium transition-colors ${
                        isActive(item.path)
                          ? 'bg-blue-100 text-blue-700'
                          : 'text-gray-700 hover:bg-gray-100'
                      }`}
                    >
                      <Icon className="h-4 w-4 mr-2" />
                      {item.name}
                    </Link>
                  )
                })}
              </nav>

              {/* User Menu */}
              <div className="relative ml-4">
                <button
                  onClick={() => setUserMenuOpen(!userMenuOpen)}
                  className="flex items-center space-x-3 px-3 py-2 rounded-md text-sm font-medium text-gray-700 hover:bg-gray-100 transition-colors"
                >
                  <div className="flex items-center justify-center w-8 h-8 rounded-full bg-blue-600 text-white font-semibold">
                    {usuario.nombre.charAt(0)}
                  </div>
                  <div className="text-left">
                    <p className="font-semibold">{usuario.nombre}</p>
                    <p className="text-xs text-gray-500">{usuario.rol}</p>
                  </div>
                </button>

                {/* Dropdown Menu */}
                {userMenuOpen && (
                  <div className="absolute right-0 mt-2 w-56 bg-white rounded-lg shadow-lg border border-gray-200 py-1 z-50">
                    <div className="px-4 py-3 border-b border-gray-200">
                      <p className="text-sm font-semibold text-gray-900">{usuario.nombre}</p>
                      <p className="text-xs text-gray-500">{usuario.email}</p>
                    </div>
                    
                    <button
                      onClick={() => {
                        setUserMenuOpen(false)
                        alert('Función de perfil no implementada')
                      }}
                      className="w-full px-4 py-2 text-left text-sm text-gray-700 hover:bg-gray-100 flex items-center"
                    >
                      <User className="h-4 w-4 mr-3" />
                      Mi Perfil
                    </button>
                    
                    <button
                      onClick={() => {
                        setUserMenuOpen(false)
                        alert('Función de configuración no implementada')
                      }}
                      className="w-full px-4 py-2 text-left text-sm text-gray-700 hover:bg-gray-100 flex items-center"
                    >
                      <Settings className="h-4 w-4 mr-3" />
                      Configuración
                    </button>
                    
                    <div className="border-t border-gray-200 mt-1 pt-1">
                      <button
                        onClick={() => {
                          setUserMenuOpen(false)
                          handleLogout()
                        }}
                        className="w-full px-4 py-2 text-left text-sm text-red-600 hover:bg-red-50 flex items-center"
                      >
                        <LogOut className="h-4 w-4 mr-3" />
                        Cerrar Sesión
                      </button>
                    </div>
                  </div>
                )}
              </div>
            </div>

            {/* Mobile menu button */}
            <button
              onClick={() => setMenuOpen(!menuOpen)}
              className="md:hidden p-2 rounded-md text-gray-700 hover:bg-gray-100"
            >
              <Menu className="h-6 w-6" />
            </button>
          </div>
        </div>

        {/* Mobile Navigation */}
        {menuOpen && (
          <div className="md:hidden border-t">
            {/* User Info Mobile */}
            <div className="px-4 py-3 bg-gray-50 border-b">
              <div className="flex items-center space-x-3">
                <div className="flex items-center justify-center w-10 h-10 rounded-full bg-blue-600 text-white font-semibold">
                  {usuario.nombre.charAt(0)}
                </div>
                <div>
                  <p className="font-semibold text-gray-900">{usuario.nombre}</p>
                  <p className="text-xs text-gray-500">{usuario.email}</p>
                </div>
              </div>
            </div>

            {/* Navigation Links */}
            <div className="px-2 pt-2 pb-3 space-y-1">
              {navigation.map((item) => {
                const Icon = item.icon
                return (
                  <Link
                    key={item.path}
                    to={item.path}
                    onClick={() => setMenuOpen(false)}
                    className={`flex items-center px-3 py-2 rounded-md text-base font-medium ${
                      isActive(item.path)
                        ? 'bg-blue-100 text-blue-700'
                        : 'text-gray-700 hover:bg-gray-100'
                    }`}
                  >
                    <Icon className="h-5 w-5 mr-3" />
                    {item.name}
                  </Link>
                )
              })}

              {/* User Actions Mobile */}
              <div className="border-t border-gray-200 mt-2 pt-2 space-y-1">
                <button
                  onClick={() => {
                    setMenuOpen(false)
                    alert('Función de perfil no implementada')
                  }}
                  className="w-full flex items-center px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:bg-gray-100"
                >
                  <User className="h-5 w-5 mr-3" />
                  Mi Perfil
                </button>
                
                <button
                  onClick={() => {
                    setMenuOpen(false)
                    alert('Función de configuración no implementada')
                  }}
                  className="w-full flex items-center px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:bg-gray-100"
                >
                  <Settings className="h-5 w-5 mr-3" />
                  Configuración
                </button>
                
                <button
                  onClick={() => {
                    setMenuOpen(false)
                    handleLogout()
                  }}
                  className="w-full flex items-center px-3 py-2 rounded-md text-base font-medium text-red-600 hover:bg-red-50"
                >
                  <LogOut className="h-5 w-5 mr-3" />
                  Cerrar Sesión
                </button>
              </div>
            </div>
          </div>
        )}
      </header>

      {/* Main Content */}
      <main className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
        <Outlet />
      </main>

      {/* Footer */}
      <footer className="bg-white border-t mt-auto">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <p className="text-center text-sm text-gray-500">
            © 2024 Sistema de Certificados con Blockchain. Todos los derechos reservados.
          </p>
        </div>
      </footer>
    </div>
  )
}
