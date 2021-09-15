//  Updates Simples e Complexo

/* 
  Utilizar o método updateOne() ;
  Utilizar o método updateMany() ;
  Utilizar os operadores $set , $mul , $inc , $min , $max e $currentDate ;
  Renomear campos;
  Remover campos.
 */

  // Collections para utilizarmos nos exemplos
use conteudo_trybe;
db.inventory.insertMany([
  { "item": "journal", "qty": 25, "size": { "h": 14, "w": 21, "uom": "cm" }, "status": "A" },
  { "item": "notebook", "qty": 50, "size": { "h": 8.5, "w": 11, "uom": "in" }, "status": "A" },
  { "item": "paper", "qty": 100, "size": { "h": 8.5, "w": 11, "uom": "in" }, "status": "D" },
  { "item": "planner", "qty": 75, "size": { "h": 22.85, "w": 30, "uom": "cm" }, "status": "D" },
  { "item": "postcard", "qty": 45, "size": { "h": 10, "w": 15.25, "uom": "cm" }, "status": "A" }
  ]);

  /* 
    Utilizando o .updateOne()


    Temos dois parametros nessa função que sção passado como objetos. No primeiro colocamos o filtro que queremos utilizar para encontrar o que será atualizado no banco. O segundo é a operalçao em si, sendo a chave a ação e o valor o que será adicionado nessa ação. Segue exemplo
  
  */
    db.inventory.updateOne(
      { item: "paper" },
      { $set: { "size.uom": "cm", status: "P" } }
    );

/* Alterando múltiplos documentos
O método db.colecao.updateMany() permite que vários documentos que satisfaçam o critério de filtro sejam alterados de uma única vez.
No exemplo abaixo, o método db.colecao.updateMany() é utilizado para alterar todos os documentos da coleção inventory em que o valor do campo qty seja menor do que 50 :
db.inventory.updateMany(
  { "qty": { $lt: 50 } },
  { $set: { "size.uom": "in", status: "P" } }
);
A operação acima utiliza o operador $set para alterar o valor do campo size.uom para in e o valor do campo status para P .
Ou seja, se você tiver 10 documentos na coleção inventory em que o valor do campo qty seja menor do que 50 (esse valor foi passado como parâmetro do filtro e utilizou o operador $lt ), todos esses documentos serão alterados em uma única operação.
⚠️ Chamando o método db.colecao.updateMany() com o parâmetro de filtro vazio { } , o resultado é a atualização de todos os documentos presentes em colecao . ⚠️ */

/* 
  uTILIZAMOS $SET como chave do objeto do segundo parametro. Em seu valor o que será adicionado. No primeiro parametro colocamos para ser encontrado o documento qeu tem a chave item com o valor paper. Esse será o elemento atualizado.
  Se colocarmos um objeto vazio no primeiro parametro o que será atualizado é o primeiro objeto do banco.
  Se fizermos isso com uma função updateMany() atualizará todos os registros.
*/

/* 
Operador $set
  Como você viu nos exemplos acima, o $set altera o valor de um campo específico.
  Se o campo não existir, o operador $set adiciona um novo campo com o valor especificado. Se você especificar campos com dot notation , os documentos embedados necessários serão criados para suprir o caminho do campo.
  Você pode especificar múltiplos pares de campos-valores que o operador $set alterará ou criará cada um desses campos.
  Veja alguns exemplos considerando a coleção products com o seguinte documento:
  use conteudo_trybe;
  db.products.insertOne({
  _id: 100,
  sku: "abc123",
  quantity: 250,
  instock: true,
      reorder: false,
      details: { model: "14Q2", make: "xyz" },
      tags: [ "apparel", "clothing" ],
      ratings: [ { by: "ijk", rating: 4 } ]
    })
  Exemplo 1: Alterando campos no primeiro nível (top-level)
    Para o documento que corresponder ao critério de filtro em que o campo _id seja igual a 100 , a operação a seguir altera o valor dos campos quantity , details e tags :
    db.products.update(
      { _id: 100 },
      { $set: {
          quantity: 500,
          details: { model: "14Q3", make: "xyz" },
          tags: [ "coats", "outerwear", "clothing" ]
        }
      }
    );
    A operação acima altera o valor de quantity para 500 , details para um novo documento embedado e tags para um novo array .
    No exemplo acima, vários campos foram agrupados e, com isso, são alterados em um mesmo comando! Assim, você pode alterar vários campos de uma única vez.
    Exemplo 2: Alterando campos em documentos embedados
    Para alterar campos dentro de subdocumentos, você deve utilizar o mesmo conceito de dot notation visto durante as operações de find() .
    A operação abaixo altera o valor do campo make dentro do subdocumento details em que o campo _id seja igual a 100 :
    db.products.update(
      { _id: 100 },
      { $set: { "details.make": "zzz" } }
    );
    Exemplo 3: Alterando valores em arrays
    Como visto, arrays são uma estrutura muito importante na modelagem de dados do MongoDB , e em algum momento você precisará fazer updates nessas estruturas.
    A query abaixo tem como critério de seleção o campo _id igual a 100 . Ela altera o segundo elemento (índice 1 ) do array tags e o campo rating no primeiro elemento (índice 0 ) do array ratings :
    db.products.update(
      { _id: 100 },
      { $set: {
          "tags.1": "rain gear",
          "ratings.0.rating": 2
        }
      }
    );
    Na operação acima, a posição no array está especificada explicitamente. Mais à frente, você verá como fazer para que esse valor seja dinâmico, dependendo de um critério de seleção. Verá também a utilização de outros operadores mais específicos para operações em arrays .
*/

/* 
  Operador $mul
  O operador $mul multiplica o valor de um campo por um número especificado, persistindo o resultado dessa operação sem a necessidade do operador $set .
Considere a coleção products com o novo documento descrito abaixo:
db.products.insertOne(
  { "_id": 1, "item": "ABC", "price": NumberDecimal("10.99"), "qty": 25 }
);
A query abaixo altera esse documento, utilizando o operador $mul para multiplicar os valores dos campos price e qty :
db.products.update(
  { _id: 1 },
  { $mul: { price: NumberDecimal("1.25"), qty: 2 } }
);
O resultado dessa operação é o documento abaixo, em que o novo valor do campo price é o valor original 10.99 multiplicado por 1.25 , e o valor do campo qty , que originalmente era 25 , é multiplicado por 2 :
{ "_id": 1, "item": "ABC", "price": NumberDecimal("13.7375"), "qty": 50 }
Você pode utilizar o $mul em um campo que não exista no documento. Nesse caso, o operador criará o campo e atribuirá a ele o valor zero do mesmo tipo numérico do multiplicador .
Considerando um outro documento na coleção products :
db.products.insertOne(
  { _id: 2, item: "Unknown" }
);
A query abaixo faz um update no documento, aplicando o operador $mul no campo price , que não existe neste documento:
db.products.update(
  { _id: 2 },
  { $mul: { price: NumberLong("100") } }
);
Como resultado, temos o campo price criado no documento com valor zero do mesmo tipo numérico do multiplicador. Nesse caso, o tipo é NumberLong :
{ "_id": 2, "item": "Unknown", "price": NumberLong(0) }
Você também pode multiplicar valores com tipos diferentes. Veja o documento abaixo:
db.products.insertOne(
  { _id: 3,  item: "XYZ", price: NumberLong("10") }
);
A query abaixo faz um update , multiplicando o valor do campo price , que é do tipo NumberLong("10") , por NumberInt(5) :
db.products.update(
  { _id: 3 },
  { $mul: { price: NumberInt(5) } }
);
E como resultado temos o seguinte:
{ "_id": 3, "item": "XYZ", "price": NumberLong(50) }
Saiba mais sobre as Regras de Conversão de Tipos em Multiplicações.
*/


/* 
  Operador $inc
  Com o operador $inc , você pode incrementar ou decrementar valores em um campo específico, utilizando tanto valores positivos quanto negativos.
Esse operador é bastante útil para fazer alterações em campos numéricos sem a necessidade prévia de uma consulta para retornar o valor atual do campo. Com o $inc , em uma única operação isso é possível!
Considere que você tenha o seguinte documento na coleção increment :
db.increment.insertOne(
  {
    _id: 1,
    sku: "abc123",
    quantity: 10,
    metrics: {
      orders: 2,
      ratings: 3.5
    }
  }
)
Na operação de update a seguir, o operador $inc é utilizado para decrementar o valor do campo qty em 2 (incrementa em -2 ) e incrementar o valor do campo metrics.orders em 1 :
db.increment.update(
  { sku: "abc123" },
  { $inc: { quantity: -2, "metrics.orders": 1 } }
);
O documento alterado ficará assim:
{
  "_id": 1,
  "sku": "abc123",
  "quantity": 8,
  "metrics": {
    "orders": 3,
    "ratings": 3.5
  }
}
Note que, em uma única chamada ao operador $inc , você consegue aumentar e diminuir os valores de campos diferentes.
*/

/* Operador $inc
Com o operador $inc , você pode incrementar ou decrementar valores em um campo específico, utilizando tanto valores positivos quanto negativos.
Esse operador é bastante útil para fazer alterações em campos numéricos sem a necessidade prévia de uma consulta para retornar o valor atual do campo. Com o $inc , em uma única operação isso é possível!
Considere que você tenha o seguinte documento na coleção increment :
Copiar
db.increment.insertOne(
  {
    _id: 1,
    sku: "abc123",
    quantity: 10,
    metrics: {
      orders: 2,
      ratings: 3.5
    }
  }
)
Na operação de update a seguir, o operador $inc é utilizado para decrementar o valor do campo qty em 2 (incrementa em -2 ) e incrementar o valor do campo metrics.orders em 1 :
db.increment.update(
  { sku: "abc123" },
  { $inc: { quantity: -2, "metrics.orders": 1 } }
);
O documento alterado ficará assim:
{
  "_id": 1,
  "sku": "abc123",
  "quantity": 8,
  "metrics": {
    "orders": 3,
    "ratings": 3.5
  }
}
Note que, em uma única chamada ao operador $inc , você consegue aumentar e diminuir os valores de campos diferentes. */

/* $mul */
/* $min e $max */
/* $currentDate */
/* $rename */
/* $unset */

//  Referencia:
//  https://docs.mongodb.com/manual/reference/operator/update-field/
//  https://docs.mongodb.com/manual/reference/update-methods/