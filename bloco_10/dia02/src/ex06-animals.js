// Nesse exercício, você irá criar funções parecidas com código abaixo - o mesmo que foi usado como exemplo sobre os testes de promise. Use como base para os exercícios a seguir:
// 6.1. Adicione uma funcionalidade para buscar pelo nome do animal - crie uma função que deverá passar no teste abaixo.
// Dica: use o código do exemplo dado para criar uma nova função, analise os testes antes de iniciar.

 const Animals = [
  { name: 'Dorminhoco', age: 1, type: 'Dog' },
  { name: 'Soneca', age: 2, type: 'Dog' },
  { name: 'Preguiça', age: 5, type: 'Cat' },
];

const findAnimalsByType = (type) => (
  new Promise((resolve, reject) => {
    setTimeout(() => {
      const arrayAnimals = Animals.filter((animal) => animal.type === type);
      if (arrayAnimals.length !== 0) {
        return resolve(arrayAnimals);
      };

      return reject({ error: 'Não possui esse tipo de animal.' });
    }, 100);
  })
);

const getListAnimals = (type) => (
  findAnimalsByType(type).then(list => list)
);

// const Animals = [
//   { name: 'Dorminhoco', age: 1, type: 'Dog' },
//   { name: 'Soneca', age: 2, type: 'Dog' },
//   { name: 'Preguiça', age: 5, type: 'Cat' },
// ];

const findAnimalByName = (name) => (
  new Promise((resolve, reject) => {
    setTimeout(() => {
      const animalsByName = Animals.filter(animal => animal.name === name);
      if (animalsByName.length > 0) {
        return resolve(animalsByName);
      };

      return reject('Nenhum animal com esse nome!');
    }, 100);
  })

);

// console.log(getAnimal('Dorminhoco'));

// 6.2. Adicione uma nova funcionalidade para buscar pela idade dos animais. O retorno deve ser um array de objetos, mas, caso não ache nenhum, retorne uma mensagem de erro. Escreva tanto a função como o seu teste.

const findAnimalsByAge = (age) => (
  new Promise((resolve, reject) => {
    setTimeout(() => {
      const animalAge = Animals.filter(animal => animal.age === age);
      if (animalAge.length > 0) {
        return resolve(animalAge);
      };

      return reject({ error: 'There are not animals of that age' });
    }, 100);
  })
);

const getAnimal = (data) => {
  if (typeof data === 'string') {
    return findAnimalByName(data).then(animal => animal);
  };
  return findAnimalsByAge(data).then(animal => console.log(animal));
};

console.log(getAnimal(1))

module.exports = {
  getAnimal
};