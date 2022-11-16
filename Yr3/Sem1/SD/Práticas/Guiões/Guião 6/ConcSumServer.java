import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;

// TODO


public class ConcSumServer {
    public static void main(String[] args) {
        try {
            ServerSocket ss = new ServerSocket(12345);

            while (true) {
                Socket socket = ss.accept();

                int acc = 0;
                int count = 0;

                BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                PrintWriter out = new PrintWriter(socket.getOutputStream());

                String line;
                while ((line = in.readLine()) != null) {

                    System.out.println("Number received: " + line);

                    int currnum = Integer.parseInt(line);
                    count++;
                    acc += currnum;

                    out.println(acc);
                    out.flush();

                    System.out.println("Sum: " + acc);
                }

                System.out.println("Media: " + (double) acc/count);
                out.println((double) acc/count);
                out.flush();

                socket.shutdownInput();
                socket.shutdownOutput();
                socket.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
