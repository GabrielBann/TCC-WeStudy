import express from 'express'
import path from 'path'
import {fileURLToPath} from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const router = express.Router()

import controller from '../controllers/usuarioController.js'

router.post('/logar', controller.logar)
router.post('/cadastrar', controller.cadastrar)
router.put('/editar', controller.editar)
router.delete('/excluir', controller.excluir)

export default router

