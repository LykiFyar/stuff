package Ficha2;

import java.util.Arrays;
import java.util.Scanner;

public class TestEx4 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int n;
        System.out.println("Quantos valores vai ler?");
        n = input.nextInt();
        int [] a = new int[n];
        for(int i = 0; i < n; i++) {
            System.out.println("Introduza o próximo inteiro");
            a[i] = input.nextInt();
        }
        Ficha2.Ex4 f = new Ficha2.Ex4();
        // Alínea a
        System.out.println("O array " + a + " " + Arrays.toString(a) + " Ordenado é " + Arrays.toString(f.ordena(a)));
        // Alínea b
        int v;
        System.out.println("Qual o elemento a procurar?");
        v = input.nextInt();

        int p = f.procuraBinaria(a,v);
        System.out.println("O elemento " + v + " está na posição " + p);
    }
}
