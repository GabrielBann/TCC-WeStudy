import model from '../models/usuarioModel.js'

async function logar(req, res) {
    const {email, senha} = req.body
    try{
        const user = await model.Logar(email, senha)
        return res.json(user)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao logar o usuário' })
    }
}

async function cadastrar(req, res) {
    const {email, senha, nome, tipo} = req.body
    try{
        const user = await model.Cadastrar(email, senha, nome, tipo)
        return res.json(user)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao cadastrar o usuário' })
    }
}

async function editar(req, res) {
    const {email, senha, nome} = req.body
    try{
        const user = await model.Editar(email, senha, nome)
        return res.json(user)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao editar o usuário' })
    }
}


async function excluir(req, res) {
    const {email, senha} = req.body
    try{
        const user = await model.Excluir(email, senha)
        return res.json(user)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao excluir o usuário' })
    }
}

export default {
    logar,
    cadastrar,
    editar,
    excluir
}