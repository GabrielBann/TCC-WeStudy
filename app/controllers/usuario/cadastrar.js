const model = require('../../models/usuario')

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

module.exports = cadastrar