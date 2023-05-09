var http = require('http')

http.createServer(function(req,res) {
    res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
    res.end('<p>Olá turma 2023!</p>')
}).listen(7777)
console.log("Servidor à escuta na porta 7777...")