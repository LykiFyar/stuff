package Ficha3;

/**
 * EXERCICIO 7
 * LINHA DE ENCOMENDA
 */

public class LinhaDeEncomenda {
    private String reference;
    private String description;
    private double price;
    private int quantity;
    private int tax;
    private int discount;

    public LinhaDeEncomenda() {
        reference = "";
        description = "";
        price = 0;
        quantity = 0;
        tax = 0;
        discount = 0;
    }

    public LinhaDeEncomenda(String ref, String desc, double prc, int quant, int tx, int disc) {
        reference = ref;
        description = desc;
        price = prc;
        quantity = quant;
        tax = tx;
        discount = disc;
    }

    public LinhaDeEncomenda(LinhaDeEncomenda e) {
        reference = e.getReference();
        description = e.getDescription();
        price = e.getPrice();
        quantity = e.getQuantity();
        tax = e.getTax();
        discount = e.getDiscount();
    }

    public String getReference() {
        return reference;
    }

    public String getDescription() {
        return description;
    }

    public double getPrice() {
        return price;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getTax() {
        return tax;
    }

    public int getDiscount() {
        return discount;
    }

    @Override
    public boolean equals(Object obj) {
        if(this == obj) return true;
        if(obj == null || this.getClass() != obj.getClass()) return false;
        LinhaDeEncomenda e = (LinhaDeEncomenda) obj;
        return ((reference == e.getReference()) && (description == e.getDescription()) && (price == e.getPrice()) && (quantity == e.getQuantity()) && (tax == e.getTax()) && (discount == e.getDiscount()));
    }

    @Override
    public String toString() {
        return "Referencia: " + reference + " Descrição: " + description + " Preço: " + price + " Quantidade: " + quantity + " Imposto: " + tax + " Desconto comercial: " + discount;
    }

    public LinhaDeEncomenda clone() {
        return new LinhaDeEncomenda(this);
    }

    public double calculaValorLinhaEnc() {
        return price - (price * (discount/100)) + (price * (tax/100));
    }
    
    public double calculaValorDesconto() {
        return price*(discount/100);
    }
}
