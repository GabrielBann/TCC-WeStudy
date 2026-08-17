const model = require('../../models/usuario')

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

module.exports = logar