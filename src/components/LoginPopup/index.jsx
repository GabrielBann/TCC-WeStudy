import "./index.css";
import { useState } from "react";
import Logar from "../../funcoes/Logar";
import { useNavigate } from "react-router-dom";




export default function LoginPopup({ onClose }) {

    const navigate = useNavigate();

    const [email, setEmail] = useState("");
    const [senha, setSenha] = useState("");
    const [mensagem, setMensagem] = useState("");
    function emailOnChange(e) {
        setEmail(e.target.value);
    }
    function senhaOnChange(e) {
        setSenha(e.target.value);
    }
    async function Login(){
        const vEmail = email.trim();
        const vSenha = senha.trim();

        if (vEmail === "") {
        setMensagem("Informe seu e-mail");

        setTimeout(() => {
            setMensagem("");
        }, 3000);

        return;
    }

    if (vSenha === "") {
        setMensagem("Informe sua senha");

        setTimeout(() => {
            setMensagem("");
        }, 3000);

        return;
    }

        const funcao = await Logar(vEmail, vSenha, navigate);
        console.log(funcao);
        if (funcao && funcao.mensagem) {
            console.log(funcao.mensagem);
            setMensagem(funcao.mensagem);
            setTimeout(() => {
                setMensagem("");
            }, 3000);
            return;
        }

        onClose();
    }

    return (
        <div className="login-overlay">
            <div className="login-popup">

                <div className="login-header">
                    <h3>Faça o Login</h3>

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
                            onClick={Login}
                        >
                            Entrar
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
    );
}