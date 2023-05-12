var Caminho = require('../models/caminho')
var Cidade = require('../models/cidade')


module.exports.list = () => {
    return Caminho
            .find()
            .sort({distância:1})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getCaminho = id => {
    return Caminho.findOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getCidadeCaminhos = cid => {
    return Caminho.find({$or:[{origem:cid},{destino:cid}]})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.addCaminho = c => {
    return Caminho.create(c)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.updateCaminho = c => {
    return Caminho.updateOne({_id:c._id}, c)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.deleteCaminho = id => {
    return Caminho.deleteOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

// TODO
module.exports.getCidadeCaminhosNomes = cid => {
    return Caminho.find({$or:[{origem:cid},{destino:cid}]})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}