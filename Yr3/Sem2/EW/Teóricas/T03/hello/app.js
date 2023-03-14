const express = require('express')
const app = express()
var port = 7777

app.get('/', (req, res) => {
    res.send('Hello turma de 2023!')
})

app.listen(port, () => {
    console.log("Servidor à escuta na porta " + port + "...")
})