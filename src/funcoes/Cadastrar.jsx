import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function Cadastrar(email, senha, nome, tipo){

    const navigate = useNavigate();

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
    axios.post("http://localhost:3000/usuario/cadastrar", 
    {
        "email": vEmail,
        "senha": vSenha,
        "nome": vNome,
        "tipo": vTipo
    },
    ).then(function (resposta) {
        console.log("Cadastrado com sucesso");
        navigate('/plataforma');
    })
    .catch(function (error) {
        console.warn(error);
    })
    .finally(function () {});
}