package Ficha6;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;

public class Utilizador implements Comparable<Utilizador>{

    private static final int MALE = 0;
    private static final int FEMALE = 1;
    private static final int UNDEFINED = 2;


    private String email;
    private String password;
    private String nome;
    private int genero;
    private int altura;
    private double peso;
    private LocalDate birthdate;
    private String favsport;

    private Map<String, Atividade> atividades;

    public Utilizador() {
        email = "";
        password = "";
        nome = "";
        genero = UNDEFINED;
        altura = 0;
        peso = 0;
        birthdate = LocalDate.ofEpochDay(0);
        favsport = "";
        atividades = new HashMap<>();
    }

    public Utilizador(String nemail, String npassword, String newnome, int ngenero, int naltura, double npeso, LocalDate nbirthdate, String nfavsport, Map<String, Atividade> m) {
        email = nemail;
        password = npassword;
        nome = newnome;
        genero = ngenero;
        altura = naltura;
        peso = npeso;
        birthdate = nbirthdate;
        favsport = nfavsport;
        setAtividades(m);
    }

    public Utilizador(Utilizador u) {
        email = u.getEmail();
        password = u.getPassword();
        nome = u.getNome();
        genero = u.getGenero();
        altura = u.getAltura();
        peso = u.getPeso();
        birthdate = u.getBirthdate();
        favsport = u.getFavsport();
        setAtividades(u.atividades);
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getNome() {
        return nome;
    }

    public int getGenero() {
        return genero;
    }

    public int getAltura() {
        return altura;
    }

    public double getPeso() {
        return peso;
    }

    public LocalDate getBirthdate() {
        return birthdate;
    }

    public String getFavsport() {
        return favsport;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setGenero(int genero) {
        this.genero = genero;
    }

    public void setAltura(int altura) {
        this.altura = altura;
    }

    public void setPeso(double peso) {
        this.peso = peso;
    }

    public void setBirthdate(LocalDate birthdate) {
        this.birthdate = birthdate;
    }

    public void setFavsport(String favsport) {
        this.favsport = favsport;
    }

    public Map<String, Atividade> getAtividades() {
        Map<String, Atividade> at = new HashMap<>();
        for(Atividade a : atividades.values()) {
            at.put(a.getId(), a.clone());
        }
    }

    public void setAtividades(Map<String, Atividade> atividades) {
        for(Atividade a : atividades.values()) {
            this.atividades.put(a.getId(),a.clone());
        }
    }

    @Override
    public String toString() {
        return "Utilizador: {\nEmail: " + email + "\nPassword: " + password + "\nNome: " + nome + "\nGénero: " + (genero == MALE ? "Male" : (genero == FEMALE ? "Female" : "Undefined")) + "\nAltura (cm): " + altura + "\nPeso (kg): " + peso + "\nData de Nascimento: " + birthdate.toString() + "\nDesporto Favorito: " + favsport;
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Utilizador u = (Utilizador) o;
        return    (email.equals(u.email)
                && password.equals(u.password)
                && nome.equals(u.nome)
                && genero == u.genero
                && altura == u.altura
                && Double.compare(peso, u.peso) == 0
                && birthdate.equals(u.birthdate)
                && favsport.equals(u.favsport));
    }

    @Override
    public Utilizador clone() {
        return new Utilizador(this);
    }

    @Override
    public int compareTo(Utilizador u) {
        if(this.calculaCalorias() < u.calculaCalorias()) return -1;
        else if(this.calculaCalorias() > u.calculaCalorias()) return 1;
        else this.nome.compareTo(u.getNome());
    }

    public double calculaCalorias() {
        return this.atividades.values().stream().mapToDouble(a -> a.calorias()).sum();
    }

    public void adicionaAtividade(String email, Atividade a) {
        atividades.put(email, a);
    }
}
