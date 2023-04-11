var Lista = require('../models/lista')

module.exports.list = () => {
    return Lista.find().sort({data:-1})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getLista = id => {
    return Lista.findOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.addLista = l => {
    return Lista.create(l)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}


module.exports.updateLista = l => {
    return Lista.updateOne({_id:l._id},l)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.deleteLista = id => {
    return Lista.deleteOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.categorias = () => {
    return Lista.distinct("produtos.categoria")
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}


module.exports.prodsByCats = (id) => {
    return Lista.aggregate([{$unwind: "$produtos"}, {$match: {"produtos.categoria":id}}, {$project: {"produtos.designacao":1, "_id": 0}}])
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}