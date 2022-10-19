#LICENCIATURA EM ENGENHARIA INFORMÁTICA
#MESTRADO integrado EM ENGENHARIA INFORMÁTICA

#Inteligência Artificial
#2022/23

#Draft Ficha 1


#Importar classes nodo e grafo
from grafo import Graph
from nodo import Node


def main():

    #Criar instância de grafo
    g = Graph()

    #Adicionar vertices ao grafo g
    g.add_edge("elvas", "alandroal",40)
    g.add_edge("elvas", "arrailos",50)
    g.add_edge("elvas", "borba",15)
    g.add_edge("borba", "estremoz",15)
    g.add_edge("alandroal", "redondo", 25)
    g.add_edge("arrailos", "alcácer", 90)
    g.add_edge("redondo", "monsaraz",30)
    g.add_edge("alcácer", "palmela", 85)
    g.add_edge("estremoz","évora",40)
    g.add_edge("évora","montemor",20)
    g.add_edge("montemor","vendas novas",15)
    g.add_edge("vendas novas","lisboa",50)
    g.add_edge("monsaraz","barreiro",120)
    g.add_edge("barreiro","palmela",25)
    g.add_edge("barreiro","baixa da banheira",5)
    g.add_edge("palmela", "almada", 25)
    g.add_edge("almada", "lisboa", 15)
    g.add_edge("baixa da banheira", "moita", 7)
    g.add_edge("moita", "alcochete", 20)
    g.add_edge("alcochete", "lisboa", 20)
    
    g.add_heuristica("elvas", 270)
    g.add_heuristica("alandroal",180)
    g.add_heuristica("redondo",170)
    g.add_heuristica("monsaraz",120)
    g.add_heuristica("arrailos",220)
    g.add_heuristica("alcácer",140)
    g.add_heuristica("borba",250)
    g.add_heuristica("estremoz",145)
    g.add_heuristica("évora",95)
    g.add_heuristica("montemor",70)
    g.add_heuristica("palmela",85)
    g.add_heuristica("barreiro",30)
    g.add_heuristica("baixa da banheira",33)
    g.add_heuristica("moita",35)
    g.add_heuristica("alcochete",26)
    g.add_heuristica("almada",25)
    g.add_heuristica("vendas novas",45)
    g.add_heuristica("lisboa",0)



    #cosntrução de menu
    saida = -1
    while saida != 0:
        print("1-Imprimir Grafo")
        print("2-Desenhar Grafo")
        print("3-Imprimir  nodos de Grafo")
        print("4-Imprimir arestas de Grafo")
        print("5-DFS")
        print("0-Saír")

        saida = int(input("introduza a sua opcao-> "))
        if saida == 0:
            print("saindo.......")
        elif saida == 1:
            #Escrever o grafo como string
            print(g)
            l=input("prima enter para continuar")
        elif saida == 2:
            #Desenhar o grafo de forma gráfica
            g.desenha()
        elif saida == 3:
            #Imprimir as chaves do dicionario que representa o grafo
            print(g.m_graph.keys())
            l = input("prima enter para continuar")
        elif saida == 4:
            #imprimir todas as arestas do grafo
            print(g.imprime_aresta())
            l = input("prima enter para continuar")
        elif saida == 5:
            #Efetuar  pesquisa de caminho entre nodo inicial e final com DFS
            inicio=input("Nodo inicial->")
            fim = input("Nodo final->")
            print(g.procura_DFS( inicio, fim, path=[], visited=set()))
            l = input("prima enter para continuar")
        else:
            print("Opção inválida...")
            l = input("prima enter para continuar")



if __name__ == "__main__":
    main()
