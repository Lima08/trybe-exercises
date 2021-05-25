// faça um teste que verifique o resultado da função getUserName para o caso em que o usuário é encontrado, e também um teste para o caso em que o usuário não é encontrado utilizando a sintaxe de async/await .
// Dica: Utilize o try/catch para o caso de erro.
const { getUserName } = require('../src/ex03-getUserName-async');

describe('Testing with async /await', () => {
  it('When ID exists returns the user name', async () => {
    expect.assertions(1);
    const user =  await getUserName(4);
    expect(user).toEqual('Mark');
  });

  it('When ID does not exists retuns an error', async () => {
    expect.assertions(1);
    try {
      await getUserName(1);
    } catch(error) {
      expect(error).toEqual({ error: 'User with ' + 1 + ' not found.' });
    }
  });
});
