import model from '../models/usuarioModel.js'

async function consultarSessoes(req, res) {
    const {statusPrivacidade} = req.body
    try{
        const sessoes = await model.BuscarSessoes(statusPrivacidade)
        return res.json(sessoes)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao consultar sessões' })
    }
}

async function consultarCadernos(req, res) {
    const {email} = req.body

    if (!email) {
        return res.status(400).json({ error: 'O campo email é obrigatório' });
    }

    try{
        const cadernos = await model.BuscarCadernos(email)
        return res.json(cadernos)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao consultar cadernos' })
    }
}

async function consultarGuias(req, res) {
    const {email} = req.body

    if (!email) {
        return res.status(400).json({ error: 'O campo email é obrigatório' });
    }

    try{
        const guias = await model.BuscarGuias(email)
        return res.json(guias)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao consultar guias' })   
    }
}

export default {
    consultarSessoes,
    consultarCadernos,
    consultarGuias
}