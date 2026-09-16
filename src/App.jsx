import { BrowserRouter, Route, Routes } from "react-router-dom";
import Inicio from "./pages/Inicio";
import Plataforma from "./pages/Plataforma";
import Opcoes from "./pages/Opcoes";
import Perfil from "./pages/Perfil";

export default function App() {
    
return (
    <BrowserRouter>
        <Routes>
            <Route path="/" element={<Inicio />} />
            <Route path="/plataforma" element={<Plataforma />}> 
                <Route index element={<Opcoes />} />
                {/* <Route path="/guias" element={<Guias />} />
                <Route path="/sessoes" element={<Sessoes />} />
                <Route path="/cadernos" element={<Cadernos />} /> */}
            </Route>
            <Route path="/perfil" element={<Perfil />} />
        </Routes>
    </BrowserRouter>
  )
}