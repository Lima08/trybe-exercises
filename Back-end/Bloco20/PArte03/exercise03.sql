--- Testes ----
use sakila;
SELECT * FROM payment;

-- Nesse exemplo o AND roda primeiro. Com isso, como o OR é rodado depois, a coluna staff_id recebe valores <> de 2
SELECT * FROM sakila.payment
WHERE amount = 0.99 OR amount = 2.99 AND staff_id = 2;

-- Para corrigir isso precisamos usar o parentese no or, fazendo com que ele rode antes do AND. Isso evita o problema com o ID.
SELECT * FROM sakila.payment
WHERE (amount = 0.99 OR amount = 2.99) AND staff_id = 2;