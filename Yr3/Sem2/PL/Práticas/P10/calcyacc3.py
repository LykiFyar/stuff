import ply.yacc as yacc
from calclex import test_lex, tokens
import sys
import math


mem = {}


precedence = [
    ('right', '='),
    ('left', '+', '-'),
    ('left', '/', '*', '%'),
    ('right', '^')
]

def p_calc1(p):
    r"calc : elemento '\n'"
    p[0] = f"{p[1]}"
    
def p_calc2(p):
    r"calc : calc elemento '\n'"
    p[0] = f"{p[1]}\n{p[2]}"
    
def p_calc3(p):
    r"elemento : deff"
    p[0] = p[1]

def p_calc4(p):
    r"elemento : e"
    p[0] = f"print({p[1]})"


def p_e1(p):
    r"e : e '-' e"
    p[0] = p[1] - p[3]
    
def p_e2(p):
    r"e : e '+' e"
    p[0] = p[1] + p[3]
    
def p_e3(p):
    r"e : e '*' e"
    p[0] = p[1] * p[3]
    
def p_e4(p):
    r"e : e '/' e"
    p[0] = p[1] / p[3]
    
def p_e5(p):
    r"e : e '%' e"
    p[0] = p[1] % p[3]

def p_e6(p):
    r"e : '(' e ')'"
    p[0] = p[2]
    
def p_e7(p):
    r"e : LOG '(' e ')'"
    p[0] = math.log(p[3])
    
def p_e8(p):
    r"e : EXP '(' e ')'"
    p[0] = math.exp(p[3])
    
def p_e9(p):
    r"e : NUM"
    p[0] = p[1]
    
def p_e10(p):
    r"e : ID '=' e"
    mem[p[1]] = p[3]
    p[0] = p[3]
    
def p_e11(p):
    r'e : ID'
    p[0] = mem.get(p[1],0)
    
def p_deff1(p):
    r"deff : ID '(' ID ')' '=' e"
    p[0] = f"def {p[1]}(x):\n\treturn {p[6]}"
    

def p_error(p):
    print(f"Syntax error: {p.value}")

parser = yacc.yacc()

with open(sys.argv[1]) as f:
    txt = f.read()
    print(parser.parse(txt.strip() + '\n'))
    #test_lex(txt)

