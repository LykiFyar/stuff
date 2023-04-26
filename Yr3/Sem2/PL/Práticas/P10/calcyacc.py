import ply.yacc as yacc
from calclex import test_lex, tokens
import sys


def p_calc1(p):
    r"calc : e '\n'"
    p[0] = p[1]
    print(p[0])
    
def p_calc2(p):
    r"calc : calc e '\n'"
    p[0] = f"{p[1]}\n{p[2]}"
    print(p[2])

def p_e1(p):
    "e : p"
    p[0] = p[1]

def p_e2(p):
    "e : e '-' p"
    p[0] = p[1] - p[3]
    
def p_e3(p):
    "e : e '+' p"
    p[0] = p[1] + p[3]
    
def p_p1(p):
    "p : p '*' f"
    p[0] = p[1] * p[3]
    
def p_p2(p):
    "p : p '/' f"
    p[0] = p[1] / p[3]

def p_p3(p):
    "p : f"
    p[0] = p[1]

def p_f1(p):
    "f : '(' e ')'"
    p[0] = p[2]
    
def p_f2(p):
    "f : NUM"
    p[0] = p[1]
    
    
def p_error(p):
    print(f"Syntax error: {p.value}")

parser = yacc.yacc()

with open(sys.argv[1]) as f:
    txt = f.read()
    parser.parse(txt.strip() + '\n')
    #test_lex(txt)

