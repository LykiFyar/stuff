package Ficha3;

public class TestCirculo {
    public static void main(String[] args) {
        Circulo c1 = new Circulo();
        System.out.println("C1: " + c1);
        System.out.println("C1 area: " + c1.calculaArea() + " Perimetro: " + c1.calculaPerimetro());

        Circulo c2 = new Circulo(1,1,1);
        System.out.println("C2: " + c2);
        System.out.println("C2 area: " + c2.calculaArea() + " Perimetro: " + c2.calculaPerimetro());

        System.out.println("c1 equals c2? " + c1.equals(c2));
        c1.setX(1);
        c1.setY(1);
        c1.setRaio(1);
        System.out.println("C1: " + c1);
        System.out.println("c1 equals c2? " + c1.equals(c2));
        System.out.println("c1 == c1.clone()? " + (c1 == c1.clone()));
        System.out.println("c1 equals c1.clone()? " + c1.equals(c1.clone()));
    }
}
