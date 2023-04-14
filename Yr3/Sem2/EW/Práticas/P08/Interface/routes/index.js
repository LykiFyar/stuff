var express = require('express');
var router = express.Router();
var env = require("../config/env")
var axios = require('axios')

/* GET home page. */
router.get('/', function(req, res) {
  var data = new Date().toISOString().substring(0,16)
  axios.get(env.apiAcessPoint + "/listas")
  .then(response => {
    res.render('index', {lists: response.data, d: data})
  })
  .catch(erro => {
    res.render('error', {error: erro})
  })
});

router.get('/retrievelist/:id', function(req, res) {
  var data = new Date().toISOString().substring(0,16)
  axios.get(env.apiAcessPoint + "/listas/" + req.params.id)
  .then(response => {
    res.render('listaCompras', {list: response.data, d: data})
  })
  .catch(erro => {
    res.render('error', {error: erro})
  })
});

router.get('/lista/:idL/deleteProduto/:idP', function(req, res) {
  var data = new Date().toISOString().substring(0,16)
  axios.delete(env.apiAcessPoint + "/listas/" + req.params.idL + "/produtos/" + req.params.idP)
  .then(response => {
    res.redirect("/retrievelist/" + req.params.idL)
  })
  .catch(erro => {
    res.render('error', {error: erro})
  })
});

module.exports = router;
