import axios from "axios";
import { useNavigate } from "react-router-dom";

export default function Logar(email, senha){

    const navigate = useNavigate();

    const vEmail = email.trim();
    const vSenha = senha.trim();

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
    axios.post("http://localhost:3000/usuario/logar", 
    {
        "email": vEmail,
        "senha": vSenha
    },
    ).then(function (resposta) {
        console.log(resposta);
        console.log(resposta.data);
        console.log("Logadoooo")
        navigate('/plataforma');
    })
    .catch(function (error) {
        console.warn(error);
    })
    .finally(function () {});
}