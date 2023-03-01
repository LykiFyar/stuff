import re
import sys

entrada = """hello world
goodbye world
hi, hello there""".splitlines()

def main():
    for line in entrada:
        print(line, re.search(r'hello', line))
        
### FOR MORE DONE IN THIS CLASS CHECK: ../Fichas/Ficha_RE_1.ipynb
        

if __name__=="__main__":
    main()