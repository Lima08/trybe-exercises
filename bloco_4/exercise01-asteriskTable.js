/* 1- Para o primeiro exercício de hoje, faça um programa que, dado um valor n qualquer, seja n > 1 , imprima na tela um quadrado feito de asteriscos de lado de tamanho n . Por exemplo:

n = 5

*****
*****
*****
*****
*****/

function table () {
  let sizeTable = 5;

  for (let asterisk = '*'; asterisk.length <= sizeTable; asterisk += '*') {
   for (var asterisk1 = '*'; asterisk1.length < sizeTable; asterisk1 += '*') {}
   console.log(asterisk1);
  }
}
table();
table();
