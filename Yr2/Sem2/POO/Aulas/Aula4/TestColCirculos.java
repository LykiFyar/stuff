package Aula4;

public class TestColCirculos {
    public static void main(String[] args) {
        ColCirculos cc = new ColCirculos();
        for(int i = 0; i < 10; i++) 
            cc.addCirculo(new Circulo(i, new Ponto(i,i)));
        System.out.println("Colecao: " + cc);
        ColCirculos cc1 = (ColCirculos) cc.clone();
        System.out.println("cc equals cc1?" + cc.equals(cc1));

        for(int i = 0; i < 11; i++) {
            Circulo c = new Circulo(i, new Ponto (i,i));
            System.out.println("cc contains " + c + "->" + cc.containsCirculo(c));
            System.out.println("cc1 contains " + c + "->" + cc1.containsCirculo(c));
        }
    }
}
