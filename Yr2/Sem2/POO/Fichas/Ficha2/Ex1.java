package Ficha2;

public class Ex1 {
    public int minimo(int[] a) {
        int min = Integer.MAX_VALUE;
        for (int j : a) {
            if (j < min) {
                min = j;
            }
        }
        return min;
    }

    public int[] arrayEntre(int[] a, int id1, int id2) {
        if(id1 > 0 && id1 < a.length && id2 > 0 && id2 < a.length && id1 < id2) {
            int[] res = new int[id2-id1+1];
            System.arraycopy(a, id1, res, 0, id2-id1+1);
            return res;
        }
        return null;
    }
}
