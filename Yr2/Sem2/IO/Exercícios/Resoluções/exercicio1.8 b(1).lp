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
// A distância do cliente j ao depósito ao longo do eixo dos x é dada pelo valor absoluto de: x - coord_xj, | x - coord_xj |
// O valor de (x - coord_xj) pode ser positivo ou negativo, consoante a posição relativa do cliente e do depósito.

// Vamos usar uma variável sem restrição de sinal para representar (x - coord_xj).
// Uma variável sem restrição de sinal é expressa como a diferença entre duas variáveis não negativas:
//  (x - coord_xj) = xjp - xjn
//  xjp expressa o valor de (x - coord_xj) quando (x - coord_xj) é positivo
//  xjn expressa o valor de (x - coord_xj) quando (x - coord_xj) é negativo

// A função xjp + xjn expressa o valor absoluto da distância entre o depósito e o cliente j ao longo do eixo x.
//          xjp + xjn = |xjp, se a posição relativa for positiva
//                      |xjn, se a posição relativa for negativa

// o mesmo para a coordenada y

// dj = xjp + xjn + yjp + yjn = distância total entre o depósito e o cliente j (eixos x e y)


min:  dmax
// adicionar uma penalidade infinitesimal aos valores das distâncias
// para, entre valores admissíveis alternativos de d1 ... d5,
// escolher os mais pequenos:
+ 1e-10 d1 + 1e-10 d2 + 1e-10 d3 + 1e-10 d4 + 1e-10 d5;


// posição relativa ao longo do eixo do x
x - 2 = x1p - x1n;
x -10 = x2p - x2n;
x - 1 = x3p - x3n;
x - 9 = x4p - x4n;
x - 3 = x5p - x5n;

// posição relativa ao longo do eixo do y
y - 8 = y1p - y1n;
y - 7 = y2p - y2n;
y - 3 = y3p - y3n;
y - 1 = y4p - y4n;
y - 6 = y5p - y5n;

// distância total (eixos x e y) entre o local e o cliente j
x1p + x1n + y1p + y1n = d1;
x2p + x2n + y2p + y2n = d2;
x3p + x3n + y3p + y3n = d3;
x4p + x4n + y4p + y4n = d4;
x5p + x5n + y5p + y5n = d5;

// encontra o maior valor de distância
dmax >= d1;
dmax >= d2;
dmax >= d3;
dmax >= d4;
dmax >= d5;



