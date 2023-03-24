var express = require('express');
var router = express.Router();
var Exame = require('../controllers/exame')


router.get('/emds', function(req, res) {
  Exame.list()
    .then(exams => res.status(200).json(exams))
    .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de exames"}))
});

router.get('/emds/:idExam', function(req, res, next) {
  Exame.getExame(req.params.idExam)
  .then(exams => res.status(200).json(exams))
  .catch(erro => res.status(521).json({erro: erro, mensagem: "Erro na obtenção do exame: " + req.params.idExam}))
});

router.post('/emds', function(req, res, next) {
  Exame.addExame(req.body)
  .then(exams => res.status(201).json(req.body))
  .catch(erro => res.status(522).json({erro: erro, mensagem: "Erro a adicionar o exame"}))
});

router.put('/emds/:idExam', function(req, res, next) {
  Exame.updateExame(req.body)
    .then(dados => res.status(200).json(dados))
    .catch(erro => res.status(523).json({erro: erro, mensagem: "Erro a alterar exame"}))
});

router.delete('/emds/:idExam', function(req, res, next) {
  Exame.deleteExame(req.params.idExam)
    .then(dados => res.status(200).json(dados))
    .catch(erro => res.status(524).json({erro: erro, mensagem: "Erro a apagar exame"}))
});

module.exports = router;
