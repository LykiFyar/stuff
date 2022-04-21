package Ficha6;

import java.time.LocalDate;

public abstract class Atividade {
    private String id;
    private String descricao;
    private LocalDate data;
    private int time; // em minutos

    public Atividade() {
        id = "";
        descricao = "";
        data = LocalDate.ofEpochDay(0);
        time = 0;
    }

    public Atividade(String newid, String newdescricao, LocalDate newdata, int newtime){
        id = newid;
        descricao = newdescricao;
        data = newdata;
        time = newtime;
    }

    public Atividade(Atividade a) {
        id = a.getId();
        descricao = a.getDescricao();
        data = a.getData();
        time = a.getTime();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ID: ").append(id)
          .append("\nDescricao: ").append(descricao)
          .append("\nData: ").append(data.toString())
          .append("\nTempo (minutos): ").append(time);
        return sb.toString();
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Atividade a = (Atividade) o;
        return (id.equals(a.id) && descricao.equals(a.descricao) && data == a.data && time == a.time);
   }

   public abstract double calorias();
}
