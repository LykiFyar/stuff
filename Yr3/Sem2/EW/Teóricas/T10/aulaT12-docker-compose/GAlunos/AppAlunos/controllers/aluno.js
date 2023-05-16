var axios = require('axios')
var myhost = "http://alunos_data_server:3000"

// Student list
module.exports.list = () => {
    return axios.get(myhost + '/alunos?_sort=nome')
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getAluno = id => {
    return axios.get(myhost + '/alunos/' + id)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.addAluno = a => {
    return axios.post(myhost + '/alunos', a)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.updateAluno = a => {
    return axios.put(myhost + '/alunos/' + a.id, a)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}

module.exports.deleteAluno = id => {
    return axios.delete(myhost + '/alunos/' + id)
            .then(resposta => {
                return resposta.data
            })
            .catch(erro => {
                return erro
            })
}