var express = require('express');
var router = express.Router();
var env = require('../config/env')
var axios = require('axios')
var jwt = require('jsonwebtoken')


function verificaToken(req, res, next) {
  if(req.cookies && req.cookies.token) next()
  else {
    res.redirect("/login")
  }
}

/* GET home page. */
router.get('/', function(req, res){
  if(req.cookies && req.cookies.token) {
    jwt.verify(req.cookies.token, "EngWeb2023", function(e, payload){
      if(e){
        res.render('index')
      }
      else{
        res.render('index', {u: payload})
      }
    })
  }
  else res.render('index')
})

router.get('/retrieveAll', verificaToken, function(req, res) {
  var data = new Date().toISOString().substring(0,19)
  axios.get(env.apiAccessPoint+"/listas?token=" + req.cookies.token)
    .then(response => {
      res.render('listas', { lists: response.data, d: data });
    })
    .catch(err => {
      res.render('error', {error: err})
    })
});

router.get('/retrieveList/:id', verificaToken, function(req, res) {
  var data = new Date().toISOString().substring(0,19)
  axios.get(env.apiAccessPoint+"/listas/" + req.params.id + "?token=" + req.cookies.token)
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
  axios.delete(env.apiAccessPoint+"/listas/"+ req.params.idLista +"/produtos/"+ req.params.idProd)
    .then(response => {
      res.redirect('/retrieveList/' + req.params.idLista)
    })
    .catch(err => {
      res.render('error', {error: err})
    })
});


router.get("/login", function(req,res) {
  res.render("loginForm")
})

router.post("/login", (req, res) => {
  axios.post(env.authAccessPoint + "/login", req.body)
    .then(response => {
      res.cookie("token", response.data.token)
      res.redirect('/')
    })
    .catch(err => {
      res.render('error', {error: err})
    })
})


router.get("/logout", verificaToken, (req,res) => {
  res.cookie('token', "revogado.revogado.revogado")
  res.redirect('/')
})


router.get("/register",verificaToken, function(req,res) {
  res.render("registerForm")
})

router.post("/register", verificaToken, (req, res) => {
  axios.post(env.authAccessPoint + "/register?token=" + req.cookies.token, req.body)
    .then(response => {
      res.redirect('/')
    })
    .catch(err => {
      res.render('error', {error: err})
    })
})


module.exports = router;
