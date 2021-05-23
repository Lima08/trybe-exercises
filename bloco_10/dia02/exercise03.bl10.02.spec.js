// faça um teste que verifique o resultado da função getUserName para o caso em que o usuário é encontrado, e também um teste para o caso em que o usuário não é encontrado utilizando a sintaxe de async/await .
// Dica: Utilize o try/catch para o caso de erro.

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

findUserById(4).then(result=> console.log(result)).catch((error) => console.log(error));

describe('Testing with async /await', () => {
  it('Existent ID', async () => {
    expect.assertions(1);
    return  await getUserName(4).then(result => expect(result).toEqual('Mark'));
  });

  it('Undefined ID', async () => {
  expect.assertions(1);
    return await getUserName(6).catch(error => expect(error).toEqual({ error: 'User with 6 not found.' }))
  });
});

// const users = {
//   : { name: 'Mark' },
//   : { name: 'Paul' }
//   };
  
//   const findUserById = (id) => {
//     return new Promise((resolve, reject) => {
//         if (users[id]) {
//           return resolve(users[id]);
//         }
//         return reject({ error: 'User with ' + id + ' not found.' });
//     });
//   }
  
//   const getUserName = (userID) => {
//     return findUserById(userID).then(user => user.name);
//   }
  
//   describe('getUserName - async/await', () => {
//     describe('when the user id exists', () => {
//       it('returns the user name', async () => {
//         expect.assertions(1);
//         const data = await getUserName(4);
//         expect(data).toEqual('Mark');
//       });
//     });
  
//     describe('when the user id does not exists', () => {
//       it('returns an error', async () => {
//         expect.assertions(1);
//         try {
//           await getUserName(1);
//         } catch (error) {
//           expect(error).toEqual({ error: 'User with 1 not found.' });
//         }
//       });
//     });
//   });