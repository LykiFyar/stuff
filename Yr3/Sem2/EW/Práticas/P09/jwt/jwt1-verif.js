var jwt = require('jsonwebtoken')
var token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImpjciIsImxldmVsIjoiZWRpdG9yIiwiZXhwaXJlc0luIjozMCwiaWF0IjoxNjgyMDc2OTU2fQ.LRuR1XZ3ZRgNaOimoeIcdlbYTx30bX6H34VOAsKSNU0"

jwt.verify(token, 'EngWeb2023', function(e, payload) {
    if(e) console.log("Erro na verificação do token: " + e)
    else console.log('Descodificado: ' + JSON.stringify(payload))
})