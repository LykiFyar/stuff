# abins_program.py
# 2023-03-21 by jcr
# ----------------------
from abin_anasin import rec_Parser

import sys
texto = sys.stdin.read()
ast = rec_Parser(texto)
ast.pp()
print('Inorder: ')
ast.inorder()
print('\nPreorder: ')
ast.preorder()
print(ast.json())
print(ast.count())
print(ast.sum())