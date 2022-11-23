import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.concurrent.locks.ReentrantLock;

import static java.util.Arrays.asList;

class ContactManager {
    private HashMap<String, Contact> contacts;

    ReentrantLock l = new ReentrantLock();

    public ContactManager() {
        contacts = new HashMap<>();
        // example pre-population
        update(new Contact("John", 20, 253123321, null, asList("john@mail.com")));
        update(new Contact("Alice", 30, 253987654, "CompanyInc.", asList("alice.personal@mail.com", "alice.business@mail.com")));
        update(new Contact("Bob", 40, 253123456, "Comp.Ld", asList("bob@mail.com", "bob.work@mail.com")));
    }


    public void update(Contact c) {
        l.lock();
        try {
            this.contacts.put(c.name(), c);
        } finally {
            l.unlock();
        }
    }


    public ContactList getContacts() {
        ContactList cs = new ContactList();
        for(Contact c : contacts.values()) {
            cs.add(c.clone());
        }
        return cs;
    }
}

class ServerWorker implements Runnable {
    private Socket socket;
    private ContactManager manager;

    public ServerWorker (Socket socket, ContactManager manager) {
        this.socket = socket;
        this.manager = manager;
    }


    @Override
    public void run() {
        try {
            // EX 4
            ContactList cs = manager.getContacts();
            cs.serialize(new DataOutputStream(socket.getOutputStream()));

            //
            DataInputStream in = new DataInputStream(new BufferedInputStream(socket.getInputStream()));

            boolean flag = true;
            while(flag) {
                Contact c = Contact.deserialize(in);
                if(c == null) {
                    flag = false;
                }
                else {
                    manager.update(c);
                    System.out.println(c.toString());
                }
                socket.shutdownInput();
                socket.shutdownOutput();
            }
        } catch (Exception e) {
            //
        }
    }
}



public class Server {

    public static void main (String[] args) throws IOException {
        ServerSocket serverSocket = new ServerSocket(12345);
        ContactManager manager = new ContactManager();

        while (true) {
            Socket socket = serverSocket.accept();
            Thread worker = new Thread(new ServerWorker(socket, manager));
            worker.start();
        }
    }

}
