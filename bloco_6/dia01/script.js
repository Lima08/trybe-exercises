const labelStates = document.getElementById('label');

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

function createOption() {
 const option = document.createElement('option');
 return option;
}

function setOption(stateObject) {
  const newSection = document.createElement('select');
  newSection.id = 'state-list';
  for (let proprity in stateObject) {
    const newInput = createOption();
    newInput.innerText = stateObject[proprity];
    newInput.value = proprity;
    newSection.appendChild(newInput);
  }
  return newSection;
}

labelStates.appendChild(setOption(statesList));

