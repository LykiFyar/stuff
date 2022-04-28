package Ficha6;

import jdk.jshell.execution.Util;

import java.util.*;
import java.util.stream.Collectors;

public class Fitness {
    private Map<String, Utilizador> users;
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
}
