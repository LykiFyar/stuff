package Ficha3;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/** EXERCICIO 8 */

public class Encomenda {
    private String name;
    private int taxnum;
    private String address;
    private int ordernum;
    private LocalDate date;
    private List<LinhaDeEncomenda> orders;

    public Encomenda() {
        this.name = "";
        this.taxnum = 0;
        this.address = "";
        this.ordernum = 0;
        this.date = LocalDate.EPOCH;
        this.orders = new ArrayList<>();
    }

    public Encomenda(String newname, int newtaxnum, String newaddress, int newordernum, LocalDate newdate, List<LinhaDeEncomenda> neworders) {
        this.name = newname;
        this.taxnum = newtaxnum;
        this.address = newaddress;
        this.ordernum = newordernum;
        this.date = newdate;
        this.orders = new ArrayList<>(neworders.size());
        for(LinhaDeEncomenda l: neworders) this.orders.add(l);
    }

    public Encomenda(Encomenda e) {
        name = e.getName();
        taxnum = e.getTaxnum();
        address = e.getAddress();
        ordernum = e.getOrdernum();
        date = e.getDate();
        this.orders = e.getOrders();
    }

    public String getName() {
        return name;
    }

    public int getTaxnum() {
        return taxnum;
    }

    public String getAddress() {
        return address;
    }

    public int getOrdernum() {
        return ordernum;
    }
    public LocalDate getDate() {
        return date;
    }
    public List<LinhaDeEncomenda> getOrders() {
        List<LinhaDeEncomenda> res = new ArrayList<>();
        for(LinhaDeEncomenda c : orders) res.add(c.clone());
        return res;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setTaxnum(int taxnum) {
        this.taxnum = taxnum;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setOrdernum(int ordernum) {
        this.ordernum = ordernum;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public void setOrders(List<LinhaDeEncomenda> orders) {
        this.orders = new ArrayList<>();
        for(int i = 0; i < orders.size(); i++) {
            LinhaDeEncomenda l = orders.get(i);
            this.orders.add(l.clone());
        }
    }

    @Override
    public boolean equals(Object o) {
        if(this == o) return true;
        if(o == null || o.getClass() != this.getClass()) return false;
        Encomenda l = (Encomenda) o;
        return(this.name == l.getName() && taxnum == l.getTaxnum() && address == l.getAddress() && ordernum == l.getOrdernum() && date == l.getDate() && this.getOrders().equals(l.getOrders()));
    }

    public double calculaValorTotal() {
        double res = 0;
        for(LinhaDeEncomenda l : orders) res += l.calculaValorLinhaEnc();
        return res;
    }

    public int numeroTotalProdutos() {
        int res = 0;
        for(LinhaDeEncomenda l : orders) res += l.getQuantity();
        return res;
    }

    public boolean existeProdutoEncomenda(String refProduto) {
        for(LinhaDeEncomenda l : orders) 
            if(l.getReference() == refProduto) return true;
        return false;
    }

    public void adicionaLinha(LinhaDeEncomenda linha) {
        this.orders.add(linha.clone());
    }

    public void removeProduto(String refProduto) {
        for(LinhaDeEncomenda l : orders) {
            if(l.getReference() == refProduto) this.orders.remove(l);
        }
    }
}
