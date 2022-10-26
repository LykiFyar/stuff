import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

public class Barrier implements Runnable{

    ReentrantLock l = new ReentrantLock();

    Condition cond = l.newCondition();

    int count;
    int max;
    int epoch;

    public Barrier(int N) {
        this.count = 0;
        this.max = N;
        this.epoch = 0;
    }

    void await() throws InterruptedException {
        l.lock();
        try {
            int e = epoch;
            count++;
            if (count % max != 0) {
                while (e == epoch) {
                    System.out.println(Thread.currentThread().getName() + " awaiting...");
                    cond.await();
                }
            }
            else {
                cond.signalAll();
                e++;
                epoch++;
                System.out.println(Thread.currentThread().getName() + " will signal all...");
            }
        }
        finally{
            System.out.println(Thread.currentThread().getName() + " ended...");
            l.unlock();
        }
    }

    public void run() {
        try {
            await();
        }
        catch (InterruptedException a) {
            throw new RuntimeException(a);
        }
    }
}

