const axios = require('axios')

axios.get('http://localhost:3000/pessoas')
    .then(function(resp){
        var pessoas = resp.data
        console.log("Recuperei " + pessoas.length + " registos")
        console.log(pessoas[3].nome)
    })
    .catch(erro => {
        console.log("Erro: " + erro)
    })