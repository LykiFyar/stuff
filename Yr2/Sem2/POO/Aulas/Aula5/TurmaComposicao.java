package Aula5;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;


public class TurmaComposicao {
    private String designacao;
    private List<Aluno> alunos;

    public TurmaComposicao() {
        designacao = "";
        alunos = new ArrayList<>();
    }

    public TurmaComposicao(String designacao, List<Aluno> alunos) {
        this.designacao = designacao;
        this.alunos = alunos.stream().map(Aluno::clone).collect(Collectors.toList());
    } 

    public TurmaComposicao(TurmaComposicao outra) {
        this.designacao = outra.getDesignacao();
        this.alunos = outra.getAlunos();
    }

    public String getDesignacao() {
        return designacao;
    }

    public void setDesignacao(String designacao) {
        this.designacao = designacao;
    }

    public List<Aluno> getAlunos() {
        ArrayList<Aluno> res = new ArrayList<>();
        for(Aluno a:this.alunos) res.add(a.clone());
        return res;
    }

    public void setAlunos(List<Aluno> alunos) {
        this.alunos = new ArrayList<>();
        for(Iterator<Aluno> i = alunos.iterator(); i.hasNext(); ) {
            Aluno a = i.next();
            this.alunos.add(a.clone());
        }
    }

    public void addAluno(Aluno a) {
        this.alunos.add(a.clone());
    }

    public boolean existeAluno(Aluno a) {
        return this.alunos.contains(a);
    }

    public boolean existeAluno(String nome) {
        return this.alunos.stream().anyMatch(a->a.getNome().equals(nome));
    }

    public boolean existeAlunoNum(String num) {
        return this.alunos.stream().filter(a->a.getNumero().equals(num)).count() != 0;
    }

    public Set<Aluno> ordemAlfabetica() {
        TreeSet<Aluno> res = new TreeSet<>(new Comparator<Aluno>() {
            @Override
            public int compare(Aluno o1, Aluno o2) {
                return o1.getNome().compareTo(o2.getNome());
            }
        });
        // TreeSet<Aluno> res1 = new TreeSet<>((o1,o2) -> o1.getNome().compareTo(o2.getNome()));
        for(Aluno a: this.alunos) res.add(a.clone());
        return res;
    }

    public Set<Aluno> alunosPorOrdem(Comparator<Aluno> c) {
        return this.alunos.stream()
               .map(Aluno::clone)
               .collect(Collectors.toCollection(()-> new TreeSet<Aluno>(c)));
    }

    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        TurmaComposicao t = (TurmaComposicao) o;
        return t.getDesignacao().equals(this.designacao) && t.getAlunos().equals(this.alunos);
    }

    public TurmaComposicao clone() {
        return new TurmaComposicao(this);
    }
}
