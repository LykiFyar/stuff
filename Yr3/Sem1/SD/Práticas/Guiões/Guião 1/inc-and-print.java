
import java.lang.Thread;


class Inc implements Runnable {
    public void run() {
      final long I=100;
  
      for (long i = 0; i < I; i++)
        System.out.println(i);
      System.out.println("thread-id (" + Thread.currentThread().getId() + ")");
    }

  }

  class ex1 {
      public static void main(String[] args) throws InterruptedException {
          final int N = 10;

          Thread[] t = new Thread[N];

          for(int i = 0; i < N; i++) {
              t[i] = new Thread(new Inc());
              t[i].start();
              try {
                      t[i].join();
              } catch (InterruptedException e) {
                  throw new RuntimeException(e);
              }
          }
          System.out.println("fim");
      }
  }