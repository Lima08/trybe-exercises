const readLine = require('readline-sync');

function playAgain() {
  const userAnswer = readLine.question("Jogar novamente? (S/N) \n");

  switch(userAnswer.toLowerCase()) {
    case "s":
      return true;
    case "n":
      console.log("\n Adeus e obrigado pelos peixes!");
      return false
    default:
      console.log("Não entendi. Responda com S ou N.")
  }

  return playAgain();
}

function loteria() {
  const randouNumber = Math.round(Math.random() * 10);
  const userChoice = readLine.questionInt("Escolha um numero de 0 a 10: \n");
  
  const rigthChoiceMsg =  "Parabéns, número correto!";
  const wrongChoiceMsg = `Opa, não foi dessa vez. O número era ${randouNumber} e você escolheu ${userChoice}. \n`;
  
  if (userChoice === randouNumber) {
    console.log(rigthChoiceMsg)
  } else {
    console.log(wrongChoiceMsg)
  };
}

function startLoopGame() {
  loteria();
  while (playAgain()) loteria();
}

module.exports = startLoopGame();
