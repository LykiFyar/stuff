var mongoose = require('mongoose');
// set up a mongoose connection
var mongoDB = 'mongodb://127.0.0.1/world'
mongoose.connect(mongoDB, { useNewUrlParser: true, useUnifiedTopology: true });
// get default connection
var db = mongoose.connection;
// Bind connection to error event (to get notification of connection errors)
db.on('error', console.error.bind(console, 'MongoDB connection error...'));
db.once('open', function() {
    console.log("MongoDB connection established successfully");
});