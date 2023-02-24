var http = require('http')
var meta = require('./auxx')
var url = require('url')


var MyServer = http.createServer(function (req, res) {
    console.log(req.method + " " + req.url + " " + meta.myDateTime())
    res.writeHead(200, {'Content-Type': 'text/html; charset=utf-8'})
    
    var q = url.parse(req.url, true) // true devolve um objeto com a query como dicionário com tudo separado, false devolve uma string
    
    if(q.pathname == "/add") {
        var soma = parseInt(q.query.n1, 10) + parseInt(q.query.n2, 10)
        res.write("<pre>" + q.query.n1 + " + " + q.query.n2 + " = " + soma + "</pre>")
    }
    else if(q.pathname == "/sub") {
        var soma = parseInt(q.query.n1, 10) - parseInt(q.query.n2, 10)
        res.write("<pre>" + q.query.n1 + " - " + q.query.n2 + " = " + soma + "</pre>")
    }
    else {
        res.write("<p>Operação não suportada...</p>")
    }

    res.end()
})

MyServer.listen(7777)
console.log("Servidor à escuta na porta 7777...")