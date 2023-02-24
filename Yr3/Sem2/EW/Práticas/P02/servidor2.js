var http = require('http')
var meta = require('./auxx')

var MyServer = http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
    res.write("<p>Criada com o node.js por " +
    meta.myName() + " em " + meta.myDateTime() + " na turma " + meta.turma + "</p>")
    res.end()
})

MyServer.listen(7777)
console.log("Servidor à escuta na porta 7777...")