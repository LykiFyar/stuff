var mongoose = require('mongoose')

var caminhoSchema = new mongoose.Schema({
    _id : String,
    origem : String,
    destino : String,
    'distância': Number
})

module.exports = mongoose.model('caminho', caminhoSchema)