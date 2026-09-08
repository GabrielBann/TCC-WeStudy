import { NavLink, Outlet } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { useState } from "react";

import "./index.css"

import MenuLateral from "../MenuLateral";
import Logotipo from "../../assets/Logotipo WeStudy.png";
import GrupoIcon from "../../assets/Icones/Grupo.svg";
import NoficacoesIcon from "../../assets/Icones/Notificação.svg";

export default function Plataforma() {
    const navigate = useNavigate();
    const [menuAberto, setMenuAberto] = useState(false);

    function abrirMenuLateral() {
        setMenuAberto(!menuAberto);
    }

    return (
        <section>
            <header>
                 <NavLink to="/plataforma"><img src={Logotipo} alt="Logotipo WeStudy"/></NavLink>
                <nav>
                    
                    <NavLink to="#">Guias</NavLink>
                    <NavLink to="#">Sessões</NavLink>
                    <NavLink to="#">Cadernos</NavLink>
                    <a href="#"><img src={GrupoIcon} class="icone" alt=""/></a>
                    <a href="#"><img src={NoficacoesIcon} class="icone" alt=""/></a>
                    <button id="btn-menu" onClick={abrirMenuLateral}>
                    <svg width="36" height="36" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 20C10.1811 20.0026 8.41612 19.3829 6.998 18.244L7 18.245V17.562C7 15.768 8.492 14.312 10.333 14.312H13.667C15.507 14.312 17 15.768 17 17.562V18.245C15.5823 19.3832 13.8181 20.0024 12 20ZM2 12C2 6.477 6.477 2 12 2C17.523 2 22 6.477 22 12C22 17.5 17.56 21.963 12.068 22H11.93C6.438 21.962 2 17.5 2 12ZM12 7C10.16 7 8.667 8.455 8.667 10.25C8.667 12.045 10.159 13.5 12 13.5C13.84 13.5 15.333 12.045 15.333 10.25C15.333 8.455 13.841 7 12 7Z" fill="#59A694"/>
                    </svg>    
                        Gabriel
                    </button>
                </nav>
            </header>
            <main>
            <Outlet></Outlet>
            </main>
            <footer>
                <small>WeStudy 2026</small>
            </footer>
            { menuAberto && <MenuLateral onClose={abrirMenuLateral} /> }
        </section>
    )
}