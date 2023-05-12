var express = require('express');
var router = express.Router();
var Cidade = require('../controllers/cidade')
var Caminho = require('../controllers/caminho')


router.get('/cidades', function(req, res, next) {
  Cidade.list()
  .then(cidades => {
    res.jsonp(cidades)
  })
  .catch(erro => {
    res.render('error', {error: erro, message: "Erro na obtenção da lista de cidades"})
  })
});

router.get('/cidades/:id', function(req, res, next) {
  Cidade.getCidade(req.params.id)
  .then(cidade => {
    res.jsonp(cidade)
  })
  .catch(erro => {
    res.render('error', {error: erro, message: "Erro na obtenção da cidade com id " + req.params.id})
  })
});

router.get('/cidades/:id/ligacoes', function(req, res, next) {
  Caminho.getCidadeCaminhos(req.params.id)
  .then(caminhos => {
    res.jsonp(caminhos)
  })
  .catch(erro => {
    res.render('error', {error: erro, message: "Erro na obtenção dos caminhos da cidade com id " + req.params.id})
  })
});

module.exports = router;
