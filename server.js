var express = require('express');
var app = express();
var bodyParser = require('body-parser');

// create application/json parser
var jsonParser = bodyParser.json();

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'senha123456',
  database : 'imobiliaria'
});
 
connection.connect();

app.get('/', function (req, res) {
  res.send('hello world')
})

app.use(function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
  next();
});

app.get('/homes', function (req, res) {
  connection.query('SELECT I.ID, I.tipo, I.rua, I.numero, I.bairro, I.cidade, I.estado, I.pais, I.nquartos, I.nsuites, I.nsalas_estar, I.nvagas, I.area, I.armario_embutido, I.descricao, A.nsalas_jantar, A.andar, A.valor_condominio, A.portaria_24h FROM imovel AS I LEFT OUTER JOIN apartamento AS A ON I.ID = A.ID ', function (error, results, fields) {
    if (error) throw error;
    console.log(results[2]);
    res.send(results);
  });
})

app.get('/rent', function (req, res) {
  connection.query('SELECT I.ID, I.tipo, I.rua, I.numero, I.bairro, I.cidade, I.estado, I.pais, I.nquartos, I.nsuites, I.nsalas_estar, I.nvagas, I.area, I.armario_embutido, I.descricao,  A.valor_aluguel, A.data FROM imovel AS I LEFT OUTER JOIN aluguel AS A ON I.ID = A.id_imovel', function (error, results, fields) {
    if (error) throw error;
    console.log(results[2]);
    res.send(results);
  });
})

app.get('/rent/houses/:id', function (req, res) {
  const id = req.params.id;
  connection.query('SELECT * FROM imovel NATURAL LEFT OUTER JOIN apartamento NATURAL LEFT OUTER JOIN aluguel WHERE  imovel.ID = ' + id, function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
})

app.post('/rent/add', jsonParser, function (req, res) {
  const data = req.body;
  connection.query('SELECT * FROM imovel AS C, casa F C.ID = F.ID', function (error, results, fields) {
    if (error) throw error;
    res.send(results);
    console.log('Apartamento 1: ', results[0]);
  });

  connection.end();
})

app.listen(3000)

