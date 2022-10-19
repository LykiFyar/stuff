import java.util.*;
import java.util.concurrent.locks.ReentrantLock;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/////////////////
// EXERCÍCIO 1 //
/////////////////

/*
class Bank {

    private static class Account {
        private int balance;

        public ReentrantLock lockConta = new ReentrantLock();

        Account(int balance) { this.balance = balance; }
        int balance() { return balance; }
        boolean deposit(int value) {
            balance += value;
            return true;
        }
        boolean withdraw(int value) {
            if (value > balance)
                return false;
            balance -= value;
            return true;
        }
    }

    private Map<Integer, Account> map = new HashMap<Integer, Account>();

    ReentrantLock lockBank = new ReentrantLock();
    private int nextId = 0;

    // create account and return account id
    public int createAccount(int balance) {
        Account c = new Account(balance);

        lockBank.lock();

        int id = nextId;
        nextId += 1;
        map.put(id, c);

        lockBank.unlock();

        return id;
    }

    // close account and return balance, or 0 if no such account
    public int closeAccount(int id) {
        lockBank.lock();
        Account c = map.remove(id);
        if (c == null) {
            lockBank.unlock();
            return 0;
        }
        c.lockConta.lock();
        lockBank.unlock();
        try {
            return c.balance();
        } finally {
            c.lockConta.unlock();
        }
    }

    // account balance; 0 if no such account
    public int balance(int id) {
        lockBank.lock();
        Account c = map.get(id);
        if (c == null) {
            lockBank.unlock();
            return 0;
        }
        c.lockConta.lock();
        lockBank.unlock();
        try {
            return c.balance();
        }
        finally {
            c.lockConta.unlock();
        }
    }

    // deposit; fails if no such account
    public boolean deposit(int id, int value) {
        lockBank.lock();
        Account c = map.get(id);
        if (c == null) {
            lockBank.unlock();
            return false;
        }
        c.lockConta.lock();
        lockBank.unlock();
        try {
            return c.deposit(value);
        }
        finally {
            c.lockConta.unlock();
        }
    }

    // withdraw; fails if no such account or insufficient balance
    public boolean withdraw(int id, int value) {

        lockBank.lock();
        Account c = map.get(id);
        if (c == null) {
            lockBank.unlock();
            return false;
        }

        c.lockConta.lock();
        lockBank.unlock();

        try {
            return c.withdraw(value);
        } finally {
            c.lockConta.unlock();
        }
    }

    // transfer value between accounts;
    // fails if either account does not exist or insufficient balance
    public boolean transfer(int from, int to, int value) {
        Account cfrom, cto;

        lockBank.lock();

        cfrom = map.get(from);
        cto = map.get(to);

        if (cfrom == null || cto ==  null) {
            lockBank.unlock();
            return false;
        }

        cfrom.lockConta.lock();
        cto.lockConta.lock();

        lockBank.unlock();

        try {
            return cfrom.withdraw(value) && cto.deposit(value);
        } finally {
            cfrom.lockConta.unlock();
            cto.lockConta.unlock();
        }
    }

    // sum of balances in set of accounts; 0 if some does not exist
    public int totalBalance(int[] ids) {
        int total = 0;
        lockBank.lock();

        for (int i : ids) {
            Account c = map.get(i);
            if (c == null) {
                lockBank.unlock();
                return 0;
            }
        }

        for(int i : ids)
            map.get(i).lockConta.lock();

        lockBank.unlock();

        for (int i : ids) {
            Account c = map.get(i);
            total += c.balance();
            c.lockConta.unlock();
        }

        return total;
  }

  int[] getAllIDs() {
        return map.keySet().stream().mapToInt(a -> a.intValue()).toArray();
  }
}

*/

/////////////////
// EXERCÍCIO 3 //
/////////////////

class Bank {

    private static class Account {
        private int balance;

        public ReentrantLock lockConta = new ReentrantLock();

        Account(int balance) { this.balance = balance; }
        int balance() { return balance; }
        boolean deposit(int value) {
            balance += value;
            return true;
        }
        boolean withdraw(int value) {
            if (value > balance)
                return false;
            balance -= value;
            return true;
        }
    }

    private Map<Integer, Account> map = new HashMap<Integer, Account>();

    ReentrantReadWriteLock lockBank = new ReentrantReadWriteLock();
    private int nextId = 0;

    // create account and return account id
    public int createAccount(int balance) {
        Account c = new Account(balance);

        lockBank.writeLock().lock();

        int id = nextId;
        nextId += 1;
        map.put(id, c);
        lockBank.writeLock().unlock();

        return id;
    }

    // close account and return balance, or 0 if no such account
    public int closeAccount(int id) {
        lockBank.writeLock().lock();
        Account c = map.remove(id);
        if (c == null) {
            lockBank.writeLock().unlock();
            return 0;
        }
        c.lockConta.lock();
        lockBank.writeLock().unlock();
        try {
            return c.balance();
        } finally {
            c.lockConta.unlock();
        }
    }

    // account balance; 0 if no such account
    public int balance(int id) {
        lockBank.readLock().lock();
        Account c = map.get(id);
        if (c == null) {
            lockBank.readLock().unlock();
            return 0;
        }
        c.lockConta.lock();
        lockBank.readLock().unlock();
        try {
            return c.balance();
        }
        finally {
            c.lockConta.unlock();
        }
    }

    // deposit; fails if no such account
    public boolean deposit(int id, int value) {
        lockBank.readLock().lock();
        Account c = map.get(id);
        if (c == null) {
            lockBank.readLock().unlock();
            return false;
        }
        c.lockConta.lock();
        lockBank.readLock().unlock();
        try {
            return c.deposit(value);
        }
        finally {
            c.lockConta.unlock();
        }
    }

    // withdraw; fails if no such account or insufficient balance
    public boolean withdraw(int id, int value) {

        lockBank.readLock().lock();
        Account c = map.get(id);
        if (c == null) {
            lockBank.readLock().unlock();
            return false;
        }

        c.lockConta.lock();
        lockBank.readLock().unlock();

        try {
            return c.withdraw(value);
        } finally {
            c.lockConta.unlock();
        }
    }

    // transfer value between accounts;
    // fails if either account does not exist or insufficient balance
    public boolean transfer(int from, int to, int value) {
        int max = Math.max(from, to); // para evitar deadlock (caso em que 1 thread faz transfer de from para to e um 2o thread ao mesmo tempo faz transfer de to para from)
        int min = Math.min(from, to);
        Account cfrom, cto;

        lockBank.readLock().lock();

        cfrom = map.get(max);
        cto = map.get(min);

        if (cfrom == null || cto ==  null) {
            lockBank.readLock().unlock();
            return false;
        }

        cfrom.lockConta.lock();
        cto.lockConta.lock();

        lockBank.readLock().unlock();

        try {
            return cfrom.withdraw(value) && cto.deposit(value);
        } finally {
            cfrom.lockConta.unlock();
            cto.lockConta.unlock();
        }
    }

    // sum of balances in set of accounts; 0 if some does not exist
    public int totalBalance(int[] ids) {
        int total = 0;
        lockBank.readLock().lock();

        for (int i : ids) {
            Account c = map.get(i);
            if (c == null) {
                lockBank.readLock().unlock();
                return 0;
            }
        }

        for(int i : ids)
            map.get(i).lockConta.lock();

        lockBank.readLock().unlock();

        for (int i : ids) {
            Account c = map.get(i);
            total += c.balance();
            c.lockConta.unlock();
        }

        return total;
    }

    int[] getAllIDs() {
        return map.keySet().stream().mapToInt(a -> a.intValue()).toArray();
    }
}

