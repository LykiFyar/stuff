var express = require('express');
var router = express.Router();
var Lista = require('../controllers/compra')

// GET: os vários pedidos

router.get('/api/listas', function(req, res, next) {
  Lista.list()
    .then(listas => {
      res.jsonp(listas)
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção das listas de compras"})
    })
});

router.get('/api/listas/:id', function(req, res) {
  Lista.getLista(req.params.id)
    .then(lista => {
      res.jsonp(lista)
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção da lista de compras"})
    })
});

router.get('/api/categorias', function(req, res) {
  Lista.categorias()
    .then(lista => {
      res.jsonp(lista)
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção das categorias"})
    })
});

router.get('/api/categorias/:id/produtos', function(req, res) {
  Lista.prodsByCateg(req.params.id)
    .then(lista => {
      res.jsonp(lista)
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção das categorias"})
    })
});

// POST: de uma lista de compras

router.post('/api/listas', function(req, res) {
  Lista.addLista(req.body)
    .then(lista => {
      res.jsonp(lista)
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na inserção da lista"})
    })
})

// POST: de um produto numa lista de compras

router.post('/api/listas/:id/produtos', function(req, res) {
  Lista.addProduto(req.params.id, req.body)
    .then(dados => {
      res.jsonp(dados)
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na inserção de um produto"})
    })
})

// DELETE de um produto numa lista de compras

router.delete('/api/listas/:id/produtos/:prod', function(req, res) {
  Lista.deleteProduto(req.params.id, req.params.prod)
    .then(dados => {
      res.jsonp(dados)
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na inserção de um produto"})
    })
})


module.exports = router;
