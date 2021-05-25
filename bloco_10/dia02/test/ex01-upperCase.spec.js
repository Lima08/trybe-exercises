const upperCase = require('../src/ex01-uppercase');

it('Testing if function uppercase returns LIMA', () => {
  expect.assertions(1);

  upperCase('lima', (result)=> {
    expect(result).toEqual('LIMA')
  })
});