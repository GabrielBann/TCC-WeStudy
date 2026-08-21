import { BrowserRouter, Route, Routes } from "react-router-dom";
import Inicio from "./components/Inicio";
import Login from "./components/Login";
import Cadastrar from "./components/Cadastrar";

export default function App() {
    
return (
    <BrowserRouter>
        <Routes>
            <Route path="/" element={<Inicio />} />
            <Route path="/login" element={<Login />} />
            <Route path="/cadastrar" element={<Cadastrar />} />
        </Routes>
    </BrowserRouter>
  )
}


