import connection from '../database/connection.js'

async function Logar(
    email,
    senha
) {
    try {
        const [rows] = await connection.query('CALL login_usuario(?, ?)',[email, senha]);

        return rows;
    } catch (error) {
        console.log(error);
        return {"mensagem": error.sqlMessage};
    }
} 

async function Cadastrar(
    email,
    senha,
    nome,
    tipo
) {
    const [result] = await connection.query('CALL cadastrar_usuario(?,?,?,?)', [nome,email,senha,tipo])
    return result
} 
async function Editar(email,senha,nome) {
    const [result] = await connection.query('CALL atualizar_usuario(?,?,?)', [email,senha,nome])
    return result
} 
async function Excluir(
    email,
    senha
) {
    const [result] = await connection.query('CALL excluir_usuario(?,?)', [email,senha])
    return result
} 

export default {
    Logar,
    Cadastrar,
    Editar,
    Excluir
}