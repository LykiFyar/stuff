package Ficha6;

import java.time.LocalDate;

public class Corrida extends Atividade{
    private int distpercorrida; // em metros
    private int altimetria;
    private String percurso;

    public Corrida() {
        super();
        distpercorrida = 0;
        altimetria = 0;
        percurso = "";
    }

    public Corrida(String id, String descricao, LocalDate data, int time, int newdistpercorrida, int newaltimetria, String newpercurso) {
        super(id,descricao,data,time);
        distpercorrida = newdistpercorrida;
        altimetria = newaltimetria;
        percurso = newpercurso;
    }

    public Corrida(Corrida c) {
        super(c);
        distpercorrida = c.getDistpercorrida();
        altimetria = c.getAltimetria();
        percurso = c.getPercurso();
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
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Corrida c = (Corrida) o;
        return (super.equals(c) && distpercorrida == c.distpercorrida && altimetria == c.altimetria && percurso.equals(c.percurso));
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Corrida: {\n").append(super.toString())
                .append("\nDistancia percorrida: ").append(distpercorrida)
                .append("\nAltimetria: ").append(altimetria)
                .append("\nPercurso: ").append(percurso).append(" }\n");
        return sb.toString();
    }

    public Object clone() {
        return new Corrida(this);
    }

    @Override
    public double calorias(Utilizador u) {
        return distpercorrida*u.getPeso()*this.getTime()*(LocalDate.now().getYear() - u.getBirthdate().getYear())/50;
    }
}
