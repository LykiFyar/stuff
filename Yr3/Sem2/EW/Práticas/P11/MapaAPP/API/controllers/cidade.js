var Cidade = require('../models/cidade')


module.exports.list = () => {
    return Cidade
            .find()
            .sort({nome:1})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getCidade = id => {
    return Cidade.findOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.addCidade = c => {
    return Cidade.create(c)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.updateCidade = c => {
    return Cidade.updateOne({_id:c._id}, c)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.deleteCidade = id => {
    return Cidade.deleteOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}
