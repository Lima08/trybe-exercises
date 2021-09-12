-- EXERCICIOS DO DIA
-- crie uma tabela com as seguintes restrições:
-- Nome da tabela: Filme
-- Colunas:
-- FilmeId - primary key, tipo int, incrementa por 1 cada vez que um valor é inserido automaticamente;
-- Descricao - não permite nulos, tipo texto (varchar(100));
-- AnoLancamento - não permite nulos, tipo int;
-- Nota - permite nulos, tipo int;
CREATE TABLE Filme (
  FilmeId int NOT NULL AUTO_INCREMENT,
  Descricao varchar(100)  NOT NULL,
  AnoLancamento int NOT NULL,
  Nota int,
  PRIMARY KEY (FilmeId)
);

use sakila;
INSERT INTO Filme VALUES 
(2,'Filme 2', 2020, 2);


-- Exercício 4 : Analise a tabela city e encontre a tabela à qual a coluna country_id faz referência.

SELECT * FROM city; 
SELECT * FROM country; 
-- R: Faz referencia com a tabela country

-- Exercício 5 : Após resolver o exercício anterior, responda: qual tipo de relacionamento a tabela city faz com a tabela country ?
-- R: Muitos pra um

-- Exercício 6 : Qual tipo de relacionamento a tabela country faz com a tabela city ?
-- R: Um pra muitos

-- Exercício 7 : Abra tabela por tabela do banco sakila e encontre no mínimo 3 exemplos de um relacionamentos 1:N ou N:1.
-- R: country to city: um pra muitos
--    city to country: muitos para um
--    actor to film: um pra muitos


