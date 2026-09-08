import axios from "axios";

export default async function Logar(vEmail, vSenha, navigate) {
    try {
        const resposta = await axios.post(
            "http://localhost:3000/usuario/logar",
            {
                email: vEmail,
                senha: vSenha
            }
        );

        if (resposta.data && resposta.data.mensagem) {
            return { mensagem: resposta.data.mensagem };
        }

        console.log(resposta);
        console.log(resposta.data);
        console.log("Logadoooo");

        navigate("/plataforma");

        return null;

    } catch (error) {
        console.warn(error);

        return {mensagem: "Erro ao logar o usuário"};
    }
}