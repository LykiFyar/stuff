import ply.lex as lex

tokens = ('TAG', 'IDA', 'STR', 'm', 'M' ,'mb', 'ig', 'TXT')

states = (
    ('Aele', 'exclusive'),
    ('texto', 'exclusive'),
    ('Fele', 'exclusive')
)


def t_texto_mb(t):
    r'</'
    t.lexer.begin('Fele')
    return t

def t_ANY_m(t):
    r'\<'
    t.lexer.begin('Aele')
    return t

def t_Aele_Fele_M(t):
    r'\>'
    t.lexer.begin('texto')
    return t

t_Aele_Fele_TAG = r'\w+'
t_Aele_IDA = r'\w+(?==)'
t_Aele_ig = r'='
t_Aele_STR = r'(\".+?\")|(\'.+?\')'

t_texto_TXT = r'[^<]+'

t_INITIAL_Aele_ignore = " \t\n"
t_Fele_texto_ignore = "\t\n"

def t_ANY_error(t):
    print("Error: " + t.value[0])
    t.lexer.skip(1) 
    
texto = """<a>
<b at1="batatas">
at1 é uma "String"
<c> e depois </c>
</b>
</a>"""



def lexDebug(lexer):
    while tok:=lexer.token():
        print(tok)

lexer = lex.lex()

lexer.input(texto)
lexDebug(lexer)