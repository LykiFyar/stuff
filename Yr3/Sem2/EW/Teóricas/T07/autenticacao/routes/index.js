var express = require('express');
const passport = require('passport');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  console.log("Na callback da homepage.")
  console.log(req.sessionID)
  res.render('index');
});

router.get('/login', function(req, res, next) {
  console.log("Na callback do GET login.")
  console.log(req.sessionID)
  res.render('loginForm');
});


function verificaAutenticacao(req, res, next) {
  console.log("User (verif.): " + JSON.stringify(req.user))
  if(req.isAuthenticated()) {
    next()
  }
  else res.redirect("/login")
}

router.get('/protegida', verificaAutenticacao,function(req, res, next) {
    res.send('Atingiste a área protegida!!!' + "User: " + JSON.stringify(req.user))
});




router.post('/login', passport.authenticate('local'), function(req, res, next) {
  console.log("Na callback do POST login.")
  console.log("Auth: " + JSON.stringify(req.user))
  res.redirect('/protegida');
});




module.exports = router;
