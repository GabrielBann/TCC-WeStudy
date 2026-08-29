import { BrowserRouter, Route, Routes } from "react-router-dom";
import Inicio from "./components/Inicio";
import Plataforma from "./components/Plataforma";
import Opcoes from "./components/Opcoes";

export default function App() {
    
return (
    <BrowserRouter>
        <Routes>
            <Route path="/" element={<Inicio />} />
            <Route path="/plataforma" element={<Plataforma />}> 
                <Route index element={<Opcoes />} />
                <Route path="/guias" element={<Guias />} />
                <Route path="/sessoes" element={<Sessoes />} />
                <Route path="/cadernos" element={<Cadernos />} />
            </Route>
        </Routes>
    </BrowserRouter>
  )
}


