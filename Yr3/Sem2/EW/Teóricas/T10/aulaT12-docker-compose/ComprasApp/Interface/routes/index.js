var express = require('express');
var router = express.Router();
var env = require('../config/env')
var axios = require('axios')

function verificaToken(req, res, next){
  if(req.cookies && req.cookies.token){
    next()
  } 
  else{
    res.redirect('/login')
  }
}

/* GET home page. */
router.get('/', function(req, res){
  res.render('index')
})

router.get('/retrieveAll', function(req, res) {
  var data = new Date().toISOString().substring(0,19)
  var token = ""
  if(req.cookies && req.cookies.token)
    token = req.cookies.token
  
  axios.get('http://data_server/listas')
    .then(response => {
      res.render('listas', { lists: response.data, d: data });
    })
    .catch(err => {
      res.render('error', {error: err})
    })
});

router.get('/retrieveList/:id', function(req, res) {
  var data = new Date().toISOString().substring(0,19)
  axios.get('http://data_server/listas/' + req.params.id)
    .then(response => {
      res.render('listaCompras', { list: response.data, d: data });
    })
    .catch(err => {
      res.render('error', {error: err})
    })
});

router.get('/lista/:idLista/deleteProduto/:idProd', function(req, res) {
  var data = new Date().toISOString().substring(0,19)
  console.log(req.params.idProd)
  axios.delete('http://data_server/listas/'+ req.params.idLista +"/produtos/"+ req.params.idProd)
    .then(response => {
      res.redirect('/retrieveList/' + req.params.idLista)
    })
    .catch(err => {
      res.render('error', {error: err})
    })
});

// Tratamento do Login
router.get('/login', function(req, res){
  res.render('loginForm')
})

router.post('/login', function(req, res){
  axios.post('http://auth_server:8002/users/login', req.body)
    .then(response => {
      res.cookie('token', response.data.token)
      res.redirect('/')
    })
    .catch(e =>{
      res.render('error', {error: e, message: "Credenciais inválidas"})
    })
})

// Register

router.get('/register', (req, res) => {
  res.render('registerForm')
})

router.post('/register', (req, res) => {
  axios.post('http://auth_server:8002/users/register', req.body)
    .then(response => {
      // Falta fazer a template de confirmação do registo
      res.redirect('/')
    })
    .catch(err => {
      res.render('error', {error: err})
    })
})

module.exports = router;
