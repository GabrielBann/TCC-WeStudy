import express from 'express'

const router = express.Router()

import controller from '../controllers/atividadesController.js'

router.post('/consultar_sessoes', controller.consultarSessoes)
router.post('/consultar_cadernos', controller.consultarCadernos)
router.post('/consultar_guias', controller.consultarGuias)

export default router

