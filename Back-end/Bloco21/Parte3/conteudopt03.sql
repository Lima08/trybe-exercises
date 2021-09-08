----------------------- TRIGGER --------------------------

--  é uma especie de função que é associada a uma tabela e é invocada sempre quando um comando DML é executado.
--  Não podemos chama-los manualmente
--  Usado para Verificação e validação dos dados, rastreamento de logs e atividades em tabelas e arquivamento de registros excluidos.
--  SINTAXE
CREATE TRIGGER nome timing operação
On tabelaFOR EACH ROWdeclaração

--  Timin - BEFORE / AFTER
-- operação - INSERT / DELETE / UPDATE



--  Precisa ter um delimiter
--  nome CREATE PROCEDURE albuns_do_artista
--  Comando before ou after e onde ele é aplicado
--  Para quais linhas
--  Precisa ter begin
--  O comando e onde ele deve ser feito. Usar o id comparando o old. Repete quantas vezes for necessario
--  Comando end e o delimiter
-- volta o delimiter do jeito que era
-- 
--  Para chamar usamos o comando CALL + nome da procedure
--  AS procedures podem ter valores de entrada. PAra isso usamos dentro dos parametros () IN e o tipo ex: NUMERIC
--  AS procedures podem ter valores de saidas. PAra isso usamos dentro dos parametros () OUT e o nome da variavel de saida + tipo - EX DOUBLE
--  AS procedures podem ter valores de entrada e saidas. PAra isso usamos ambas as sintaxes
--  AS procedures podem ter valores de entrada e saidas juntos. PAra isso usamos o parametro INOUT com o nome da variavel + tipo 7
-- CALL albuns_do_artista('Walter Phoenix');





--  Precisa ter um delimiter
--  nome CREATE TRIGGER trigger_usuario_delete
--  Comando before ou after e onde ele é aplicado
--  Para quais linhas
--  Precisa ter begin
--  O comando e onde ele deve ser feito. Usar o id comparando o old. Repete quantas vezes for necessario
--  Comando end e o delimiter
-- volta o delimiter do jeito que era
-- DELETE FROm SpotifyClone.usuarios WHERE nome_usuario = 'Cintia';