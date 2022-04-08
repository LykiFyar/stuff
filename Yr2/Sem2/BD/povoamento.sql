-- POVOAMENTO

-- ALTER command
-- ALTER TABLE `nome da tabela`
-- 		adicionar coluna: ADD COLUMN `nome da coluna` [tipo]
-- 		apagar coluna: DROP COLUMN `nome da coluna`
-- 		modificar coluna: MODIFY COLUMN `nome da coluna` [novo_tipo]

-- INSERT command 
-- INSERT INTO `nome da tabela`
-- 				(os atributos)
-- 				VALUES
-- 				(valores para os atributos, na mesma ordem);

-- UPDATE command
-- UPDATE `nome da tabela`
-- SET
-- 	 	`nome do atributo` = novo valor;
-- 		...
-- WHERE
-- 		`nome do atributo` = valor (condicionante que indica a linha que queremos alterar)

-- DELETE command
-- DELETE FROM `nome da tabela`
-- WHERE 
-- 		(condicionantes para remoção da tabela)

-- Base de dados a usar / default
USE `agiledb`;

-- Povoar Equipa
INSERT INTO `Equipa` (`ID`, `n_elementos`, `nome`) VALUES (1, 10, "Team 1");

INSERT INTO `Equipa` VALUES (2, 3, "Team 2");
INSERT INTO `Equipa` VALUES (3, 5, "Team 3");
INSERT INTO `Equipa` VALUES (4, 8, "Team 4");
    
-- SHOW TABLE
SELECT * FROM `Equipa`;

-- Povoar Colaborador
INSERT INTO `Colaborador` (`ID`, `perfil`, `nome`) VALUES (1, "Admin", "João Braga" );
INSERT INTO `Colaborador` VALUES (2, "Software Engineer", "John Crackow" );
INSERT INTO `Colaborador` VALUES (3, "Data Scientist", "Clara" );
INSERT INTO `Colaborador` VALUES (4, "Programmer", "Ricardo" );
INSERT INTO `Colaborador` VALUES (5, "Designer", "Leonel" );
INSERT INTO `Colaborador` VALUES (6, "Programmer", "Vítor" );
INSERT INTO `Colaborador` VALUES (7, "God Gamer", "Diogo" );
INSERT INTO `Colaborador` VALUES (8, "Rager main", "Cristina" );

-- UPDATE EXAMPLE
UPDATE `Colaborador` SET `perfil` = "Rager GOD" WHERE `ID` = 8;

-- DELETE EXAMPLE
DELETE FROM `Colaborador` WHERE `ID` = 3;

-- SHOW TABLE
SELECT * FROM `Colaborador`;

-- Povoar Relacionamento Equipa_has_Colaborador
INSERT INTO `agiledb`.`equipa_has_colaborador` (`colaborador_id`,`equipa_id`) VALUES (1,1);
INSERT INTO `agiledb`.`equipa_has_colaborador` VALUES (5,1);

SELECT * FROM `equipa_has_colaborador`;

-- Povoar Projeto
INSERT INTO `projeto` (`ID`,`nome`,`descricao`,`status`) VALUES (1,"FPS Game","Precise Gunplay","In Development");
INSERT INTO `projeto` VALUES (2,"WebApp2","yes","Complete");
INSERT INTO `projeto` VALUES (3,"Lelz","noice","In development");

-- SHOW TABLE
SELECT * FROM `Projeto`;

-- Povoar Product Increment
INSERT INTO `agiledb`.`product_increment` (`ID`,`descricao`,`data_inicio`,`data_fim`) VALUES (1, "-" , '2012-03-02', '2013-11-21');
INSERT INTO `agiledb`.`product_increment` VALUES (2, "-" , '2015-03-02', '2013-11-21');

