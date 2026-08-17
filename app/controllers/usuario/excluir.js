const model = require('../../models/usuario')

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

module.exports = excluir