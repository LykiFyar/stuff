package Ficha1;

import java.util.Scanner;

public class Ex1 {
    public static void main(String[] args) {
        int dia;
        int mes;
        int ano;
        Scanner input = new Scanner(System.in);
        System.out.println("Introduza o dia ");
        dia = input.nextInt();
        System.out.println("Introduza o mes ");
        mes = input.nextInt();
        System.out.println("Introduza o ano ");
        ano = input.nextInt();
        
        int res = (ano-1900)*365 + (ano-1900)/4;
        if(ano % 4 == 0 && (ano % 100 != 0 && ano%400 == 0)) {
            if (mes <= 2) {
                res -=1;
            }
        }

        for(int i = 1; i < mes; i++) {
            switch(i) {
                case 1,3,5,7,8,10,12:
                res += 31;
                break;
                case 4,6,9,11:
                res += 30;
                case 2:
                res += 28;
                break;
            }
        res += dia;
        }

        int dsem = res/7;

        switch (dsem) {
            case 0:
                System.out.println("Domingo");
                break;
            case 1:
                System.out.println("Segunda");
                break;
            case 2:
                System.out.println("Terça");
                break;
            case 3:
                System.out.println("Quarta");
                break;
            case 4:
                System.out.println("Quinta");
                break;
            case 5:
                System.out.println("Sexta");
                break;
            case 6:
                System.out.println("Sábado");
                break;
        }
    }
}