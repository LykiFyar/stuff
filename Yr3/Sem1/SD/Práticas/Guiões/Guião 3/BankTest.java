import java.util.Random;

// *TODO*


class TestCreate implements Runnable {
    Bank b;

    int N;
    // Number of accounts

    public Test(Bank b, int s) { this.b=b; this.N = N;}

    public void run(){
    }
}

public class BankTest {
    public static void main(String[] args) throws InterruptedException {
        final int N = 1000000;

        Bank b = new Bank();

        for (int i = 0; i < N; i++)
            b.createAccount(1000);

        System.out.println(b.totalBalance(b.getAllIDs()));

        Thread t1 = new Thread(new Mover(b, 10));
        Thread t2 = new Thread(new Mover(b, 10));
        Thread t3 = new Thread(new Mover(b, 10));
        Thread t4 = new Thread(new Mover(b, 10));
        Thread t5 = new Thread(new Mover(b, 10));
        Thread t6 = new Thread(new Mover(b, 10));
        Thread t7 = new Thread(new Mover(b, 10));
        Thread t8 = new Thread(new Mover(b, 10));

        t1.start();
        t2.start();
        t3.start();
        t4.start();
        t5.start();
        t6.start();
        t7.start();
        t8.start();
        t1.join();
        t2.join();
        t3.join();
        t4.join();
        t5.join();
        t6.join();
        t7.join();
        t8.join();
        System.out.println("Expected balance: " );
        System.out.println(b.totalBalance(b.getAllIDs()));

    }
}
