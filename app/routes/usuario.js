const express = require('express')
const path = require('path')

const router = express.Router()

const logar = require('../controllers/usuario/logar')
const cadastrar = require('../controllers/usuario/cadastrar')
const editar = require('../controllers/usuario/editar')
const excluir = require('../controllers/usuario/excluir')


router.post('/logar', logar)
router.post('/cadastrar', cadastrar)
router.put('/editar', editar)
router.delete('/excluir', excluir)

