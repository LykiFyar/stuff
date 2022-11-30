package g8;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.concurrent.locks.ReentrantLock;

public class FramedConnection implements AutoCloseable {
    Socket socket;
    private final DataOutputStream out;
    private final DataInputStream  in;
    ReentrantLock wlock = new ReentrantLock();
    ReentrantLock rlock = new ReentrantLock();

    public FramedConnection(Socket socket) throws IOException {
        this.socket = socket;
        in = new DataInputStream(this.socket.getInputStream());
        out = new DataOutputStream(this.socket.getOutputStream());
    }
    public void send(byte[] data) throws IOException {
        wlock.lock();
        out.writeInt(data.length);
        out.write(data);
        out.flush();
        wlock.unlock();
    }
    public byte[] receive() throws IOException {
        rlock.lock();
        try{
            int size = in.readInt();
            byte[] b = new byte[size];
            in.readFully(b);
            return b;
        }
        finally {
            rlock.unlock();
        }

    }
    public void close() throws IOException {
        socket.close();
    }
}
