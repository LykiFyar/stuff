var express = require('express');
var router = express.Router();
var Aluno = require('../controllers/aluno')

/* GET home page. */
router.get('/', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.list()
    .then(alunos => {
      res.render('index', { slist: alunos, d: data });
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção da lista de alunos"})
    })
});

// GET Student Form
router.get('/alunos/registo', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  res.render('addForm', { d: data });
});

/* GET Student page. */
router.get('/alunos/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.getAluno(req.params.idAluno)
    .then(aluno => {
      res.render('aluno', { a: aluno, d: data });
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção do registo de aluno"})
    })
});

/* GET Student Update page. */
router.get('/alunos/edit/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.getAluno(req.params.idAluno)
    .then(aluno => {
      res.render('updateForm', { a: aluno, d: data });
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção do registo de aluno"})
    })
});

/* GET Student Delete page. */
router.get('/alunos/delete/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.getAluno(req.params.idAluno)
    .then(aluno => {
      res.render('deleteForm', { a: aluno, d: data });
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção do registo de aluno"})
    })
});

router.get('/alunos/deleteConfirm/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.deleteAluno(req.params.idAluno)
    .then(aluno => {
      res.redirect('/')
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção do registo de aluno"})
    })
});

// POST Student 
router.post('/alunos/registo', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.addAluno(req.body)
    .then(aluno => {
      res.render('addAlunoConfirm', {a: aluno, d: data })
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro no armazenamento do registo de aluno"})
    })
});

router.post('/alunos/edit/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.updateAluno(req.body)
    .then(aluno => {
      res.render('updateAlunoConfirm', {a: aluno, d: data })
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na alteração do registo de aluno"})
    })
});
module.exports = router;
