var Student = require('../models/aluno')

// Student list
module.exports.list = () => {
    return Student
        .find()
        .sort({nome:1})
        .then(dados => {
            return dados
        })
        .catch(erro => {
            return erro
        })
}

module.exports.getAluno = id => {
    return Student.findOne({_id: id})
        .then(dados => {
            return dados
        })
        .catch(erro => {
            return erro
        })
}

module.exports.addAluno = a => {
    return Student.create(a)
        .then(dados => {
            return dados
        })
        .catch(erro => {
            return erro
        })
}

module.exports.updateAluno = a => {
    return Student.updateOne({_id: a._id}, a)
        .then(dados => {
            return dados
        })
        .catch(erro => {
            return erro
        })
}

module.exports.deleteAluno = id => {
    return Student.deleteOne({_id: id})
        .then(dados => {
            return dados
        })
        .catch(erro => {
            return erro
        })
}