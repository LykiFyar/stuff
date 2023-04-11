var express = require('express');
var router = express.Router();
var Lista = require('../controllers/lista')

/* GET home page. */
router.get('/api/listas', function(req, res) {
  Lista.list()
    .then(lists => res.status(200).jsonp(lists))
    .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da listas de compras"}))
});

router.get('/api/listas/:id', function(req, res) {
  Lista.getLista()
    .then(list => res.status(200).jsonp(list))
    .catch(erro => res.status(521).json({erro: erro, mensagem: "Erro na obtenção da lista de compras"}))
});

router.get('/api/categorias', function(req, res) {
  Lista.categorias()
    .then(cats => res.status(200).jsonp(cats))
    .catch(erro => res.status(522).json({erro: erro, mensagem: "Erro na obtenção das categorias"}))
});

router.get('/api/categorias/:id/produtos', function(req, res) {
  Lista.prodsByCat(req.params.id)
    .then(prods => res.status(200).jsonp(prods))
    .catch(erro => res.status(522).json({erro: erro, mensagem: "Erro na obtenção das categorias"}))
});



module.exports = router;
