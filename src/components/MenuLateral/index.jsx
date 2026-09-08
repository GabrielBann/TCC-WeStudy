import { useState } from "react";

import "./index.css"
import FecharIcon from "../../assets/Icones/Fechar.svg";
import FlechaDireita from "../../assets/Icones/Flecha Direita.svg";
import FlechaBaixo from "../../assets/Icones/Flecha Baixo.svg";
import GuiaIcon from "../../assets/Icones/Papel.svg";
import SairIcon from "../../assets/Icones/Sair.svg";
import MarcadorIcon from "../../assets/Icones/Marcador.svg";
import { useNavigate } from "react-router-dom";

export default function menuLateral({ onClose }) {
        const navigate = useNavigate();
        const [notificacao, setNotificacao] = useState(false);

        function abrirNotificacoes(){
            setNotificacao(!notificacao);
        }
        return (
            <div class="menu-lateral">
                <h1>Menu <img onClick={onClose} src={FecharIcon} alt="Fechar" /></h1>
                <button id="btn-menu" onClick={() => navigate("/perfil")}>
                    <svg width="36" height="36" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 20C10.1811 20.0026 8.41612 19.3829 6.998 18.244L7 18.245V17.562C7 15.768 8.492 14.312 10.333 14.312H13.667C15.507 14.312 17 15.768 17 17.562V18.245C15.5823 19.3832 13.8181 20.0024 12 20ZM2 12C2 6.477 6.477 2 12 2C17.523 2 22 6.477 22 12C22 17.5 17.56 21.963 12.068 22H11.93C6.438 21.962 2 17.5 2 12ZM12 7C10.16 7 8.667 8.455 8.667 10.25C8.667 12.045 10.159 13.5 12 13.5C13.84 13.5 15.333 12.045 15.333 10.25C15.333 8.455 13.841 7 12 7Z" fill="#59A694"/>
                    </svg>    
                    Gabriel
                </button>
                <button onClick={() => navigate("/cadernos")}>
                    <img src={MarcadorIcon} class="icone" alt="Meus Cadernos"/>
                    Meus Cadernos
                </button>
                <button onClick={() => navigate("/guias")}>
                    <img src={GuiaIcon} class="icone" alt="Meus Guias"/>
                    Meus Guias
                </button>
                <button onClick={() => navigate("/")}>
                    <img src={SairIcon} class="icone" alt="Sair"/>
                    Sair
                </button>
                <button onClick={abrirNotificacoes}>Notificações <img src={notificacao ? FlechaBaixo : FlechaDireita} alt="" /></button>
            </div>
        )
    }