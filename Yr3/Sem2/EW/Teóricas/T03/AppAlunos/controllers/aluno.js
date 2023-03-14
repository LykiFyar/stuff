var axios = require('axios')

// Student List
module.exports.list = () => {
    return axios.get("http://localhost:3000/alunos/?_sort=nome")
            .then(res => {
                return res.data
            })
            .catch(error => {
                return error
            })
}

// Student
module.exports.getAluno = id => {
    return axios.get("http://localhost:3000/alunos/" + id)
            .then(res => {
                return res.data
            })
            .catch(error => {
                return error
            })
}