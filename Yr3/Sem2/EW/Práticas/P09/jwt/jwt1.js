var jwt = require('jsonwebtoken');
try{
    var token = jwt.sign({
        username: 'jcr',
        level: 'editor',
        expiresIn: 30
    },
    'EngWeb2023');
    console.log('Token: ' + token)
}
catch(e) {
    console.log("Erro na criação do token: " + e)
}