const readLine = require('readline-sync');

function menuOptions() {
  const menu = readLine.questionInt(
    `O que você quer fazer? \n 
    [1] - Tentar a sorte. \n
    [2] - Ver seu IMC. \n
    [3] - Calcular velocidade. \n
    Digite o numero da opção desejada. \n
    `
  );

  //  Utilizando so o require ele já executa a função.
  switch(menu) {
    case 1:
      require('./sorteio');
      break;
    case 2:
      require('./imc');
      break;
      case 3:
        require('./velocidade');
        break;
      default:
        console.log("Selecione uma opção valida.");
        menuOptions();
        break;
  }
}

menuOptions();
