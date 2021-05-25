// Utilizando a sintaxe de Promise , faça um teste que verifique o resultado da função getUserName para o caso em que o usuário é encontrado, e também um teste para o caso em que o usuário não é encontrado.
// Dica : Veja os dados falsos utilizados no banco de dados, disponíveis na variável users , para saber quais IDs existem.

const { getUserName } = require('../src/ex02-getUserName')

describe('findUserById', () => {
  it('Test if returns the correct name', () => {
    expect.assertions(1);
    return getUserName(4).then(user => expect(user).toEqual( 'Mark'));
  });

  it('Return fail test with undefined ID', () => {
    expect.assertions(1);
    return getUserName(6).catch(error => expect(error).toEqual({ error: 'User with 6 not found.' }));
  });
});
