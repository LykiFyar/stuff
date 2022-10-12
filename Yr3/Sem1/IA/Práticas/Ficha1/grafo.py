import math
from queue import Queue

from node import Node

class Graph:

    def __init__(self, directed=False):
        self.n_nodes = []
        self.n_directed = directed
        self.n_graph = dict()
        self.n_h = []



    def add_edge(self, node1, node2, weight):
        n1 = Node(node1)
        n2 = Node(node2)
        if(n1 not in self.n_nodes):
            self.n_nodes.append(n1)
            self.n_graph[node1]  = set()
        else:
            n2 = self.get_node_by_name(node2)

        self.n_graph[node1].add((node2,weight))

        if not self.n_directed:
            self.n_graph[node2] = set()
            self.n_graph[node2].add((node1,weight))

    def get_node_by_name(self, name):
        search_node = Node(name)
        for node in self.n_nodes:
            if node == search_node:
                return node
            else:
                return None

    def imprime_aresta(self):
        listaA = ""
        for nodo in self.n_graph.keys():
            for (nodo2, custo) in self.n_graph[nodo]:
                listaA = listaA + nodo + " -> " + nodo2 + " custo: " + str(custo) + "\n"
            return listaA

    def get_arc_cost(self, node1, node2):
        custoT = math.inf
        a = self.m_graph[node1]
        for (nodo, custo) in a:
            if nodo == node2:
                custoT = custo
        return custoT


    def calcula_custo(self, caminho):
        teste = caminho
        custo=0
        i=0
        while i+1 < len(teste):
            custo=custo + self.get_arc_cost(teste[i], teste[i+1])
            i=i+1
        return custo

    def procura_DFS(self, start, end, path = [], visited = set()):
        path.append(start)
        visited.add(start)

        if start == end:
            custoT = self.calcula_custo(path)
            return (path, custoT)
        for(adjacente, peso) in self.n_graph[start]
            if adjacente not in visited:
                resultado = self.procura_DFS(adjacente, end, path, visited)
                if resultado is not None:
                    return resultado
        path.pop()
        return None

    def procura_BFS(self, start, end):
        ## TODO
    


