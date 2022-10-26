# Ficha TP1

## Exercício 1

### Formulação do problema

#### Estado inicial

|A|A|A|C|C|C| |

#### Estado final

Todas as peças C à esquerda das peças A

#### Operadores de mudança de estado

- Mudar a posição de uma peça para uma posição adjacente livre

- Mudar a posição de uma peça por cima de outra adjacente para uma posição livre

- Mudar a posição de uma peça por cima de outras 2 adjacentes para uma posição livre

#### Número de estados finais

- 7

|C|C|C|A|A|A| |

ou

| |C|C|C|A|A|A|

ou

|C|C|C| |A|A|A|

ou

|C| |C|C|A|A|A|

ou

|C|C| |C|A|A|A|

ou

|C|C|C|A| |A|A|

ou

|C|C|C|A|A| |A|

## Exercício 2

### Alínea i - Procura em profundidade

#### Ordem de expansão dos nós

A - B - D - H - I - E - J - K - C - F - L

#### Solução

A - C - F - L

### Alínea ii - Procura em largura

#### Ordem de expansão dos nós

A - B - C - D - E - F - G

#### Solução

A - C - G