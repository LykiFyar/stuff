package Ficha4;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class CasaInteligente {

    private List<Lampada> lampadas;

    public CasaInteligente() {
        lampadas = new ArrayList<>();
    }

    public CasaInteligente(List<Lampada> newlamps) {
        this.setLampadas(newlamps);
    }

    public CasaInteligente(CasaInteligente c) {

    }

    public List<Lampada> getLampadas() {
        ArrayList<Lampada> res = new ArrayList<>();
        for(Lampada l: lampadas) res.add(l.clone());
        return res;
    }

    public void setLampadas(List<Lampada> lampadas) {
        this.lampadas = lampadas.stream().map(Lampada::clone).collect(Collectors.toList());
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        CasaInteligente c = (CasaInteligente) o;
        return this.lampadas.equals(c.getLampadas());
    }

    @Override
    public String toString() {
        return "Casa Inteligente: \nLâmpadas: \n" + lampadas;
    }

    public CasaInteligente clone() {
        return new CasaInteligente(this);
    }

    //b)
    //i)
    public void addLampada(Lampada l) {
        this.lampadas.add(l.clone());
    }

    //ii
    public void ligaLampadaNormal(int index) {
        this.lampadas.get(index).lampON();
    }

    //iii
    public void ligaLampadaEco(int index) {
        this.lampadas.get(index).lampECO();
    }

    //iv
    /*public long qtEmEco() { // TODO
        return this.lampadas.stream().filter(l -> (l.getModo() == ECO)).count();
    }*/
}
