//  ----- IMC ------
//  Peso / Altura * 2
//  Arustar o calculo 
const readLine = require('readline-sync');

const peso = readLine.questionInt("Digite seu peso: ");
const altura = readLine.questionInt("Digite sua altura: ");

function imc() {
  const result = peso / ((altura / 100) * 2);
  if (result < 18.5) {
    console.log(' Abaixo do peso (magreza)')
    return
  };

  if (result < 24,9){
   console.log(' Peso normal. IMC de s%', result);
   return
  }

  if (result < 29,9){
  console.log('Acima do peso (sobrepeso)');
  return
  }

  if (result < 34,9) {
  console.log(' Obesidade grau I');
  return
  }

  if (result < 39,9) {
  console.log('Obesidade grau II');
  return
  }
} 

imc();

module.exports = imc();
