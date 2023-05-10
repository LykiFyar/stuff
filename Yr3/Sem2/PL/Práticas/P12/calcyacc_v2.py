import ply.yacc as yacc
from calclex import test_lex, tokens
import sys

precedence = [
    ('left' , 'IMP', 'EQUI'),
    ('left', '|'),
    ('left', '&'),
    ('right', '~')
]

def p_calc1(p): r"calc : e " ; p[0] = (lambda dic: calc(p[1],dic), var(p[1]))
def p_e1(p): r"e : e '&' e"  ; p[0] = (p[2], p[1], p[3])
def p_e2(p): r"e : e '|' e"  ; p[0] = (p[2], p[1], p[3])
def p_e3(p): r"e : e IMP e"  ; p[0] = (p[2], p[1], p[3])
def p_e4(p): r"e : e EQUI e" ; p[0] = (p[2], p[1], p[3])
def p_e5(p): r"e : ID"       ; p[0] = ('VAR',p[1])
def p_e6(p): r"e : '(' e ')'"; p[0] = p[2]
def p_e7(p): r"e : '~' e"    ; p[0] = (p[1],p[2])

def p_error(p):
    print(f"Syntax error: {p}")
    
def calc(ap,dic):
    match ap:
        case ('VAR',x): return dic[x]
        case ('~', a): return not calc(a,dic)
        case ('&', ae, ad): return calc(ae,dic) and calc(ad,dic)
        case ('|', ae, ad): return calc(ae,dic) or calc(ad,dic)
        case ('=>', ae, ad): return not calc(ae,dic) or calc(ad,dic)
        case ('<=>', ae, ad): return calc(ae,dic) == calc(ad,dic)
        case _: print(f"Error, {ap}"); return None
        
def var(ap):
    match ap:
        case ('VAR',x): return {x}
        case ('~', a): return var(a)
        case ('&', ae, ad): return var(ae) | var(ad)
        case ('|', ae, ad): return var(ae) | var(ad)
        case ('=>', ae, ad): return var(ae) | var(ad)
        case ('<=>', ae, ad): return var(ae) | var(ad)
        case _: print(f"Error, {ap}"); return None
                
def permutations(n):
    if n == 1:
        return [[0],[1]]
    else:
        l1 = permutations(n-1)
        return [x+[0] for x in l1] + [x+[1] for x in l1]

def dics(v):
    l1 = permutations(len(v))
    return [list(zip(v,l)) for l in l1]        

def table(l, f):
    for d in l:
        print(f"{d} | {bool(f(dict(d)))}")
    
    
    


parser = yacc.yacc()

with open(sys.argv[1]) as f:
    txt = f.read()
    f,v = parser.parse(txt)
    table(dics(v),f)
    #test_lex(txt)

