import java.util.*;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;


/////////////////
// EXERCÍCIO 1 //
/////////////////

class Warehouse {
  private Map<String, Product> map =  new HashMap<String, Product>();

  ReentrantLock l = new ReentrantLock();

  private class Product {
    int quantity = 0;
    Condition pcond = l.newCondition();
  }

  private Product get(String item) {
    l.lock();
    try {
      Product p = map.get(item);
      if (p != null) return p;
      p = new Product();
      map.put(item, p);
      return p;
    }
    finally {
      l.unlock();
    }
  }

  // 1.1 - Cliente Greedy

  /*
  public void supply(String item, int quantity) throws InterruptedException {
    l.lock();
    Product p = get(item);
    p.quantity += quantity;
    p.pcond.signalAll();
    l.unlock();
  }

  public void consume(Set<String> items) throws InterruptedException {
    l.lock();
    try {
      for (String s : items) {
        Product p = get(s);
        while (p.quantity <= 0)
          p.pcond.await();

        p.quantity--;
      }
    }
    catch (InterruptedException a) {
      throw new RuntimeException(a);
    }
    finally {
      l.unlock();
    }
  }
  */

// 1.2 - Versão Cooperativa
  // /*

  public void supply(String item, int quantity) throws InterruptedException {
    l.lock();
    Product p = get(item);
    p.quantity += quantity;
    p.pcond.signalAll();
    l.unlock();
  }


  public void consume(Set<String> items) throws InterruptedException {
    l.lock();
    try {
      for (String s : items) {
        Product p = get(s);
        while (p.quantity <= 0)
          p.pcond.await();
      }

      for(String s : items) {
        Product p = get(s);
        p.quantity--;
      }
    }
    catch (InterruptedException a) {
      throw new RuntimeException(a);
    }
    finally {
      l.unlock();
    }
  }

  // */
}

class WareHouseTest {

  class Client implements Runnable{

    Warehouse w;

    public Client(Warehouse ware) {
      this.w = ware;
    }

    @Override
    public void run() {

    }
  }

  class Supplier implements Runnable {

    Warehouse w;

    public Supplier(Warehouse ware) {
      this.w = ware;
    }

    @Override
    public void run() {

    }
  }

  public static void main(String[] args) {

  }
}
