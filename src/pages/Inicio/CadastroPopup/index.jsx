import "./index.css";
import { useState } from "react";
import Cadastrar from "../../../funcoes/Cadastrar";
import { useNavigate } from "react-router-dom";

export default function CadastroPopup({ onClose }) {
    const navigate = useNavigate();
    const [email, setEmail] = useState("");
    const [senha, setSenha] = useState("");
    const [nome, setNome] = useState("");
    const [tipo, setTipo] = useState("");   
    const [mensagem, setMensagem] = useState("");   

    function emailOnChange(e) {
        setEmail(e.target.value);
    }
    function senhaOnChange(e) {
        setSenha(e.target.value);
    }
    function nomeOnChange(e) {
        setNome(e.target.value);
    }
    function tipoOnChange(e) {
        setTipo(e.target.value);
    }
    function Cadastro(){

        const vEmail = email.trim();
        const vSenha = senha.trim();
        const vNome = nome.trim();
        const vTipo = tipo.trim();

        if(vEmail === ""){
        setMensagem("Informe seu e-mail");
        setTimeout(() => {
            setMensagem("");
        }, 3000);
            return;
        }
        if(vSenha === ""){
            setMensagem("Informe sua senha");
            setTimeout(() => {
                setMensagem("");
            }, 3000);
            return;
        }

        if(vNome === ""){
            setMensagem("Informe seu nome");
            setTimeout(() => {
                setMensagem("");
            }, 3000);
            return;
        }
        if(vTipo === ""){
            setMensagem("Informe seu tipo");
            setTimeout(() => {
                setMensagem("");
            }, 3000);
            return;
        }
        if(vSenha === ""){
            setMensagem("Informe sua senha");
            setTimeout(() => {
                setMensagem("");
            }, 3000);
            return;
        }

        Cadastrar(vEmail, vSenha, vNome, vTipo, navigate);
        onClose();
    }

    return(
        <div className="login-overlay">
            <div className="login-popup">

                <div className="login-header">
                    <h3>Faça o Cadastro</h3>

                    <button
                        type="button"
                        className="login-close"
                        onClick={onClose}
                    >
                        ×
                    </button>
                </div>

                <form className="login-form">

                    <div className="login-field">
                        <label htmlFor="email">
                            E-mail
                        </label>

                        <input
                            type="email"
                            id="email"
                            placeholder="email@gmail.com"
                            value={email}
                            onChange={emailOnChange}
                        />
                    </div>

                    <div className="login-field">
                        <label htmlFor="senha">
                            Senha
                        </label>

                        <div className="password-container">
                            <input
                                type="password"
                                id="senha"
                                placeholder="Mínimo de 8 caracteres"
                                value={senha}
                                onChange={senhaOnChange}
                            />
                        </div>
                    </div>
                    
                    <div className="login-field">
                        <label htmlFor="nome">
                            Nome
                        </label>

                        <input
                            type="text"
                            id="nome"
                            placeholder="Seu nome completo"
                            value={nome}
                            onChange={nomeOnChange}
                        />
                    </div>
                    <div className="login-field">
                        <label htmlFor="tipo">
                            Tipo
                        </label>

                        <select name="tipo" id="tipo" value={tipo} onChange={tipoOnChange}>
                            <option value="-1">Selecione seu tipo</option>
                            <option value="Aluno">Aluno</option>
                            <option value="Educador">Educador</option>
                        </select>
                    </div>

                    

                    <div className="login-options">

                        <label className="remember">
                            <input type="checkbox" />
                            <span>Lembrar de mim</span>
                        </label>

                        <a href="/cadastro">
                            Não tem uma conta? Cadastre-se
                        </a>

                    </div>

                    <div className="login-buttons">

                        <button
                            type="button"
                            className="login-enter"
                            onClick={Cadastro}
                        >
                            Cadastrar
                        </button>

                        <button
                            type="button"
                            className="login-cancel"
                            onClick={onClose}
                        >
                            Cancelar
                        </button>

                        {mensagem == "" ? null : <p className="login-message">{mensagem}</p>}

                    </div>

                </form>

            </div>
        </div>
    )
}