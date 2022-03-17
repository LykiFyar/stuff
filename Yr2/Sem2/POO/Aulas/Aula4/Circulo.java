package Aula4;

/** Implementação do Círculo com a classe Ponto */

public class Circulo {
     // variáveis de instância
     private Ponto centro;
     private int raio;
 
     /** 
      * Construtores da classe Circulo, por omissão, parametrizado e de cópia
      */
     /**
      * Construtor por omissão de Circulo
      */
     public Circulo() {
         this.centro = new Ponto();
         this.raio = 0;
     }
 
     /**
      * Construtor parametrizado de Circulo
      * @param cx a abcissa do centro do círculo
      * @param cy a ordenada do centro do círculo
      * @param cr o raio do círculo
      */
     public Circulo(int cx, int cy, int cr) {    
         this.centro = new Ponto(cx,cy);
         this.raio = cr;
     }

     /**
      * Construtor parametrizado de Circulo
      * @param p o centro co círculo
      * @param cr o raio do círculo
      */
      public Circulo(int cr, Ponto p) {    
        this.centro = new Ponto(p);
        this.raio = cr;
    }
 
     /**
      * Construtor de cópia de Circulo
      * Aceita como parâmetro outro Círculo
      */
     public Circulo(Circulo c) {
         this.centro = c.getCentro();
         this.raio = c.getRaio();
     }
 
     /**
      * Métodos de instância
      */
 
     /**
      * Devolve o valor do centro do Círculo
      * @return o valor do centro
      */
     public Ponto getCentro() {
         return this.centro.clone();
     }
 
     /**
      * Devolve o valor do raio do Círculo
      * @return o valor raio
      */
     public int getRaio() {
         return this.raio;
     }
 
     /**
      * Atualiza o valor da coordenada do centro em x
      * @param novoX novo valor da coordenada em x
      */
     public void setCentro(Ponto centro) {
         this.centro = centro.clone();
     }
     /**
      * Atualiza o valor do raio do Círculo
      * @param novoRaio novo valor do raio
      */
     public void setRaio(int novoRaio) {
         this.raio = novoRaio;
     }
 
     /**
      * Método que implementa a igualdade entre dois Circulos
      * @param o o objeto que é comparado com o receptor da mensagem
      * @return resultado boleano da comparação
      */
     public boolean equals(Object o) {
         if(this == o) return true;
         if((o == null) || (this.getClass() != o.getClass())) return false;
         Circulo c = (Circulo) o;
         return (c.getCentro().equals(this.centro) && this.raio == c.getRaio());
     }
 
     /**
      * Método que devolve a representação em String de Circulo
      * @return String que representa o circulo
      */
     public String toString() {
         StringBuilder sb = new StringBuilder();
         sb.append("Circulo { raio = ");
         sb.append(raio);
         sb.append(", Centro = ");
         sb.append(centro);
         sb.append("}");
         return sb.toString();
     }
     /**
      * Método que faz uma cópia do objeto recetor da mensagem
      * @return objeto clone do objeto que recebe a mensagem
      */
     public Circulo clone() {
         return new Circulo(this);
     }
     /**
      * Método que calcula a área de um círculo
      * @return o valor da área
      */
     public double calculaArea() {
         return Math.PI * Math.pow(this.raio, 2);
     }
 
     /**
      * Método que calcula o perímetro de um círculo
      * @return o valor do perímetrio
      */
     public double calculaPerimetro() {
         return 2 * Math.PI * this.raio;
     }
}
