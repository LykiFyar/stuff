var axios = require('axios')

// Student list
module.exports.list = () => {
    return axios.get('http://localhost:3000/alunos?_sort=nome')
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getAluno = id => {
    return axios.get('http://localhost:3000/alunos/' + id)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.addAluno = a => {
    return axios.post('http://localhost:3000/alunos', a)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.editAluno = a => {
    return axios.put('http://localhost:3000/alunos/' + a.id, a)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.deleteAluno = id => {
    return axios.delete('http://localhost:3000/alunos/' + id)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}