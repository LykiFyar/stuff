from ply import yacc
import re
from arvbin_analex import tokens, literals
import json

'''
    arvbin : '(' NUM arvbin arvbin ')'
    arvbin : '(' ')' 
'''

def p_abin1(p):
    "arvbin : '(' NUM arvbin arvbin ')'"
    p[0] = (p[2], p[3] , p[4])
#    p[0] = f"""{{"root":{p[2]},
#    "left":{p[3]},
#    "right":{p[4]}
#}}"""
 
def p_abin2(p):
    "arvbin : '(' ')'"
    p[0] = None
    #p[0] = "null"
    
    
def p_error(p):
    print(f"Syntax error: {p.value}")
    
    
parser = yacc.yacc()
ri = parser.parse("( 5 (3 (1 () ()) ()) (8 () (10 () ())))")

#print(ri)

def makeJSON(tuple):
    if tuple is None:
        return None
    else: 
        return {
            "root": tuple[0],
            "left": makeJSON(tuple[1]),
            "right": makeJSON(tuple[1])
                }
        
#print(json.dumps(makeJSON(ri)))

def ri2Html(x):
    if x is None:
        return "#"
    else:
        n,a1,a2 = x
        return f"""<ul><li>{n}</li><li>left: {ri2Html(a1)}</li><li>right: {ri2Html(a2)}</li></ul>"""
    
print(ri2Html(ri))