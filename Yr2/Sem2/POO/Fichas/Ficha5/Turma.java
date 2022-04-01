package Ficha5;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

public class Turma {
    private List<Aluno> alunos;
    private int capacidade;

    public Turma(){
        this.alunos=new ArrayList<>();
        this.capacidade=30;
    }

    public Turma(List<Aluno> nalunos, int ncapacidade){
        this.alunos=new ArrayList<>();
        for(Aluno a : nalunos){
            alunos.add(a.clone());
        }
        this.capacidade=ncapacidade;
    }

    public Turma(Turma t){
        this.capacidade=t.getCapacidade();
        this.alunos=t.getAlunos();
    }

    public int getCapacidade(){
        return this.capacidade;
    }

    public void setCapacidade(int ncapacidade){
        this.capacidade=ncapacidade;
    }

    public List<Aluno> getAlunos(){
        //return this.alunos; -> assim estaria errado porque é preciso criar uma cópia
        Collectors Colectors;
        return this.alunos
                   .stream()
                    /**.map(x->clone())
                     OU:
                    .map(x->{
                       return x.clone();
                   })
                    OU ainda:**/
                   .map(Aluno::clone)
                   .collect((Colectors.toList()));
    }

    public void setAlunos (List <Aluno> nalunos){
        Iterator<Aluno> it=nalunos.iterator();
        this.alunos=new ArrayList<>();
        /**boolean flag=false;
        while (it.hasNext() && !flag){  //verifica se ainda há elementos no iterator
            Aluno a=it.next();  //passa para o seguinte
            if(a.getNota()>=10) flag=true;
            this.alunos.add(a.clone());
         **/
        while (it.hasNext()){  //verifica se ainda há elementos no iterator
            Aluno a=it.next();  //passa para o seguinte
            this.alunos.add(a.clone());
        }
    }

    public boolean equals(Object o){
        if(this==o) return true;
        if((o==null) || (this.getClass()!=o.getClass()))
            return false;

        Turma t=(Turma) o;
        return(this.alunos.equals(t.getAlunos()));
    }

    public String toString() {
        StringBuilder sb= new StringBuilder();

        for(Aluno a: this.alunos){
            s.append (a.toString()).append("\n");
        }

        sb.append("Capacidade:").append(this.capacidade);

        return sb.toString();
    }

    public Turma clone(){
        return new Turma(this);
    }

    public void addAluno(Aluno a){
        if((this.alunos.size() < this.capacidade) && (!this.alunos.contains(a))){
            this.alunos.add(a.clone());
        }
    }

    public void removeAluno(String nome){ //INCOMPLETO
        Iterator <Aluno> it = this.alunos.iterator();
        boolean removido=false;
        while (it.hasNext() && !removido){
            Aluno a = it.next();
            if(a.getNome() == nome){
                it.remove();
                removido=true;
            }
        }
    }
    public int quantosPositiva(){
        int r=0;
        for(Aluno a:this.alunos)
            if (a.getNota()>=10) r++;
        return r;
    }

    public int quantasPositivaStream(){
        return (int) this.alunos
                .stream()
                .filter(a->a.getNota()>=10)
                .count;
    }

    public double mediaAlunos(){
        return this.alunos
                   .stream()
                   .mapToInt(a->a.getNota())
                   .average().orElse(0);
    }





    }
