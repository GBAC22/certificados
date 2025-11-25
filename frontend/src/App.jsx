import { BrowserRouter, Routes, Route } from 'react-router-dom'
import Layout from './components/Layout'
import Dashboard from './pages/Dashboard'
import Ferias from './pages/Ferias'
import FeriaDetalle from './pages/FeriaDetalle'
import ProyectoDetalle from './pages/ProyectoDetalle'
import Certificados from './pages/Certificados'
import CertificadoDetalle from './pages/CertificadoDetalle'
import Verificar from './pages/Verificar'

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Layout />}>
          <Route index element={<Dashboard />} />
          <Route path="ferias" element={<Ferias />} />
          <Route path="ferias/:id" element={<FeriaDetalle />} />
          <Route path="proyectos/:id" element={<ProyectoDetalle />} />
          <Route path="certificados" element={<Certificados />} />
          <Route path="certificados/:id" element={<CertificadoDetalle />} />
          <Route path="verificar" element={<Verificar />} />
        </Route>
      </Routes>
    </BrowserRouter>
  )
}

export default App
