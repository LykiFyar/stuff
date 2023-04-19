



import ply.lex as lex
import ply.yacc as yacc
import sys


states = [
    ('valor', 'exclusive')
]

tokens = [
    'TYPE',
    'ID',
    'ATTRIBUTE',
    'VALUE'
    ]

literals = "{},@"
t_ANY_ignore = " \t\n"

def t_TYPE(t):  r'@\w+'; return t
def t_ATTRIBUTE(t): r'\w+(?=\s*=)'; return t
def t_IGUAL(t): r'='; t.lexer.begin('valor')
def t_ID(t): r'\w+'; return t
def t_valor_VALUE(t): r'\"[^\"]\"'; t.lexer.begin('INITIAL'); return t
def t_valor_C(t): r'\{[^\}]\}'; t.lexer.begin('INITIAL'); t.type = 'VALUE'; return t

def t_error(t):
    print("Caracter ilegal: " + t.value[0])
    t.lexer.skip(1)

lexer = lex.lex()


def p_error(p):
    print(f"Syntax error: {p}")

texto = '''
@incollection {HDYE78,
author = "Ricardo Martini and Pedro Rangel Henriques and Giovani Libreloto",
title = "Storing Archival Emigration Documents to Create Virtual Exhibition Rooms",
booktitle = "New Contributions in Information Systems and Technologies",
series="Advances in Intelligent Systems and Computing",
editor="Rocha, Alvaro and Correia, Ana and Costanzo, S. and Reis, Luis Paulo",
volume="353",
pages="403-409",
year = "2015",
month =  "April"
}


@book {H787,
author = {Vitor T. Martins and Pedro Rangel Henriques and Daniela da Cruz},
title = {An AST-based tool, Spector, for Plagiarism Detection},
booktitle = {Proceedings of SLATE’15},
pages = {173--178},
ISBN = {},
year = {2015},
month =   {},
publisher = {Fundacion General UCM},
annote = {Keywords: software, plagiarism, detection, comparison, test}}

@book {H787,
author = {Vitor T. Martins and Pedro Rangel Henriques and Daniela da Cruz},
title = "{A}n {AST}-based tool, {S}pector, for Plagiarism Detection",
booktitle = {Proceedings of SLATE’15},
pages = {173--178},
ISBN = {},
year = {2015},
month =   {},
publisher = {Fundacion General UCM},
annote = {Keywords: software, plagiarism, detection, comparison, test}
}'''




