import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class sd20220119_ex6 implements Votacao {
    List<Integer> voters = new ArrayList<>(); // true - já votou, false - não votou
    Cabines c;
    List<Integer> candidatos = new ArrayList<>(); // Id do candidato, Quantidade de votos

     ReentrantLock l = new ReentrantLock();

    public class Cabines {
        int usadas;
        int max;
        List<Boolean> cabine;
        ReentrantLock l = new ReentrantLock();
        Condition condition = l.newCondition();

        public Cabines(int max){
            usadas = 0;
            this.max = max;
            cabine = new ArrayList<>();
            for(int i = 0; i < max; i++) {
                cabine.add(false);
            }
        }
    }

    @Override
    public boolean verifica(int identidade) {
        l.lock();
        try {
            if (voters.contains(identidade))
                return false;
            else {
                voters.add(identidade);
                return true;
            }
        }
        finally {
            l.unlock();
        }
    }

    @Override
    public int esperaPorCabine() throws InterruptedException {
        c.l.lock();
        try {
            while (c.usadas >= c.max) {
                c.condition.await();
            }
            int index = c.cabine.indexOf(false);
            c.cabine.add(index,true);
            c.usadas++;
            return index;
        }
        finally {
            c.l.unlock();
        }
    }

    @Override
    public void vota(int escolha) {
        l.lock();
        try {
            candidatos.add(escolha, candidatos.get(escolha) + 1);
        }
        finally {
            l.unlock();
        }
    }

    @Override
    public void desocupaCabine(int i) {
        c.l.lock();
        try {
            c.cabine.add(i, false);
            c.usadas--;
            c.condition.signal();
        }
        finally {
            c.l.unlock();
        }
    }

    @Override
    public int vencedor() {
        // ... TODO - é necessário alterar algumas estruturas para conseguir fazer
        return candidatos.indexOf(candidatos.stream().mapToInt().max());
    }
}

interface Votacao {
    boolean verifica(int identidade);
    int esperaPorCabine() throws InterruptedException;
    void vota(int escolha);
    void desocupaCabine(int i);
    int vencedor(); // apenas para a alinea de Valorização
}
