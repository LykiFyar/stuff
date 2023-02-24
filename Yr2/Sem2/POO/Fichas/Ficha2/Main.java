package Ficha2;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Indique tamanho do array:");
        int n = sc.nextInt();
        int[] valores = new int[n];


        System.out.println("Indique os valores, um de cada vez:");
        for (int i = 0; i < n; i++) {
            valores[i] = sc.nextInt();
        }

        Numeros n1 = new Numeros(n, valores);
        System.out.println("Mínimo = " + n1.min());
    }
}
