INSERT INTO fases (fases) VALUES 
("Quartas de Final"), ("Semifinal"), ("Final");

INSERT INTO times (times) VALUES
("Brasil"), ("Uruguai"), ("Argentina"), 
("Paraguai"),("Peru"), ("Chile"), ("Bolívia"), ("Colômbia");   

INSERT INTO 
jogo (partida, publico, gols_a_favor, 
gols_contra, penalti_convertido, chutes, 
chutes_gol, impedimento, escanteio, cartao_amarelo, 
cartao_vermelho, expulsao_cartao_amarelo, faltas_cometidas,
faltas_sofridas, Fases_idFases)
VALUES
("Brasil x Uruguai", 30000, 3, 0, 0, 10, 5, 3, 10, 1, 1, 0, 5, 5, 1);

INSERT INTO 
jogo (partida, publico, gols_a_favor, 
gols_contra, penalti_convertido, chutes, 
chutes_gol, impedimento, escanteio, cartao_amarelo, 
cartao_vermelho, expulsao_cartao_amarelo, faltas_cometidas,
faltas_sofridas, Fases_idFases)
VALUES
("Argentina x Paraguai",30000, 5, 0, 0, 15, 5, 3, 10, 0, 0, 0, 0, 0, 1);

INSERT INTO 
jogo (partida, publico, gols_a_favor, 
gols_contra, penalti_convertido, chutes, 
chutes_gol, impedimento, escanteio, cartao_amarelo, 
cartao_vermelho, expulsao_cartao_amarelo, faltas_cometidas,
faltas_sofridas, Fases_idFases)
VALUES
("Peru x Chile", 45000, 2, 0, 0, 13, 5, 0, 0, 0, 0, 0, 0, 0, 1);

INSERT INTO 
jogo (partida, publico, gols_a_favor, 
gols_contra, penalti_convertido, chutes, 
chutes_gol, impedimento, escanteio, cartao_amarelo, 
cartao_vermelho, expulsao_cartao_amarelo, faltas_cometidas,
faltas_sofridas, Fases_idFases)
VALUES
("Bolívia x Colômbia", 45000, 1, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 1);

INSERT INTO 
jogo (partida, publico, gols_a_favor, 
gols_contra, penalti_convertido, chutes, 
chutes_gol, impedimento, escanteio, cartao_amarelo, 
cartao_vermelho, expulsao_cartao_amarelo, faltas_cometidas,
faltas_sofridas, Fases_idFases)
VALUES
("Brasil x Argentina", 10000, 1, 0, 0, 13, 5, 0, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO 
jogo (partida, publico, gols_a_favor, 
gols_contra, penalti_convertido, chutes, 
chutes_gol, impedimento, escanteio, cartao_amarelo, 
cartao_vermelho, expulsao_cartao_amarelo, faltas_cometidas,
faltas_sofridas, Fases_idFases)
VALUES
("Peru x Colômbia", 10000, 1, 0, 0, 5, 3, 0, 0, 0, 0, 0, 0, 0, 2);

INSERT INTO 
jogo (partida, publico, gols_a_favor, 
gols_contra, penalti_convertido, chutes, 
chutes_gol, impedimento, escanteio, cartao_amarelo, 
cartao_vermelho, expulsao_cartao_amarelo, faltas_cometidas,
faltas_sofridas, Fases_idFases)
VALUES
("Brasil x Colômbia", 10000, 7, 0, 0, 7, 9, 0, 0, 0, 0, 0, 0, 0, 3);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (1,1,1);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (1,1,2);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (2,1,3);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (2,1,4);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (3,1,5);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (3,1,6);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (4,1,7);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (4,1,8);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (5,2,1);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (5,2,3);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (6,2,6);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (6,2,8);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (7,3,1);

INSERT INTO 
jogo_has_times (Jogo_idJogo, Jogo_Fases_idFases, Times_idTimes)
VALUES (7,3,8);

CREATE VIEW SA2_ETAPA1 AS
SELECT jogo.partida, fases.fases, jogo.publico, jogo.gols_a_favor, 
jogo.gols_contra, jogo.penalti_convertido, jogo.chutes, 
jogo.chutes_gol, jogo.impedimento, jogo.escanteio, jogo.cartao_amarelo, 
jogo.cartao_vermelho, jogo.expulsao_cartao_amarelo, jogo.faltas_cometidas,
jogo.faltas_sofridas FROM jogo JOIN fases ON jogo.Fases_idFases = fases.idFases

SELECT * FROM SA2_ETAPA1;

 CREATE VIEW SA2_ETAPA1_2 AS 
SELECT fases.fases AS "Fases", count(jogo.Fases_idFases) 
as "Número de Jogos",  sum(gols_a_favor) as "Número de Gols",
count(jogo.idJogo)/sum(gols_a_favor) as "Média de Gols"
from fases join jogo
 on fases.idFases = jogo.Fases_idFases group by fases.fases;
 
 SELECT * FROM SA2_ETAPA1_2;
 
 
 CREATE USER 'Adm'@'localhost' IDENTIFIED BY
 '111222333';
 GRANT ALL PRIVILEGES ON *.* TO 
 'Adm'@'localhost';
 CREATE USER 'padrão'@'localhost' IDENTIFIED BY
 '000000';
 GRANT UPDATE ON *.* TO 'padrão'@'localhost';
 CREATE USER 'Restrito'@'localhost' IDENTIFIED BY
 '11111';
 GRANT INSERT, SELECT ON *.* TO 'Restrito'
 @'localhost';
 CREATE USER 'Consulta'@'localhost' IDENTIFIED BY
 '12345';
 GRANT SELECT ON *.* TO 'Consulta'@'localhost';
 FLUSH PRIVILEGES;
 
 
 