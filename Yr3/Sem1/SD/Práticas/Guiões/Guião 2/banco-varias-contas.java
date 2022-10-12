import java.util.concurrent.locks.ReentrantLock;
/*

/////////////////////
// EXERCÍCIO 1 e 2 //
/////////////////////

class Bank {

    private static class Account {

        private int balance;
        Account(int balance) { this.balance = balance; }
        int balance() {
            return balance;
        }
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

    // Bank slots and vector of accounts
    private int slots;
    private Account[] av;

    private ReentrantLock l;
    public Bank(int n)
    {
        slots=n;
        av=new Account[slots];
        l = new ReentrantLock();
        for (int i=0; i<slots; i++) av[i]=new Account(0);
    }

    // Account balance
    public int balance(int id) {
        if (id < 0 || id >= slots)
            return 0;
        l.lock();
        try {
            return av[id].balance();
        }
        finally {
            l.unlock();
        }
    }

    // Deposit
    boolean deposit(int id, int value) {
        if (id < 0 || id >= slots)
            return false;
        l.lock();
        try {
            return av[id].deposit(value);
        }
        finally {
            l.unlock();
        }
    }

    // Withdraw; fails if no such account or insufficient balance
    public boolean withdraw(int id, int value) {
        if (id < 0 || id >= slots)
            return false;
        l.lock();
        try {
            return av[id].withdraw(value);
        }
        finally {
            l.unlock();
        }
    }

    boolean transfer(int from, int to, int value) {
        if (from < 0 || from >= slots || to < 0 || to >= slots)
            return false;
        l.lock();
        try {
            if(balance(from) < value)
                return false;
            av[from].withdraw(value);
            av[to].deposit(value);
            return true;
        }
        finally {
            l.unlock();
        }
    }

    int totalBalance() {
        int total = 0;
        l.lock();
        try {
            for(int i = 0; i < slots; i++) {
                total += av[i].balance;
            }
            return total;
        }
        finally {
            l.unlock();
        }
    }
}

/////////////////////
*/


/////////////////
// EXERCÍCIO 3 //
/////////////////

class Bank {

    private static class Account {

        private ReentrantLock l;
        private int balance;
        Account(int balance) {
            l = new ReentrantLock();
            this.balance = balance;
        }
        int balance() {
            l.lock();
            try {
                return balance;
            }
            finally {
                l.unlock();
            }
        }
        boolean deposit(int value) {
            l.lock();
            balance += value;
            l.unlock();
            return true;
        }
        boolean withdraw(int value) {
            l.lock();
            try {
                if (value > balance)
                    return false;
                balance -= value;
                return true;
            }
            finally {
                l.unlock();
            }
        }

        void lockAcc() {
            l.lock();
        }
        void unlockAcc() {
            l.unlock();
        }
    }

    // Bank slots and vector of accounts
    private int slots;
    private Account[] av;

    public Bank(int n)
    {
        slots=n;
        av=new Account[slots];
        for (int i=0; i<slots; i++) av[i]=new Account(0);
    }

    // Account balance
    public int balance(int id) {
        if (id < 0 || id >= slots)
            return 0;
        return av[id].balance();
    }

    // Deposit
    boolean deposit(int id, int value) {
        if (id < 0 || id >= slots)
            return false;
        return av[id].deposit(value);
    }

    // Withdraw; fails if no such account or insufficient balance
    public boolean withdraw(int id, int value) {
        if (id < 0 || id >= slots)
            return false;
        return av[id].withdraw(value);
    }

    boolean transfer(int from, int to, int value) {
        if (from < 0 || from >= slots || to < 0 || to >= slots)
            return false;
        int contaMin = Math.min(from, to);
        int contaMax = Math.max(from, to);
        av[contaMin].lockAcc();
        av[contaMax].lockAcc();
        try {
            if (balance(from) < value)
                return false;
            av[from].withdraw(value);
            av[to].deposit(value);
            return true;
        }
        finally {
            av[from].unlockAcc();
            av[to].unlockAcc();
        }
    }

    int totalBalance() {
        int total = 0;
        for(int i = 0; i < slots; i++) {
            av[i].lockAcc();
        }
        for(int i = 0; i < slots; i++) {
            total += av[i].balance;
            av[i].unlockAcc();
        }
        return total;
    }
}

/////////////////