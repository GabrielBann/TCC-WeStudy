import express from 'express'

const router = express.Router()

import controller from '../controllers/usuarioController.js'

router.post('/logar', controller.logar)
router.post('/cadastrar', controller.cadastrar)
router.put('/editar', controller.editar)
router.delete('/excluir', controller.excluir)

export default router

