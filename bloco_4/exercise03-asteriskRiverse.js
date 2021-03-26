/* 3- Agora inverta o lado do triângulo. Por exemplo:
Copiar
n = 5

    *
   **
  ***
 ****
*****
Atenção! Note que esse exercício é bem mais complexo que o anterior! Não basta, aqui, imprimir somente asteriscos. Você precisará de uma lógica para imprimir espaços também. */

function asteriskRiverse(stringsize) {
  let space = "";
  let asterisk = "";
  for (let index = 1; index < stringsize; index += 1) {
    space += "-"; 
  }
  for (let index = 1; index < stringsize; index += 1) {
    asterisk += "*"; 
  }
  console.log(space + asterisk);
}   

asteriskRiverse(5);


