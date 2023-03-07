# Semana 04 - Aula PL
## turno:  PL 2

## grupo 
|  Número |            Nome             |
|---------|-----------------------------| 
|  97018  | Telmo Leonel Silva Oliveira |
|  97223  | João Paulo Peixoto Castro   |
|  97368  | João Pedro Vilas Boas Braga |
|  97642  | José Rafael Cruz Ferreira   |

## Exercícios da aula (ficha 02):

### Exercício 1 

**Perfis do utilizador – Software Tester**
- Informação sobre o utilizador
  - Grupo etário: 18-35
  - Formação académica: Licenciatura em Engenharia Informática
  - Competências: Conhecimento de programação e testagem de sistemas informáticos
  - Tipo de utilizador/Experiência: Utilizador ocasional e iniciante do sistema
- Utilização do sistema 
  - Opcional ou obrigatória: Opcional para jogar campeonatos, configurar corridas, escolher pilotos, carros,..
- Informação sobre trabalho
  - Classe de utilizador: Software Tester
  - Descrição do trabalho: É contratado para testar sistemas informáticos à procura de falhas e erros nos mesmos, tal como providenciar feedback sobre o uso do sistema e sugestões de melhorias
  - Tarefas principais: Testar as funcionalidades do jogo e verificar a existência de erros no sistema enquanto joga, cria e configura campeonatos.
  - Responsabilidades: Garantir que encontra o máximo de vulnerabilidades existentes possíveis, contribuindo para o correto funcionamento do jogo na perspetiva do jogador comum.
  
**Perfis do utilizador – Estudante Universitário**
- Informação sobre o utilizador
  - Grupo etário: 18-22 anos 
  - Formação académica: Ensino Secundário, frequenta a Licenciatura em Ciências da Comunicação
  - Competências: Comunicação, experiência em ferramentas Adobe(Photoshop, Illustrator, After Effects),
conhecimento em idiomas, fluente em: português, inglês e espanhol, intermédio em: Francês e Alemão 
  - Tipo de utilizador/Experiência: Jogador recorrente ao fim de semana
- Utilização do sistema 
  - Opcional ou obrigatória: Opcional, apenas escolhe as características 
dos objetos com as quais vai lidar no sistema quando entra neste.
- Informação sobre trabalho
  - Classe de utilizador: Jogador (guest)
  - Descrição do trabalho: Participante no sistema que pode jogar num campeonato mas que não lhe é atribuído um ranking global no sistema
  - Tarefas principais: Escolher o seu carro e o piloto de acordo com as características da meteorologia e do campeoanto que joga.
  - Responsabilidades: Sem responsabilidades diretas na funcionalidade do sistema, devendo apenas manter o respeito pelos parceiros de jogo

**Perfis do utilizador- Estudante universitário**
- Informação sobre o utilizador
  - Grupo etário 20-22anos
  - Formação académica: Ensino Secundário na área de Ciências e Tecnologia. Licenciado em engenharia informática. De momento, a cursar o mestrado de Mestrado em Engenharia de Software 
  -Competências: Conhecimentos de informática quer a nivel de hardware quer de software. Boas habilidades em jogos de multiplayer.
Tipo de utilizador/Experiência Utilizador frequente que joga 2 vezes por semana.
- Utilização do sistema
  - Opcional ou obrigatória: Obrigatória. Este possui um papel importante na criação dos vários componentes do sistemae por fazer uma gestão dos mesmos.
- Informação sobre trabalho: Administrador
  - Descrição do trabalho: Gerir campeonatos,circuitos,pilotos e carros. Participar em corridas de um campeonato e vera sua classificação.
  - Tarefas: Gestão de campeonatos,circuitos,pilotos e carros. Pode participar na simulacao de um campeonato e consultar o seu ranking 
  - Responsabilidades: Gestão de campeonatos,circuitos,pilotos e carros.


### Exercício 2

0. Para receitar medicamentos:
> 1. Autenticar doutor no sistema
> 2. Indicar o código do SNS do utente
> 3. Abrir consulta com utente
> 4. Abrir receita para utente
> 5. Digitar código do medicamento
> 6. Assinalar que medicamento existe
> 7. Adicionar medicamento à receita
>> 7.1. Adicionar psicotrópico  
>> 7.2. Adicionar Outro  
> 8. Especificar dados da receita do medicamento
>> 8.1. Indicar princípio ativo do medicamento  
>> 8.2. Indicar quantidade do medicamento  
>> 8.3. Indicar posologia  
> 9.  Assinalar que atingiu máximo de medicamentos (3)
> 10. Submeter receita
> 11. Cancelar receita
> 12. Avisar que já existe um medicamento desse tipo na receita

Plano 0: Seguir a ordem 1-2-3-4-5-6-7-8-10, podendo repetir os passos 7-8 no máximo 3 vezes com sucesso.  
Plano 8: Fazer 8.1, 8.2 e 8.3 em qualquer ordem  
Plano 7: Fazer 7.1 ou 7.2  
Plano 7.1: Fazer 7.1 se 7.2 não tiver acontecido  
Plano 7.2: Fazer 7.2 se 7.1 não tiver acontecido  
Plano 10: Fazer 10 ou 11 dependendo de 9  
Plano 10: Fazer 10, se quiser  
Plano 11: Fazer 11, se quiser  

### Exercício 3
...