-- ------------------------------------------------------
-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
-- Lincenciatura em Ciências da Computação
-- Unidade Curricular de Bases de Dados
-- 
-- Caso de Estudo: Base de dados Agile
-- Povoamento de base de dados
-- 2022
-- ------------------------------------------------------
use mydb;

-- -----------------------------------------------------
-- Table `mydb`.`Projeto`
-- -----------------------------------------------------




INSERT INTO `Projeto` (`idProjeto`, `status`, `descricao`, `nome`) VALUES (1, "Open", "Best project ever", "Atlas");
INSERT INTO `Projeto` (`idProjeto`, `status`, `descricao`, `nome`) VALUES (2, "Open", "Best project ever", "RideCare");
INSERT INTO `Projeto` (`idProjeto`, `status`, `descricao`, `nome`) VALUES (3, "Open", "Best project ever", "EasyRide");
INSERT INTO `Projeto` (`idProjeto`, `status`, `descricao`, `nome`) VALUES (4, "Open", "Best project ever", "InnovCar");
INSERT INTO `Projeto` (`idProjeto`, `status`, `descricao`, `nome`) VALUES (5, "Open", "Best project ever", " ");
INSERT INTO `Projeto` (`idProjeto`, `status`, `descricao`, `nome`) VALUES (6, "Open", "Best project ever", " ");
INSERT INTO `Projeto` (`idProjeto`, `status`, `descricao`, `nome`) VALUES (7, "Closed", "Best project ever", "InnovCar10");


-- -------------------------------------------------------
-- Table `mydb`.`Colaborador`
-- -------------------------------------------------------

INSERT INTO `mydb`.`Colaborador` (`ID`, `perfil`, `nome`) VALUES (1, "SW Developer", "Pedro Silva"); 
INSERT INTO `mydb`.`Colaborador` (`ID`, `perfil`, `nome`) VALUES (2, "SW Tester", "Pedro Cunha");
INSERT INTO `mydb`.`Colaborador` (`ID`, `perfil`, `nome`) VALUES (3, "SW Arch", "Joao Fernandes");
INSERT INTO `mydb`.`Colaborador` (`ID`, `perfil`, `nome`) VALUES (4, "Project Manager", "Flavio Cunha");
INSERT INTO `mydb`.`Colaborador` (`ID`, `perfil`, `nome`) VALUES (5, "Project Debugger", "Carlos");

-- -----------------------------------------------------
-- Table `mydb`.`Equipa`
-- -----------------------------------------------------
INSERT INTO `mydb`.`Equipa` (`idEquipa`, `n_elementos`, `nome`, `Projeto_idProjeto`, `Lider_ID`) VALUES (1, 10, "JellyFish", 1, 4);
INSERT INTO `mydb`.`Equipa` (`idEquipa`, `n_elementos`, `nome`, `Projeto_idProjeto`, `Lider_ID`) VALUES (2, 10, "Datanausts", 2, 4);
INSERT INTO `mydb`.`Equipa` (`idEquipa`, `n_elementos`, `nome`, `Projeto_idProjeto`, `Lider_ID`) VALUES (3, 10, "GoldDiggers", 3, 4);
INSERT INTO `mydb`.`Equipa` (`idEquipa`, `n_elementos`, `nome`, `Projeto_idProjeto`, `Lider_ID`) VALUES (4, 11, "Honeybadger", 4, 4);


-- -------------------------------------------------------
-- Table `mydb`.`Equipa_has_Colaborador`
-- -------------------------------------------------------


INSERT INTO `mydb`.`Equipa_has_Colaborador` (`Equipa_idEquipa`, `Colaborador_ID`) VALUES (1, 1);
INSERT INTO `mydb`.`Equipa_has_Colaborador` (`Equipa_idEquipa`, `Colaborador_ID`) VALUES (1, 5);
INSERT INTO `mydb`.`Equipa_has_Colaborador` (`Equipa_idEquipa`, `Colaborador_ID`) VALUES (2, 2);
INSERT INTO `mydb`.`Equipa_has_Colaborador` (`Equipa_idEquipa`, `Colaborador_ID`) VALUES (3, 3);
INSERT INTO `mydb`.`Equipa_has_Colaborador` (`Equipa_idEquipa`, `Colaborador_ID`) VALUES (4, 4);

-- -----------------------------------------------------
-- Table `mydb`.`Backlog`
-- -----------------------------------------------------

INSERT INTO `mydb`.`Backlog` (`idBacklog`, `nome`, `tipo`, `Projeto_idProjeto`) VALUES (1,"Product Backlog", "Product", 1);
INSERT INTO `mydb`.`Backlog` (`idBacklog`, `nome`, `tipo`, `Projeto_idProjeto`) VALUES (2,"Product Backlog", "Sprint", 1);
INSERT INTO `mydb`.`Backlog` (`idBacklog`, `nome`, `tipo`, `Projeto_idProjeto`) VALUES (3,"Product Backlog", "Sprint", 1);
INSERT INTO `mydb`.`Backlog` (`idBacklog`, `nome`, `tipo`, `Projeto_idProjeto`) VALUES (4,"Product Backlog", "Product", 2);
INSERT INTO `mydb`.`Backlog` (`idBacklog`, `nome`, `tipo`, `Projeto_idProjeto`) VALUES (5,"Product Backlog", "Sprint", 2);
INSERT INTO `mydb`.`Backlog` (`idBacklog`, `nome`, `tipo`, `Projeto_idProjeto`) VALUES (6,"Product Backlog", "Sprint", 2);
INSERT INTO `mydb`.`Backlog` (`idBacklog`, `nome`, `tipo`, `Projeto_idProjeto`) VALUES (7,"Product Backlog", "Sprint", 2);

-- -----------------------------------------------------
-- Table `mydb`.`Product Increment`
-- -----------------------------------------------------

-- Qual é o ultimo product increment do projecto X?

INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (1, 1,"Product increment 1", '2022/04/01','2022/04/30', 1);
INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (2, 2,"Product increment 2", '2022/04/30', '2022/05/14', 1);
INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (3, 3,"Product increment 3", '2022/05/30', '2022/06/16', 1);

INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (4, 1,"Product increment 1", '2022/04/30', '2022/05/14', 2);
INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (5, 2,"Product increment 2", '2022/04/30', '2022/05/14', 2);
INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (6, 3,"Product increment 3", '2022/05/30', '2022/06/16', 2);

INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (7, 1,"Product increment 1", '2022/04/30', '2022/05/14', 3);
INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (8, 2,"Product increment 2", '2022/04/30', '2022/05/14', 3);
INSERT INTO `ProductIncrement` (`idProductIncrement`, `numero`, `descricao`, `data_inicio`, `data_fim`, `Projeto_idProjeto`) VALUES (9, 3,"Product increment 3", '2022/05/30', '2022/06/16', 3);

-- -------------------------------------------------------
-- Table `mydb`.`Sprint`
-- -------------------------------------------------------

INSERT INTO `mydb`.`Sprint` (`idSprint`, `status`, `numero`, `data_inicio`, `data_fim`, `Backlog_idBacklog`, `ProductIncrement_idProductIncrement`) 
VALUES (1,"Created", 1, '2022/04/30', '2022/04/30', 2,1);
INSERT INTO `mydb`.`Sprint` (`idSprint`, `status`, `numero`, `data_inicio`, `data_fim`, `Backlog_idBacklog`, `ProductIncrement_idProductIncrement`) 
VALUES (2,"Created", 2, '2022/05/30', '2022/06/15' ,3,1);

INSERT INTO `mydb`.`Sprint` (`idSprint`, `status`, `numero`, `data_inicio`, `data_fim`, `Backlog_idBacklog`, `ProductIncrement_idProductIncrement`) 
VALUES (4,"Created", 1, '2022/04/30', '2022/04/30' ,5, 4);
INSERT INTO `mydb`.`Sprint` (`idSprint`, `status`, `numero`, `data_inicio`, `data_fim`, `Backlog_idBacklog`, `ProductIncrement_idProductIncrement`) 
VALUES (5,"Created", 2, '2022/05/30', '2022/06/15' ,6, 4);
INSERT INTO `mydb`.`Sprint` (`idSprint`, `status`, `numero`, `data_inicio`, `data_fim`, `Backlog_idBacklog`, `ProductIncrement_idProductIncrement`) 
VALUES (6,"Created", 3, '2022/05/30', '2022/06/15' ,7, 4);







-- Quais os nomes dos projecto existentes?
SELECT * FROM `Projeto`;
SELECT `nome` FROM `projeto`;

-- Quais os nomes e estados?
SELECT nome, status FROM Projeto;

-- Quais os nomes e estados dos projetos existentes que se encontram no estado "Closed"?
SELECT nome, status FROM Projeto
	WHERE status = "Closed";
    
-- Qual o nº de projetos com estado "Open"?
SELECT count(idProjeto), status FROM Projeto
	WHERE status = "Open";

-- Qual o nº de projetos com estado "Open" ou estado "Closed"?
SELECT count(idProjeto), status FROM Projeto
	WHERE status = "Open" or status = "Open";
    
-- Quais os IDs de projeto existentes na BD ordenados de forma decrescente?
SELECT * FROM Projeto
	order by idProjeto DESC;

-- Quais os nomes das equipas associadas ao projeto X = RideCare?
SELECT E.nome from Equipa AS E
INNER JOIN Projeto AS P
	WHERE P.idProjeto = E.Projeto_idProjeto and P.nome = "RideCare";
    
-- Quais os nomes dos colaboradores do projeto X?
SELECT C.nome FROM Colaborador AS C
	INNER JOIN Equipa_has_Colaborador AS EC
    INNER JOIN Equipa AS E
    INNER JOIN Projeto AS P
    WHERE C.ID = EC.Colaborador_ID and EC.Equipa_idEquipa = E.idEquipa and E.Projeto_idProjeto = P.idProjeto and P.nome = "RideCare";

