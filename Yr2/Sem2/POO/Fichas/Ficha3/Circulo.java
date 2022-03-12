package Ficha3;

public class Circulo {
    
    
    // variáveis de instância
    private double x;
    private double y;
    private double raio;

    /** 
     * Construtores da classe Circulo, por omissão, parametrizado e de cópia
     */
    /**
     * Construtor por omissão de Circulo
     */
    public Circulo() {
        this.x = 0;
        this.y = 0;
        this.raio = 0;
    }

    /**
     * Construtor parametrizado de Circulo
     * @param cx a abcissa do centro do círculo
     * @param cy a ordenada do centro do círculo
     * @param cr o raio do círculo
     */
    public Circulo(double cx, double cy, double cr) {    
        this.x = cx;
        this.y = cy;
        this.raio = cr;
    }

    /**
     * Construtor de cópia de Circulo
     * Aceita como parâmetro outro Círculo
     */
    public Circulo(Circulo c) {
        this.x = c.getX();
        this.y = c.getY();
        this.raio = c.getRaio();
    }

    /**
     * Métodos de instância
     */

    /**
     * Devolve o valor da abcissa do centro do Círculo
     * @return o valor x
     */
    public double getX() {
        return this.x;
    }

    /**
     * Devolve o valor da ordenada do centro do Círculo
     * @return o valor y
     */
    public double getY() {
        return this.y;
    }

    /**
     * Devolve o valor do raio do Círculo
     * @return o valor raio
     */
    public double getRaio() {
        return this.raio;
    }

    /**
     * Atualiza o valor da coordenada do centro em x
     * @param novoX novo valor da coordenada em x
     */
    public void setX(double novoX) {
        this.x = novoX;
    }
    /**
     * Atualiza o valor da coordenada do centro em y
     * @param novoY novo valor da coordenada em y
     */
    public void setY(double novoY) {
        this.y = novoY;
    }
    /**
     * Atualiza o valor do raio do Círculo
     * @param novoRaio novo valor do raio
     */
    public void setRaio(double novoRaio) {
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
        return (this.x == c.getX() && this.y == c.getY() && this.raio == c.raio);
    }

    /**
     * Método que devolve a representação em String de Circulo
     * @return String que representa o circulo
     */
    public String toString() {
        return "(" + this.x + "," + this.y + ") Raio = " + this.raio;
    }
    /**
     * Método que faz uma cópia do objeto recetor da mensagem
     * @return objeto clone do objeto que recebe a mensagem
     */
    public Circulo clone() {
        return new Circulo(this);
    }

    /**
     * Método que altera o centro de um Círculo
     * @param x o novo valor da coordenada em x
     * @param y o novo valor da coordenada em y
     */
    public void alteraCentro(double x, double y) {
        this.setX(x);
        this.setY(y);
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
