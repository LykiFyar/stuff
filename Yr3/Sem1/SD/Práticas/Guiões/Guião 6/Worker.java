import java.net.Socket;

public class Worker implements Runnable {

    Socket socket;

    public Worker(Socket s) {
        this.socket = s;
    }

    @Override
    public void run() {
        // TODO
    }
}

