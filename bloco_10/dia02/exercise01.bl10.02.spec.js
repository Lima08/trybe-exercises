const uppercase = (str, callBack) => {
   callBack(str.toUpperCase());
};

it('Testing if function uppercase return LIMALIMA', () => {
  expect.assertions(1);

  uppercase('lima', (result)=> {
    expect(result).toEqual('LIMA')
  })
});
