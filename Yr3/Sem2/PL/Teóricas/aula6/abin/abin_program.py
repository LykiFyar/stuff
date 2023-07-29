# abins_program.py
# 2023-03-21 by jcr
# ----------------------
from abin_anasin import rec_Parser

linha = input("Introduza uma árvore binária: ")
ast = rec_Parser(linha)
ast.pp()
print('Inorder: ')
ast.inorder()
print('\nPreorder: ')
ast.preorder()
print(ast.json())