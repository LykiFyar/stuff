package Ficha2;

import java.util.Arrays;
import java.util.Scanner;

public class TestEx1 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n;
        System.out.println("Quantos valores vai ler?");
        n = input.nextInt();
        int[] a = new int[n];
        for(int i = 0; i < n; i++) {
            System.out.println("Introduza o proximo inteiro");
            a[i] = input.nextInt();
        }
        Ficha2.Ex1 f = new Ficha2.Ex1();

        System.out.println("O valor mínimo do array " + Arrays.toString(a) + " é o número " + f.minimo(a));

        int id1, id2;
        System.out.println("Introduza o índice 1");
        id1 = input.nextInt();
        System.out.println("Introduza o índice 2");
        id2 = input.nextInt();

        
        System.out.println("O array com índices entre " + id1 + " e " + id2 + " é " + Arrays.toString(f.arrayEntre(a, id1, id2)));
        input.close();
    }
}
