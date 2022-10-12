import java.util.Random;

class Mover implements Runnable {
    Bank b;
    int s; // Number of accounts

    public Mover(Bank b, int s) { this.b=b; this.s=s; }

    public void run() {
        final int moves=100000;
        int from, to;
        Random rand = new Random();

        for (int m=0; m<moves; m++)
        {
            from=rand.nextInt(s); // Get one
            while ((to=rand.nextInt(s))==from); // Slow way to get distinct
            b.transfer(from,to,1);
        }
    }
}

class BankTest {
    public static void main(String[] args) throws InterruptedException {
        final int N = 10;

        Bank b = new Bank(N);

        for (int i = 0; i < N; i++)
            b.deposit(i, 1000);

        System.out.println(b.totalBalance());

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

        System.out.println(b.totalBalance());
    }
}