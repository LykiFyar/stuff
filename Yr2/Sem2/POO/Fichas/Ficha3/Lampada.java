package Ficha3;

public class Lampada {
    public static final int ON = 1;
    public static final int OFF = 0;
    public static final int ECO = -1;

    private static final double consumoOFF = 0;
    private static final double consumoECO = 0.5;
    private static final double consumoON = 1;
    private int state;
    private double consumo;
    private long instanteON;
    private double totalConsumo;
    private double periodoConsumo;

    public Lampada() {
        state = Lampada.OFF;
        consumo = 0;
        instanteON = 0;
        totalConsumo = 0;
        periodoConsumo = 0;
    }

    public Lampada(int newstate, double newconsumo, long newinstanteON, double newtotalConsumo, double newperiodoConsumo) {
        state = newstate;
        consumo = newconsumo;
        instanteON = newinstanteON;
        totalConsumo = newtotalConsumo;
        periodoConsumo = newperiodoConsumo;
    }

    public Lampada(Lampada l) {
        state = l.getState();
        consumo = l.getConsumo();
        instanteON = l.getInstanteON();
        totalConsumo = l.getTotalConsumo();
        periodoConsumo = l.getPeriodoConsumo();
    }

    public int getState() {
        return state;
    }

    public double getConsumo() {
        return consumo;
    }

    public long getInstanteON() {
        return instanteON;
    }

    public double getTotalConsumo() {
        return totalConsumo;
    }

    public double getPeriodoConsumo() {
        return periodoConsumo;
    }

    public void setState(int state) {
        this.state = state;
    }

    public void setConsumo(double consumo) {
        this.consumo = consumo;
    }

    public void setInstanteON(long instanteON) {
        this.instanteON = instanteON;
    }

    public void setTotalConsumo(double totalConsumo) {
        this.totalConsumo = totalConsumo;
    }

    public void setPeriodoConsumo(double periodoConsumo) {
        this.periodoConsumo = periodoConsumo;
    }

    public void lampON() {
        
        long now = System.currentTimeMillis();
        
        atualizaConsumo(now);

        instanteON = now;
        state = Lampada.ON;
    }

    public void lampOFF() {
                
        long now = System.currentTimeMillis();
        
        atualizaConsumo(now);

        instanteON = now;
        state = Lampada.OFF;
    }

    public void lampECO() {
                
        long now = System.currentTimeMillis();
        
        atualizaConsumo(now);

        instanteON = now;
        state = Lampada.ECO;
    }

    private void atualizaConsumo(long now) {
            double fator = 0;
            
            if(state == Lampada.ON) fator = Lampada.consumoON;
            else if (state == Lampada.ECO) fator = Lampada.consumoECO;
            else if (state == Lampada.OFF) fator = Lampada.consumoOFF;
    
            totalConsumo += (now - instanteON) * consumo * fator;
            periodoConsumo += (now - instanteON) * consumo * fator;
    }

    public void resetPeriodo() {
        long now = System.currentTimeMillis();
        atualizaConsumo(now);
        instanteON = now;
        periodoConsumo = 0;
    }
}
