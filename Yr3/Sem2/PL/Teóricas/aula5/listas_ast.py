# listas_ast.py
# 2023-03-21 by jcr
# ----------------------
# P1: Lista -->  
# P2:         | Conteudo 
# P3: Conteudo --> num Conteudo
# P4:   
# -------------------------------         
class Lista:
    def __init__(self, type, lista):
        self.type = type
        self.lista = lista

    def pp(self, lista):
         if lista.type == 'lista':
              self.showConteudo(lista.lista)

    def showConteudo(self, conteudo):
         if conteudo.type == 'conteudo':
            print(conteudo.head)
            self.showConteudo(conteudo.tail)
         else:
              pass
         
class Vazia:
    def __init__(self, type):
        self.type = type

class Conteudo:
    def __init__(self, type, head, tail):
        self.type = type
        self.head = head
        self.tail = tail

    
