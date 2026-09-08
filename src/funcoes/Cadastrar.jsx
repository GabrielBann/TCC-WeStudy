import axios from "axios";

export default function Cadastrar(vEmail, vSenha, vNome, vTipo, navigate) {

    console.log(vEmail, vSenha, vNome, vTipo);

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