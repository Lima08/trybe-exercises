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
Use sakila;
SELECT * FROM sakila.staff;
INSERT IGNORE INTO sakila.staff
(first_name, last_name, address_id, email, store_id, active, username, `password`)
VALUES
('Joao', 'Lima', 1, 'jaoo.lima@gmail.com', 2, 1, 'LimaLima', 'SenhaSegura123');

INSERT INTO `sakila`.`staff`
    (first_name, last_name, address_id, email, store_id, active, username, password)
VALUES
    ('Geralt', 'of Rivia', 2, 'tossacoin@gmail.com', 1, 1, 'geralt', 'theWhiteWolf');
-- Para saber quais campos são obrigatórios, clique com o botão direito na tabela sakila.staff e selecione "Table Inspector". 
-- No WorkBench clicando na aba "columns" é possivel verificar quais campos aceitam nulos. Lembre-se de que valores que são gerados automaticamente não precisam ser inseridos manualmente.

SELECT * FROM sakila.staff;

-- Feito o exercício anterior, vamos agora para o nível 2. Insira dois funcionários novos em apenas uma query .


-- Selecione os cinco primeiros nomes e sobrenomes da tabela sakila.customer e cadastre essas pessoas como atores na tabela sakila.actor .


-- Cadastre três categorias de uma vez só na tabela sakila.category .


-- Cadastre uma nova loja na tabela sakila.store .

--------------------------------------------------------
------ O UPDATE te permite alterar valores de uma tabela com base em alguma condição. ---
UPDATE sakila.staff
SET first_name = 'Rannveig'
WHERE first_name = 'Ravein';

-- Uma curiosidade sobre o UPDATE e o DELETE no MySQL Server é que, por padrão, existe uma configuração chamada safe updates mode que só vai te permitir executá-los caso eles incluam quais IDs devem ser modificados. Então, caso você tente fazer a query abaixo, ela não funcionaria por não incluir o ID.
-- UPDATE sakila.staff
-- SET first_name = 'Rannveig'
-- WHERE first_name = 'Ravein';
-- Para evitar essa restrição, rode o seguinte comando em uma janela de query dentro do MySQL Workbench sempre que abri-lo para desabilitar essa funcionalidade, antes de executar seus comandos de UPDATE ou DELETE :
-- SET SQL_SAFE_UPDATES = 0;

-- Alterando mais de uma coluna ao mesmo tempo
-- UPDATE sakila.staff
-- SET first_name = 'Rannveig', last_name = 'Jordan'
-- WHERE staff_id = 4;
-- UPDATE em massa
-- Por questões de performance, para que apenas uma solicitação de query seja enviada ao servidor, podemos fazer uma atualização em massa.
-- -- Opção 1 - Incluindo a lista de condições fixas
-- UPDATE sakila.actor
-- SET first_name = 'JOE'
-- WHERE actor_id IN (1,2,3);

-- -- Opção 2 - Especificando como cada entrada será alterada individualmente
-- UPDATE sakila.actor
-- SET first_name = (
-- CASE actor_id WHEN 1 THEN 'JOE' -- se actor_id = 1, alterar first_name para 'JOE'
--               WHEN 2 THEN 'DAVIS' -- se actor_id = 2, alterar first_name para 'DAVIS'
--               WHEN 3 THEN 'CAROLINE' -- se actor_id = 3, alterar first_name para 'CAROLINE'
--           ELSE first_name -- em todos os outros casos, mantém-se o first_name
-- END);

