import ply.lex as lex
import ply.yacc as yacc
import sys

tokens = ('TIPO', 'NUM', 'ID', 'P4', 'PRECO')

literals = "-;:"

t_ignore = " \t\n"

def t_TIPO(t):  r'[A-Z]{2,}'         ;                            return t
def t_PRECO(t): r'\d+\.\d+'          ; t.value = float(t.value) ; return t
def t_NUM(t):   r'\d+'               ; t.value = int(t.value)   ; return t
def t_ID(t):    r'[A-ZÁ]\w+(\s\w+)*' ;                            return t
def t_P4(t):    r'::'                ;                            return t
def t_error(t):
    print("Erro: " + t.value[0], file=sys.stderr)
    t.lexer.skip(1)


# Devolve tuplo de custo total das compras, número de itens listados e total de artigos a comprar
'''
def soma3(v1,v2):
    return (v1[0] + v2[0], v1[1] + v2[1], v1[2] + v2[2])


def p_LC1(t):
    "LC : categoria LC"
    t[0] = soma3(t[1], t[2])

def p_LC2(t):
    "LC : categoria"
    t[0] = t[1]

def p_categoria(t):
    "categoria : TIPO ':' produtos"
    t[0] = t[3]
    
def p_produtos1(t):
    "produtos : produto produtos"
    t[0] = soma3(t[1],t[2])

def p_produtos2(t):
    "produtos : "
    t[0] = (0,0,0)

def p_produto(t):
    "produto : '-' NUM P4 ID P4 PRECO P4 NUM ';'"
    t[0] = (t[6] * t[8], 1, t[8])
    
'''

# Devolver uma porção em LaTeX com a lista (not complete)

def p_LC1(t):
    "LC : categoria LC"
    t[0] = t[1] + t[2]

def p_LC2(t):
    "LC : categoria"
    t[0] = t[1]

def p_categoria(t):
    "categoria : TIPO ':' produtos"
    t[0] = f"{t[1]}:\n{t[3]}"
    
def p_produtos1(t):
    "produtos : produto produtos"
    t[0] = f"{t[1]}\n{t[2]}"

def p_produtos2(t):
    "produtos : "
    t[0] = f""

def p_produto(t):
    "produto : '-' NUM P4 ID P4 PRECO P4 NUM ';'"
    t[0] = f"\item {t[4]} ({t[8]})"
   

def p_error(t):
    print(f"Syntax error: {t.value}")




lista = '''
CARNE :
  - 1 :: Bife :: 10.00 :: 1;
  - 2 :: Panado :: 5.00 :: 4;
  - 3 :: Hambúrguer :: 8.00 :: 3;
  - 4 :: Almôndegas :: 7.00 :: 5;

BEBIDA :
  - 5 :: Água :: 0.40 :: 16;
  - 6 :: Sumo :: 1.50 :: 9;
  - 7 :: Refrigerante :: 1.80 :: 10;

FRUTA :
  - 8 :: Maçã :: 0.60 :: 20;
  - 9 :: Banana :: 0.50 :: 15;
  - 10 :: Laranja :: 0.80 :: 18;
  - 11 :: Pêssego :: 0.70 :: 22;
  - 12 :: Uva :: 0.90 :: 17;

LEGUMES :
  - 13 :: Alface :: 1.00 :: 25;
  - 14 :: Tomate :: 0.75 :: 23;
  - 15 :: Cebola :: 0.50 :: 28;
  - 16 :: Batata :: 0.30 :: 30;
  - 17 :: Cenoura :: 0.40 :: 26;

PASTELARIA :
  - 18 :: Bolo de Chocolate :: 3.50 :: 1;
  - 19 :: Croissant :: 1.20 :: 14;
  - 20 :: Pastel de Nata :: 1.00 :: 5;
  - 21 :: Donut :: 0.80 :: 13;
  '''
  
lexer = lex.lex()
  
parser = yacc.yacc()
print(parser.parse(lista))