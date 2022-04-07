package Aula6;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;

public class AlunoTests {
    
    @Test
    public void testGetNota() {
        Aluno a = new Aluno("A100", 15, "Lopes da Silva", "LCC");
        assertEquals(15, a.getNota(), "Valor de nota obtido inválido");
        a.setNota(20);
        assertEquals(15, a.getNota(), "Valor de nota obtido inválido");
    }
}
