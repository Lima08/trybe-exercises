-- ----------------- Descomplicando JOINs, UNIONs e Subquerie---------------------------------------------
-- Aprendizado sobre como::
-- Utilizar INNER JOIN para combinar dados de duas ou mais tabelas
-- Utilizar LEFT JOIN e RIGHT JOIN para combinar dados de duas ou mais tabelas
-- Utilizar SELF JOIN para fazer join de uma tabela com ela própria
-- Unir resultados com UNION e UNION ALL
-- Utilizar SUBQUERIES
-- Criar queries mais eficientes através do EXISTS
--  Join permite combinarmos os registro de duas ou mais tabelas
-- Union permite acrescentar os resultados de uma query em outra
--  Utilizamos o EXISTS como um filtro que verifica se já existe ou não algum dado no resultado da consulta.
--  SUBQUERY faz uma sub consulta dentro de uma outra query.

-----------------------------------------------------------------------------

-- Comandos :
-- INNER JOIN
-- LEFT JOIN
-- RIGHT JOIN
-- SELF JOIN
-- UNION
-- UNION ALL
-- SUBQUERIES
-- EXISTS
-- ON

-----------------------------------------------------------------
------------------ UTILIZANDO JOINS-----------------------------

-- o INNER JOIN permite retornar todos os resultados em que a condição da cláusula ON for satisfeita. A sintaxe de um INNER JOIN é a seguinte:
SELECT t1.coluna, t2.coluna
FROM tabela1 AS t1
INNER JOIN tabela2 AS t2
ON t1.coluna_em_comum = t2.coluna_em_comum;

--  Para fazermos query em duas tabelas temos os seguintes passos:
-- 1 - No SELECT colocamos todas as colunas que iremos utilizar de ambas as tabelas.
-- 2 - No FROM escolhemos a tabela base de consulta e colocamos um apelido nela com o AS
-- 3 - Voltamos no SELECT e agora referenciamos o apelido da tabela nas colunas que ela possui e que desejamos consultas.
-- 4 - Fazemos o JOIN na terceira linha informando qual tabela estamos mesclando, damos um apelido a ela tambem, e no SELECT referenciamos a tabela e coluna que queremos, da mesma forma que fizemso no passo 2.
-- 5 - Dizemos na linha 3 com ON qual o campo que desejamos relacionar em nossa query. (chave extrangeira em uma tabela que corresponde a chave primaria  em outra.)

--  EX:
SELECT * FROM sakila.country;
SELECT * FROM sakila.city;
SELECT city.city, city.country_id, country.country
FROM sakila.city AS city
INNER JOIN sakila.country AS country
ON country.country_id = city.country_id; -- O relacionamento se dá aqui. O encontro das duas informações correspondentes.

SELECT f.title, f.language_id, l.name
FROM sakila.film AS f
INNER JOIN sakila.language AS l
ON f.language_id = l.language_id;


--------------------------------- Ex de fixação ----------------------------
-- Vamos ver agora alguns desafios para consolidar esse conhecimento sobre o INNER JOIN , utilizando o banco de dados sakila . Antes de começar a escrever suas queries , identifique quais tabelas contêm as informações de que você precisa e como elas estão relacionadas.

-- Monte uma query que exiba o id do ator , nome do ator e id do filme em que ele já atuou usando as tabelas actor e film_actor.
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.actor;
SELECT f.actor_id, a.first_name, f.film_id
FROM sakila.actor AS a
INNER JOIN sakila.film_actor AS f
ON f.actor_id = a.actor_id;


-- Use o JOIN para exibir o nome , sobrenome e endereço de cada um dos funcionários do banco. Use as tabelas staff e address .
SELECT * FROM sakila.address;
SELECT * FROM sakila.staff;
SELECT s.first_name, s.last_name, a.`address`
FROM sakila.staff AS s
INNER JOIN sakila.address AS a
On  a.address_id = s.address_id;



-- Exiba o id do cliente , nome e email dos primeiros 100 clientes, ordenados pelo nome em ordem decrescente, juntamente com o id do endereço e o nome da rua onde o cliente mora. Essas informações podem ser encontradas nas tabelas customer e address .
SELECT * FROM sakila.customer;
SELECT * FROM sakila.address;
SELECT c.customer_id, c.first_name, c.email, a.address_id, a.`address`
FROM sakila.customer AS c
INNER JOIN sakila.address AS a
ON  a.address_id = c.address_id
ORDER BY c.first_name DESC
LIMIT 100;


-- Exiba o nome , email , id do endereço , endereço e distrito dos clientes que moram no distrito da California e que contêm "rene" em seus nomes. As informações podem ser encontradas nas tabelas address e customer .
SELECT * FROM sakila.customer;
SELECT * FROM sakila.address;
SELECT c.first_name, c.email, a.address_id, a.`address`, a.district
FROM sakila.customer AS c
INNER JOIN sakila.address AS a
ON a.address_id = c.address_id
WHERE a.district = 'California' AND c.first_name LIKE '%rene%';


-- Exiba o nome e a quantidade de endereços dos clientes cadastrados. Ordene seus resultados por nomes de forma decrescente. Exiba somente os clientes ativos. As informações podem ser encontradas na tabela address e customer .
SELECT * FROM sakila.customer;
SELECT * FROM sakila.address;
SELECT c.first_name, COUNT(a.address_id) AS `quantidade de endereço`
FROM sakila.customer AS c
INNER JOIN sakila.address as a
ON a.address_id = c.address_id
WHERE c.active = 1
GROUP BY c.first_name
ORDER BY c.first_name DESC;


-- Monte uma query que exiba o nome , sobrenome e a média de valor ( amount ) paga aos funcionários no ano de 2006. Use as tabelas payment e staff . Os resultados devem estar agrupados pelo nome e sobrenome do funcionário.
-- SELECT * FROM sakila.customer;
-- SELECT * FROM sakila.address;




-- Monte uma query que exiba o id do ator , nome , id do filme e título do filme , usando as tabelas actor , film_actor e film . Dica: você precisará fazer mais de um JOIN na mesma query .
-- SELECT * FROM sakila.customer;
-- SELECT * FROM sakila.address;


-- Até o momento, temos produzido resultados apenas quando temos valores correspondentes em ambas as colunas de referência. Porém, o que devemos fazer quando possivelmente apenas uma das tabelas possui um valor correspondente existente? É possível que você tenha que usar o LEFT JOIN ou RIGHT JOIN nessas situações.
-- SELECT * FROM sakila.customer;
-- SELECT * FROM sakila.address;


