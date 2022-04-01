package Ficha5;


public class Aluno implements Comparable<Aluno>{

    private String numero;
    private int nota;
    private String nome;
    private String curso;

    public int compareTo(Aluno a){
        //> 0 se this > a
        //== 0 se this == a
        //< 0 se this < a
        return this.nome.compareTo(a.getNome());
    }

    public Aluno(){
        this.numero = "";
        this.nota = 0;
        this.nome = "";
        this.curso = "";
    }
    public Aluno(String numero, int nota, String nome, String curso) {
        this.numero = numero;
        this.nota = nota;
        this.nome = nome;
        this.curso = curso;
    }

    public Aluno(Aluno a){
        this.numero = a.getNumero();
        this.nota = a.getNota();
        this.nome = a.getNome();
        this.curso = a.getCurso();
    }
    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public int getNota() {
        return nota;
    }

    public void setNota(int nota) {
        this.nota = nota;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCurso() {
        return curso;
    }

    public void setCurso(String curso) {
        this.curso = curso;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Aluno aluno = (Aluno) o;
        return (this.nota == aluno.getNota() &&
                this.numero == aluno.getNumero() &&
                this.nome.equals(aluno.getNome()) &&
                this.curso.equals(aluno.getCurso()));
    }

    public Aluno clone(){
        return new Aluno(this);
    }

}