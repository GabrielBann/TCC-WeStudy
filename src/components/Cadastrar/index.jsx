import axios from "axios";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Cadastrar(){
    const [nome, setNome] = useState('')
    const [tipo, setTipo] = useState('')
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
    function nomeChange(e){
        setNome(e.target.value)
    }
    function tipoChange(e){
        setTipo(e.target.value)
    }
    function senhaChange(e){
        setSenha(e.target.value)
    }

    function Logar(){
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
            <input type="text" id="nome" placeholder="Nome" value={nome} onChange={nomeChange}/>
            <input type="text" id="tipo" placeholder="Tipo" value={tipo} onChange={tipoChange}/>
            <button onClick={Logar}>Cadastrar</button>
            {mensagem == "" ? null : <p>{mensagem}</p>}
        </section>
        
    )
}