class Node:
    def __init__(self, name):
        self.n_name = str(name)

    def __str__(self):
        return "node " + self.n_name

    def __repr__(self):
        return "node " + self.n_name

    def getName(self):
        return self.n_name

    def setName(self, name):
        self.n_name = name


