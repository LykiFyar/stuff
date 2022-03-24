package Aula5;

import java.util.List;
import java.util.Set;

public class TesteTurmaComposicao {
    public static void main(String[] args) {
        TurmaComposicao t = new TurmaComposicao();
        t.setDesignacao("uma turma");

        for(int j = 0; j < 2; j++) {
            for(int i = 9; i >= 0; i--) {
                t.addAluno(new Aluno(String.valueOf(i), i, String.valueOf(i), "um curso"));
            }
        }
        List<Aluno> la = t.getAlunos();
        System.out.println("turma " + la.size() + "--" + la);
        Set<Aluno> sa = t.ordemAlfabetica();
        System.out.println("turma ordenada " + sa.size() + " -- " + sa);
    }
}
