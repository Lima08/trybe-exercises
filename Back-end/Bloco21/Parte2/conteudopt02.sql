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
SELECT * FROM sakila.payment;
SELECT * FROM sakila.staff;
SELECT s.first_name, s.last_name, ROUND(AVG(p.amount), 2) AS `Média de pagamentos`
FROM sakila.staff AS s
INNER JOIN sakila.payment AS p
ON s.staff_id = p.staff_id
WHERE YEAR(p.payment_date) = 2006
GROUP BY s.first_name, s.last_name;


-- Monte uma query que exiba o id do ator , nome , id do filme e título do filme , usando as tabelas actor , film_actor e film . Dica: você precisará fazer mais de um JOIN na mesma query .
SELECT * FROM sakila.actor;
SELECT * FROM sakila.film_actor;
SELECT * FROM sakila.film;
SELECT a.actor_id, a.first_name, f.film_id, f.title
FROM sakila.actor AS a
INNER JOIN sakila.film_actor AS af
ON a.actor_id = af.actor_id
INNER JOIN sakila.film AS f
ON af.film_id = f.film_id ;

--  TBM PODEMOS FAZER ASSIM:
-- SELECT a.first_name, f.title
-- FROM sakila.actor AS a
-- INNER JOIN sakila.film_actor AS af
-- ON a.actor_id = af.actor_id
-- INNER JOIN sakila.film AS f
-- ON af.film_id = f.film_id ;

--------------------------------------------------------------------------------------------------------------
-------------- Como utilizar o LEFT JOIN e o RIGHT JOIN -------------------------------------
-- Até o momento, temos produzido resultados apenas quando temos valores correspondentes em ambas as colunas de referência. Porém, o que devemos fazer quando possivelmente apenas uma das tabelas possui um valor correspondente existente? É possível que você tenha que usar o LEFT JOIN ou RIGHT JOIN nessas situações.

-- O conceito é o mesmo. A direfença é que conforme a posição das tabelas no SELECT a prioridade de trazer os valores é dada pelo comando LEFT e RIGHT
-- LEFT JOIN
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.actor_id,
    a.first_name,
    a.last_name
FROM customer AS c
LEFT JOIN actor AS a
ON c.last_name = a.last_name
ORDER BY c.last_name;


-- RIGHT JOIN
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    a.actor_id,
    a.first_name,
    a.last_name
FROM customer AS c
RIGHT JOIN actor AS a
ON c.last_name = a.last_name
ORDER BY c.last_name;


---------------------------- O que é SELF JOIN e quando utilizá-lo  ------------------------------------
-- Até o momento, temos usado mais de uma tabela para analisar dados e gerar informação. No entanto, a informação a ser analisada pode estar concentrada em apenas uma tabela. Nesse cenário, o SELF JOIN pode ser usado para criar resultados relevantes.
-- BAsicamente comparamos a tabela com ela mesmo dando dois apelidos para ela.

-- EX:
SELECT t1.title, t1.replacement_cost, t2.title, t2.replacement_cost
FROM sakila.film AS t1, sakila.film AS t2
WHERE t1.length = t2.length;

-- Para fixar esses conceitos, tente encontrar as seguintes informações:
-- Queremos saber os ids e custos de substituição dos filmes que possuem o mesmo custo de substituição.
SELECT s1.film_id, s1.replacement_cost, s2.film_id, s2.replacement_cost
FROM sakila.film AS s1, sakila.film AS s2
WHERE s1.replacement_cost = s2.replacement_cost;
-- Não ficou claro para mim --

-- Exiba o título e a duração de empréstimo dos filmes que possuem a mesma duração. Exiba apenas os filmes com a duração de empréstimo entre 2 e 4 dias.
SELECT * FROM sakila.film;
SELECT f1.title, f1.rental_duration, f2.title, f2.rental_duration
FROM sakila.film AS f1, sakila.film AS f2
WHERE f1.rental_duration = f2.rental_duration
HAVING f1.rental_duration BETWEEN 2 AND 4;

---------------------------------------------------------------------------
----------------------Como unir resultados com o UNION e o UNION ALL------------------------------
--  O Union junta as informações passadas em select de duas tabelas diferentes em uma. A quantidade de colunas deve ser a masma mara as duas tabelas.
-- Imagine que temos duas tabelas, morning_events e night_events , e que essas tabelas possuem os nomes das pessoas que compareceram a esses dois tipos diferentes de eventos. Porém, queremos uma lista agregada de todas as pessoas que estão cadastradas, independente do tipo de evento a que compareceram.
-- Essa situação é um dos cenários que podem ser resolvidos através do UNION . O UNION nos permite unir os registros de uma tabela com outra, desde que usemos a mesma quantidade de colunas. Se voce quiser fazer a uniam de tabelas com quantidade de colunas diferentes podemos colocar uma coluna falça a mais.
--   Com o comando UNION ALL as duas tabelas são mescladas totalmente, mesmo que tenha valores repetidos. Se colocar apenas UNION não repete valores.


---------------------------- EX:
-- Todos os funcionários foram promovidos a atores. Monte uma query que exiba a união da tabela staff com a tabela actor , exibindo apenas o nome e o sobrenome . Seu resultado não deve excluir nenhum funcionário ao unir as tabelas.




-- Monte uma query que una os resultados das tabelas customer e actor , exibindo os nomes que contêm a palavra "tracy" na tabela customer e os que contêm "je" na tabela actor . Exiba apenas os resultados únicos.




-- Monte uma query que exiba a união dos cinco últimos nomes da tabela actor , o primeiro nome da tabela staff e cinco nomes a partir da 15ª posição da tabela customer . Não permita que dados repetidos sejam exibidos. Ordene os resultados em ordem alfabética.




-- Você quer exibir uma lista paginada com os nomes e sobrenomes de todos os clientes e atores do banco de dados, em ordem alfabética. Considere que a paginação está sendo feita de 15 em 15 resultados e que você está na 4ª página. Monte uma query que simule esse cenário.




------------------------------------------------------------------------------------------------------------
----------------------------------------------------Como utilizar uma SUBQUERY-----------------------------------
-- Uma SUBQUERY é uma query aninhada que é avaliada dentro de um par de parênteses. Ela pode conter expressões simples, como adições e subtrações, mas não se limita a isso, uma vez que podemos utilizar praticamente todos os comandos já vistos até o momento dentro de uma SUBQUERY .
-- Algo a se lembrar é que a subquery não é a única maneira de encontrar resultados de tabelas relacionadas. Quando se trata de SQL, os JOINs podem ser usados para encontrar os mesmos resultados.
-- É recomendado tomar a decisão sobre qual opção utilizar (subquery ou JOIN ) baseando-se na performance da sua query.


---------------- Diferentes maneiras de utilizar uma SUBQUERY --------------------------------------------
-- Usando uma SUBQUERY como fonte de dados para o FROM .
SELECT f.title, f.rating
FROM (
    SELECT *
    FROM sakila.film
    WHERE rating = 'R'
) AS f;

-- Preenchendo uma coluna de um SELECT por meio de uma SUBQUERY .
SELECT
    address,
    district,
    (
        SELECT city
        FROM sakila.city
        WHERE city.city_id = sakila.address.city_id
    ) AS city
FROM sakila.address;

-- Filtrando resultados com WHERE usando como base os dados retornados de uma SUBQUERY .
SELECT address, district
FROM sakila.address
WHERE city_id in (
    SELECT city_id
    FROM sakila.city
    WHERE city in ('Sasebo', 'San Bernardino', 'Athenai', 'Myingyan')
);


-- Usando uma tabela externa, de fora da SUBQUERY , dentro dela.
SELECT
    first_name,
    (
        SELECT address
        FROM sakila.address
        WHERE address.address_id = tabela_externa.address_id
    ) AS address
FROM sakila.customer AS tabela_externa;

-- SUBQUERY ou JOIN
-- Talvez você esteja se perguntando se seria possível resolver as queries anteriores através de um JOIN . De fato, podemos, como é exemplificado a seguir.

-- Usando SUBQUERY ------------
SELECT
    first_name,
    (
        SELECT address
        FROM sakila.address
        WHERE address.address_id = tabela_externa.address_id
    ) AS address
FROM sakila.customer AS tabela_externa;

-- Usando INNER JOIN ---------
SELECT c.first_name, ad.address
FROM sakila.customer c
INNER JOIN sakila.address ad ON c.address_id = ad.address_id;
-- Sabendo disso, como decidir entre as duas abordagens? Decida qual usar através de testes de performance e, em seguida, por afinidade.


-----------------------------------------------------------------------------------------------------------------
------------------- Criando queries mais dinâmicas através do EXISTS----------------------------------------------
--  Com EXISTS podemos fazeer uma filtragem de valores condicionados a existencia de alguma informação no banco de dados.
-- EX:
SELECT * FRAOM praticando.manufacturers AS m
WHERE EXISTS (
  SELECT * FROM praticando.poducts
  WHERE manufacturer = m.code
);

--  Podemo tbm utilizar o comando NOT para fazer anegação. EX:
SELECT * FRAOM praticando.manufacturers AS m
WHERE NOT EXISTS (
  SELECT * FROM praticando.poducts
  WHERE manufacturer = m.code
);


--------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------ Vamos Praticar um pouco mais sobre o exists------------------------------------------------------
-- Use o banco de dados hotel para realizar os desafios a seguir:
-- Usando o EXISTS na tabela books_lent e books , exiba o id e título dos livros que ainda não foram emprestados.



-- Usando o EXISTS na tabela books_lent e books , exiba o id e título dos livros estão atualmente emprestados e que contêm a palavra "lost" no título.



-- Usando a tabela carsales e customers , exiba apenas o nome dos clientes que ainda não compraram um carro.



-- Usando o comando EXISTS em conjunto com JOIN e as tabelas cars , customers e carsales , exiba o nome do cliente e o modelo do carro de todos os clientes que fizeram compras de carros.



