void triangulo (int n) {
    for (int i=0 ; i<n ; i++){
      for (int j=0 ; j <= i ; j++) {
         putchar('#'); }
      putchar('\n'); 
      }
     n--;
     for(int i=n; i>0; i--) {
         for(int j=i; j>0; j--) {
            putchar ('#');
        }
    putchar ('\n');
    }
}


/* Modificadores 
    %d - inteiros
    %f - reais
    %c - carateres
    %s - strings    

   CPP - C PreProcessor
   CC - C Compiler
   Linker - ...

Canais de input/output i/o

 stdout - monitor
 stderr - canal de erros, normalmente associado ao monitor
 stdprn - impressora
 stdin - canal de entrada, teclado
*/

