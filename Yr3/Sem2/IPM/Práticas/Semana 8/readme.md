[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/8faacNC8)
# Semana 08 - Aula PL

## turno:  PL 02

## grupo

| Número | Nome |
| --- | --- |
| 97642 | José Rafael Ferreira |
| 97018 | Telmo Oliveira  |
| 97368 | João Braga  |
| 97223 | João Castro  |


## Desenvolvimento do Protótipo UI do Jogo:

### 1. Um protótipo que permita jogar um campeonato já criado. 
Terá que permitir:
  1. Consultar os campeonatos existentes e escolher um
  2. Escolher o carro e piloto com que o jogador quer participar no campeonato
  3. Iniciar o campeonato e, antes de cada corrida, consultar as características da pista e afinar o carro ou fazer apostas (conforme o exemplo que tiverem escolhido usar: trabalho de DSS ou programa fornecido nas aulas).
  4. Ver resultado final do campeonato.

**Resposta**: **[Novo protótipo](prototype.pdf)**

### 2. O mapa de navegação do protótipo
**Resposta**: **[Mapa de Navegação](IPM-mapadenavegacao.pdf)**

### 3. Os passos necessários no protótipo para jogar o campeonato  
Uma descrição/listagem dos passos necessários no protótipo para jogar o campeonato (de modo a que alguém possa usar o protótipo para experimentar jogar um campeonato). 

**Resposta**:

0. Entrada no programa
1. Configura o campeonato no botão 'Configurar';  
    1.1 Selecionar o campeonato desejado de entre os disponíveis;  
    1.2 Selecionar o Carro (pode usar os filtros que pretende ver no Carro);  
    1.3 Selecionar o piloto;  
    - 1.3.1 - Se ainda existam vagas para participar no Campeonato:  
        - Sim: É apresentada uma mensagem de registo, deve clicar 'OK' para prosseguir;  
        - Não: É apresentada uma mensagem de erro no registo, deve clicar 'OK' para voltar ao ponto 1;  
2. Clicar em 'Simular Campeonato';
3. Indicar o id do Campeonato que pretende jogar, que configurou no ponto 1, e clicar em 'Simular';
4. Esperar pelo carregamento;
5. A simulação começa e incialmente são apresentadas as características da corrida que irá decorrer de seguida e os resultados até ao momento. (NOTA: nesta fase, surgirão automaticamente janelas para cada jogador propondo a execução de afinações ou não)  
Após efetuadas todas as afinações, são apresentados os comentários da corrida atual. (NOTA: Nesta fase, de maneira a que a interface desenvolvida se assemelhe ao código desenvolvido no projeto de DSS, após terminado os comentários da corrida, são apresentados os resultados.)
6. Por fim, estando na interface em que decorre a simulação, pode clicar 'OK' para regressar ao ponto 0.
