import model from '../models/atividadesModel.js'

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

async function consultarCadernosPublicos(req, res) {
    try{
        const cadernos = await model.BuscarCadernosPublicos()
        return res.json(cadernos)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao consultar cadernos' })
    }
}

async function consultarGuiasPublicos(req, res) {
    try{
        const guias = await model.BuscarGuiasPublicos()
        return res.json(guias)
    }
    catch (error){
        return res.status(500).json({ error: 'Erro ao consultar guias' })
    }
}

// cadastrar_caderno cadastrar_sessao

async function criarSessao(req, res) {
    const {
        email,
        cd_guia,
        topico,
        disciplina,
        privado,
        qt_pessoas_limite,
        codigo_entrada,
        texto_caderno
    } = req.body

    if (!email) {
        return res.status(400).json({ error: 'O campo email é obrigatório' })
    }

    if (!topico) {
        return res.status(400).json({ error: 'O campo tópico é obrigatório' })
    }

    if (!disciplina) {
        return res.status(400).json({ error: 'O campo disciplina é obrigatório' })
    }

    if (privado === undefined || privado === null) {
        return res.status(400).json({ error: 'O campo privado é obrigatório' })
    }

    if (qt_pessoas_limite === undefined || qt_pessoas_limite === null) {
        return res.status(400).json({ error: 'O campo limite de pessoas é obrigatório' })
    }

    if (privado === 1 && !codigo_entrada) {
        return res.status(400).json({ error: 'O código de entrada é obrigatório para sessões privadas' })
    }

    try {
        const sessao = await model.CadastrarSessao(
            email,
            cd_guia,
            topico,
            disciplina,
            privado,
            qt_pessoas_limite,
            codigo_entrada,
            texto_caderno
        )

        return res.json(sessao)
    }
    catch (error) {
        return res.status(500).json({
            error: error.sqlMessage || 'Erro ao cadastrar a sessão'
        })
    }
}


async function criarCaderno(req, res) {
    const {
        email,
        cd_guia,
        texto,
        disciplina,
        topico
    } = req.body

    if (!email) {
        return res.status(400).json({ error: 'O campo email é obrigatório' })
    }

    if (!texto) {
        return res.status(400).json({ error: 'O campo texto é obrigatório' })
    }

    if (!disciplina) {
        return res.status(400).json({ error: 'O campo disciplina é obrigatório' })
    }

    if (!topico) {
        return res.status(400).json({ error: 'O campo tópico é obrigatório' })
    }

    try {
        const caderno = await model.CadastrarCaderno(
            email,
            cd_guia,
            texto,
            disciplina,
            topico
        )

        return res.json(caderno)
    }
    catch (error) {
        return res.status(500).json({
            error: error.sqlMessage || 'Erro ao cadastrar o caderno'
        })
    }
}

async function editarCaderno(req, res) {
    const {
        email,
        cd_caderno,
        texto,
        disciplina,
        topico
    } = req.body

    if (!email) {
        return res.status(400).json({
            error: 'O campo email é obrigatório'
        })
    }

    if (cd_caderno === undefined || cd_caderno === null) {
        return res.status(400).json({
            error: 'O campo cd_caderno é obrigatório'
        })
    }

    if (!texto) {
        return res.status(400).json({
            error: 'O campo texto é obrigatório'
        })
    }

    if (!disciplina) {
        return res.status(400).json({
            error: 'O campo disciplina é obrigatório'
        })
    }

    if (!topico) {
        return res.status(400).json({
            error: 'O campo tópico é obrigatório'
        })
    }

    try {
        const caderno = await model.EditarCaderno(
            email,
            cd_caderno,
            texto,
            disciplina,
            topico
        )

        return res.json(caderno)
    }
    catch (error) {
        return res.status(500).json({
            error: error.sqlMessage || 'Erro ao editar o caderno'
        })
    }
}

async function excluirCaderno(req, res) {
    const {
        email,
        cd_caderno
    } = req.body

    if (!email) {
        return res.status(400).json({
            error: 'O campo email é obrigatório'
        })
    }

    if (cd_caderno === undefined || cd_caderno === null) {
        return res.status(400).json({
            error: 'O campo cd_caderno é obrigatório'
        })
    }

    try {
        const caderno = await model.ExcluirCaderno(
            email,
            cd_caderno
        )

        return res.json(caderno)
    }
    catch (error) {
        return res.status(500).json({
            error: error.sqlMessage || 'Erro ao excluir o caderno'
        })
    }
}

async function publicarCaderno(req, res) {
    const {
        email,
        cd_caderno
    } = req.body

    if (!email) {
        return res.status(400).json({
            error: 'O campo email é obrigatório'
        })
    }

    if (cd_caderno === undefined || cd_caderno === null) {
        return res.status(400).json({
            error: 'O campo cd_caderno é obrigatório'
        })
    }

    try {
        const caderno = await model.PublicarCaderno(
            email,
            cd_caderno
        )

        return res.json(caderno)
    }
    catch (error) {
        return res.status(500).json({
            error: error.sqlMessage || 'Erro ao publicar o caderno'
        })
    }
}

export default {
    consultarSessoes,
    consultarGuiasPublicos,
    consultarCadernosPublicos,
    consultarGuias,
    consultarCadernos,
    criarSessao,
    criarCaderno,
    editarCaderno,
    excluirCaderno,
    publicarCaderno
}