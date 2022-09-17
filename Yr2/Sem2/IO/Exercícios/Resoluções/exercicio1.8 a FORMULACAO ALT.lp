/*

problema de localização - exercicio 1.8 a)

objectivo: minimização das distância percorridas entre o depósito e os clientes

*/

// x, y - coordenadas do depósito (assume-se colocação num ponto da grelha, e portanto >= 0)
//
// NOTA: as variáveis x e y podem ser fraccionárias;
//       se se pretender que o local fique na intersecção de 2 traços do quadriculado,
//       as variáveis x e y devem ser declaradas como inteiras

// O cliente j está localizado no ponto com coordenadas  ( coord_xj ,coord_yj )
// A distância do cliente j ao depósito ao longo do eixo dos x é dada pelo valor absoluto de: x - coord_xj,  | x - coord_xj |
// o mesmo para a coordenada y

// vamos usar as variáveis
// dxj = max { x - coord_xj , coord_xj - x } para representar o valor absoluto da distância ao longo do eixo dos x
// dyj = max { y - coord_yj , coord_yj - y } para representar o valor absoluto da distância ao longo do eixo dos y
//
// a distância total entre o depósito e o cliente j (eixos x e y) é dada por dj = dxj + dyj

// se quiséssemos minimizar a soma das distâncias, a f. objectivo seria:
// min:     d1 +    d2 +    d3 +     d4 +    d5;


min:  15 d1 +  8 d2 + 17 d3 +  12 d4 +  4 d5;

// posição relativa ao longo do eixo do x
  x - 2 <= dx1;
- x + 2 <= dx1;
  x -10 <= dx2;
- x +10 <= dx2;
  x - 1 <= dx3;
- x + 1 <= dx3;
  x - 9 <= dx4;
- x + 9 <= dx4;
  x - 3 <= dx5;
- x + 3 <= dx5;

// posição relativa ao longo do eixo do y
  y - 8 <= dy1;
- y + 8 <= dy1;
  y - 7 <= dy2;
- y + 7 <= dy2;
  y - 3 <= dy3;
- y + 3 <= dy3;
  y - 1 <= dy4;
- y + 1 <= dy4;
  y - 6 <= dy5;
- y + 6 <= dy5;

// distância total (eixos x e y) entre o local e o cliente j
dx1 + dy1 = d1;
dx2 + dy2 = d2;
dx3 + dy3 = d3;
dx4 + dy4 = d4;
dx5 + dy5 = d5;






