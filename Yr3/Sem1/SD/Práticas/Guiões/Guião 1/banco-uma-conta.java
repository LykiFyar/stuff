import java.util.concurrent.locks.ReentrantLock;

class Bank {

  private static class Account {
    private int balance;
    Account(int balance) { this.balance = balance; }
    int balance() { return balance; }
    boolean deposit(int value) {
      balance += value;
      return true;
    }
  }

  // Our single account, for now
  private Account savings = new Account(0);

  // Account balance
  public int balance() {
    return savings.balance();
  }

  // Deposit
  boolean deposit(int value) {
    return savings.deposit(value);
  }
}

class ex2 { // Como os threads atuam concorrentemente, há a possibilidade de 2 threads lerem/depositarem um mesmo valor, nunca obtendo o 1M desejado.
  public static void main(String[] args) {
    final int N = 10;
    final int dep = 1000;
    final int value = 100;
    Bank b = new Bank();

    Thread[] t = new Thread[N];

    for (int i = 0; i < N; i++) {
      t[i] = new Thread(() -> {
        for (int j = 0; j < dep; j++) b.deposit(value);
      });
      t[i].start();
    }
    for (int i = 0; i < N; i++) {
      try {
        t[i].join();
      } catch (InterruptedException e) {
        throw new RuntimeException(e);
      }
    }

    System.out.println("Final savings = " + b.balance());
  }
}

class ex3 {
  public static void main(String[] args) {
    final int N = 10;
    final int dep = 1000;
    final int value = 100;
    Bank b = new Bank();

    Thread[] t = new Thread[N];

    ReentrantLock l = new ReentrantLock();

    for (int i = 0; i < N; i++) {
      t[i] = new Thread(() -> {
        for (int j = 0; j < dep; j++)  {
          l.lock();
          b.deposit(value);
          l.unlock();
        }
      });
      t[i].start();
    }
    for (int i = 0; i < N; i++) {
      try {
        t[i].join();
      } catch (InterruptedException e) {
        throw new RuntimeException(e);
      }
    }

    System.out.println("Final savings = " + b.balance());
  }
}

/*
  class Deposit implements Runnable {

    public void run() {
      final int val = 100;
      final long I = 1000;

      for(long i = 0; i < I; i++) b.deposit(val);

      System.out.println("Final savings = " + b.balance());
    }
  }

 */