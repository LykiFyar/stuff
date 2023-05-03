from ply import lex
import re

tokens = [
    "NUM"
    ]

literals = "()"

t_ignore = " \t\n"

def t_NUM(t):
    r'\d+'
    t.value = int(t.value)
    return t


def t_error(t):
    print("Erro: " + t.value[0])
    t.lexer.skip(1)

lexer = lex.lex()
