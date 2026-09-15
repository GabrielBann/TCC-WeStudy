import { BrowserRouter, Route, Routes } from "react-router-dom";
import Inicio from "./components/Inicio";
import Plataforma from "./components/Plataforma";
import Opcoes from "./components/Opcoes";
import Perfil from "./components/Perfil";

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