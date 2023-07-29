from listas_analex import lexer

prox_simb = ('Erro', '', 0, 0)

def parserError(simb):
    print("Erro sintático, token inesperado: ", simb)

def rec_term(simb):
    global prox_simb
    if prox_simb.type == simb:
        prox_simb = lexer.token()
    else:
        parserError(prox_simb)

def rec_Conteudo2():
    if prox_simb.type == 'PF':
        pass
    elif prox_simb.type == 'VIRG':
        rec_term('VIRG')
        rec_Conteudo()

def rec_Conteudo():
    rec_term('NUM')
    rec_Conteudo2()

def rec_LCont():
    if prox_simb.type == 'PF':
        rec_term('PF')
    elif prox_simb.type == 'NUM':
        rec_Conteudo()
        rec_term('PF')
    else:
        parserError(prox_simb)

def rec_Lista():
    rec_term('PA')
    rec_LCont()


def rec_Parser(data):
    global prox_simb
    lexer.input(data)
    prox_simb = lexer.token()
    rec_Lista()
    print("That's all folks!")