const axios = require('axios')

axios.post('http://localhost:3000/pessoas', {
    id:'1121',
    BI: '12345',
    nome: 'Xupapi Muñaño'
})
    .then(function(resp) { // callback se conseguir fazer o pedido
        console.log(resp.status)
    })
    .catch(erro => { // callback se não conseguir fazer o pedido
        console.log("Erro: " + erro)
    })