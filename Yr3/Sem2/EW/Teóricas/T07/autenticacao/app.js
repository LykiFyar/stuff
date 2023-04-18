var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');


const { v4: uuidv4 } = require('uuid')
var session = require('express-session') 
var FileStore = require('session-file-store')(session)

var passport = require('passport')
var LocalStrategy = require('passport-local').Strategy
var axios = require('axios')



var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');


app.use(session({
  genid: req => {
    console.log("Dentro do middleware da sessão...")
    console.log(req.sessionID)
    return uuidv4()
  },
  store: new FileStore(),
  secret: 'O meu segredo',
  resave: false,
  saveUninitialized: true
}))

// Configuração da estratégia local
passport.use(new LocalStrategy(
  {usernameField: 'email'}, (email, passowrd, done) => {
    axios.get("http://localhost:5011/users?email=" + email)
    .then(dados => {
      const user = dados.data[0]
      if(!user) {
        return done(null, false, {message: "Credenciais inválidas!\n"})
      }
      if(passowrd != user.passowrd) {
        return done(null, false, {message: "Password inválida!\n"})
      }
      return done(null, user)
    })
    .catch(erro => done(erro))
  }
))


// Indica-se ao passport como serializar o utilizador
passport.serializeUser((user, done) => {
  console.log('Vou serializar o user na sessão: ' + JSON.stringify(user))
  // Serialização do utilizador. O passport grava o utilizador na sessão aqui
  done(null, user.id)
})

// Desserialização: a partir do id obtem-se a informação do utilizador
passport.deserializeUser((uid, done) => {
  console.log('Vou desserializar o user: ' + uid)
  axios.get('http://localhost:5011/users/' + uid)
    .then(dados => done(null, dados.data))
    .catch(erro => done(erro, false))
})



app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(passport.initialize())
app.use(passport.session())


app.use('/', indexRouter);
app.use('/users', usersRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
