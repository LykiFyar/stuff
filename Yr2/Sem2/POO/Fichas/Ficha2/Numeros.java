package Ficha2;

import java.util.Arrays;

public class Numeros {
    private int[] inteiros;

    public Numeros(int n, int[] valores) {
        this.inteiros = Arrays.copyOf(valores, n);
    }

    public int min() {
        int min = inteiros[0];
        for (int i = 1; i < inteiros.length; i++){
            min = Math.min(min,inteiros[i]);
        }
        return min;
    }
}
