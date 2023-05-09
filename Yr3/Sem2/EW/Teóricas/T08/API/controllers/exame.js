var Exame = require('../models/exame')

module.exports.listAll = sel => {
    return Exame.find(sel).sort({dataEMD:-1})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}


module.exports.list = sel => {
    return Exame.find(sel,{_id:1,nome:1,dataEMD:1,resultado:1}).sort({dataEMD:-1})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getExame = id => {
    return Exame.findOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.getModalidades = () => {
    //     db.exames.aggregate([{$project: {"modalidade":1}}, {$group: {_id:"$modalidade"}}])
    return Exame.aggregate([
        {$project: {"modalidade":1}},
        {$group: {_id:"$modalidade"}}
    ])
    .then(resposta => {
        return resposta
    })
    .catch(erro => {
        return erro
    })
}

module.exports.listAtletasNomeAlf = sel => {
    return Exame.find(sel,{_id:0,nome:1}).sort({nome:1})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}


module.exports.addExame = e => {
    return Exame.create(e)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}


module.exports.updateExame = e => {
    return Exame.updateOne({_id:e._id},e)
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}

module.exports.deleteExame = id => {
    return Exame.deleteOne({_id:id})
            .then(resposta => {
                return resposta
            })
            .catch(erro => {
                return erro
            })
}