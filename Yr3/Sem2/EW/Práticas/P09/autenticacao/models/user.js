var mongoose = require('mongoose')
const passport = require('passport')
var passportLocalMongoose = require('passport-local-mongoose')
var Schema = mongoose.Schema


var userSchema = Schema({
    username: String,
    password: String,
    name: String,
    level: String,
    dateCreated: String,
    active: Boolean
})

userSchema.plugin(passportLocalMongoose)

module.exports = mongoose.model('user', userSchema)