import express from 'express'
import path from 'path'
import { fileURLToPath } from 'url'
import usuarioRoutes from './routes/usuarioRoutes.js'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const app = express()

app.use(express.urlencoded({ extended: true }))
app.use(express.json())

app.use(express.static(path.join(__dirname, '../dist')))

app.use('/usuario', usuarioRoutes)
app.get("/{*joker}", (req, res) => { res.sendFile(path.join(__dirname, "../dist/index.html")) })

export default app