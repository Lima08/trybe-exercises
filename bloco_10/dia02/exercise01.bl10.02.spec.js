const uppercase = (str, callback) => {
  callback(str.toUpperCase());
};

it('Testing if function uppercase return LIMALIMA', () => {
  expect.assertions(1);

  uppercase('limalima', (result) => {
    expect(result).toBe('LIMALIMA')
  });
});
