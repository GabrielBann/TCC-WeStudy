import axios from "axios";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Login(){
    const [email, setEmail] = useState('')
    const [senha, setSenha] = useState('')
    const [mensagem, setMensagem] = useState('')

    const navigate = useNavigate();

    function emailChange(e){
        setEmail(e.target.value)
    }
    function senhaChange(e){
        setSenha(e.target.value)
    }

    function Logar(){
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
            })
            .catch(function (error) {
                console.warn(error);
            })
            .finally(function () {});
    }
    return(
        <section>
            <input type="text" id="email" placeholder="Email" value={email} onChange={emailChange}/>
            <input type="password" id="password" placeholder="Senha" value={senha} onChange={senhaChange}/>
            <button onClick={Logar}>Logar</button>
        </section>
        
    )
}