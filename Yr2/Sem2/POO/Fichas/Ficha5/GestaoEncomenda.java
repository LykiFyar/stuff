package Ficha5;
import java.util.*;

public class GestaoEncomenda {
    private Map<Integer, Encomenda> encomendas;

    public GestaoEncomenda(){
        /** this.encomendas = new TreeMap<>(); -> o compilador sabe por default o tipo das variáveis presentes,
         *  não é necessário escrever como está em baixo
         */
        this.encomendas = new TreeMap<Integer, Encomenda>();
    }

    public Integer encomendaComMaisProdutos (){
        Comparator<Encomenda> c = (e1,e2) ->
                           (e1.numeroTotalProdutos() - (e2.numeroTotalProdutos())) * -1;
                                   /** e1.numeroTotalProdutos() - (e2.numeroTotalProdutos()); assim fica por ordem crescente**/

        TreeSet<Encomenda> t = new TreeSet<>(c);
        for (Encomenda e : this.encomendas.values()){
            t.add(e); /**aqui não é necessário fazer clone porque só estamos a trabalhar com inteiros, neste caso**/
        }
        Encomenda r = t.first(); /**dá o primeiro, ou seja, a encomenda com mais produtos porque está ordenado por ordem descrescente**/
        return  r.getNEnc();
    }

    public Integer encomendaComMaisProdutosS (){
        Comparator<Encomenda> c = (e1,e2) ->
                (e1.numeroTotalProdutos() - (e2.numeroTotalProdutos())) * -1;

        return this.encomendas.values().stream()
                                .sorted(c)
                                .map(e -> e.getNEnc())
                                .findFirst().orElse(-1);

    }





    public Set<Integer> todosCodigosEnc(){
        return encomendas.keySet();

    }
}
