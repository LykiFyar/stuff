[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/K8jq4QGU)
# Semana 09 - Aula PL

## turno:  PL 02

## grupo

| Número | Nome |
| ------- | ---- |
| 97018    | Telmo Oliveira |
| 97368    | João Braga  |

## Resolução dos Exercícios (ficha 06):

[Enunciado da Ficha 06](Ficha_IPM_06_enunciado.pdf)

Material de apoio para a resolução desta ficha em [Aulas &gt; Semana 09](https://elearning.uminho.pt/webapps/blackboard/content/listContentEditable.jsp?content_id=_1336495_1&course_id=_55891_1)

### Exercício 1

Considere o protótipo [Fly2023](https://www.di.uminho.pt/~jfc/ensino/fly2023/) de  gestão de sumários.

Realize uma análise com _Cognitive Walkthrough_ para a tarefa de Editar um Sumário e, com base
nos resultados da análise, apresente uma proposta de melhoria da interface.
Considere que o utilizador é um docente universitário.

    Editar Sumários de 15/03 e 17/05:*
      Ponto de partida: Menu principal da aplicação
      Sequência de passos da tarefa a testar*
          (a) Selecionar Edição de sumários: Clicar Sumários>Editar
          (b) Seleccionar sumário de 15/03: Clicar checkbox respectiva
          (c) Seleccionar sumário de 17/05: Clicar checkbox respectiva
          (d) Ir para formulário de edição: Fazer scroll down para tornar visível o botão “Editar” e clicar o botão
          (e) Alterar data e texto do primeiro sumário: Fazer scroll down [dados já alterados no protótipo]
          (f) Actualizar sumário: Clicar botão “Actualizar”
          (g) Alterar data e texto do segundo sumário: Fazer scroll down [dados já alterados no protótipo]
          (h) Actualizar sumário: Clicar botão “Actualizar” Protótipo de um sistema de gestão de sumários.

Formulário para _Cognitive Walkthrough_
   [ [CW.xlsx](https://elearning.uminho.pt/bbcswebdav/pid-1336503-dt-content-rid-6828666_1/xid-6828666_1) ]  [ [CW.pdf](https://elearning.uminho.pt/bbcswebdav/pid-1336503-dt-content-rid-6828665_1/xid-6828665_1)  ]

**Resposta:**

Análise com _Cognitive Walkthrough_ para a tarefa de Editar um Sumário: [CW_Ex01.xlsx](CW_EX01.xlsx)

Resumo da proposta de melhoria da interface:

- Achamos que seria mais eficiente e mais acessível para o utilizador se em vez de ser gerada uma nova página onde se atualiza os sumários, se houvesse diretamente um botão na coluna de cada sumário que ao ser selecionado já possibilitaria a edição do próprio sumário diretamente, de forma a modularizar a edição dos vários sumários.

### Exercício 2

Protótipo criado pelos colegas:

- [link para o pdf](RacingManager.pdf) do protótipo
- Os [passos](passos.txt) necessários no protótipo para *Jogar o Campeonato*
  - Dos passos recebidos, foram considerados os seguintes:
   1) Carregar no botão Start
   2) Carregar no rectângulo do meio para selecionar o campeonato
   3) Carregar no botão Select para selecionar o carro
   4) Carregar no botão Select para selecionar o condutor
   5) Carregar no Botão Start para iniciar a corrida
   6) Carregar no botão Next Race para prosseguir para a próxima corrida (voltar a 5)
   7) Carregar no botão Championship results para ver os resultados do campeonato
   8) Carregar no botão Quit para sair do jogo

**Resposta:**

Análise com _Cognitive Walkthrough_ para a tarefa *Jogar o Campeonato*: [CW_Ex02.xlsx](CW_Ex02.xlsx)

Resumo da proposta de melhoria da interface:

- Melhorar a interpretação do menu de seleção dos campeonatos, onde não se encontra muito claro como selecionar um campeonato específico.
