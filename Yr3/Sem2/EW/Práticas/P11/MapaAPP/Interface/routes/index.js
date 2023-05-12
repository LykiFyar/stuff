var express = require('express');
var router = express.Router();
var axios = require('axios')

/* GET home page. */
router.get('/', function(req, res) {
  var data = new Date().toISOString().substring(0,16)
  axios.get("http://localhost:8020/cidades")
  .then(response => {
    res.render('index', {cidades: response.data, d: data})
  })
  .catch(erro => {
    res.render('error', {error: erro})
  })
});


router.get('/:id', function(req, res) {
  var data = new Date().toISOString().substring(0,16)
  axios.get("http://localhost:8020/cidades/"+req.params.id)
  .then(response1 => {
    axios.get("http://localhost:8020/cidades/"+req.params.id+"/ligacoes")
    .then(response2 => {
      res.render('cidade', {cidade: response1.data, caminhos: response2.data, d: data})
    })
    .catch(erro => {
      res.render('error', {error: erro})
    })
  })
  .catch(erro => {
    res.render('error', {error: erro})
  })
});

module.exports = router;
