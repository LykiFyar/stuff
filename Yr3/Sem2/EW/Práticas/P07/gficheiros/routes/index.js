var express = require('express');
var router = express.Router();
var jsonfile = require('jsonfile');
var fs = require('fs');

var multer = require('multer')

var upload = multer({dest: 'uploads'})

/* GET home page. */
router.get('/', function(req, res, next) {
  var data = new Date().toISOString().substring(0,19)
  jsonfile.readFile(__dirname + "/../data/dbfiles.json", (err, registos) => {
    if(err) {
      res.render('error', {error: err})
    }
    else {
      res.render('fileManager', {files: registos, d: data})
    }
  })
});

router.get('/download/:fname', function(req,res) {
  res.download(__dirname + "/../public/fileStore/" + req.params.fname)
})

router.post('/files', upload.single('myFile'), (req,res) => {
  console.log('cdir: ' + __dirname)
  let oldPath = __dirname + '/../' + req.file.path
  console.log('old: ' + oldPath)
  let newPath = __dirname + "/../public/fileStore/" + req.file.originalname
  console.log('new: ' + newPath)

  fs.rename(oldPath, newPath, err => {
    if(err) console.log(err)
  })

  var data = new Date().toISOString().substring(0,19)
  var files = jsonfile.readFileSync(__dirname + '/../data/dbfiles.json')
  files.push({
    date: data,
    name: req.file.originalname,
    mimetype: req.file.mimetype,
    size: req.file.size,
    desc: req.body.desc
  })

  jsonfile.writeFileSync(__dirname + '/../data/dbfiles.json', files)
  res.redirect('/')
})

module.exports = router;
