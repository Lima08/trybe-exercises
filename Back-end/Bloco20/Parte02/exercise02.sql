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



