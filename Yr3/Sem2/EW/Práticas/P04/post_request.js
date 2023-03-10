const axios = require('axios');

axios.post('http://localhost:3000/alunos', {
    "id": "A4140",
    "gitlink": "https://github.com/jcramalho2",
    "nome": "José Carlos Ramalho",
}).then(resp => {
    console.log(resp.data);
}).catch(error => {
    console.log('Erro: ' + error);
});
