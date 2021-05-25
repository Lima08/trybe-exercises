


Object.keys --> Chaves
Object.values() --> valores
Object.includes() --> se possui o parametro passado dentro de alguma variavel epecifica
Object.assign(param1,param2) ---> Da ao param1(que seria um obs) as propriedades do param2(outro obj)
Para o assign da para colocar o param1 como um obj que nao existe, fazendo assim um CloseEvent.
Object.entries() coloca as chaves e valores do obj em arrays. Um array para cada e encapsula em uum array de array


const obj = {
  lima: 08,
  jp: 'apelido'
}

console.log(Object.values(obj).includes("lima"));
console.log(Object.values(obj));
console.log(Object.keys(obj));
console.table(Object.values(obj).includes("lima"));
console.table(Object.values(obj));
console.table(Object.keys(obj));

const keys = Object.keys(obj);
console.log(keys)

for ( let index = 0; index < keys.length; index += 1) {
  console.log(obj[keys[index]]);
}
