import express from 'express'

const router = express.Router()

import controller from '../controllers/atividadesController.js'

router.post('/consultar_sessoes', controller.consultarSessoes) //publicos
router.get('/consultar_cadernos_publicos', controller.consultarCadernosPublicos) //publicos
router.get('/consultar_guias_publicos', controller.consultarGuiasPublicos) //publicos
router.post('/criar_sessao', controller.criarSessao) //usuario
router.post('/criar_caderno', controller.criarCaderno) //usuario
router.put('/editar_caderno', controller.editarCaderno) //usuario
router.delete('/excluir_caderno', controller.excluirCaderno) //usuario
router.post('/publicar_caderno', controller.publicarCaderno) //usuario
router.post('/consultar_cadernos', controller.consultarCadernos) //usuario
router.post('/consultar_guias', controller.consultarGuias) //usuario

// http://localhost:3000/atividades/consultar_sessoes
// http://localhost:3000/atividades/consultar_cadernos_publicos
// http://localhost:3000/atividades/consultar_guias_publicos
// http://localhost:3000/atividades/criar_sessao
// http://localhost:3000/atividades/criar_caderno
// http://localhost:3000/atividades/editar_caderno
// http://localhost:3000/atividades/excluir_caderno
// http://localhost:3000/atividades/publicar_caderno
// http://localhost:3000/atividades/consultar_cadernos
// http://localhost:3000/atividades/consultar_guias

export default router

