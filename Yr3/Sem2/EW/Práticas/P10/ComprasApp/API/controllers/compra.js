var Lista = require('../models/compra')

// Shop list
module.exports.list = () => {
    return Lista
            .find()
            .sort({data:-1})
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
    return Lista.updateOne({_id:l._id}, l)
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

module.exports.prodsByCateg = (id) => {
    return Lista.aggregate([{$unwind: "$produtos"}, {$match: {"produtos.categoria": id}}, {$project: {"produtos.designacao":1, _id:0}}])
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.addProduto = (id, prod) => {
    return Lista.updateOne({_id:id}, 
                { $push: { "produtos": prod } })
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.deleteProduto = (id, prod) => {
    return Lista.updateOne({ "_id": id }, 
                { $pull: {"produtos": {_id: prod}}})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}