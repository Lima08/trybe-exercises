--- FILTRANDO DADOS DE FORMA ESPECÍFICA  ----
------------WHERE E OPERADORES LOGICOS
use sakila;
SELECT * FROM payment;

-- Nesse exemplo o AND roda primeiro. Com isso, como o OR é rodado depois, a coluna staff_id recebe valores <> de 2
SELECT * FROM sakila.payment
WHERE amount = 0.99 OR amount = 2.99 AND staff_id = 2;

-- Para corrigir isso precisamos usar o parentese no or, fazendo com que ele rode antes do AND. Isso evita o problema com o ID.
SELECT * FROM sakila.payment
WHERE (amount = 0.99 OR amount = 2.99) AND staff_id = 2;

---- De forma gera temos os seguintes operadores:
-- =   IGUAL
-- >   MAIOR QUE
-- <   MENOR QUE
-- >=  MAIOR QUE OU IGUAL
-- <=  MENOR QUE OU IGUAL
-- <>  DIFERENTE DE
-- AND OPERADOR LÓGICO E
-- OR  OPERADOR LÓGICO OU
-- NOT NEGAÇÃO
-- IS  COMPARA COM VALORES BOOLEANOS (TRUE, FALSE, NULL)

----------------------------------------------------
---------------- Para Fixar ------------------------
-- A tabela a seguir é um guia de como a classificação indicativa é usada no banco de dados sakila . Consulte-a ao fazer os desafios propostos.
-- G = permitido para todos
-- PG = permitido para crianças menores de 13 anos
-- PG-13 = permitido para pessoas com mais de 13 anos
-- R = permitido para pessoas com mais de 17 anos
-- NC-17 = permitido apenas para adultos

-- Entre no banco de dados sakila e siga as instruções (e guarde as queries para conferir posteriormente):
-- Precisamos identificar os dados do cliente com o e-mail LEONARD.SCHOFIELD@sakilacustomer.org .
use sakila;
SELECT * from customer
WHERE email = 'LEONARD.SCHOFIELD@sakilacustomer.org';

-- Precisamos de um relatório dos nomes dos clientes, em ordem alfabética , que não estão mais ativos no nosso sistema e pertencem à loja com o id = 2 , e não inclua o cliente KENNETH no resultado.
SELECT first_name, last_name FROM customer
WHERE active = 0
AND store_id = 2
AND first_name <> 'KENNETH'
ORDER BY first_name ASC, last_name ASC;


-- O setor financeiro quer saber título, descrição, ano de lançamento e valor do custo de substituição ( replacement_cost ), dos 100 filmes com o maior custo de substituição, do valor mais alto ao mais baixo, entre os filmes feitos para menores de idade e que têm o custo mínimo de substituição de $18,00 dólares. Em caso de empate, ordene em ordem alfabética pelo título.
SELECT * FROM film;
SELECT title, `description`, release_year, replacement_cost, rating FROM film
WHERE rating = 'PG'
AND replacement_cost >= 18.00
ORDER BY replacement_cost DESC, title ASC
LIMIT 100;


-- Quantos clientes estão ativos e na loja 1 ?
SELECT COUNT(*) AS `Quantidade de clientes ativos` FROM customer
WHERE active = 1
AND store_id = 1;

-- Mostre todos os detalhes dos clientes que não estão ativos na loja 1 .
SELECT * FROM customer
WHERE active = 0 AND store_id = 1;

-- Precisamos descobrir quais são os 50 filmes feitos apenas para adultos com a menor taxa de aluguel, para que possamos fazer uma divulgação melhor desses filmes. Em caso de empate, ordene em ordem alfabética pelo título.
SELECT * FROM film
WHERE rating = 'NC-17'
ORDER BY rental_duration, title
LIMIT 50;

------------------------------------------------------------------------
-------Como criar pesquisas mais dinâmicas e maleáveis usando o LIKE-------

-- Você está tentando se lembrar do nome de um filme a que já assistiu, mas só se lembra de que ele terminava com don no nome. Como seria possível usar o LIKE para te ajudar a encontrá-lo?
SELECT * FROM sakila.film
WHERE title LIKE '%don';
-- O LIKE é usado para buscar por meio de uma sequência específica de caracteres, como no exemplo acima. Além disso, dois "curingas", ou modificadores, são normalmente usados com o LIKE :
-- % - O sinal de percentual, que pode representar zero, um ou múltiplos caracteres
-- _ - O underscore (às vezes chamado de underline, no Brasil), que representa um único caractere
-- Vamos ver abaixo como usá-los (todos podem ser verificados no banco sakila )
-- Encontra qualquer resultado finalizando com "don"
SELECT * FROM sakila.film
WHERE title LIKE '%don';

-- Encontra qualquer resultado iniciando com "plu"
SELECT * FROM sakila.film
WHERE title LIKE 'plu%';

-- Encontra qualquer resultado que contém "plu"
SELECT * FROM sakila.film
WHERE title LIKE '%plu%';

-- Encontra qualquer resultado que inicia com "p" e finaliza com "r"
SELECT * FROM sakila.film
WHERE title LIKE 'p%r';

-- Encontra qualquer resultado em que o segundo caractere da frase é "C"
SELECT * FROM sakila.film
WHERE title LIKE '_C%';

-- Encontra qualquer resultado em que o título possui exatamente 8 caracteres
SELECT * FROM sakila.film
WHERE title LIKE '________';

-- Encontra todas as palavras com no mínimo 3 caracteres e que iniciam com E
SELECT * FROM sakila.film
WHERE title LIKE 'E__%';

----------- Para Fixar -----------
-- Para consolidar esse conhecimento, brinque com os resultados que serão encontrados usando os comandos acima e tente criar suas próprias condições. Depois de ter praticado um pouco com eles, tente encontrar as seguintes informações:
-- Mostre todos os detalhes dos filmes que contêm a palavra ace no nome.
SELECT * FROM film
WHERE title LIKE '%ace%';


-- Mostre todos os detalhes dos filmes cujas descrições finalizam com china .
SELECT * FROM film
WHERE `description` LIKE '%china';

-- Mostre todos os detalhes dos dois filmes cujas descrições contêm a palavra girl e o título finaliza com a palavra lord .
SELECT * FROM film
WHERE `description` LIKE '%girl%'
AND title LIKE '%lord';

-- Mostre os dois casos em que, a partir do 4° caractere no título do filme, tem-se a palavra gon .
SELECT * FROM film
WHERE title LIKE '___gon%';

-- Mostre o único caso em que, a partir do 4° caractere no título do filme, tem-se a palavra gon e a descrição contém a palavra Documentary .

SELECT * FROM film
WHERE title LIKE '___gon%' AND `description` LIKE '%Documentary%';

-- Mostre os dois filmes cujos títulos ou finalizam com academy ou iniciam com mosquito .
SELECT * FROM film
WHERE title LIKE '%academy' OR title LIKE 'mosquito%';

-- Mostre os seis filmes que contêm as palavras monkey e sumo em suas descrições.
SELECT * FROM film
WHERE `description` LIKE '%monkey%' AND `description` LIKE '%sumo%';

----------------------------------------------------------------
--------------------Operador IN---------------------------------

-- Como você viu no início do dia hoje, é possível juntar várias condições nas suas queries usando os operadores AND e OR . No entanto, você ainda terá que digitar cada condição separadamente, como no exemplo a seguir:
SELECT * FROM sakila.actor
WHERE first_name = 'PENELOPE'
OR first_name = 'NICK'
OR first_name = 'ED'
OR first_name = 'JENNIFER';

-- Uma forma melhor de fazer essa mesma pesquisa seria usando o IN :
SELECT * FROM sakila.actor
WHERE first_name IN ('PENELOPE','NICK','ED','JENNIFER');

SELECT * FROM sakila.customer
WHERE customer_id in (1, 2, 3, 4, 5);


-- Como você faria, então, para encontrar, usando o IN , todos os detalhes sobre o aluguel dos clientes com os seguintes ids: 269, 239, 126, 399, 142?
SELECT * FROM sakila.customer
WHERE customer_id in (269, 239, 126, 399, 142);

-- Como encontraria todas as informações sobre os endereços que estão registrados nos distritos de QLD, Nagasaki, California, Attika, Mandalay, Nantou e Texas?
SELECT * FROM address;
SELECT * FROM address
WHERE district IN ('QLD', 'Nagasaki', 'California', 'Attika', 'Mandalay', 'Nantou', 'Texas');


-----------------------------------------------------------------------------------
--------------------Operador BETWEEN-----------------------------------------------
-- Uma outra opção quando queremos trabalhar com faixas de resultados é o BETWEEN , que torna possível fazer pesquisas dentro de uma faixa inicial e final.

-- Note que o MySQL inclui o valor inicial e o final nos resultados
SELECT title, length FROM sakila.film
WHERE length BETWEEN 50 AND 120
ORDER BY length;

-------------Usando o BETWEEN com strings-------------
-- Para encontrar uma faixa de valores em que os valores são strings, podemos digitar a palavra por completo para encontrar os valores. Exemplo:
SELECT * FROM sakila.language;
SELECT * FROM sakila.language
WHERE name BETWEEN 'Italian' AND 'Mandarin';
SELECT * FROM sakila.language
WHERE name BETWEEN 'Italian' AND 'Mandarin'
ORDER BY name;

--
-----------------Usando o BETWEEN com datas-----------------------------
-- Para usar o BETWEEN com datas, basta que você digite o valor no formato padrão da data, que é YYYY-MM-DD HH:MM:SS , sendo os valores de horas, minutos e segundos opcionais. No exemplo abaixo, estamos filtrando os resultados para exibir o rental_id e rental_date apenas entre o mês 05 e o mês 07:
SELECT rental_id, rental_date FROM sakila.rental
WHERE rental_date
BETWEEN '2005-05-27' AND '2005-07-17';


-----------------------Para Fixar-----------------------------------------
-- Mostre o nome, sobrenome e e-mail dos clientes com os seguintes sobrenomes: hicks, crawford, henry, boyd, mason, morales e kennedy , ordenados por nome em ordem alfabética.
SELECT * FROM customer;
SELECT first_name, last_name FROM customer
WHERE last_name in ('hicks', 'crawford', 'henry', 'boyd', 'mason', 'morales', 'kennedy')
ORDER BY first_name;


-- Mostre o e-mail dos clientes com os address_id 172, 173, 174, 175 e 176 , ordenados em ordem alfabética.
SELECT email FROM customer
WHERE address_id BETWEEN 172 AND 176
ORDER BY email;


-- Descubra quantos pagamentos foram feitos entre 01/05/2005 e 01/08/2005 . Lembre-se de que, no banco de dados, as datas estão armazenadas no formato ano/mês/dia , diferente do formato brasileiro, que é dia/mês/ano .
SELECT COUNT(*) AS quantidade_de_pagamentos FROM payment
WHERE payment_date BETWEEN '2005/05/01' AND '2005/08/01';


-- Mostre o título, ano de lançamento e duração do empréstimo de todos os filmes com a duração de empréstimo de 3 a 6 . Os resultados devem ser classificados em filmes com maior duração de empréstimo primeiro. Em caso de empate, ordene em ordem alfabética pelo título.
SELECT * FROM film;
SELECT title, release_year, rental_duration FROM film
WHERE rental_duration BETWEEN 3 AND 6
ORDER BY rental_duration DESC, title;

-- Monte um relatório que exiba o título e classificação dos 500 primeiros filmes direcionados para as classificações indicativas G, PG e PG-13 . Os resultados devem estar ordenados por título.
SELECT title, rating FROM film
WHERE rating in ('G', 'PG', 'PG-13')
ORDER BY title
LIMIT 500;


------------------------------------------------------------------
----------Maneiras de encontrar dados por data--------------------
-- Vamos dizer que queremos encontrar pagamentos realizados na data 2005-07-31 na tabela sakila.payment . Há várias formas de fazer isso.
-- Encontra todos os pagamentos deste dia, ignorando horas, minutos e segundos
SELECT * FROM sakila.payment
WHERE DATE(payment_date) = '2005-07-31';

-- Encontra todos pagamentos deste dia, ignorando horas, minutos e segundos
SELECT * FROM sakila.payment
WHERE payment_date LIKE '2005-07-31%';

-- Encontra um pagamento com dia e hora exatos
SELECT * FROM sakila.payment
WHERE payment_date LIKE '2005-08-20 00:30:52';

-- Encontra pagamentos especificando um valor mínimo e um valor máximo para a data
SELECT *
FROM sakila.payment
WHERE payment_date BETWEEN '2005-05-26 00:00:00' AND '2005-05-27 23:59:59';

----------------------------------------------------------------
------------Selecionando apenas partes de uma data-----------------
-- Teste cada um dos comandos a seguir:
SELECT DATE(payment_date) FROM sakila.payment; -- YYYY-MM-DD
SELECT YEAR(payment_date) FROM sakila.payment; -- Ano
SELECT MONTH(payment_date) FROM sakila.payment; -- Mês
SELECT DAY(payment_date) FROM sakila.payment; -- Dia
SELECT HOUR(payment_date) FROM sakila.payment; -- Hora
SELECT MINUTE(payment_date) FROM sakila.payment; -- Minuto
SELECT SECOND(payment_date) FROM sakila.payment; -- Segundo

---------------------------------------
----------------Para Fixar--------------
-- Quantos pagamentos temos com a data de retorno 2005-05-25 ? Há múltiplas maneiras possíveis de encontrar a resposta.


-- Quantos pagamentos foram feitos entre 01/07/2005 e 22/08/2005 ?


-- Usando a tabela rental , extraia data, ano, mês, dia, hora, minuto e segundo dos registros com rental_id = 10330. Utilize a coluna rental_date para extrair as informações.


-- Monte uma query que retorne todos os dados do pagamento feito no dia 28/07/2005 a partir das 22 horas .




