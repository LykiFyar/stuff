var http = require('http')
var meta = require('./auxx')
var url = require('url')


var MyServer = http.createServer(function (req, res) {
    console.log(req.method + " " + req.url + " " + meta.myDateTime())
    res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
    
    var q = url.parse(req.url, true) // true devolve um objeto com a query como dicionário com tudo separado, false devolve uma string
    res.write('True: <pre>' + JSON.stringify(q) + "</pre>")

    var q = url.parse(req.url, false) // true devolve um objeto com a query como dicionário com tudo separado, false devolve uma string
    res.write('\nFalse: <pre>' + JSON.stringify(q) + "</pre>")


    res.write("")
    res.end()
})

MyServer.listen(7777)
console.log("Servidor à escuta na porta 7777...")