const sum = require('./exercise01-bl1001');

describe(' Sum function test', () => {
  it('4 plus 5 equal 9', () => {
    expect(sum(4, 5)).toBe(9);
  });

  it('0 plus 0 equal 0', () => {
    expect(sum(0, 0)).toBe(0);
  });

  it('Return error', () => {
    expect(() => { sum(4, '5') }).toThrow();
  });

  it('Return error msg', () => {
    expect(() => { sum(4, "5"); }).toThrow(/parameters must be numbers/);
  })
})





// assert.strictEqual(sum(4, 5), 9, 'Soma de 4 e 5 é 9');
// assert.strictEqual(sum(0, 0), 0, 'Soma de 0 e 0 é 0');
// assert.throws(() =>{ sum(4, "5"); });
// assert.throws(() =>{ sum(4, "5"); }, /^Error: parameters must be numbers$/ );