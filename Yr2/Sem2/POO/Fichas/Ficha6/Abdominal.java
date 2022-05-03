package Ficha6;

import java.time.LocalDate;

public class Abdominal extends Atividade{
    private String tipo;
    private int reps;

    public Abdominal() {
        super();
        tipo = "";
        reps = 0;
    }

    public Abdominal(String id, String descricao, LocalDate date, int time, String tipo, int reps) {
        super(id, descricao, date, time);
        this.tipo = tipo;
        this.reps = reps;
    }

    public Abdominal(Abdominal a){
        super(a);
        tipo = a.getTipo();
        reps = a.getReps();
    }


    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getReps() {
        return reps;
    }

    public void setReps(int reps) {
        this.reps = reps;
    }


    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Abdominais: {\n").append(super.toString())
                .append("\nTipo: ").append(tipo)
                .append("\nRepeticoes: ").append(reps).append("\n}\n");
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Abdominal a = (Abdominal) o;
        return (super.equals(a) && tipo.equals(a.tipo) && reps == a.getReps());
    }

    public Atividade clone() {
        return new Abdominal(this);
    }

    @Override
    public double calorias() {
        return this.getTime() * reps * 0.6;
    }
}
