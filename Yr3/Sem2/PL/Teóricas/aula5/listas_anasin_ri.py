# listas_anasin.py
# 2023-03-21 by jcr
# ----------------------
from listas_analex import lexer
from listas_ast import Lista, Conteudo, Vazia

prox_simb = ('Erro', '', 0, 0)

def parserError(simb):
    print("Erro sintático, token inesperado: ", simb)

def rec_term(simb):
    global prox_simb
    if prox_simb.type == simb:
        prox_simb = lexer.token()
    else:
        parserError(prox_simb)

# P4: Conteudo --> num 
# P5:            | num ',' Conteudo
# É preciso alterar para:
# P4: Conteudo --> num Cont2
# P5: Cont2    --> 
# P6: Cont2    --> ',' Conteudo

def rec_Cont2():
    global prox_simb
    if prox_simb.type == 'VIRG':
        rec_term('VIRG')
        res = rec_Conteudo()
    elif prox_simb.type == 'PF':
        res = Vazia('vazia')
    else:
        parserError(prox_simb)
        res = Vazia('vazia')
    return res

def rec_Conteudo():
    global prox_simb
    rec_term('NUM')
    return Conteudo('conteudo', prox_simb, rec_Cont2())

def rec_LCont():
    global prox_simb
    if prox_simb.type == 'PF':
        rec_term('PF')
        res = Vazia('vazia')
    elif prox_simb.type == 'NUM':
        res = rec_Conteudo()
        rec_term('PF')
    else:
        parserError(prox_simb)
        res = Vazia('vazia')
    return res

# P1: Lista --> '[' LCont
# P2: LCont --> ']' 
# P3:         | Conteudo ']'
def rec_Lista():
    global prox_simb
    rec_term('PA')
    ast = Lista('lista', rec_LCont())
    return ast


def rec_Parser(data):
    global prox_simb
    lexer.input(data)
    prox_simb = lexer.token()
    ast = rec_Lista()
    ast.pp(ast)