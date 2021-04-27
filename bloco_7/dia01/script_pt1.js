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

// código com let (vs2)
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
// código com let (vs2)
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

// (vs2)Em arrow function com ternario
const testingScope = (escopo) => escopo === true ?  console.log(' ótimo, fui utilizada no escopo !') : console.log('Não devo ser utilizada fora meu escopo (else)');

testingScope(false);

// PT1 -EX 2  
/* Copie o código abaixo e faça uma função que retorne o array oddsAndEvens em ordem crescente.
Utilize template literals para que a chamada console.log(oddsAndEvens); retorne "Os números 2,3,4,7,10,13 se encontram ordenados de forma crescente!".
Bônus (opcional): tente fazer o mesmo exercício utilizando o método array.sort() . Spoiler: É possível realizar uma função que ordene qualquer array de números. */

const oddsAndEvens = [13, 3, 4, 10, 7, 2];

// Seu código aqui..

console.log(oddsAndEvens);
