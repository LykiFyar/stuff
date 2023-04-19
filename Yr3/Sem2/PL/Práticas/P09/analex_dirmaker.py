import ply.lex as lex
import ply.yacc as yacc
import sys

tokens = ['NAME','STRING']

literals = ['{','}', '=']
t_ignore = " \t\n"

def t_NAME(t):  r'[\w\-.]+'; return t
def t_STRING(t): r'\"[^\"]*\"'; return t
def t_COMMAND(t): r'\$\([^\)]*\)'; t.type = "NAME"; return t

def t_error(t):
    print("Caracter ilegal: " + t.value[0])
    t.lexer.skip(1)

lexer = lex.lex()

def p_tree(p):
    "tree : NAME '{' childs '}'"
    p[0] = f"mkdir {p[1]}\ncd {p[1]}\n{p[3]}\ncd .."
    
def p_childs1(p): 
    "childs : "
    p[0] = ""
    
def p_childs2(p):
    "childs : file childs"
    p[0] = f"{p[1]}\n{p[2]}"

def p_childs3(p):
    "childs : tree childs"
    p[0] = f"{p[1]}\n{p[2]}"

def p_file1(p):
    "file : NAME"
    p[0] = f"touch {p[1]}"

def p_file2(p):
    "file : NAME '=' STRING"
    p[0] = f"echo '{p[3]}' > {p[1]}"

def p_error(p):
    print(f"Syntax error: {p}")
    

with open(sys.argv[1]) as f:
    txt = f.read()
    parser = yacc.yacc()
    #parser.input(txt)
    print(parser.parse(txt))