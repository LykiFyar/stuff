import ply.lex as lex
import re

tokens = [
    'NUM',
    'LOG',
    'EXP',
    'ID',
    'lambda'
]

literals = "\n+-*/()%=^"


t_ignore = " \t"

def t_NUM(t):
    r'\d+(\.\d+)?'
    t.value = float(t.value)
    return t

def t_LOG(t):
    r'log'
    return t

def t_EXP(t):
    r'exp'
    return t

def t_ID(t):
    r'[aA-zZ]\w*'
    return t

def t_lambda(t):
    r'lambda.*'
    t.value = re.sub(r'^lambda', "", t.value)
    return t


def t_error(t):
    print("Erro: " + t.value[0])
    t.lexer.skip(1)


lexer = lex.lex()
    
def test_lex(text):
    lexer.input(text)
    while t := lexer.token():
        print(t)
        



