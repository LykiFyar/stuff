var express = require('express');
var router = express.Router();
var passport = require('passport')

/* GET home page. */
router.get('/', function(req, res) {
  if(req.isAuthenticated()) {
    res.render('index', {u:req.user})
  }
  else res.render('index');
});

function verificaAutenticacao(req, res, next){
  console.log('User (verif.): ' + JSON.stringify(req.user))
  if(req.isAuthenticated()){
  //req.isAuthenticated() will return true if user is logged in
      next();
  } else{
    res.redirect("/login");
  }
}

router.get('/protegida', verificaAutenticacao, 
(req,res) => {
   			res.send('Atingiste a área protegida!!!' + 'User: ' + JSON.stringify(req.user))
})

// Login page
router.get('/login', function(req, res) {
  console.log('Na cb do GET login...')
  console.log(req.sessionID)
  res.render('loginForm')
})
  
router.post('/login', passport.authenticate('local'), function(req, res) {
  console.log('Na cb do POST login...')
  console.log('Auth: ' + JSON.stringify(req.user))
 	res.redirect('/')
})


router.get('/logout', function(req,res) {
  req.logout(function(err) {
    if(err) {
      console.log("Logout error: " + err)
      res.render('error', {error: err})
    }
    else {
      res.redirect('/')
    }
  })
})

// Register
router.get('/register', function(req,res) {
  res.render('registerForm')
})



var userModel = require('../models/user')
router.post('/register', function(req,res) {
  var d = new Date().toISOString().substring(0,16)
  userModel.register(new userModel({username: req.body.username,
                                    name: req.body.name,
                                    level: req.body.level,
                                    dateCreated: d,
                                    active: true
                                  }), 
                                  req.body.password, 
                                  function(err, user) {
                                    if(err) {
                                      console.log("Register error: " + err)
                                      res.render('error', {error:err})
                                    }
                                    else {
                                      passport.authenticate('local')(req,res, function() {
                                        res.redirect('/')
                                      })
                                    }
                                  })
})

  

module.exports = router;
