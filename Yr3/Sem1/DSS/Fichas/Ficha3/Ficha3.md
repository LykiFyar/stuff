# Ficha 3

#### "Registar Requisição de livro"

Cenários: 1,2,3

Pré-Condição: Funcionário está autenticado

Pós-condição: Sistema fica com um novo registo de requisição e o livro fica no estado "requisitado"

FLUXO NORMAL:

    1. Funcionário fornece código de utente e código de livro (cota)
    2. Sistema verifica que utente é válido
    3. Sistema verifica que utente não tem multas para pagar
    4. Sistema verifica a disponibilidade do livro
    5. Sistema regista uma requisição do livro pelo utente
    6. Sistema atualiza estado do livro para "requisitado"
    7. Sistema calcula data de devolução
    8. Sistema imprime talão comprovativo da requisição

FLUXO DE EXCEPÇÃO 1 [utente não é válido] (passo 2)

    2.1 Sistema informa que o utente não existe registado
    2.2 Sistema cancela a requisição

FLUXO ALTERNATIVO 2 [utente com multas para pagar] (passo 3)

    3.1 Sistema calcula montante de multa e informa Funcionário
    3.2 Funcionário confirma pagamento da multa
    3.3 Sistema prolonga empréstimo dos livros em atraso
    3.4 Regressa a 4.

FLUXO DE EXCEPÇÃO 3 [utente não paga multas] (passo 3.2)

    3.2.1 Funcionário comunica não pagamento de multa
    3.2.2 Sistema cancela a requisição

FLUXO DE EXCEPÇÃO 4 [livro não pode ser requisitado] (passo 4)

    4.1 Sistema informa que livro não pode ser requisitado
    4.2 Sistema cancela a requisição

**TODO**

"Registar Entrega do Livro"

Cenários: 4,5

Pré-condição: Funcionário está autenticado, Utente apresenta o livro

Pós.condição: Sistema fica com novo registo de requisição e o livro fica no estado "livre"

FLUXO NORMAL:

    1. Funcionário fornece código de utente e código de livro (cota)
    2. Sistema verifica que utente é válido
    3. Sistema verifica que utente está a entregar o livro dentro de prazo
    4. Sistema regista entrega do livro
    5. Sistema altera estado do livro para "disponível"
    6. Sistema imprime comprovativo de entrega

FLUXO ALTERNATIVO 1 [livro está a ser entregue com atraso] (passo 2)

    2.1 Sistema calcula a multa a pagar
    2.2 Sistema informa que está a entregar fora de prazo e indica a multa
    2.3 Funcionário indica pagamento da multa
    2.4 Sistema regista pagamento
    2.5 Regressa a 3

FLUXO DE EXCEPÇÃO 2 [Utente não paga multa] (passo 2.3)

    2.3.1 Funcionário retém livro