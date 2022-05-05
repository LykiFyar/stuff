package Ficha6;

import jdk.jshell.execution.Util;

import java.io.*;
import java.util.*;
import java.util.stream.Collectors;

public class Fitness implements Serializable {
    private Map<String, Utilizador> users;


    public Fitness() {
        users = new HashMap<>();
    }

    public Fitness(Map<String, Utilizador> u) {
        setUsers(u);
    }

    public Fitness(Fitness f) {
        setUsers(f.users);
    }


    public Map<String, Utilizador> getUsers() {
        Map<String, Utilizador> r = new HashMap<>();
        for(Utilizador u : users.values()) {
            r.put(u.getEmail(), u.clone());
        }
        return r;
    }

    public void setUsers(Map<String, Utilizador> us) {
        for(Utilizador u : us.values()) {
            this.users.put(u.getEmail(), u.clone());
        }
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Fitness f = (Fitness) o;
        return (this.users.equals(f.users));
    }


    @Override
    public Fitness clone() {
        return new Fitness(this);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Fitness: {\n").append(users.toString()).append("\n}\n");
        return sb.toString();
    }

    public boolean existeUtilizador(String email) {
        return users.containsKey(email);
    }

    public int quantos() {
        return users.size();
    }

    public int quantos(String actividade, String email){
        return (int) this.users.get(email).clone().getAtividades().values().stream().filter(a -> a.getClass().getSimpleName().equals(actividade)).count();
    }

    public Utilizador getUtilizador(String email) {
        return users.get(email).clone();
    }

    public void adiciona(String email, Atividade act) {
        users.get(email).adicionaAtividade(email, act.clone());
    }

    public List<Atividade> getAllAtividades() {
        // TODO
    }

    public void adiciona(String email, Set<Atividade> set) {
        // TODO
    }

    public int tempoTotalUtilizador(String email) {
        // TODO
    }

    public Atividade atividadeMaisExigente() {
        // TODO
    }

    public Utilizador utilizadorMaisAtivo() {
        // TODO
    }

    public void atualizaDesportoFav() {
        // TODO
    }

// Fase 2
    public Set<Utilizador> ordenarUtilizadores() {
        Set<Utilizador> r = new TreeSet<>();

        for( Utilizador u: users.values()) {
            r.add(u.clone());
        }
        return r;
    }

    public List<Utilizador> ordenarUtilizadoresList() {
        return this.users.values().stream().map(Utilizador::clone).sorted().collect(Collectors.toList());
    }

    public Set<Utilizador> ordenarUtilizadoresC(Comparator<Utilizador> c) {
        Set<Utilizador> r = new TreeSet<>(c);

        for( Utilizador u: users.values()) {
            r.add(u.clone());
        }
        return r;
    }

    public List<Utilizador> ordenarUtilizadoresListC(Comparator<Utilizador> c) {
        return this.users.values()
                .stream()
                .map(Utilizador::clone)
                .sorted(c)
                .collect(Collectors.toList());
    }

    public Utilizador userComMenosPeso() {
        Comparator<Utilizador> c = (u1, u2) -> Double.compare(u1.getPeso(), u2.getPeso());
        TreeSet<Utilizador> r = new TreeSet<>(c);
        for (Utilizador u : users.values()) {
            r.add(u);
        }
        return r.first().clone();
    }


    // Fase 3

    public List<FazMetros> daoPontos() {
        List<FazMetros> l = new ArrayList<>();
        for(Utilizador u : users.values()) {
            for(Atividade a : u.getAtividades().values()) {
                if(a instanceof FazMetros) l.add( (FazMetros) a);
            }
        }
        return l;
    }

    // Fase 4
    // ex2
    public void guardaFitness(String filename) throws FileNotFoundException, IOException {
        FileOutputStream fos = new FileOutputStream(filename);
        ObjectOutputStream oos = new ObjectOutputStream(fos);
        oos.writeObject(this);
        oos.flush();
        oos.close();
    }

    // Utilizar o static de forma a obter um Fitness sem ser necessário criar um Fitness antes
    public static Fitness lerFitness(String filename) throws FileNotFoundException, IOException, ClassNotFoundException {
        FileInputStream fis = new FileInputStream(filename);
        ObjectInputStream ois = new ObjectInputStream(fis);
        Fitness f = (Fitness) ois.readObject();
        ois.close();
        return f;
    }


}
