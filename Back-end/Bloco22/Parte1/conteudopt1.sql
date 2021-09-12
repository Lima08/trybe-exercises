----------------------------- Identificando entidades, atributos e relacionamentos --------------------------

-- Primeiramente você deve identificar as entidades , atributos e relacionamentos com base na descrição do problema. Porém, antes disso é necessário entender o significado de cada um deles.

-- Entidades:
-- São uma representação de algo do mundo real dentro do banco de dados. Elas normalmente englobam toda uma ideia e são armazenadas em formato de tabelas em um banco de dados.

-- Atributos:
-- Os atributos são tudo aquilo que pode ser usado para descrever algo. Por exemplo, uma entidade pessoa pode ter nome, altura, peso e idade.

-- Relacionamentos:
-- Os relacionamentos servem para representar como uma entidade deve estar ligada com outra(s) no banco de dados. Há três tipos de relacionamentos possíveis em um banco de dados, que são:
-- Relacionamento Um para Um (1..1)

-- Relacionamento Um para Muitos ou Muitos para Um (1..N)

-- Relacionamento Muitos para Muitos (N..N)
-- Esse tipo de relacionamento pode ser visto também como dois relacionamentos um para muitos ligados por uma tabela intermediária, como é o caso da tabela filme_ator . Pode-se chamar essa tabela intermediária de tabela de junção . Ela é usada para guardar informações de como as tabelas se relacionam entre si. Desta maneira, quando se quer demonstrar que um filme pode contar com vários atores e também que os atores podem atuar em vários filmes, surge a necessidade de um relacionamento muitos para muitos.


-------------------------------------------------------------------------------------------------
------------------------------------- TIPO DE DADOS ---------------------------------------------
-- Os principais tipos de dados são so Booleanos, Caracteres, somente numeros e dados temporais

--  Bool -> Pode receber 1 ou 0. O padão é nulo

--  Caracteres podem ser de tamanho fixo, chamados de CHAR. Nele vc passa a quantidade de caracteres em parenteses. EX:
--  CHAR(5) -> Ocupa todos os espaços, independente se está usando ou não
--  VARCHAR(50) -> Ocupa apenas a quantidade que utilizar

--  Numeros 
--  Pode ser valores exatos inteiros. EX:
--  TINYINT = 0 a 255 UNSIGNED -> VAlores inteiros ou -128 a 127 SINGED
--  UNSIGNED permite apenas positivos
--  SIGNED permite positivos e negativos

--  Outro tipos de valores exatos inteiros são:
--  SMALLINT
--  MEDIUMINT
--  INT
-- BIGINT

--  Outro tipo de numeros são os exatos com casas DECIMAL que permite a definição da quantidade maxima de numeros e sua precisão. EX:
--  DECIMAL(5,2) = 199.99 (Poderia ter ate 5 na primeira)
-- FLOAT/REAL (Ambos fazema  masma coisa) - Tem a precisão de uma casa decimal. EX:
-- 10.9 (Antes da casa decimal pode ser qualquer uma)
--  DOUBLE - Tem a precisão de duas casas. EX:
-- 49.90 (Antes da casa decimal pode ser qualquer uma)

-- Ou seja, se for usar mais de duas casas decimais utilizamos DECIMAL. Se não podemos utilizar os outros comandos.


-----------------------------------------------------------------------------
------------------------ DADOS TEMPORAIS ----------------------------------
-- Os tipos de dados temporais são:
-- DATE - Valores no padão yyy-mm-dd
--  TIME - Padrão hh:mm:ss
-- YEAR - Somente anos entre 1901 a 2155
--  DATETIME - yyyy-mm-dd hh:mm:ss
--  TIMESTAMP - Iqual date time porem da para trabalhar com fuso horário


-----------------------------------------------------------------------------
--------------------- CRIAÇÂO DE TABELAS ------------------------------------

--  EX:
    DROP SCHEMA IF EXISTS Brasil; -- DROP deleta. SCHEMA é a mesma coisa que TABLE
    CREATE SCHEMA Brasil;
    USE Brasil;

    CREATE TABLE cidades(
        cidade VARCHAR(100) NOT NULL,
        estado VARCHAR(10) NOT NULL,
        populacao INTEGER,
        CONSTRAINT PRIMARY KEY(cidade, estado) -- Chave primaria composta
    );

    INSERT INTO cidades(cidade, estado, populacao)
    VALUES('Rio Claro','SP',185421),
          ('Rio Claro','RJ',17216);

-- A escolha na utilização de chaves primárias simples ou compostas para criar sua tabela depende da situação. No exemplo acima, faz mais sentido criar um campo id e utilizá-lo como chave primária simples , assim fica mais fácil fazer os relacionamentos com outras tabelas e utilizar operadores de busca pois você usará apenas o campo id .
-- A criação da tabela cidades com uma chave composta foi puramente ilustrativa, para seguir o padrão de termos uma chave primária simples podemos mudar a query para fazer da seguinte forma.

     -- Apagar a versão antiga da tabela
     DROP TABLE cidades; 
     CREATE TABLE cidades(
       id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
       cidade VARCHAR(100) NOT NULL,
       estado VARCHAR(10) NOT NULL,
       populacao INTEGER
    );

    INSERT INTO cidades(cidade, estado, populacao)
    VALUES('Rio Claro','SP',185421),
          ('Rio Claro','RJ',17216);

-- De qualquer forma, a aplicação de chaves compostas pode ser vantajosa em outras situações, como na criação de tabelas N:N, também conhecidas como tabelas de junção , pois os campos que contêm as chaves estrangeiras para as outras tabelas são utilizados para formar a chave primária composta , garantindo o bloqueio de registros com associações iguais.
    CREATE TABLE filme_ator(
        AtorId INTEGER,
        FilmeId INTEGER,
        CONSTRAINT PRIMARY KEY(AtorId, FilmeId),
        FOREIGN KEY (AtorId) REFERENCES Actor (Atorid),
        FOREIGN KEY (FilmeId) REFERENCES Filme (Filmeid)
    );

--------------------------------------------------------------------------------------
----------------- SINTAXE PARA CRIAÇÃO DE TABELAS ------------------------------------

-- CREATE TABLE nome_tabela (
--   coluna1 tipo constraint,
--   coluna2 tipo constraint,
--   coluna3 tipo constraint,
--   ...
-- ) ENGINE='nome_engine'

--  OBS: Não necessariomente uma coluna precisa de uma constraint
--  OBS2: Podemo colocar tbm uma função chamada AUTO_INCREMENT para ir sendo atualizado sozinha

--  Para colocarmos FOREIGN KEY precisamos expecificar qual é a PRYMARY KEY da tabela e a REFERENCES para indicar essa tabela referente. 
--  SINTAXE:
--  FOREIGN KEY (nome_coluna_ja_criada_que_recebe_FK) REFERENCES nome_da_tabela(nome_coluna_PK_Da_tabela),


--------------------------------------------------------------------------------------
----------------- SINTAXE PARA CRIAÇÃO DE BANCO DE DADOS ------------------------------------
-- CREATE DATABASE IN NOT EXISTS albuns;