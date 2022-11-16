import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

public class EchoServer {

    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(12345);

            while (true) {
                Socket socket = ss.accept();

                BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                PrintWriter out = new PrintWriter(socket.getOutputStream());

                String line;
                while ((line = in.readLine()) != null) {
                    out.println(line);
                    out.flush();
                }

                socket.shutdownOutput();
                socket.shutdownInput();
                socket.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
