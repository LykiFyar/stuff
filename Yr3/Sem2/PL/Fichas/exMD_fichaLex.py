# Analizador léxico de Markdown

import re
import ply.lex as lex

texto = '''# This is a heading

## This is a subheading

This is some **bold** text.

This is some *italic* text.

- This is a bullet point
- This is another bullet point

1. This is a numbered list
2. This is another numbered list item

> This is a blockquote.

`This is some inline code.`

```python
# This is some code block
print("Hello, world!")
```'''

tokens = [
    'TITLE',
    'BOLD'
]

def t_TITLE(t):
    r'\# (.+)'
    print(f'<h1>{t.value.strip("# ")}</h1>', end="")

def t_BOLD(t):
    r'\*\*.+?\*\*'
    print(f'<b>{t.value.strip("**")}</b>', end="")

def t_DEFAULT(t):
    r'.|\n'
    print(t.value, end="")

def t_error(t):
    print(f"Carácter ilegal '{t.value[0]}' na linha {t.lineno}")
    t.lexer.skip(1)

lexer = lex.lex()

lexer.input(texto)

while t:=lexer.token():
    print(t)
