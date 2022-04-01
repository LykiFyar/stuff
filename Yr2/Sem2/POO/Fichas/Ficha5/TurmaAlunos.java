package Ficha5;

import java.util.*;

public class TurmaAlunos {
    private Map<String, Aluno> alunos;
    private String nomeTurma;
    private String codUC;

    public TurmaAlunos (){
        this.alunos = new TreeMap <> ();
        //this.alunos = new HashMap <> ();
        this.nomeTurma = "N/A";
        this.codUC= "N/A";
    }

    public TurmaAlunos (Map <String, Aluno> nAlunos, String nNomeTurma, String nCodUC){
        this.nomeTurma=nNomeTurma;
        this.codUC=nCodUC;
        this.alunos=new TreeMap<>();
        for (Aluno a : nAlunos.values()){
            this.alunos.put (a.getNumero(), a.clone());
        }
    }

    public TurmaAlunos (TurmaAlunos t){
        this.alunos = t.getAlunos();
        this.nomeTurma = t.getNomeTurma();
        this.codUC=t.getCodUC();
    }

    public void setNomeTurma (String nNomeTurma){
        this.nomeTurma = nNomeTurma;
    }

    public String getNomeTurma() {
        return this.nomeTurma;
    }

    public void setCodUC(String codUC) {
        this.codUC = codUC;
    }

    public String getCodUC() {
        return this.codUC;
    }

    public Map<String, Aluno> getAlunos(){
        Map<String, Aluno> r = new TreeMap<>();
        for (String k: this.alunos.keySet()){
            r.put(k, this.alunos.get(k).clone());
        }
        return r;
    }

    public void setAlunos(Map<String, Aluno> nAlunos) {
        this.alunos = new TreeMap<>();
        for ( Map.Entry<String, Aluno> e : nAlunos.entrySet()){ /**entrySet dá um conjunto de Map.Entry ...**/
            alunos.put (e.getKey(),         /**tira o primeiro valor de String**/
                        e.getValue().clone()); /**tira o segundo valor de Aluno**/
        }
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || (this.getClass() != o.getClass())) return false;
        TurmaAlunos t = (TurmaAlunos) o;
        return ((this.nomeTurma.equals(t.getNomeTurma())) && this.codUC.equals(t.getCodUC()) && this.alunos.equals(t.getAlunos()));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Nome da Turma: "). append(this.nomeTurma).append("\n")
                .append("Código da UC:") .append(this.codUC).append("\n");

        for(Aluno a: this.alunos.values()){
            sb.append(a.toString()).append("\n");
        }
        return sb.toString();
    }

    public TurmaAlunos clone (){
        return new TurmaAlunos(this);
    }

    public void insereAluno(Aluno a){
        this.alunos.put(a.getNumero(), a.clone());
    }

    public Aluno getAluno (String codAluno){
        if(this.alunos.containsKey(codAluno)){ return this.alunos.get(codAluno).clone();}
            else return null;
    }

    public void removeAluno (String codAluno){
        this.alunos.remove(codAluno);
    }

    public Set<String> todosOsCodigos(){
        return alunos.keySet();
    }

    public int qtsAlunos(){
        return alunos.size();
    }

    public Collection<Aluno> alunosOrdemAlfabetica(){
        TreeSet<Aluno> t = new TreeSet<>();
        for(Aluno a : this.alunos.values()){
            t.add(a.clone());
        }
        return t;
    }

    public Set<Aluno> alunosOrdemDecescenteNumero(){
        Comparator<Aluno> c = (a1, a2) -> a2.getNumero().compareTo(a1.getNumero());
        /** por odem crescente ficaria: Comparator<Aluno> c = (a1, a2) -> a1.getNumero().compareTo(a2.getNumero());**/
        //> 0 se this > a
        //== 0 se this == a
        //< 0 se this < a
        TreeSet<Aluno> t = new TreeSet<>(c);
        for (Aluno a : this.alunos.values()){
            t.add(a.clone());
        }
        return t;
    }
}

