/* 3- Agora inverta o lado do triângulo. Por exemplo:
Copiar
n = 5

    *
   **
  ***
 ****
*****
Atenção! Note que esse exercício é bem mais complexo que o anterior! Não basta, aqui, imprimir somente asteriscos. Você precisará de uma lógica para imprimir espaços também. */

 /*  function asteriskRiverse(stringsize) {
    let row = "";
 */
    /* for (let numberRows = 0; numberRows <= stringsize; numberRows += 1){ */
/*       for (let index = 1; index < stringsize; index += 1) {
        for (let index = 1; stringsize > index ; index -= 1)
        row += "-";
      }
      if (row.length < stringsize) {
        row += "*";
      } 
    } */

 /*    console.log(row);
  }   

  asteriskRiverse(5);

  let n = 5;


  for (let index = 0; index < n; index += 1) {
    console.log('*'.repeat(n));
  }
 */


let n = 5;
let symbol = '*';
let inputLine = '';

let midOfMatrix = (n + 1) / 2;
let controlLeft = midOfMatrix;
let controlRight = midOfMatrix;

for (let lineIndex = 0; lineIndex <= midOfMatrix; lineIndex += 1) {
  for (let columnIndex = 0; columnIndex <= n; columnIndex += 1) {
    if (columnIndex > controlLeft && columnIndex < controlRight) {
      inputLine = inputLine + symbol;
    } else {
      inputLine = inputLine + ' ';
    }
  }
  console.log(inputLine);
  inputLine = '';
  controlRight += 1;
  controlLeft -= 1
};