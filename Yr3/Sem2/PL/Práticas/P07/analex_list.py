import ply.lex as lex
import ply.yacc as yacc

tokens = ['NUM']

literals = "[]"

def t_NUM(t):
    r'\d+'
    t.value = int(t.value)
    return t

t_ignore = " \t\n"

def t_error(t):
    print("Error: " + t.value[0])
    t.lexer.skip(1) 
    
texto = "[ 4 67 3  8  9]"

def lexDebug(lexer):
    while tok:=lexer.token():
        print(tok)

lexer = lex.lex()

#lexer.input(texto)
#lexDebug(lexer)

def p_A(t):
    "LE : '[' cont ']' "
    print(t[2])

def p_B(t):
    "cont : NUM cont"
    t[0] = t[1] + t[2]
    
def p_C(t):
    "cont : NUM"
    t[0] = t[1]
    
def p_error(t):
    print("Syntax error")

parser = yacc.yacc()
parser.parse(texto)