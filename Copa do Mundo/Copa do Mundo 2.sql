USE mydb;
INSERT INTO selecoes (nome_selecoes)
VALUES ("Brasil"), ("Egito"), ("Mongolia");

INSERT INTO cadastros (nome)
VALUES ("Juliano"), ("Clovis"), ("Mikael"), ("Airton"),("Jurandir");

INSERT INTO arbitragem (Cadastros_idCadastros, cargo_arbitros)
VALUES (1, "Juiz");

INSERT INTO arbitragem (Cadastros_idCadastros, cargo_arbitros)
VALUES (2, "Bandeirinha");

INSERT INTO jogadores (Cadastros_idCadastros, posicao_campo)
VALUES (3, "atacante");

INSERT INTO jogadores (Cadastros_idCadastros, posicao_campo)
VALUES (4, "atacante");

INSERT INTO estadio (nome_estadio, capacidade)
VALUES ("Gigante", 45000);

INSERT INTO estadio (nome_estadio, capacidade)
VALUES ("Arena", 29000);

INSERT INTO estadio (nome_estadio, capacidade)
VALUES ("Maracanã", 31000);

#Listando as seleções presentes no campeonato;
SELECT nome_selecoes FROM selecoes;

#Listando o nome dos Árbitros;    
SELECT a.idArbitragem, a.cargo_arbitros, b.nome FROM arbitragem as A 
INNER JOIN cadastros as B on a.Cadastros_idCadastros = b.idCadastros;

#Listando os nomes e identificadores dos jogadores;
SELECT a.idJogadores, a.posicao_campo, b.nome FROM jogadores as A 
INNER JOIN cadastros as B on a.Cadastros_idCadastros = b.idCadastros;

#Listando o nome dos estádios com capacidade superior a 30 mil torcedores;
SELECT nome_estadio FROM estadio WHERE capacidade > 30000;