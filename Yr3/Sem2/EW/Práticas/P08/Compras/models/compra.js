const mongoose = require('mongoose')

var quantidadeSchema = new mongoose.Schema({
    valor: String,
    unidade: String
});

var produtoSchema = new mongoose.Schema({
    _id: String,
    designacao: String,
    categoria: String,
    quantidade: quantidadeSchema
});

var listaSchema = new mongoose.Schema({
    _id: String,
    designacao: String,
    data: String,
    produtos: [produtoSchema]
});

module.exports = mongoose.model('lista', listaSchema)