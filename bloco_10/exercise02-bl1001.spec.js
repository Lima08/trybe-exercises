const myRemove = require('./exercise02-bl1001');

describe('Test myRemove', () => {
  it('return correct array', () => {
    expect(myRemove([1, 2, 3, 4], 3)).toEqual([1, 2, 4]);
  });

  it('return correct array', () => {
    expect(myRemove([1, 2, 3, 4], 3)).not.toEqual([1, 2, 3, 4]);
  });
});





// assert.strictEqual(typeof myRemove, 'function');
// assert.deepStrictEqual(myRemove([1, 2, 3, 4], 3), [1, 2, 4], 'O retorno é diferente do esperado.');
// assert.notDeepStrictEqual(myRemove([1, 2, 3, 4], 3), [1, 2, 3, 4], 'O retorno é diferente do esperado.');
// const array = [1, 2, 3, 4];
// myRemove(array,1);
// assert.deepStrictEqual( array, [1, 2, 3, 4]);
// assert.deepStrictEqual(myRemove([1, 2, 3, 4], 5), [1, 2, 3, 4], 'O retorno é diferente do esperado.');