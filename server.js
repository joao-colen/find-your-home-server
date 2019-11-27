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

// show all homes
app.get('/homes', function (req, res) {
  connection.query('SELECT * from apartamento NATURAL RIGHT JOIN imovel' , function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
})

// show all homes with rent information
app.get('/rent', function (req, res) {
  connection.query('SELECT * from aluguel NATURAL JOIN imovel NATURAL LEFT JOIN apartamento', function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
})

// show especific home for rent
app.get('/rent/houses/:id', function (req, res) {
  const id = req.params.id;
  connection.query('SELECT * from aluguel NATURAL JOIN imovel NATURAL LEFT JOIN apartamento WHERE  imovel.ID = ' + id, function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
})

app.post('/rent/add', function (req, res) {
  console.log(res.body);
  //let query = "insert  into imovel(tipo, rua, numero, bairro, cidade, estado, pais, nquartos, nsuites, nsalas_estar, nvagas, area, armario_embutido) values (" + req.tipo + "," +  req.rua + "," + req.numero + "," + req. bairro;
  //query += ","+ req.cidade + "," + req.estado + "," + req.pais + "," + req.nquartos + "," + req.nsuites + "," + req.nsalas_estar + "," + req.nvagas + "," + req.area + "," +  req.armario_embutido + ");";
  //connection.query(query, function (error, results, fields) {
    //if (error) throw error;
    //res.send(results);
  //});
  //if(req.tipo == 'apartamento') {
    //query2 = "insert into apartamento(id, nsalas_jantar, andar, valor_condominio, portaria_24h) values ((Select max(id) from imovel)," + req.nsalas_jantar + "," + req.andar + "," + req.valor_condominio + "," + req.portaria_24h +");";
    //connection.query(query2, function (error, results, fields) {
      //if (error) throw error;
      //res.send(results);
    //});
  //}
  //query3 = "insert  into aluguel(id_imovel, valor_aluguel, data, descricao) values ((Select max(id) from imovel)," + req.valor_aluguel + "," + req.data + "," + req.descricao + " );"
  //connection.query(query3, function (error, results, fields) {
    //if (error) throw error;
    //res.send(results);
  //});
})
app.listen(3000)

