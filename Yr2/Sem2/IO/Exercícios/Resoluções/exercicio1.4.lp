

/* Objective function */
min:  5 x1 + 5.5 x2 + 6.5 x3 + 6.5 x4 + 6.5 x5 + 6.5 x6 + 6 x7;

/* restrições */

f2eira: x1              + x4  + x5  + x6  + x7  >= 10;
f3eira: x1  + x2              + x5  + x6  + x7  >= 16;
f4eira: x1  + x2  + x3              + x6  + x7  >= 12;
f5eira: x1  + x2  + x3  + x4              + x7  >=  8;
f6eira: x1  + x2  + x3  + x4  + x5              >= 15;
sabado:     + x2  + x3  + x4  + x5  + x6        >= 18;
domngo:           + x3  + x4  + x5  + x6  + x7  >= 12;

int x1, x2, x3, x4, x5, x6, x7;