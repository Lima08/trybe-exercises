/* 2- Para o segundo exercício, faça o mesmo que antes, mas que imprima um triângulo retângulo com 5 asteriscos de base. Por exemplo:
Copiar
n = 5

*
**
***
****
***** */

function asteriskString (stringsize){
  for (let asterisk = "*"; asterisk.length <= stringsize; asterisk += "*") {
    console.log(asterisk);
  }
}

asteriskString(5);
asteriskString(5);
asteriskString(5);