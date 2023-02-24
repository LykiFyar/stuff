var http = require('http');

http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type': 'text/plain'}); // constroi cabeçalho - 1º arg: código, 2º arg: 
    res.end('Olá turma de 2023!'); // fechar pacote
}).listen(7777); // servidor à escuta na porta 7777

console.log("Servidor á escuta na porta 7777...");