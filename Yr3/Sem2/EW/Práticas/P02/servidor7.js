var http = require('http')
var meta = require('./auxx')
var url = require('url')
var fs = require('fs')


var MyServer = http.createServer(function (req, res) {
    console.log(req.method + " " + req.url + " " + meta.myDateTime())
    
    
    fs.readFile("pag1.html", function (err, data) {
        res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
        if(err) {
            res.write("Erro: na leitura do ficheiro :: " + err)
        }
        else {
            res.write(data)
        }
        res.end()
    })
    
})

MyServer.listen(7777)
console.log("Servidor à escuta na porta 7777...")