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

/* GET Student Form. */
router.get('/alunos/registo', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  res.render('addAlunoForm', {d: data})
});

/* GET Student Edit page. */
router.get('/alunos/edit/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.getAluno(req.params.idAluno)
    .then(aluno => {
      res.render('editAlunoForm', {a: aluno, d: data });
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção do registo de aluno"})
    })
});

/* GET Student Delete Form Confirmation. */
router.get('/alunos/delete/:idAluno/confirm', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.deleteAluno(req.params.idAluno)
    .then(aluno => {
      res.redirect("/")
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção do registo de aluno"})
    })
});

/* GET Student Delete Form. */
router.get('/alunos/delete/:idAluno', function(req, res, next) {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.getAluno(req.params.idAluno)
    .then(aluno => {
      res.render('deleteAlunoForm', {a: aluno, d: data });
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na obtenção do registo de aluno"})
    })
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

// POST Student Create Form
router.post('/alunos/registo', (req,res) => {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.addAluno(req.body)
    .then(aluno => {
      res.render('addAlunoConfirm', { a: aluno})
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na adição do aluno"})
    })
    });

// POST Student Edit Form
router.post('/alunos/edit', (req,res) => {
  var data = new Date().toISOString().substring(0, 16)
  Aluno.editAluno(req.body)
    .then(aluno => {
      res.render('editAlunoConfirm', { a: aluno})
    })
    .catch(erro => {
      res.render('error', {error: erro, message: "Erro na edição do aluno"})
    })
    });


module.exports = router;
