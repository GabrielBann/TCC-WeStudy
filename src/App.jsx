import { BrowserRouter, Route, Routes } from "react-router-dom";
import Inicio from "./pages/Inicio";
import Plataforma from "./pages/Plataforma";
import Opcoes from "./pages/Plataforma/Opcoes";
import Perfil from "./pages/Perfil";
import Sessao from "./pages/Sessao";

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
            <Route path="/sessao" element={<Sessao />} />
        </Routes>
    </BrowserRouter>
  )
}