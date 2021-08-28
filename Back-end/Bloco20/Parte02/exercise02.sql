-- Testes de comando
SELECT 10;
SELECT 'Olá mundo!';
SELECT 10 * 2;
SELECT 'João Paulo' AS Nome, 'Gomes Lima' AS Sobrenome;
SELECT NOW();
Use sakila;
SELECT * FROM sakila.actor;
SELECT city, country_id FROM city;
SELECT COUNT(*) FROM sakila.rental;
SELECT * FROM sakila.rental;
SELECT * FROM sakila.rental LIMIT 10;
-- # Query + LIMIT quantidade_de_linhas OFFSET quantidade_de_linhas
SELECT * FROM sakila.rental LIMIT 10 OFFSET 3;

-- Vamos agora entrar no banco de dados sakila e encontrar as seguintes informações, montando uma query para cada uma:
-- Escreva uma query que selecione todas as colunas da tabela city ;
SELECT * FROM city;

-- Escreva uma query que exiba apenas as colunas first_name e last_name da tabela customer ;
SELECT first_name, last_name FROM customer;

-- Escreva uma query que exiba todas as colunas da tabela rental ;
SELECT * FROM rental;

-- Escreva uma query que exiba o título, a descrição e a data de lançamento dos filmes registrados na tabela film ;
SELECT * FROM film;
SELECT title, `description`, release_year FROM film;

-- CONCAT
-- Dê uma pesquisada agora na tabela sakila.actor usando o comando SELECT * FROM sakila.actor e veja que temos uma coluna first_name e outra chamada last_name . 
-- Vamos imaginar que é necessário criar um relatório com o nome completo de um ator. 
-- Como podemos fazer isso? É fácil, basta usar a função CONCAT . 
SELECT CONCAT (first_name, last_name) FROM sakila.actor; 

-- Seu resultado ficou estranho? Eu também achei! Tente agora a query a seguir.

SELECT CONCAT(first_name, ' ', last_name) FROM sakila.actor;

-- Muito melhor, certo? Mas dá para melhorar? Dá!

SELECT CONCAT(first_name, ' ', last_name) AS 'Nome Completo' FROM sakila.actor;


-- Na tabela sakila.film , monte uma query que exiba o título e o ano de lançamento dos filmes em uma coluna e dê a ela o nome Lançamento do Filme .
SELECT * FROM sakila.film;
SELECT CONCAT(title, ' - ', release_year) AS 'Lançamento do filme' FROM sakila.film;

-- Na tabela sakila.film , crie uma query que exiba o título do filme e sua classificação indicativa (PG, G, NC-17) em apenas uma coluna. Dê a ela o nome Classificação . Não se esqueça de deixar um espaço entre as palavras para que fiquem legíveis.
SELECT CONCAT(title, ' - ', rating) AS 'Classificação' FROM sakila.film;

-- Na tabela sakila.address , monte uma query que exiba a rua e o distrito de cada registro em uma coluna apenas, e dê a essa coluna o nome Endereço .
SELECT * FROM sakila.address;
SELECT CONCAT(address, ', ', district, '.') AS 'Endereço' FROM sakila.address;

-------------------------------------------------------------------------
 -- Order by

SELECT * FROM sakila.address
ORDER BY district ASC, address_id DESC;

-- _______________________________________________________________________________________________________
-- Vamos montar o bolo com todos os ingredientes que vimos hoje
-- Para os exercícios a seguir, vamos usar a tabela sakila.film
-- Escreva uma query que exiba todos os filmes cadastrados no banco de dados.
SELECT * FROM film;


-- Escreva uma query que exiba apenas o nome dos filmes, seu ano de lançamento e sua classificação .
SELECT title, release_year, rating FROM film;

-- Quantos filmes temos cadastrados?
-- R: 1000

-- Para os exercícios a seguir, vamos usar a tabela sakila.actor
SELECT * FROM actor;

-- Escreva uma query que exiba apenas os sobrenomes únicos cadastrados.
SELECT DISTINCT last_name FROM actor;

-- Quantos sobrenomes únicos temos na tabela?
-- 121

-- Ordene os valores na tabela em ordem crescente de sobrenomes e em ordem decrescente de nome.
SELECT * FROM actor
ORDER BY last_name ASC, first_name DESC;

-- Vá até a tabela language do sakila e crie uma pesquisa que mostre os 5 idiomas cadastrados , mas não mostre o idioma english .
SELECT * FROM language
WHERE name <> 'English';

-- Vá até a tabela film e selecione todos os dados da tabela.
SELECT * FROM film;

-- Agora vamos tentar fazer o seguinte: Crie uma query para encontrar os 20 primeiros filmes , incluindo o título , o ano de lançamento , a duração , a classificação indicativa e o custo de substituição . Ordene os resultados pelos filmes com a maior duração e depois pelo menor custo de substituição.
SELECT title, release_year, `length`, rating, replacement_cost FROM  film
ORDER BY `length` DESC, replacement_cost ASC
LIMIT 20;

-- -------------------------Exercicios do dia ----------------------------------------------------------
-- Agora, a prática:
-- Exercício 1 : Faça as tarefas de 1 a 15.
-- Para realizar os exercícios do 1 ao 15, restaure o banco de dados seguinte.
DROP SCHEMA IF EXISTS Scientists;
CREATE SCHEMA Scientists;
USE Scientists;

CREATE TABLE Scientists (
  SSN INT,
  Name CHAR(30) NOT NULL,
  PRIMARY KEY (SSN)
);

CREATE TABLE Projects (
  Code CHAR(4),
  Name CHAR(50) NOT NULL,
  Hours INT,
  PRIMARY KEY (Code)
);

CREATE TABLE AssignedTo (
  Scientist INT NOT NULL,
  Project CHAR(4) NOT NULL,
  PRIMARY KEY (Scientist, Project),
  FOREIGN KEY (Scientist) REFERENCES Scientists (SSN),
  FOREIGN KEY (Project) REFERENCES Projects (Code)
);

INSERT INTO Scientists(SSN,Name)
  VALUES(123234877, 'Michael Rogers'),
    (152934485, 'Anand Manikutty'),
    (222364883, 'Carol Smith'),
    (326587417, 'Joe Stevens'),
    (332154719, 'Mary-Anne Foster'),
    (332569843, 'George ODonnell'),
    (546523478, 'John Doe'),
    (631231482, 'David Smith'),
    (654873219, 'Zacary Efron'),
    (745685214, 'Eric Goldsmith'),
    (845657245, 'Elizabeth Doe'),
    (845657246, 'Kumar Swamy');

 INSERT INTO Projects (Code, Name, Hours)
  VALUES ('AeH1' ,'Winds: Studying Bernoullis Principle', 156),
    ('AeH2', 'Aerodynamics and Bridge Design', 189),
    ('AeH3', 'Aerodynamics and Gas Mileage', 256),
    ('AeH4', 'Aerodynamics and Ice Hockey', 789),
    ('AeH5', 'Aerodynamics of a Football', 98),
    ('AeH6', 'Aerodynamics of Air Hockey', 89),
    ('Ast1', 'A Matter of Time', 112),
    ('Ast2', 'A Puzzling Parallax', 299),
    ('Ast3', 'Build Your Own Telescope', 6546),
    ('Bte1', 'Juicy: Extracting Apple Juice with Pectinase', 321),
    ('Bte2', 'A Magnetic Primer Designer', 9684),
    ('Bte3', 'Bacterial Transformation Efficiency', 321),
    ('Che1', 'A Silver-Cleaning Battery', 545),
    ('Che2', 'A Soluble Separation Solution', 778);

 INSERT INTO AssignedTo (Scientist, Project)
  VALUES (123234877, 'AeH1'),
    (152934485, 'AeH3'),
    (222364883, 'Ast3'),
    (326587417, 'Ast3'),
    (332154719, 'Bte1'),
    (546523478, 'Che1'),
    (631231482, 'Ast3'),
    (654873219, 'Che1'),
    (745685214, 'AeH3'),
    (845657245, 'Ast1'),
    (845657246, 'Ast2'),
    (332569843, 'AeH4');
    
-- Esse banco de dados é de uso livre, sendo licenciado de acordo com os termos deste link: https://creativecommons.org/licenses/by-sa/3.0/.


-- Escreva uma query para exibir a string "This is SQL Exercise, Practice and Solution".
SELECT 'This is SQL Exercise, Practice and Solution';

-- Escreva uma query para exibir três números em três colunas.
SELECT 1 AS `colun1`, 2 AS `colun2`, 3 AS `colun3`;

-- Escreva uma query para exibir a soma dos números 10 e 15.
SELECT 10 + 15;

-- Escreva uma query para exibir o resultado de uma expressão aritmética qualquer.
SELECT 2 + 5 * 3 + 4;

-- Escreva uma query para exibir todas as informações de todos os cientistas.
SELECT * FROM Scientists;

-- Escreva uma query para exibir o nome como "Nome do Projeto" e as horas como "Tempo de Trabalho" de cada projeto.
SELECT * FROM projects;
SELECT Name AS 'Nome do Projeto',
Hours AS 'Tempo de Trabalho'
FROM Projects;

-- Escreva uma query para exibir o nome dos cientistas em ordem alfabética.
SELECT * FROM Scientists;
SELECT Name FROM Scientists
ORDER BY Name;

-- Escreva uma query para exibir o nome dos Projetos em ordem alfabética descendente.
SELECT * FROM Projects;
SELECT Name FROM Projects
ORDER BY Name DESC;

-- Escreva uma query que exiba a string "O projeto Name precisou de Hours horas para ser concluído." para cada projeto.
SELECT CONCAT('O projeto "', Name, '" precisou de ', Hours, ' horas para ser concluído.')
AS `Tempo De Projeto`
FROM Projects;

-- Escreva uma query para exibir o nome e as horas dos três projetos com a maior quantidade de horas.
SELECT Name, Hours FROM Projects
ORDER BY Hours DESC
LIMIT 3;

-- Escreva uma query para exibir o código de todos os projetos da tabela AssignedTo sem que haja repetições.
SELECT * FROM AssignedTo;
SELECT DISTINCT Project FROM AssignedTo;

-- Escreva uma query para exibir o nome do projeto com maior quantidade de horas.
SELECT * FROm Projects;
SELECT Name FROM Projects
ORDER BY Hours DESC
LIMIT 1;


-- Escreva uma query para exibir o nome do segundo projeto com menor quantidade de horas.
SELECT Name FROM Projects
ORDER BY Hours
LIMIT 1 OFFSET 1;

-- Escreva uma query para exibir todas as informações dos cinco projetos com a menor quantidade de horas.
SELECT * FROM Projects
ORDER BY Hours
LIMIT 5;

-- Escreva uma query que exiba a string "Existem Number cientistas na tabela Scientists.", em que Number se refira a quantidade de cientistas.
SELECT CONCAT('Existem ', COUNT(DISTINCT Name), ' cientistas na tabela Scientists.')
AS `Quantidade de Cientistas na tabela`
FROM Scientists;
