package Aula6;

public class AlunoTE extends Aluno{
    private boolean epocaespecial;

    public AlunoTE() {
        super();
        this.epocaespecial = false;
    }

    public AlunoTE(String numero, int nota, String nome, String curso, boolean epocaespecial) {
        super(numero, nota, nome, curso);
        this.epocaespecial = epocaespecial;
    }

    public AlunoTE(AlunoTE a) {
        super(a);
        this.epocaespecial = a.getEpocaEspecial();
    }


    public boolean getEpocaEspecial() {
        return this.epocaespecial;
    }

    public void setEpocaespecial(boolean epocaespecial) {
        this.epocaespecial = epocaespecial;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append("Epoca Especial? ").append(this.epocaespecial);
        return sb.toString();
    }
    @Override
    public Aluno clone() {
        return new AlunoTE(this);
    }

    public int getNota() {
        return super.getNota() + 1;
    }
}
