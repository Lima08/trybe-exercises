// PT1 - Ex 1
/* Faça as modificações necessárias na função para que o seu comportamento respeite o escopo no qual cada variável foi declarada.
Modifique a estrutura da função para que ela seja uma arrow function .
Modifique as concatenações para template literals .
Copie o código abaixo. */

// código original
function testingScope(escopo) { 
  let ifScope = 'Não devo ser utilizada fora do meu escopo (if)';
  let elseScope = 'Não devo ser utilizada fora meu escopo (else)';
  if (escopo === true) {
    ifScope = `${ifScope} ótimo, fui utilizada no escopo!`;
    return ifScope;
  } else {
    elseScope = `${elseScope} Frase para concatenar com tamplate literals!`;
  }
  return elseScope;
}

console.log(testingScope(true));
console.log(testingScope(false));

// código com let (vs2)-----------------------------------------------------------------------------------------------------------------------
function testingScope(escopo) {
  if (escopo === true) {
    var ifScope = 'Não devo ser utilizada fora do meu escopo (if)';
    ifScope = ifScope + ' ótimo, fui utilizada no escopo !';
    console.log(ifScope);
  } else {
    var elseScope = 'Não devo ser utilizada fora meu escopo (else)';
    console.log(elseScope);
  }
  console.log(ifScope + ' o que estou fazendo aqui ? :O'); // Se necessário esta linha pode ser removida.
}
// código com let (vs2)-----------------------------------------------------------------------------------------------------------------------
function testingScope(escopo) {
  let ifScope;
  let elseScope;
  if (escopo === true) {
    ifScope = 'ótimo, fui utilizada no escopo!';
  } else {
    elseScope = 'Não devo ser utilizada fora meu escopo (else).';
  }
  return ifScope||elseScope;
}

console.log(testingScope(true));

// (vs2)Em arrow function com ternario-------------------------------------------------------------------------------------
const testingScope = (escopo) => escopo === true ?  console.log(' ótimo, fui utilizada no escopo !') : console.log('Não devo ser utilizada fora meu escopo (else)');

testingScope(false);

// PT1 -EX 2  -----------------------------------------------------------------------------------------------------------------------
/* Faça uma função que retorne o array oddsAndEvens em ordem crescente.
Utilize template literals para que a chamada console.log(oddsAndEvens); retorne "Os números 2,3,4,7,10,13 se encontram ordenados de forma crescente!".
Bônus (opcional): tente fazer o mesmo exercício utilizando o método array.sort() . Spoiler: É possível realizar uma função que ordene qualquer array de números. */

// vs 1-----------------------------------------------------------------------------------------------------------------------
const oddsAndEvens = [13, 3, 4, 10, 7, 2];
// console.log(`${oddsAndEvens[5]}, ${oddsAndEvens[1]}, ${oddsAndEvens[2]}, ${oddsAndEvens[4]} e ${oddsAndEvens[3]}`);
console.log(oddsAndEvens.sort((a,b)=> 0))
console.log(`Os números ${oddsAndEvens} se encontram ordenados de forma crescente!`);

// vs bonûs-----------------------------------------------------------------------------------------------------------------------
const oddsAndEvens = [13, 3, 4, 10, 7, 2];
console.log(`Os números ${oddsAndEvens.sort((a,b) => a-b).join()} se encontram ordenados de forma crescente!`);

/* Parte 2 -----------------------------------------------------------------------------------------------------------------------
Crie uma função que receba um número e retorne seu fatorial.
Na matemática, o fatorial de um número não negativo N , com a notação N! , é o produto de todos os inteiros menores ou iguais a N . Exemplo: 4! = 4 * 3 * 2 * 1 = 24.
Bônus (opcional): tente fazer o mesmo exercício de forma recursiva . Spoiler: É possível resolver com uma linha usando ternary operator .*/

function fatorial(input) {
  let num = input;
  for (let index = input -1; index > 1; index -= 1) {
    num = num * index;
  }
  return num;
}
console.log(fatorial(4));

// Bonûs-----------------------------------------------------------------------------------------------
// Não sei

/* 
Crie uma função que receba uma frase e retorne qual a maior palavra.
Exemplo:
longestWord("Antônio foi no banheiro e não sabemos o que aconteceu") // retorna 'aconteceu' */

let x = 'teste de uma andorinha';
console.log(x.sort((a,b) => b-a));

function biggestWord(str) {

}
console.log(x.length);



/* 
Crie uma página que contenha:
Um botão ao qual será associado um event listener ;
Uma variável clickCount no arquivo JavaScript que acumule o número de clicks no botão;
Um campo no HTML que vá atualizando a quantidade de clicks no botão conforme a variável clickCount é atualizada. */


/*
Crie um código JavaScript com a seguinte especificação:
Não se esqueça de usar template literals
Função 1 : Escreva uma função que vai receber uma string como parâmetro. Sua função deverá procurar pela letra x em uma string qualquer que você determinar e substituir pela string que você passou como parâmetro. Sua função deve retornar essa nova string .
Exemplo:
String determinada: "Tryber x aqui!"
Parâmetro: "Bebeto"
Retorno: "Tryber Bebeto aqui!"
Um array com escopo global, que é o escopo do arquivo JS , nesse caso, contendo cinco strings com suas principais skills .
Função 2 : Escreva uma função que vai receber a string retornada da Função 1 como parâmetro. Essa função deve concatenar as skills do array global à string que foi passada para a Função 2 via parâmetro. Você deve ordenar os skills em ordem alfabética. Sua função deve retornar essa nova string .
Exemplo: "Tryber x aqui! Minhas cinco principais habilidades são:
JavaScript;
HTML; ... #goTrybe". */
