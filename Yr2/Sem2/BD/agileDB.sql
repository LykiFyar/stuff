-- drop database
DROP DATABASE IF EXISTS `agileDB`;
-- create database
CREATE DATABASE `agileDB`;

-- create table
CREATE TABLE IF NOT EXISTS `agileDB`.`Equipa`(
	`ID` INT NOT NULL,
	`n_elementos` INT NULL,
	`nome` VARCHAR(45) NULL,
	PRIMARY KEY (`ID`)
);

CREATE TABLE IF NOT EXISTS `agileDB`.`Colaborador` (
	`ID` INT NOT NULL,
    `perfil` VARCHAR(45),
    `nome` VARCHAR(45),
    PRIMARY KEY (`ID`)
    );

CREATE TABLE IF NOT EXISTS `agileDB`.`Projeto` (
	`ID` INT NOT NULL,
    `nome` VARCHAR(45),
    `descricao` VARCHAR(45),
    `status` VARCHAR(45),
    PRIMARY KEY(`ID`)
    );

CREATE TABLE IF NOT EXISTS `agileDB`.`Product_Increment` (
	`ID` INT NOT NULL,
    `descricao` VARCHAR(45),
	`data_inicio` DATETIME,
    `data_fim` DATETIME,
    `projeto_id` INT NULL,
    PRIMARY KEY(`ID`),
    CONSTRAINT `fk_ProductIncrement_Projeto`
		FOREIGN KEY (`projeto_id`)
		REFERENCES `agileDB`.`Projeto`(`ID`)
    );

CREATE TABLE IF NOT EXISTS `agileDB`.`Sprint` (
	`ID` INT NOT NULL,
    `descricao` VARCHAR(45),
	`data_inicio` DATETIME,
    `data_fim` DATETIME,
    `productincrement_id` INT NULL,
    PRIMARY KEY(`ID`),
    CONSTRAINT `fk_Sprint_ProductIncrement`
		FOREIGN KEY (`productincrement_id`)
		REFERENCES `agileDB`.`Product_Increment`(`ID`)
    );
    
CREATE TABLE IF NOT EXISTS `agileDB`.`Backlog` (
	`ID` INT NOT NULL,
    `tipo` VARCHAR(45),
    `descricao` VARCHAR(45),
    `projeto_id` INT NOT NULL,
    `sprint_id` INT NOT NULL,
    PRIMARY KEY(`ID`),
    CONSTRAINT `fk_Backlog_Projeto`
		FOREIGN KEY (`projeto_id`)
		REFERENCES `agileDB`.`Projeto`(`ID`),
	CONSTRAINT `fk_Backlog_Sprint`
		FOREIGN KEY (`sprint_id`)
		REFERENCES `agileDB`.`Sprint`(`ID`)
    );


CREATE TABLE IF NOT EXISTS `agileDB`.`Workpackage` (
	`ID` INT NOT NULL,
    `nome` VARCHAR(45),
    `data_inicio` DATETIME,
    `data_fim` DATETIME,
    `status` VARCHAR(45),
    `colaborador_id` INT NULL,
    `backlog_id` INT NULL,
    PRIMARY KEY(`ID`),
    CONSTRAINT `fk_Workpackage_Colaborador`
		FOREIGN KEY (`colaborador_id`)
		REFERENCES `agileDB`.`Colaborador`(`ID`),
	CONSTRAINT `fk_Workpackage_Backlog`
		FOREIGN KEY (`backlog_id`)
		REFERENCES `agileDB`.`Backlog`(`ID`)
    );

CREATE TABLE IF NOT EXISTS `agileDB`.`Tarefa` (
	`ID` INT NOT NULL,
    `nome` VARCHAR(45),
    `state` VARCHAR(45),
    `data_inicio` DATETIME,
    `data_fim` DATETIME,
    `colaborador_id` INT NULL,
    `workpackage_id` INT NULL,
    PRIMARY KEY(`ID`),
    CONSTRAINT `fk_Tarefa_Colaborador`
		FOREIGN KEY (`colaborador_id`)
		REFERENCES `agileDB`.`Colaborador`(`ID`),
	CONSTRAINT `fk_Tarefa_Workpackage`
		FOREIGN KEY (`workpackage_id`)
		REFERENCES `agileDB`.`Workpackage`(`ID`)
	);


CREATE TABLE IF NOT EXISTS `agileDB`.`Equipa_has_Colaborador` (
	`colaborador_id` INT NOT NULL,
    `equipa_id` INT NOT NULL,
    PRIMARY KEY (`colaborador_id`, `equipa_id`),
    CONSTRAINT `fk_Colaborador`
		FOREIGN KEY (`colaborador_id`)
        REFERENCES `agileDB`.`Colaborador`(`ID`),
	CONSTRAINT `fk_EquipaC`
		FOREIGN KEY (`equipa_id`)
        REFERENCES `agileDB`.`Equipa` (`ID`)
	);

CREATE TABLE IF NOT EXISTS `agileDB`.`Projeto_has_Equipa` (
	`projeto_id` INT NOT NULL,
    `equipa_id` INT NOT NULL,
    PRIMARY KEY (`projeto_id`, `equipa_id`),
    CONSTRAINT `fk_Projeto`
		FOREIGN KEY (`projeto_id`)
        REFERENCES `agileDB`.`Projeto`(`ID`),
	CONSTRAINT `fk_EquipaP`
		FOREIGN KEY (`equipa_id`)
        REFERENCES `agileDB`.`Equipa` (`ID`)
	);
