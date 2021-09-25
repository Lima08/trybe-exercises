const readLine = require('readline-sync');
const discancia = readLine.questionInt("Digite a distância")
const velocidade = readLine.questionInt("Digite a velocidade")

//  Calculo qualquer. Função montada apenas para entender o fluxo no Node.
function calcularVelocidade() {
  console.log(discancia / velocidade)
}

calcularVelocidade();

module.exports = calcularVelocidade();
