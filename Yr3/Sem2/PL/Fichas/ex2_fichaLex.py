import re
import ply.lex as lex

texto = "[ 1,5, palavra, False ,3.14,   0, fim]"

tokens = [
    'WORD',
    'BOOL',
    'INT',
    'FLOAT'
]

literals = '[],'

# t_INT = r'\d+' # EM CASO DE IGUALDADE, DÁ PRIORIDADE À QUE VEM PRIMEIRO
# t_WORD = r'\w+' # CASO CONTRÁRIO, DÁ PRIORIDADE À EXPREG MAIS COMPRIDA QUE DER MATCH
# t_BOOL = r'False|True' 
# t_FLOAT = r'\d+\.\d+'

t_ignore = ' \t\n'

def t_WORD(t):
    r'[a-zA-Z]\w*'
    if t.value in ['True', 'False']:
        t.type = 'BOOL'
    return t

def t_FLOAT(t):
    r'\d+\.\d+'
    t.value = float(t.value)
    return t

def t_INT(t):
    r'\d+'
    t.value = int(t.value)
    return t

def t_error(t):
    print(f"Carácter ilegal '{t.value[0]}' na linha {t.lineno}")
    t.lexer.skip(1)

lexer = lex.lex()

lexer.input(texto)

while t:=lexer.token():
    print(t)
