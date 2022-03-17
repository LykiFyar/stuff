package Ficha2;

import java.util.Scanner;

public class TestEx2 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int[][] notasTurma = new int[5][5];
        for(int i = 1; i <= 5; i++) {
            System.out.println("Insira as notas do " + i + "º aluno às 5 Unidades Curriculares (formato \"a b c d e\")");
            notasTurma[i-1][0] = input.nextInt();
            notasTurma[i-1][1] = input.nextInt();
            notasTurma[i-1][2] = input.nextInt();
            notasTurma[i-1][3] = input.nextInt();
            notasTurma[i-1][4] = input.nextInt();
        }
        

        input.close();
    }
}
