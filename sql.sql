CREATE DATABASE imobiliaria;


USE imobiliaria;


DROP TABLE IF EXISTS imovel;


CREATE TABLE imovel (
  id int NOT NULL AUTO_INCREMENT,
  tipo varchar(100) NOT NULL,
  rua varchar(100) NOT NULL,
  numero int NOT NULL,
  bairro varchar(50) NOT NULL,
  cidade varchar(50) NOT NULL,
  estado varchar(50) NOT NULL,
  pais varchar(50) NOT NULL,
  nquartos int NOT NULL,
  nsuites int NOT NULL,
  nsalas_estar int NOT NULL,
  nvagas int NOT NULL,
  area int NOT NULL,
  armario_embutido boolean NOT NULL,
  descricao varchar(400),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert  into imovel(tipo, rua, numero, bairro, cidade, estado, pais, nquartos, nsuites, nsalas_estar, nvagas, area, armario_embutido, descricao) values ('apartamento', 'Amazonas', 122, 'Gutierrez', 'Belo Horizonte', 'Minas Gerais', 'Brasil', 2, 2, 1, 2, 80, true, ''),('apartamento', 'Guaicurus', 88, 'Centro', 'Belo Horizonte', 'Minas Gerais', 'Brasil', 3, 2, 1, 3, 140, true, ''),('casa', 'Flores do Jardim', 820, 'Dona Flor', 'Nova Friburgo', 'Rio de Janeiro', 'Brasil', 4, 3, 2, 4, 600, true, '');


DROP TABLE IF EXISTS apartamento;

CREATE TABLE apartamento (
  id int NOT NULL,
  nsalas_jantar int NOT NULL,
  andar int NOT NULL,
  valor_condominio double NOT NULL,
  portaria_24h boolean NOT NULL,
  PRIMARY KEY(id),
  KEY FK_imovel(id),
  CONSTRAINT FK_imovel FOREIGN KEY(id) REFERENCES imovel(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into apartamento(id, nsalas_jantar, andar, valor_condominio, portaria_24h) values (1, 1, 5, 1050, true), (2, 2, 2, 400.39, false); 
insert into apartamento(id, nsalas_jantar, andar, valor_condominio, portaria_24h) values (5, 3, 4, 2000, true); 

DROP TABLE IF EXISTS aluguel;

CREATE TABLE aluguel (
  id int NOT NULL AUTO_INCREMENT,
  id_imovel int NOT NULL,  
  valor_aluguel double NOT NULL,
  data DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (id_imovel) REFERENCES imovel(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert  into aluguel(id_imovel, valor_aluguel, data) values (1,1000,'2018-08-11'), (2,1800,'2019-02-02'), (3,3000,'2019-03-01'), (4,7000,'2019-04-08'), (5,5000,'2019-06-08');

