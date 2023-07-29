# abin_ast.py
# 2023-03-21 by jcr
# ----------------------
# P1: ABin -->  
# P2:        | num ABin ABin   
# -------------------------------         
class ABinNode:
    def __init__(self, type, num, left, right):
        self.type = type
        self.num = num
        self.left = left
        self.right = right

    def pp(self):
        print('(')
        print(self.num)
        self.left.pp()
        self.right.pp()
        print(')')  

    def inorder(self):
        self.left.inorder()
        print(self.num, ' ', end='')
        self.right.inorder()

    def preorder(self):
        print(self.num, ' ', end='')
        self.left.preorder()
        self.right.preorder()

    def json(self):
        node = {
            'num': self.num,
            'left': self.left.json(),
            'right': self.right.json()
        }
        return node
    
    def count(self):
        return 1 + self.left.count() + self.right.count()
    
    def sum(self):
        return int(self.num) + self.left.sum() + self.right.sum()

class ABinEmpty:
    def __init__(self, type):
        self.type = type

    def pp(self):
        print('()')

    def inorder(self):
        pass

    def preorder(self):
        pass

    def json(self):
        return "null"
    
    def count(self):
        return 0
    
    def sum(self):
        return 0
        

    
