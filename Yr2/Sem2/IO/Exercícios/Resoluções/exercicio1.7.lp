/*
     xij: quantidade do produto j (trigo, aveia, centeio)
          na quinta i

*/

/* Objective function */
max: 4 x11 + 4 x21 + 4 x31
   + 3 x12 + 3 x22 + 3 x32
   + 1 x13 + 1 x23 + 1 x33;

// área arável
  x11 +  x12 +  x13 <= 40;
  x21 +  x22 +  x23 <= 60;
  x31 +  x32 +  x33 <= 30;

// água para irrigação
3 x11 + 2 x12 + 1 x13 <= 60;
3 x21 + 2 x22 + 1 x23 <= 80;
3 x31 + 2 x32 + 1 x33 <= 37.5;

// área máxima para cada produto
  x11 +  x21 +  x31 <= 60;
  x12 +  x22 +  x32 <= 50;
  x13 +  x23 +  x33 <= 32.5;

// mesma proporção de área arada
60 x11 + 60 x12 + 60 x13 = 40 x21 + 40 x22 + 40 x23;
30 x11 + 30 x12 + 30 x13 = 40 x31 + 40 x32 + 40 x33;


