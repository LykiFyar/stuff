package Aula5;

public class Aluno {
    private String nome;
    private int nota;
    private String numero;
    private String curso;

    public Aluno() {
        nome = "";
        nota = 0;
        numero = "";
        curso = "";
    }

    public Aluno(String nome, int nota, String numero, String curso) {
        this.nome = nome;
        this.nota = nota;
        this.numero = numero;
        this.curso = curso;
    }

    public Aluno(Aluno outro) {
        this.nome = outro.getNome();
        this.nota = outro.getNota();
        this.numero = outro.getNumero();
        this.curso = outro.getCurso();
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }
    public void setNumero(String numero) {
        this.numero = numero;
    }
    public void setCurso(String curso) {
        this.curso = curso;
    }

    public String getNome() {
        return nome;
    }
    public int getNota() {
        return nota;
    }
    public String getNumero() {
        return numero;
    }
    public String getCurso() {
        return curso;
    }

    @Override
    public String toString() {
        return "Aluno: { nome = " + nome + "; nota = " + nota + "; numero = " + numero + "; curso = " + curso + "}";
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Aluno a = (Aluno) o;
        return this.nome.equals(a.getNome()) && this.nota == a.getNota() && this.numero.equals(a.getNumero()) && this.curso.equals(a.getCurso());
    }

    public Aluno clone() {
        return new Aluno(this);
    }

}
