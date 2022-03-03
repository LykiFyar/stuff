package Ficha2;

import java.util.Arrays;

public class Ex4 {
    public int[] ordena(int[] a) {
        return Arrays.sort(a);
    }

    public int procuraBinaria(int[] a, int v) {
        return Arrays.binarySearch(ordena(a), v);
    }
}
