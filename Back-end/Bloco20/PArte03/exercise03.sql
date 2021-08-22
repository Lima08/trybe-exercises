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


-- Precisamos de um relatório dos nomes dos clientes, em ordem alfabética , que não estão mais ativos no nosso sistema e pertencem à loja com o id = 2 , e não inclua o cliente KENNETH no resultado.



-- O setor financeiro quer saber título, descrição, ano de lançamento e valor do custo de substituição ( replacement_cost ), dos 100 filmes com o maior custo de substituição, do valor mais alto ao mais baixo, entre os filmes feitos para menores de idade e que têm o custo mínimo de substituição de $18,00 dólares. Em caso de empate, ordene em ordem alfabética pelo título.


-- Quantos clientes estão ativos e na loja 1 ?


-- Mostre todos os detalhes dos clientes que não estão ativos na loja 1 .


-- Precisamos descobrir quais são os 50 filmes feitos apenas para adultos com a menor taxa de aluguel, para que possamos fazer uma divulgação melhor desses filmes. Em caso de empate, ordene em ordem alfabética pelo título.


-- Você vai se deparar também com casos em que você só tem parte de uma informação, ou em que precisa criar queries mais dinâmicas. Para esses casos, temos o LIKE . Como assim? É o que veremos a seguir.



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


-- Mostre todos os detalhes dos filmes cujas descrições finalizam com china .


-- Mostre todos os detalhes dos dois filmes cujas descrições contêm a palavra girl e o título finaliza com a palavra lord .


-- Mostre os dois casos em que, a partir do 4° caractere no título do filme, tem-se a palavra gon .


-- Mostre o único caso em que, a partir do 4° caractere no título do filme, tem-se a palavra gon e a descrição contém a palavra Documentary .


-- Mostre os dois filmes cujos títulos ou finalizam com academy ou iniciam com mosquito .


-- Mostre os seis filmes que contêm as palavras monkey e sumo em suas descrições.


----------------------------------------------------------------
