package Aula6;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

public class AlunoTETest {
    @Test
    public void test1() {
        TurmaAlunos t = new TurmaAlunos();
        assertEquals(0, t.qtsAlunos(), "Numero de alunos em turma vazia invalido");
    }

    @Test
    public void testInsereAluno() {
    }

}
