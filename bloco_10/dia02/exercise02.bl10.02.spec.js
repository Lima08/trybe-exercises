// Utilizando a sintaxe de Promise , faça um teste que verifique o resultado da função getUserName para o caso em que o usuário é encontrado, e também um teste para o caso em que o usuário não é encontrado.
// Dica : Veja os dados falsos utilizados no banco de dados, disponíveis na variável users , para saber quais IDs existem.

const users = {
  4: { name: 'Mark' },
  5: { name: 'Paul' }
};

const findUserById = (id) => {
  return new Promise((resolve, reject) => {
      if (users[id]) {
        return resolve(users[id]);
      };

      return reject({ error: 'User with ' + id + ' not found.' });
  });
};

const getUserName = (userID) => {
  return findUserById(userID).then(user => user.name);
};

// getUserName(1).then(result=> console.log(result)).catch((error) => console.log(error));

describe('findUserById', () => {
  it('Test if return the correct name', () => {
    expect.assertions(1);
    getUserName(4).then(result => expect(result).toEqual( 'Mark'));
  });

  it('Return fail test with undefined ID', () => {
    expect.assertions(1);

    getUserName(6).catch(error => expect(error).toEqual({ error: 'User with 6 not found.' }));
  });
});

// describe('Testing returns function getUserName', () => {
//   it('Test if return user finded', () => {
//     expect.assertions(1);
//     return getUserName(4).then((data) => expect(data).toEqual('Mark'));
//   });
// });

// describe('When user not exist', () => {
//   it( 'Throw error', () => {
//     expect.assertions(1);
//     return getUserName(1).catch(error => {
//       expect(error).toStrictEqual({ error: 'User ith 1 not found.' });
//     });
//   });
// });


// describe('when the user id does not exists', () => {
//   it('returns an error', () => {
//     expect.assertions(1);
//     return getUserName(2).catch(error =>
//       expect(error).toEqual({ error: 'User with 2 not found.' })
//     );
//   });
// });