package g8;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.net.Socket;
import java.util.concurrent.locks.ReentrantLock;

public class TaggedConnection implements AutoCloseable {

    private Socket socket;
    private final DataOutputStream out;
    private final DataInputStream in;
    ReentrantLock wlock = new ReentrantLock();
    ReentrantLock rlock = new ReentrantLock();

    public static class Frame {
        public final int tag;

        public final byte[] data;

        public Frame(int tag, byte[] data) {
            this.tag = tag;
            this.data = data;
        }
    }

    public TaggedConnection(Socket socket) throws IOException {
        this.socket = socket;
        out = new DataOutputStream(this.socket.getOutputStream());
        in = new DataInputStream((this.socket.getInputStream()));
    }

    public void send(Frame frame) throws IOException {
        this.send(frame.tag, frame.data);
    }

    public void send(int tag, byte[] data) throws IOException {
        wlock.lock();
        out.writeInt(tag);
        out.writeInt(data.length);
        out.write(data);
        out.flush();
        wlock.unlock();
    }

    public Frame receive() throws IOException {
        rlock.lock();
        try {
            int tag = in.readInt();
            int size = in.readInt();
            byte[] data = new byte[size];
            in.readFully(data);
            return new Frame(tag,data);
        }
        finally {
            rlock.unlock();
        }
    }

    public void close() throws IOException {
        socket.close();
    }

}
