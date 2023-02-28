const axios = require('axios')

axios.get('http://localhost:3000/pessoas')
    .then(function(resp) { // callback se conseguir fazer o pedido
        var pessoas = resp.data
        console.log("Recuperei " + pessoas.length + " registos.")
        console.log(pessoas[3].nome)
    })
    .catch(erro => { // callback se não conseguir fazer o pedido
        console.log("Erro: " + erro)
    })