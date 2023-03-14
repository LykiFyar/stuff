var express = require('express');
var router = express.Router();
var Aluno = require('../controllers/aluno')

/* GET home page. */
router.get('/', function(req, res, next) {
  var data = new Date().toISOString().substring(0,16)
  Aluno.list()
    .then(alunos => {
      res.render('index', {slist: alunos, d: data});
    }) 
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção da lista de alunos"})
    })
  
});

/* GET student page. */
router.get('/alunos/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0,16)
  Aluno.getAluno(req.params.idAluno)
    .then(aluno => {
      res.render('aluno', {a: aluno, d: data});
    }) 
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção da lista de alunos"})
    })
  
});


module.exports = router;
