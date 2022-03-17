package Aula4;

import java.util.ArrayList;
import java.util.List;

public class ColCirculos {
    private List<Circulo> circulos;

    public ColCirculos() {
        this.circulos = new ArrayList<>();
    }

    public ColCirculos(List<Circulo> circulos) {
        this.circulos = new ArrayList<>(circulos.size());
        for(Circulo c : circulos) this.circulos.add(c.clone());
    }

    public ColCirculos(ColCirculos c) {
        this.circulos = c.getCirculos();
    }

    public void setCirculos(List<Circulo> circulos) {
        this.circulos = new ArrayList<>();
        for(int i = 0; i < circulos.size(); i++) {
            Circulo c = circulos.get(i);
            this.circulos.add(c.clone());
        }
    }

    public List<Circulo> getCirculos() {
        List<Circulo> res = new ArrayList<>();
        for(Circulo c: this.circulos) res.add(c.clone());
        return res;
    }

    public boolean containsCirculo(Circulo c) {
        return this.circulos.contains(c);
    }

    public void addCirculo(Circulo c) {
        this.circulos.add(c.clone());
    }

    public void removeCirculo(Circulo c) {
        this.circulos.remove(c);
    }

    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        ColCirculos cc = (ColCirculos) o;
        return this.circulos.equals(cc.getCirculos());
    }

    public String toString() {
        return "ColCirculos{ circulos = " + circulos + "}";
    }
    public ColCirculos clone() {
        return new ColCirculos(this);
    }
}
