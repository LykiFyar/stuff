package Ficha4;

/*********************************************************************************/
/** DISCLAIMER: Este cÃ³digo foi criado e alterado durante as aulas prÃ¡ticas      */
/** de POO. Representa uma soluÃ§Ã£o em construÃ§Ã£o, com base na matÃ©ria leccionada */ 
/** atÃ© ao momento da sua elaboraÃ§Ã£o, e resulta da discussÃ£o e experimentaÃ§Ã£o    */
/** durante as aulas. Como tal, nÃ£o deverÃ¡ ser visto como uma soluÃ§Ã£o canÃ³nica,  */
/** ou mesmo acabada. Ã‰ disponibilizado para auxiliar o processo de estudo.      */
/** Os alunos sÃ£o encorajados a testar adequadamente o cÃ³digo fornecido e a      */
/** procurar soluÃ§Ãµes alternativas, Ã  medida que forem adquirindo mais           */
/** conhecimentos de POO.                                                        */
/*********************************************************************************/

/**
 * Classe que implementa uma LÃ¢mpada cf exercÃ­cio da Ficha 3.
 * Esta classe foi desenvolvida durante as aulas prÃ¡ticas pelo que algumas das
 * linhas de cÃ³digo decorrem de decisÃµes tomadas na altura. Existe naturalmente
 * espaÃ§o para melhorar e alterar este cÃ³digo.
 *
 * ATENÃ‡ÃƒO: a classe Lampada utiliza um enum para guardar os diferentes tipos
 * de consumo. Poderia tambÃ©m ser feito com constantes.
 
 *
 * @author  MaterialPOO
 * @version 20220321
 */



public class Lampada {
	
    public enum Modo {
         ON, 
         OFF,
         ECO
    }
    
    private Modo modo; //maneira mais elegante
    private double cpSEco; //consumo por segundo Eco
    private double cpSOn; //Consumo por segundo On
    private double consumoTotal; 
    private double periodoConsumo; 
    
    public Lampada() {
        this.modo = Modo.OFF; 
        this.cpSEco = 1; 
        this.cpSOn = 2; 
        this.consumoTotal = 0; 
        this.periodoConsumo = 0; 
    }
    
    public Lampada(Modo x, double cpsE, double cpsO, double cT, double pC) {
        /*
        switch (x) {
         case ON: modo = Modo.ON;
             break; 
         case OFF: modo = Modo.OFF; 
             break; 
         case ECO: modo = Modo.ECO;
             break; 
        }
        */
        this.cpSEco = cpsE;
        this.cpSOn = cpsO;
        this.modo = x; 
        this.consumoTotal = cT; 
        this.periodoConsumo = pC; 
    }
    
    public Lampada(Lampada l) {
        this.cpSEco = l.getCpSEco(); 
        this.cpSOn = l.getCpSOn();
        this.modo = l.getModo(); 
        this.consumoTotal = l.getConsumoTotal(); 
        this.periodoConsumo = l.getPeriodoConsumo(); 
    }
    
    public Modo getModo(){
         return this.modo;   
    }
    
    public void setModo(Modo m) {
         this.modo = m;    
    }
    
    public double getCpSEco(){
         return this.cpSEco;   
    }
    
    public void setCpSEco(double x){
        this.cpSEco = x; 
    }
    
    public double getCpSOn(){
         return this.cpSOn;   
    }
    
    public void setCpSOn(double x){
        this.cpSOn = x; 
    }
    
    public double getConsumoTotal(){
         return this.consumoTotal;    
    }
    
    public void setConsumoTotal(double cT){
         this.consumoTotal = cT;   
    }
    
    public double getPeriodoConsumo(){
         return this.periodoConsumo;    
    }
    
    public void setPeriodoConsumo(double pC){
         this.periodoConsumo = pC;    
    }
    
    public boolean equals(Object o) {
        if (this==o) return true; 
        if ((o == null) || (this.getClass() != o.getClass())) return false; 
        
        Lampada l = (Lampada) o; 
        return l.getModo() == this.modo && 
               l.getCpSOn() == this.cpSOn &&
               l.getCpSEco() == this.cpSEco &&               
               l.getConsumoTotal() == this.consumoTotal && 
               l.getPeriodoConsumo() == this.periodoConsumo; 
    }
    
    public Lampada clone() {
         return new Lampada(this);    
    }
    
    public String toString() {
         StringBuilder sb = new StringBuilder(); 
         sb.append("Lampada: ").append(this.modo)
          .append("\nConsumo por segundo Eco: ").append(this.cpSEco)
          .append("\nConsumo por segundo On: ").append(this.cpSOn)
          .append("\nConsumoTotal: ").append(this.consumoTotal)
          .append("\nInicio de ultimo consumo: ").append(this.periodoConsumo); 
         return sb.toString();
    }
    
    private void calculaEco(){
         this.consumoTotal += (System.currentTimeMillis() - this.periodoConsumo) * this.cpSEco;
    }
    
    private void calculaOn(){
         this.consumoTotal += (System.currentTimeMillis() - this.periodoConsumo) * this.cpSOn;
    }
    
    //a) 
    public void lampON() {
         if (this.modo == Modo.ECO) {
             calculaEco();
         }
         this.periodoConsumo = System.currentTimeMillis(); 
         this.modo = Modo.ON;   
    }
    
    //b) 
    public void lampOFF(){
        if (this.modo == Modo.ECO) {
             calculaEco();
         }
        if (this.modo == Modo.ON) {
             calculaOn();
         }
        this.periodoConsumo = System.currentTimeMillis(); 
        this.modo = Modo.OFF; 
    }
    
    //c)
    public void lampECO(){
        if (this.modo == Modo.ON) {
             calculaOn();
         }
        this.periodoConsumo = System.currentTimeMillis(); 
        this.modo = Modo.ECO; 
    }
    
    //d)
    public double totalConsumo(){
         //consumo total so mede os usos anteriores, falta o que esta a decorrer agora
         return periodoConsumo() + consumoTotal; 
    }
    
    //e)
    public double periodoConsumo() {
        double atual = 0; 
        if (modo == Modo.ON) atual = (System.currentTimeMillis() - this.periodoConsumo) * this.cpSOn;
        else if (modo == Modo.ECO) atual = (System.currentTimeMillis() - this.periodoConsumo) * this.cpSEco;
        return atual; 
    }
    
    
}