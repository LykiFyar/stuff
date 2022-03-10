package Ficha2;

import java.util.Arrays;

public class Ex4 {
    public int[] ordena(int[] a) {
        int[] b = Arrays.copyOf(a,a.length);
        Arrays.sort(b);
        return b;
    }

    public int procuraBinaria(int[] a, int v) {
        return Arrays.binarySearch(ordena(a), v);
    }
}
