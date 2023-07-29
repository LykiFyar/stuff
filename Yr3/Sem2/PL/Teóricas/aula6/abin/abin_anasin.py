# abin_anasin.py
# 2023-03-21 by jcr
# ----------------------
from abin_analex import lexer
from abin_ast import ABinEmpty, ABinNode

prox_simb = ('Erro', '', 0, 0)

def parserError(simb):
    print("Erro sintático, token inesperado: ", simb)

def rec_term(simb):
    global prox_simb
    if prox_simb.type == simb:
        prox_simb = lexer.token()
    else:
        parserError(prox_simb)
        prox_simb = ('erro', '', 0, 0)

def rec_ABin2():
    global prox_simb
    if prox_simb.type == 'PF':
        rec_term('PF')
        res = ABinEmpty('empty')
    elif prox_simb.type == 'NUM':
        t1 = prox_simb.value
        rec_term('NUM')
        t2 = rec_ABin()
        t3 = rec_ABin()
        rec_term('PF')
        res = ABinNode('node', t1, t2, t3)
    else:
        parserError(prox_simb)
        res = ABinEmpty('empty')
    return res

def rec_ABin():
    global prox_simb
    rec_term('PA')
    return rec_ABin2()

def rec_Parser(data):
    global prox_simb
    lexer.input(data)
    prox_simb = lexer.token()
    return rec_ABin()
    
