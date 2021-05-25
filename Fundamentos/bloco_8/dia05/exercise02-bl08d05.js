// Crie uma função sum que dado um número variável de elementos retorna a soma desses elementos. Ou seja:
// Dica: use parâmetro rest .

const assert = require('assert');

const sum = (...agr) => agr.reduce((acc, param) => acc + param, 0);

// console.log(sum (0,1,2,3,4));
// console.log(sum (0));


assert.strictEqual(sum(), 0);
assert.strictEqual(sum(1), 1);
assert.strictEqual(sum(1, 2), 3);
assert.strictEqual(sum(1, 2, 3), 6);
assert.strictEqual(sum(1, 2, 3, 4), 10);
