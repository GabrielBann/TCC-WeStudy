const model = require('../../models/usuario')

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

modele.exports = editar