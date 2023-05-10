import ply.lex as lex
import re

tokens = [
    'ID',
    'IMP',
    'EQUI'
]

literals = "~&|()="


t_ignore = " \t\n"

def t_IMP(t):  r'=>';         return t
def t_EQUI(t): r'<=>';        return t
def t_ID(t):   r'[aA-zZ]\w*'; return t

def t_error(t):
    print("Erro: " + t.value[0])
    t.lexer.skip(1)

lexer = lex.lex()
    
def test_lex(text):
    lexer.input(text)
    while t := lexer.token():
        print(t)