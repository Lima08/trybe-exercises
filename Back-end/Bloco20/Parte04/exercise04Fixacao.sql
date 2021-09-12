---------- Manupulando Tabelas ---------
-- Uma pesquisa rápida na tabela sakila.staff nos informa de que a empresa possui apenas dois funcionários. 
--  A sintaxe para inserir dados em uma tabela é a seguinte:
-- Use sakila;
-- SELECT * from sakila.staff;
-- INSERT INTO nome_da_tabela (coluna1, coluna2)
-- VALUES ('valor_coluna1', 'valor_coluna2');

-- É possível inserir múltiplas linhas em uma tabela com uma única query :
-- INSERT INTO nome_da_tabela (coluna1, coluna2) VALUES
-- ('valor_1','valor_2'),
-- ('valor_3','valor_4'),
-- ('valor_5','valor_6');

--  Ignorando linhas existentes
INSERT INTO pessoas (id, name) VALUES
(4,'Gloria'), -- Sem o IGNORE, essa linha geraria um erro e o INSERT não continuaria.
(5,'Amanda');

-- Pesquisando agora, você verá que a informação duplicada não foi inserida.
-- Porém os dados corretos foram inseridos com sucesso.
SELECT * FROM pessoas;

--  O importante aqui é lembrar que o INSERT IGNORE vai pular os outros erros silenciosamente também.


----------Inserindo valores em colunas com auto_increment---------------
-- Primeiramente, é preciso saber que o auto_increment é uma funcionalidade que todos os bancos de dados possuem.
-- Ela permite que valores sejam gerados automaticamente cada vez que uma nova linha é inserida em uma tabela que tem essa restrição ativa.
-- Ao inserir um novo ator na tabela sakila.actor, caso outros atores ainda não tenham sido inseridos desde que o banco foi restaurado, o próximo valor que será gerado para actor_id será o valor do último id registrado acrescido de um (201 + 1).

-------------------------------------------------------------------
-----------INSERT SELECT (Inserindo dados de uma outra tabela)------------------
-- É possível inserir dados a partir de outra tabela usando INSERT INTO SELECT :
INSERT INTO tabelaA (coluna1, coluna2)
    SELECT tabelaB.coluna1, tabelaB.coluna2
    FROM tabelaB
    WHERE tabelaB.nome_da_coluna <> 'algumValor'
    ORDER BY tabelaB.coluna_de_ordenacao;

-- Assim, estaríamos extraindo a coluna1 e a coluna2 da tabelaB e as inserindo na tabelaA , de acordo com a condição que for passada no WHERE .
-- É possível usar também SELECT * FROM e copiar todos os dados de todas as colunas de uma tabela para outra, mas nessa situação a tabelaA e a tabelaB precisam obrigatoriamente possuir a mesma quantidade de colunas, e os tipos de dados das colunas correspondentes devem ser iguais.
-- Com essa funcionalidade, é fácil criar tabelas temporárias para testes ou por necessidade. Por exemplo, para trazer os dados da tabela sakila.staff para a tabela sakila.actor , poderíamos fazer:

SELECT * FROM sakila.actor;

INSERT INTO sakila.actor (first_name, last_name)
    SELECT first_name, last_name FROM sakila.staff;

-- Conferindo se deu certo
SELECT * FROM sakila.actor
WHERE DATE(last_update) > '2006-02-15'
ORDER BY last_update;

-- Fixação --
-- Insira um novo funcionário na tabela sakila.staff .
-- Para saber quais campos são obrigatórios, clique com o botão direito na tabela sakila.staff e selecione "Table Inspector". 
-- No WorkBench clicando na aba "columns" é possivel verificar quais campos aceitam nulos. Lembre-se de que valores que são gerados automaticamente não precisam ser inseridos manualmente.
Use sakila;
SELECT * FROM sakila.staff;
INSERT INTO sakila.staff
(first_name, last_name, address_id, email, store_id, active, username, `password`)
VALUES
('Joao', 'Lima', 1, 'jaoo.lima@gmail.com', 2, 1, 'LimaLima', 'SenhaSegura123');


-- Feito o exercício anterior, vamos agora para o nível 2. Insira dois funcionários novos em apenas uma query .
INSERT IGNORE INTO sakila.staff
(first_name, last_name, address_id, email, store_id, active, username, `password`)
VALUES
   ('Jeff', 'Bezos', 2, 'jeffbezos@gmail.com', 1, 1, 'jeffb', 'ImTheChamp'),
    ('Sekiro', 'Okami', 2, 'sekirowolf@gmail.com', 1, 1, 'okami', 'SekiroTheSamurai');

-- Selecione os cinco primeiros nomes e sobrenomes da tabela sakila.customer e cadastre essas pessoas como atores na tabela sakila.actor .
SELECT * FROM sakila.customer;
SELECT * FROM sakila.actor;
SELECT * FROM sakila.customer
ORDER BY customer_id
LIMIT 5;

INSERT INTO sakila.actor (first_name, last_name)
SELECT first_name, last_name FROM sakila.customer
ORDER BY customer_id
LIMIT 5;


-- Cadastre três categorias de uma vez só na tabela sakila.category .;sakila.
SELECT * FROM sakila.category;
INSERT INTO sakila.category
(`name`)
VALUES ('Lima'),
('Paulo'),
('Gomes');


-- Cadastre uma nova loja na tabela sakila.store .
SELECT * FROM sakila.store;
INSERT INTO sakila.store
(manager_staff_id, address_id)
VALUES
(6, 5);


--------------------------------------------------------
------ O UPDATE te permite alterar valores de uma tabela com base em alguma condição. --------------
UPDATE sakila.staff
SET first_name = 'Ravein'
WHERE first_name = 'Rannveig';

-- Uma curiosidade sobre o UPDATE e o DELETE no MySQL Server é que, por padrão, existe uma configuração chamada safe updates mode que só vai te permitir executá-los caso eles incluam quais IDs devem ser modificados. Então, caso você tente fazer a query abaixo, ela não funcionaria por não incluir o ID.
UPDATE sakila.staff
SET first_name = 'Rannveig'
WHERE first_name = 'Ravein';

-- Para evitar essa restrição, rode o seguinte comando em uma janela de query dentro do MySQL Workbench sempre que abri-lo para desabilitar essa funcionalidade, antes de executar seus comandos de UPDATE ou DELETE :
SET SQL_SAFE_UPDATES = 0;

-- Alterando mais de uma coluna ao mesmo tempo
UPDATE sakila.staff
SET first_name = 'Rannveig', last_name = 'Jordan'
WHERE staff_id = 4;


--------UPDATE em massa--------
-- Por questões de performance, para que apenas uma solicitação de query seja enviada ao servidor, podemos fazer uma atualização em massa.
-- Opção 1 - Incluindo a lista de condições fixas
UPDATE sakila.actor
SET first_name = 'JOE'
WHERE actor_id IN (4, 5);

SELECT first_name FROM sakila.actor;
-- -- Opção 2 - Especificando como cada entrada será alterada individualmente
UPDATE sakila.actor
SET first_name = (
CASE actor_id WHEN 1 THEN 'JOE' -- se actor_id = 1, alterar first_name para 'JOE'
              WHEN 2 THEN 'DAVIS' -- se actor_id = 2, alterar first_name para 'DAVIS'
              WHEN 3 THEN 'CAROLINE' -- se actor_id = 3, alterar first_name para 'CAROLINE'
          ELSE first_name -- em todos os outros casos, mantém-se o first_name
END);

-------------Fazendo um UPDATE de forma sequencial-------------------------
-- Se o comando ORDER BY for usado juntamente com o UPDATE , os resultados serão alterados na ordem em que forem encontrados.
-- Se o comando LIMIT for usado em conjunto com o UPDATE , um limite será imposto na quantidade de resultados que podem ser alterados. Caso contrário, todos os resultados que satisfizerem a condição serão atualizados.
-- Veja a sintaxe abaixo. Lembre-se de que os valores entre colchetes ( [] ) são opcionais:
UPDATE nome_da_tabela
SET coluna1 = valor1, coluna2 = valor2
[WHERE condições]
[ORDER BY expressao [ ASC | DESC ]]
[LIMIT quantidade_resultados];

-- Exemplo:
UPDATE sakila.staff
SET password = 'FavorResetarSuaSenha123'
WHERE active = 1
ORDER BY last_update
LIMIT 2;

SELECT * FROm sakila.staff;
-- Essas são as maneiras mais comuns de utilizar o UPDATE no dia a dia.
-- Para saber sobreo modo --safe-updates consultar o curso bloco 20 parte 4 Pagian sobre UPDATE



------------------------------------------------------------------------------
---------------------Desafios UPDATE -----------------------------------------
-- Como o banco pode ser deletado e recriado infinitamente, vamos desabilitar o --safe-updates nos exercícios. Além disso, esse modo pode ser habilitado novamente quando necessário. Rode o seguinte comando em uma janela de query dentro do MySQL Workbench sempre que abri-lo para desabilitar essa funcionalidade, antes de executar seus comandos UPDATE ou DELETE :
SET SQL_SAFE_UPDATES = 0;

-- Atualize o primeiro nome de todas as pessoas da tabela sakila.actor que possuem o primeiro nome "JULIA" para "JULES".
UPDATE sakila.actor
SET first_name = 'JULES'
WHERE first_name = 'JULIA';

-- SELECT * FROM sakila.actor
-- WHERE first_name = 'JULES'
-- OR first_name = 'JULIA';

-- Foi exigido que a categoria "Sci-Fi" seja alterada para "Science Fiction".
-- SELECT * FROM sakila.category ;
-- SELECT * FROM sakila.category 
-- WHERE `name` LIKE 'Sci-Fi' OR `name` LIKE 'Science Fiction';
UPDATE sakila.category
SET `name` = 'Science Fiction'
WHERE `name` LIKE 'Sci-Fi';


-- Atualize o valor do aluguel para $25 de todos os filmes com duração maior que 100 minutos e que possuem a classificações "G" , "PG" ou "PG-13" e um custo de substituição maior que $20.
SELECT * FROM sakila.film;
SELECT * FROM sakila.film
;
UPDATE sakila.film
SET rental_rate = 25.00
WHERE `length` > 100
AND (rating = 'G'
OR rating = 'PG'
OR rating = 'PG-13')
AND replacement_cost > 20.00;

SELECT * FROM sakila.film
WHERE `length` > 100
AND (rating = 'G' OR rating = 'PG' OR rating = 'PG-13')
AND replacement_cost > 20.00;


-- Foi determinado pelo setor financeiro que haverá um reajuste em todos os preços dos filmes, com base em sua duração. Para todos os filmes com duração entre 0 e 100, o valor do aluguel passará a ser $10,00, e o aluguel dos filmes com duração acima de 100 passará a ser de $20,00.
SELECT * FROM sakila.film;

UPDATE sakila.film
SET rental_rate = (
    CASE
        WHEN `length` BETWEEN 1 AND 100 THEN 10
        WHEN `length` > 100 THEN 20
    END
);

---------------------------------------------------------------------------------------
--------------------Excluindo dados de uma tabela--------------------------------------
-- Para excluir dados de forma básica, temos a seguinte sintaxe:
DELETE FROM banco_de_dados.tabela
WHERE coluna = 'valor';

-- O WHERE é opcional. Porém, sem ele, todas as linhas da tabela seriam excluídas.
-- Exemplo no banco sakila :
SELECT * FROM sakila.film_text;
DELETE FROM sakila.film_text
WHERE title = 'ACADEMY DINOSAUR';

-- P.S. Novamente, caso o modo --safe-updates esteja habilitado, o comando DELETE só funcionaria se os IDs fossem incluídos em suas queries . Para fins de prática, vamos desabilitá-lo. Rode o seguinte comando em uma janela de query , dentro do MySQL Workbench, sempre que abri-lo, para desabilitar essa funcionalidade antes de executar seus comandos DELETE :
SET SQL_SAFE_UPDATES = 0;



---------------------------------------------------------------------------------------
--------------------------Vamos praticar o DELETE--------------------------------------
-- Exclua do banco de dados o ator com o nome de "KARL".
SELECT * FROM sakila.actor;
SELECT actor_id
FROM sakila.actor
WHERE first_name = 'KARL';
DELETE FROM sakila.actor
WHERE actor_id = 12;
DELETE FROM sakila.actor
WHERE first_name = 'KARL';


-- Exclua do banco de dados os atores com o nome de "MATTHEW".
-- Exclua da tabela film_text todos os registros que possuem a palavra "saga" em suas descrições.


-- Apague da maneira mais performática possível todos os registros das tabelas film_actor e film_category.


-- Inspecione todas as tabelas do banco de dados sakila e analise quais restrições ON DELETE foram impostas em cada uma. Use o Table Inspector para fazer isso (aba DDL).


-- Exclua o banco de dados e o recrie (use as instruções no início desta aula).






