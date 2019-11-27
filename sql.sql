-- use this command to start mysqlserver
-- sudo /etc/init.d/mysql start

CREATE DATABASE imobiliaria;

USE imobiliaria;

DROP TABLE IF EXISTS apartamento;
DROP TABLE IF EXISTS aluguel;
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
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert  into imovel(tipo, rua, numero, bairro, cidade, estado, pais, nquartos, nsuites, nsalas_estar, nvagas, area, armario_embutido) values ('apartamento', 'Amazonas', 122, 'Gutierrez', 'Belo Horizonte', 'Minas Gerais', 'Brasil', 2, 2, 1, 2, 80, true),('apartamento', 'Guaicurus', 88, 'Centro', 'Belo Horizonte', 'Minas Gerais', 'Brasil', 3, 2, 1, 3, 140, true),('casa', 'Flores do Jardim', 820, 'Dona Flor', 'Nova Friburgo', 'Rio de Janeiro', 'Brasil', 4, 3, 2, 4, 600, true);

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

DROP TABLE IF EXISTS aluguel;

CREATE TABLE aluguel (
  id int NOT NULL AUTO_INCREMENT,
  id_imovel int NOT NULL,  
  valor_aluguel double NOT NULL,
  data DATE NOT NULL,
  descricao varchar(10000),
  PRIMARY KEY (id),
  FOREIGN KEY (id_imovel) REFERENCES imovel(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into aluguel(id_imovel, valor_aluguel, data, descricao) values (1,1000, '2018-08-11', 'Se você pretende hospedar-se em lugar simples, (quarto inteiro) confortável, em pequeno apartamento e preço barato para desfrutar da beleza do Rio de Janeiro você encontrou o lugar certo. O local fica otimamente bem situado na praia de Copacabana. Farta condução inclusive a poucos metros do metrô - Estação Arcoverde.'), (2,1800,'2019-02-02', 'o apartamento tem uma energia ótima, tem um espaço de leitura com bastante livros, banco pra sentar e um tapete e almofada para eventuais cochilos :p || o sofá é hiper confortável, dá pra assistir tv (tem o now, que é tipo o netflix da net, com acesso ao telecine e outros canais também) ou ficar no celular com os pés apoiados no puff. tem um imac que também pode ser usado. o espaço é ventilado e iluminado, todavia, todos os quartos têm ventilador de teto. a sala é o coração da casa, é hiper-mega compartilhada, podem usufruir à vontade'), (3,3000,'2019-03-01', 'Uma pequena suíte econômica moderna localizada perto do centro comercial e comercial de Copacabana. Propriedade convertida em Hotel Boutique em 2010, com 4 suítes, cada uma com banheiro, cama de casal. TV, Wi-Fi e frigobar.');

-- insert
--insert  into imovel(tipo, rua, numero, bairro, cidade, estado, pais, nquartos, nsuites, nsalas_estar, nvagas, area, armario_embutido, descricao) values ('apartamento', 'Avenida Cristal', 498, 'Jardim Riacho', 'Contagem', 'Minas Gerais', 'Brasil', 3, 4, 1, 2, 100, true, '');
--insert into apartamento(id, nsalas_jantar, andar, valor_condominio, portaria_24h) values ((Select max(id) from imovel), 3, 4, 2000, true); 
--insert  into aluguel(id_imovel, valor_aluguel, data) values ((Select max(id) from imovel),1000,'2018-08-11');
