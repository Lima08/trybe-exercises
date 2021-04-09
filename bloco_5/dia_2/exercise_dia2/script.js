// 5- Adicione a tag div com a classe left-content como filho da tag div criada no passo 2;
// 6- Adicione a tag div com a classe right-content como filho da tag div criada no passo 2;
// 7- Adicione uma imagem com src configurado para o valor https://picsum.photos/200 e classe small-image . Esse elemento deve ser filho do div criado no passo 5;
// 8- Adicione uma lista não ordenada com os valores de 1 a 10 por extenso como valores da lista. Essa lista deve ser filha do div criado no passo 6;
// 9- Adicione 3 tags h3 , todas sendo filhas do div criado no passo 2.

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