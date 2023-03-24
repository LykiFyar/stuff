var mongoose = require('mongoose')


var examSchema = new mongoose.Schema({
    _id: String,
    index: Number,
    dataEMD: String,
    nome: {
        primeiro: String,
        'último': String,
    },
    idade: Number,
    'género': String,
    morada: String,
    modalidade: String,
    clube: String,
    email: String,
    federado: Boolean,
    resultado: Boolean,
});

module.exports = mongoose.model('exame', examSchema);