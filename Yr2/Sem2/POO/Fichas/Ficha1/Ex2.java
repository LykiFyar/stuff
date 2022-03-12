package Ficha1;

import java.util.Scanner;

public class Ex2 {
    public static String somaDatas(int d1, int h1, int m1, int s1, int d2, int h2, int m2, int s2) {
        int sf = (s1+s2);
        int mf = (m1+m2) + sf/60;
        sf = sf%60;
        int hf = (h1+h2) + mf/60;
        mf = mf%60;
        int df = d1 + d2 + hf/24;
        hf = hf%24;
        String data = df + " " + hf + " " + mf + " " + sf;
        return data;
    }
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        System.out.println("Introduza a primeira data (dd hh mm ss)");
        int d1 = input.nextInt();
        int h1 = input.nextInt();
        int m1 = input.nextInt();
        int s1 = input.nextInt();
        System.out.println("Introduza a segunda data (dd hh mm ss)");
        int d2 = input.nextInt();
        int h2 = input.nextInt();
        int m2 = input.nextInt();
        int s2 = input.nextInt();

        String res = somaDatas(d1,h1,m1,s1,d2,h2,m2,s2);
        input.close();
        System.out.println(res);
    }
}
