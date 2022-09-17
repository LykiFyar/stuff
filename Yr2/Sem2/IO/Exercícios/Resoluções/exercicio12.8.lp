/* Objective function */
max: 50x1 + 60x2 + 30x3 + 40x4
   - 4000y1 - 5000y2 - 7000y3 -6000y4 ;

/* restrições */

x1 <= 100000 y1;
x2 <= 100000 y2;
x3 <= 100000 y3;
x4 <= 100000 y4;


// máximo de três novos produtos
y1 + y2 + y3 + y4 <= 3;

// seleccao de 1 força seleccao de 3
y1 <= y3;


// formato geral Ax <= b1 + M (1-rest)
// formato geral Ax <= b1 + M  - M rest
2x1 + 3x2 + 4x3 + 5x4 <= 120000 - 100000 rest1;
5x1 + 4x2 + 3x3 + 2x4 <= 120000 - 100000 rest2;
1x1 + 1x2 + 1x3 + 1x4 <= 105000 - 100000 rest3;

// uma restrição poderá não ser activa:
rest1 + rest2 + rest3 >= 2; // restrição é activa quando resti = 1

bin y1,y2,y3,y4,rest1,rest2,rest3;
//int x1 x2 x3 x4;

