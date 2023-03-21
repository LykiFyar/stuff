var mongoose = require('mongoose');
// set up a mongoose connection
var mongoDB = 'mongodb://127.0.0.1/EngWeb2023'
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });
// get default connection
var db = mongoose.connection;
// Bind connection to error event (to get notification of connection errors)
db.on('error', console.error.bind(console, 'MongoDB connection error...'));
db.once('open', function() {
    console.log("MongoDB connection established successfully");

    var studentSchema = new mongoose.Schema({
        _id: String,
        nome: String,
        gitlink: String,
        tpc1: String,
        tpc2: String,
        tpc3: String,
        tpc4: String,
        tpc5: String,
        tpc6: String,
        tpc7: String,
        tpc8: String
    });
    var studentModel = mongoose.model('student', studentSchema);
    studentModel.find({nome:{$regex:/Dias/}})
        .then(dados => {
            console.dir(dados)
        })
        .catch(erro => {
            console.log("Erro: " + erro)
        })

    console.log("That's all folks!")
});