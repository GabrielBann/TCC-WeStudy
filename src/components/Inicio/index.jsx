import axios from "axios";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

export default function Inicio(){
    const navigate = useNavigate();

    function Login(){
        navigate('/login')
    }
    function Cadastrar(){
        navigate('/cadastrar')
    }
    return(
        <section>
            <button onClick={Login}>Login</button>
            <button onClick={Cadastrar}>Cadastrar</button>
        </section>
    )
}