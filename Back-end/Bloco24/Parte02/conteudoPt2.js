// Operador $push

//  Adicionando um valor a um array
use sales;
db.supplies.updateOne(
  { _id: 1 },
  {
push: {
      items: {
        "name": "notepad",
        "price":  35.29,
        "quantity": 2,
      },
    },
  },
  { upsert: true },
);

/* Veja, o método updateOne() é o mesmo que você já utilizou nos exemplos anteriores. A única diferença é a inclusão do operador $push . O resultado dessa operação é um documento com o seguinte formato: */
{
  _id : 1,
  items : [
      {
          "name" : "notepad",
          "price" : 35.29,
          "quantity" : 2,
      },
  ],
}

//   // Adicionando múltiplos valores a um array
//   Se você quiser adicionar múltiplos valores a um array , isso também é possível utilizando o operador $push , mas dessa vez será necessário adicionar o modificador $each .
// A operação abaixo adicionará mais dois produtos ao array items do primeiro documento na coleção supplies :
db.supplies.updateOne(
  {},
  {
push: {
      items: {
each: [
          {
            "name": "pens",
            "price": 56.12,
            "quantity": 5,
          },
          {
            "name": "envelopes",
            "price": 19.95,
            "quantity": 8,
          },
        ],
      },
    },
  },
  { upsert: true },
);

// O documento ficará assim:
{
  _id : 1,
  items : [
      {
          "name" : "notepad",
          "price" : 35.29,
          "quantity" : 2,
      },
      {
          "name" : "pens",
          "price" : 56.12,
          "quantity" : 5,
      },
      {
          "name" : "envelopes",
          "price" : 19.95,
          "quantity" : 8,
      },
  ],
}

//  Múltiplos modificadores

db.supplies.updateOne(
  { _id: 1 },
  {
push: {
      items: {
each: [
          {
            "name" : "notepad",
            "price" : 35.29,
            "quantity" : 2,
          },
          {
            "name": "envelopes",
            "price": 19.95,
            "quantity": 8,
          },
          {
            "name": "pens",
            "price": 56.12,
            "quantity": 5,
          },
        ],
sort: { quantity: -1 },
slice: 2,
      },
    },
  },
  { upsert: true },
);

/* Essa operação utiliza os seguintes modificadores:
O modificador $each para adicionar múltiplos documentos ao array items ;
O modificador $sort para ordenar todos os elementos alterados no array items pelo campo quantity em ordem decrescente;
E o modificador $slice para manter apenas os dois primeiros elementos ordenados no array items .
Em resumo, essa operação mantém no array items apenas os dois documentos com a quantidade (campo quantity ) mais alto. Veja o resultado logo abaixo: */
{
  _id : 1,
  items : [
    {
      "name" : "envelopes",
      "price" : 19.95,
      "quantity" : 8,
    },
    {
      "name" : "pens",
      "price" : 56.12,
      "quantity" : 5,
    },
  ],
}

// --------------------------------------------------------------------------------------
//  ----------------------Operador $pop---------------------
/* Uma maneira simples de remover o primeiro ou o último elemento de um array é utilizar o operador $pop . Passando o valor -1 ao operador $pop você removerá o primeiro elemento. Já ao passar o valor 1 , você removerá o último elemento do array .

Removendo o primeiro item de um array
Para remover o primeiro elemento do array items , utilize a seguinte operação:
*/
db.supplies.updateOne({ _id: 1 }, { $pop: { items: -1 } });

//  Com -1 conseguimso remover o primeiro alemento do array. Já com 1 remoovemos o ultimo elemento.


// --------------------------------------------------------------------------------------
/* --------------------- Operador $pull-------------------------------
O operador $pull remove de um array existente todos os elementos com um ou mais valores que atendam à condição especificada. */
db.supplies.updateMany(
  {},
  {
pull: {
      items: {
        name: { $in: ["pens", "envelopes"] },
      },
    },
  },
);

//  Na atualização acima, foi utilizado o operador $pull combinado com o operador $in para alterar o array items.

/* Removendo todos os itens que atendem a uma condição diretamente no $pull
Você pode especificar uma condição de remoção diretamente no $pull . Essa condição pode ser, por exemplo, um operador de comparação.
Tendo o seguinte documento na coleção profiles :
Copiar
{ _id: 1, votes: [3, 5, 6, 7, 7, 8] }
Você pode remover todos os elementos do array votes que sejam maiores ou iguais a ( $gte ) 6 . Por exemplo:
db.profiles.updateOne(
  { _id: 1 },
  {
    $pull: {
      votes: { $gte: 6 },
    },
  },
);
Depois dessa operação, o documento ficará apenas com valores menores do que 6 no array votes :
{ _id: 1, votes: [3,  5] }


Com a operação abaixo, você consegue remover do array results todos os elementos que contenham o campo score igual a 8 e o campo item igual a "B" . Ou seja, o documento deve atender a ambas as condições.
Copiar
db.survey.updateMany(
  {},
  {
    $pull: {
      results: { score: 8 , item: "B" },
    },
  },
);
*/

// --------------------------------------------------------------------------
//  Operador $addToSet --------------------------------

/*  Esse operador faz com que seja adicionado items em um array, porem apenas se o array não tiver esses itens.

3 pontos importantes:

 - Se você utilizá-lo em um campo que não existe no documento alterado, ele criará um campo do tipo array com o valor especificado na operação;
 - Se você utilizá-lo em um campo já existente no documento, mas esse campo não for um array , a operação não funcionará;
 - Se o valor passado for um documento, o MongoDB o considerará como duplicado se um documento existente no array for exatamente igual ao documento a ser adicionado, ou seja, possui os mesmos campos com os mesmos valores, e esses campos estão na mesma ordem.
- */
//  Adicionando ao array
// A operação abaixo adiciona o elemento "accessories" ao array tags desde que "accessories" não exista no array :
db.inventory.updateOne(
  { _id: 1 },
  { $addToSet: { tags: "accessories" } },
);

/* 
Se o valor existir
A operação abaixo tenta adicionar o elemento "camera" ao array tags . Porém, esse elemento já existe e a operação não surtirá efeito:*/
db.inventory.updateOne(
  { _id: 1 },
  { $addToSet: { tags: "camera"  } },
);
/* 
Como resultado dessa operação, é retornada uma mensagem dizendo que o MongoDB encontrou um documento com o _id igual a 1 , mas não fez nenhuma alteração:
{ "acknowledged" : true, "matchedCount" : 1, "modifiedCount" : 0 } */

//  Com o modificador $each
//  Para adicionar varios itens de uma só vez precisamos utilizar o modificador $each. Ele fará que seja adicionado mais de um com a mesma especificidade de não ser itens repetidos.
// Segue sintax:
db.inventory.updateOne(
  { _id: 2 },
  {
$addToSet: {
      tags: {
$each: ["camera", "electronics", "accessories"],
      },
    },
  },
);
//  ----------------------------------------------------------------------------------
//  --------------------------- Array Filters -----------------------------------------