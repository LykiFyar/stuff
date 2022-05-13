# Exercício 1

A = {a1, a2, a3}

B = {b1, b2, b3, b4, a1, a2}

C = {c1, c2, c3, b1, c4, c5}

## Normalize os esquemas das tabelas apresentadas até à 3FN, considerando o seguinte conjunto de dependências funcionais:

1. a1 -> a2, a3
2. b1 -> b2, b3, b4, a1
3. c1 -> c2, c3, b1
4. c3 -> c4, c5

A'  = {[a1], a2, a3}

B'  = {[b1], b2, b3, b4, a1} -> *a2 é suprimido por ser funcionalmente dependente de a1. trata-se de uma dependência transitiva.*

C'  = {[c1], c2, c3, b1}

C'' = {[c3], c4, c5} -> *esta tabela é construída para responder à dependência transitiva das dependências 3. e 4.*

##### [] -> chave primária

# Exercício 2

TODO

# Exercício 3

Tabelas:

A = {a1, a2, a3, d2}

C = {c1, c2, a3, d1, d3, d4}

B = {b1, b2, b3, b5}

D = {d1, d2, d3}

E = {b2, b6, b5}

Dependências funcionais:

a1 -> a2, a3

a1 -> d2, d1

c1 -> c2, a3, d1, b4

b2 -> b1, b3, b5, b6

d1 -> d2, d3 //

b4 -> b4

### Normalize os esquemas das tabelas apresentadas até à 3FN

A'  = {[a1], a2, a3, d1} -> *d1 substitui d2 por dependência parcial*

B'  = {b1, [b2], b3, b5, b6} -> *tabela E foi suprimida por dependência funcional parcial e b6 foi adicionado a tabela B porque b6 é funcionalmente dependente de b2 e a tabela E possuía atributos repetidos presentes em B (redundância)*

C'  = {[c1], c2, a3, d1, b4} -> *d3 foi suprimido porque depende funcionalmente de d1 (dependência funcional transitiva)*

D'  = {[d1], d2, d3}
