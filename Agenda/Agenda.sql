//CRIANDO E USANDO A BASE DE DADOS "AGENDA"
CREATE DATABASE agenda;
USE agenda;

//CRIANDO TABELAS
create table contatos (id int auto_increment, nome varchar(100) NOT NULL, PRIMARY KEY
(id));

create table rede_social (id int auto_increment, id_contatos int NOT NULL,
nome_rs varchar(20), rede_social varchar(30), PRIMARY KEY(id),
FOREIGN KEY(id_contatos) REFERENCES contatos(id));

create table email (id int auto_increment, id_contatos int NOT NULL,
email varchar(40) UNIQUE, PRIMARY KEY(id), FOREIGN KEY (id_contatos)
REFERENCES contatos(id));

create table telefone (id int auto_increment, id_contatos int, tipo varchar(20),
telefone varchar(20), PRIMARY KEY (id), FOREIGN KEY (id_contatos) 
REFERENCES contatos(id));

create table contatos_telefone (id int auto_increment, id_contatos int NOT NULL,
 id_telefone int NOT NULL, PRIMARY KEY(id), FOREIGN KEY (id_contatos) REFERENCES
contatos(id), FOREIGN KEY (id_telefone) REFERENCES telefone(id));


//INSERINDO VALORES
insert into contatos(nome) values ('Juliano'),('Rodrigo'),('Johnny'),('Mikael'), 
('Felipe'),('Batman'),('Robin'),('Pinguim'),('Mae'),('Pai');

insert into email(id_contatos,email) values (1,'juliano.quites@gmail.com'),
(2,'rodrigo.a@gmail.com'),(3,'jhony_professor@gmail.com'),(4,'mika_q@gmail.com'),
(5,'felipe.b@gmail.com'),(6,'batman@bol.com.br'),(7,'robin_amigo@ig.com.br'),
(8,'pinguim_gotham@gotham.com'),(9,'mae_ju@gmail.com'),(10,'pai_ju@gmail.com');

insert into rede_social(id_contatos,nome_rs,rede_social) values 
(1,'Facebook','facebook.com/julianoquites'),(2,'Instagram','@rodrigo_a'),
(3,'Instagram','@jhony_teacher'),(4,'Linkedin','linkedin.com/mikaq'),
(5,'Twitter','@lipe_b'),(6,'Desconhecido','Desconhecido'),
(7,'Desconhecido','Desconhecido'),(8,'Twitter','@rei_gotham'),
(9,'Facebook','facebook.com/mamaeju'),(10,'Facebook','facebook.com/papaiju');

insert into telefone(id_contatos,tipo,telefone) values (1,'Celular','981723988'),
(2,'Celular','948239104'),(3,'Celular','928745609'),(4,'Fixo','324589604'),
(5,'Celular','944444445'),(6,'Nenhum','00000000'),(7,'Nenhum','00000000'),
(8,'Celular','912345678'),(9,'Fixo','32689431'),(10,'Fixo','32689431');

insert into contatos_telefone(id_contatos,id_telefone) values (1,1),(2,2),(3,3),
(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);

