package Ficha6;

import java.io.Serializable;
import java.time.LocalDate;

public class Corrida extends Atividade implements FazMetros, Serializable {
    private int distpercorrida; // em metros
    private int altimetria;
    private String percurso;

    private int pontosPorMetro;

    public Corrida() {
        super();
        distpercorrida = 0;
        altimetria = 0;
        percurso = "";
        pontosPorMetro = 0;
    }

    public Corrida(String id, String descricao, LocalDate data, int time, int newdistpercorrida, int newaltimetria, String newpercurso, int pontos) {
        super(id,descricao,data,time);
        distpercorrida = newdistpercorrida;
        altimetria = newaltimetria;
        percurso = newpercurso;
        pontosPorMetro = pontos;
    }

    public Corrida(Corrida c) {
        super(c);
        distpercorrida = c.getDistpercorrida();
        altimetria = c.getAltimetria();
        percurso = c.getPercurso();
        pontosPorMetro = c.getPontosPorMetro();
    }

    public int getDistpercorrida() {
        return distpercorrida;
    }

    public void setDistpercorrida(int distpercorrida) {
        this.distpercorrida = distpercorrida;
    }

    public int getAltimetria() {
        return altimetria;
    }

    public void setAltimetria(int altimetria) {
        this.altimetria = altimetria;
    }

    public String getPercurso() {
        return percurso;
    }

    public void setPercurso(String percurso) {
        this.percurso = percurso;
    }

    @Override
    public int getPontosPorMetro() {
        return pontosPorMetro;
    }

    @Override
    public void setPontosPorMetro(int pontosPorMetro) {
        this.pontosPorMetro = pontosPorMetro;
    }

    @Override
    public int getTotalPontos() {
        return pontosPorMetro * distpercorrida;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Corrida c = (Corrida) o;
        return (super.equals(c) && distpercorrida == c.distpercorrida && altimetria == c.altimetria && percurso.equals(c.percurso) && pontosPorMetro == c.pontosPorMetro);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Corrida: {\n").append(super.toString())
                .append("\nDistancia percorrida: ").append(distpercorrida)
                .append("\nAltimetria: ").append(altimetria)
                .append("\nPercurso: ").append(percurso)
                .append("\nPontos por metro: ").append(pontosPorMetro).append(" }\n");
        return sb.toString();
    }

    public Atividade clone() {
        return new Corrida(this);
    }

    public double calorias(Utilizador u) {
        return distpercorrida*u.getPeso()*this.getTime()*(LocalDate.now().getYear() - u.getBirthdate().getYear())/50;
    }

}
