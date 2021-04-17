const statesList = {
  AC:'Acre',
  AL:'Alagoas',
  AP:'Amapá',
  AM:'Amazonas',
  BA:'Bahia',
  CE:'Ceará',
  DF:'Distrito Federal',
  ES:'Espírito Santo',
  GO:'Goiás',
  MA:'Maranhão',
  MT:'Mato Grosso',
  MS:'Mato Grosso do Sul',
  MG:'Minas Gerais',
  PA:'Pará',
  PB:'Paraíba',
  PR:'Paraná',
  PE:'Pernambuco',
  PI:'Piauí',
  RJ:'Rio de Janeiro',
  RN:'Rio Grande do Norte',
  RS:'Rio Grande do Sul',
  RO:'Rondônia',
  RR:'Roraima',
  SC:'Santa Catarina',
  SP:'São Paulo',
  SE:'Sergipe',
  TO:'Tocantins'
};

const sectionStatus = document.getElementById('state-list');
const input = document.createElement('option');
input.value = 'lima';
input.innerText = '08'
sectionStatus.appendChild(input);
const input2 = document.createElement('option');
input2.value = 'joao';
input2.innerText = '07'
sectionStatus.appendChild(input2);
// Criar uma função que recupere o select do dom e crie suas <options> dinamicamente, atribuindo innertext e value 
// loop for
function createOption() {
 const option = document.createElement('option');
 return option;
}

function setOption(stateObject) {
  for (let variable in stateObject) {
    createOption.AC;
  }
  // cria a quantidade de options iqual a quantidade de chaves no objeto.
  // Cria a section e adiciona todas as options na section
  // Devolve a section com options com value( valor da propriedade) e innerText(propriedade) definidos pelo objeto
}

for (x in statesList) {
  console.log(statesList[x])
  }
  for (x in statesList) {
    console.log(x)
    }