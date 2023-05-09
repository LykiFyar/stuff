var express = require('express');
var router = express.Router();
var Exame = require('../controllers/exame')
/*
router.get('/api/emd?res=OK', function(req, res) {
  Exame.list({resultado:true})
    .then(exams => res.status(200).json(exams))
    .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de exames"}))
});

router.get('/api/emd?modalidade=:mod', function(req, res) {
  Exame.list({modalidade:req.params.mod})
    .then(exams => res.status(200).json(exams))
    .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de exames"}))
});
*/

router.get('/api/emd', function(req, res) {
  if(req.query) {
    if(req.query.modalidade) {
      Exame.listAll({modalidade:req.query.modalidade})
        .then(exams => res.status(200).json(exams))
        .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de exames"}))
    }
    else 
      if(req.query.res && req.query.res == "OK")
          Exame.listAll({resultado:true})
          .then(exams => res.status(200).json(exams))
          .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de exames"}))

  }
  else
    Exame.list({})
    .then(exams => res.status(200).json(exams))
    .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de exames"}))
});


router.get('/api/emds', function(req, res) {
    Exame.listAll({})
    .then(exams => res.status(200).json(exams))
    .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de exames"}))
});

router.get('/api/emd/:id', function(req, res, next) {
  Exame.getExame(req.params.id)
  .then(exams => res.status(200).json(exams))
  .catch(erro => res.status(521).json({erro: erro, mensagem: "Erro na obtenção do exame: " + req.params.id}))
});


router.get('/api/modalidades', function(req, res, next) {
  Exame.getModalidades()
  .then(mods => res.status(200).json(mods))
  .catch(erro => res.status(521).json({erro: erro, mensagem: "Erro na obtenção do exame: " + req.params.id}))
});





router.get('/api/atletas', function(req, res) {
  if(req.query) {
    if(req.query.gen) {
      Exame.listAtletasNomeAlf({"género":req.query.gen, federado:true})
        .then(exams => res.status(200).json(exams))
        .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de atletas do género " + req.query.gen}))
    }
    else
      if(req.query.clube) {
        Exame.listAtletasNomeAlf({clube:req.query.clube, federado:true})
        .then(exams => res.status(200).json(exams))
        .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de atletas do clube " + req.query.clube}))
      }
  }
  else {
    Exame.listAtletasNomeAlf({federado:true})
    .then(exams => res.status(200).json(exams))
    .catch(erro => res.status(520).json({erro: erro, mensagem: "Erro na obtenção da lista de atletas do clube " + req.query.clube}))
}
  });

router.get('/api/atletas?clube=:club', function(req, res) {
  });




router.post('/emd', function(req, res, next) {
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
