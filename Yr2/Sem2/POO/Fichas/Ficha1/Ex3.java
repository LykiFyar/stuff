package Ficha1;

import java.util.Scanner;

public class Ex3 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int N;
        int i = 0;
        int current;
        int x1 = 0, x2 = 0, x3 = 0, x4 = 0;
        System.out.println("Quantas classificacoes ira introduzir?");
        N = input.nextInt();
        while(i < N) {
            System.out.println("Introduza um valor (0-20)"); 
            current = input.nextInt();
            if(current >= 0 && current <= 20) {
                if(current < 5) x1++;
                if(current >= 5 && current < 10) x2++;
                if(current >= 10 && current < 15) x3++;
                if(current >= 15) x4++;
                i++;
            }
            else {
                System.out.println("Valor inválido");
            }
        }
        System.out.println("Numero de classificacoes entre:\n[0,5[: " + x1 + "\n[5,10[: " + x2 + "\n[10,15[: " + x3 + "\n[15,20]: " + x4);
        input.close();
    }
}
