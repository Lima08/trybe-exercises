// 1- Adicione a tag h1 com o texto Exercício 5.2 - JavaScript DOM como filho da tag body ;
let body = document.querySelector('body');
let h1 = document.createElement('h1');
h1.innerText ="Exercício 5.2 - JavaScript DOM";
body.appendChild(h1);

// 2- Adicione a tag div com a classe main-content como filho da tag body ;
let div = document.createElement('div');
body.appendChild(div);
div.className += 'main-content';

// 3- Adicione a tag div com a classe center-content como filho da tag div criada no passo 2;
let div2 = document.createElement('div');
div2.className += 'center-content';
div.appendChild(div2);

// 4- Adicione a tag p como filho do div criado no passo 3 e coloque algum texto;
let tagP = document.createElement('p');
tagP.innerText = 'Estudando o DOM';
div2.appendChild(tagP);

// 5- Adicione a tag div com a classe left-content como filho da tag div criada no passo 2;
let div3 = document.createElement('div');
div3.className += 'left-content';
div.appendChild(div3);

// 6- Adicione a tag div com a classe right-content como filho da tag div criada no passo 2;
let div4 = document.createElement('div');
div4.className += 'right-content';
div.appendChild(div4);

// 7- Adicione uma imagem com src configurado para o valor https://picsum.photos/200 e classe small-image . Esse elemento deve ser filho do div criado no passo 5;
let img = document.createElement('img');
img.src="https://picsum.photos/200";
img.className += 'small-image';
div3.appendChild(img);

// 8- Adicione uma lista não ordenada com os valores de 1 a 10 por extenso como valores da lista. Essa lista deve ser filha do div criado no passo 6;
let list = document.createElement('ul');
let elementList = ['Um','Dois','Três','Quatro','Cinco','Seis','Sete','Oito','Nove','Dez'];
for (let index = 0; index < 10; index += 1) {
  let item = document.createElement('li');
  item.innerText = elementList[index];
  list.appendChild(item);
}
div4.appendChild(list);

// 9- Adicione 3 tags h3 , todas sendo filhas do div criado no passo 2.
for (index = 0; index < 3; index +=1) {
  let tagh3 = document.createElement('h3');
  tagh3.innerText = 'Tag H3 dinâmica';
  div.appendChild(tagh3);
}

// EX parte 2


// 3- Remova o div criado no passo 5 (aquele que possui a classe left-content ). Utilize a função .removeChild() ;
// 4- Centralize o div criado no passo 6 (aquele que possui a classe right-content ). Dica: para centralizar, basta configurar o margin-right: auto do div ;
// 5- Troque a cor de fundo do elemento pai da div criada no passo 3 (aquela que possui a classe center-content ) para a cor verde;
// 6- Remova os dois últimos elementos ( nove e dez ) da lista criada no passo 8.

// 1- Adicione a classe title na tag h1 criada;
h1.className += 'title';

// 2- Adicione a classe description nas 3 tags h3 criadas;
let h3s = document.querySelectorAll('h3');
for (h3 of h3s) {
  h3.className += 'description';
}
