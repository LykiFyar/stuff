const axios = require('axios');

axios.put('http://localhost:3000/alunos/A4140', {
    "gitlink": "https://github.com/jcramalho2",
    "nome": "José Carlos Ramalho",
    "tpc1": 1,
    "tpc3":1,
    "tpc5":1
  }).then(resp => {
    console.log(resp.data);
}).catch(error => {
    console.log('Erro: ' + error);
})