import { useNavigate } from "react-router-dom";
import "./index.css"


import GuiaIcon from "../../../assets/Icones/Papel.svg";
import SessaoIcon from "../../../assets/Icones/Sessão.svg";
import MarcadorIcon from "../../../assets/Icones/Marcador.svg";

export default function Opcoes() {
    const navigate = useNavigate();
    return (
         <nav>
            <button onClick={() => navigate("/sessoes")} class="card-link">
                <h4>Sessões de Estudo<br/>em Andamento</h4>
                <p>Pesquise todas as sessões de estudo públicas para entrar em uma sala.</p>
                <img src={SessaoIcon} class="icone"/>
            </button>
            <button onClick={() => navigate("/#")} class="card-link">
                <h4>Começar<br/>Sessão de Estudo</h4>
                <p>Crie uma sessão de estudos para colaborar com estudantes e até educadores de toda a plataforma.</p>
                <img src={SessaoIcon} class="icone"/>
            </button>
            <button onClick={() => navigate("/cadernos-publicos")} class="card-link">
                <h4>Cadernos Públicos </h4>
                <p>Vitrine de Cadernos publicados por estudantes focados.</p>
                <img src={MarcadorIcon} class="icone"/>
            </button>
            <button onClick={() => navigate("/#")} class="card-link">
                <h4>Escrever caderno</h4>
                <p>Escreva texto dentro de um caderno de anotações, podendo importar Guias salvos para facilitar o estudo,</p>
                <img src={MarcadorIcon} class="icone"/>
            </button>
            <button onClick={() => navigate("/guias-publicos")} class="card-link">
                <h4>Guias Públicos </h4>
                <p>Vitrine de Guias publicados por educadores qualificados</p>
                <img src={GuiaIcon} class="icone"/>
            </button>
            <button onClick={() => navigate("/guias")} class="card-link">
                <h4>Guias Salvos</h4>
                <p>Vissualize e acesse todos seus Guias salvos.</p>
                <img src={GuiaIcon} class="icone"/>
        </button>
        </nav>
    )
}