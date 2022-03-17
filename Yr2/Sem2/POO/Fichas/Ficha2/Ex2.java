package Ficha2;

public class Ex2 {
    
    public int somaUC(int[][] a, int index) {
        int res = 0;
        for(int i = 0; i < 5; i++) res += a[i][index];
        return res;
    }

    public int mediaAluno(int[][] a, int index) {
        int res = 0;
        for(int i = 0; i < 5; i++) res += a[index][i];
        return res/5;
    }

    public int mediaUC(int[][] a, int index) {
        return somaUC(a, index)/5;
    }

    
}
