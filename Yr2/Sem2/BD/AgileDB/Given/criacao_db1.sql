-- ------------------------------------------------------
-- Universidade do Minho
-- Mestrado Integrado em Engenharia Informática
-- Lincenciatura em Ciências da Computação
-- Unidade Curricular de Bases de Dados
-- 
-- Caso de Estudo: Base de dados Agile
-- Criação de base de dados
-- 2022
-- ------------------------------------------------------



SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Projeto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Projeto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Projeto` (
  `idProjeto` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idProjeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipa` (
  `idEquipa` INT NOT NULL,
  `n_elementos` INT NULL,
  `nome` VARCHAR(45) NULL,
  `Projeto_idProjeto` INT NOT NULL,
  `Lider_ID` INT NOT NULL,
  PRIMARY KEY (`idEquipa`),
  CONSTRAINT `fk_Equipa_Projeto1`
    FOREIGN KEY (`Projeto_idProjeto`)
    REFERENCES `mydb`.`Projeto` (`idProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipa_Colaborador1`
    FOREIGN KEY (`Lider_ID`)
    REFERENCES `mydb`.`Colaborador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Equipa_Projeto_idx` ON `mydb`.`Equipa` (`idEquipa` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Colaborador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Colaborador` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Colaborador` (
  `ID` INT NOT NULL,
  `perfil` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Projeto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Projeto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Projeto` (
  `idProjeto` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idProjeto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Backlog`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Backlog` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Backlog` (
  `idBacklog` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `Projeto_idProjeto` INT NOT NULL,
  PRIMARY KEY (`idBacklog`),
  CONSTRAINT `fk_Backlog_Projeto1`
    FOREIGN KEY (`Projeto_idProjeto`)
    REFERENCES `mydb`.`Projeto` (`idProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Backlog_Projeto1_idx` ON `mydb`.`Backlog` (`Projeto_idProjeto` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Workpackage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Workpackage` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Workpackage` (
  `ID` INT NOT NULL,
  `date_init` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `Responsavel_ID` INT NOT NULL,
  `Backlog_idBacklog` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Workpackage_Colaborador1`
    FOREIGN KEY (`Responsavel_ID`)
    REFERENCES `mydb`.`Colaborador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Workpackage_Backlog1`
    FOREIGN KEY (`Backlog_idBacklog`)
    REFERENCES `mydb`.`Backlog` (`idBacklog`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Workpackage_Colaborador1_idx` ON `mydb`.`Workpackage` (`Responsavel_ID` ASC);

CREATE INDEX `fk_Workpackage_Backlog1_idx` ON `mydb`.`Workpackage` (`Backlog_idBacklog` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Equipa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipa` (
  `idEquipa` INT NOT NULL,
  `n_elementos` INT NULL,
  `nome` VARCHAR(45) NULL,
  `Projeto_idProjeto` INT NOT NULL,
  `Lider_ID` INT NOT NULL,
  PRIMARY KEY (`idEquipa`),
  CONSTRAINT `fk_Equipa_Projeto1`
    FOREIGN KEY (`Projeto_idProjeto`)
    REFERENCES `mydb`.`Projeto` (`idProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipa_Colaborador1`
    FOREIGN KEY (`Lider_ID`)
    REFERENCES `mydb`.`Colaborador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Equipa_Projeto1_idx` ON `mydb`.`Equipa` (`Projeto_idProjeto` ASC);

CREATE INDEX `fk_Equipa_Colaborador1_idx` ON `mydb`.`Equipa` (`Lider_ID` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Equipa_has_Colaborador`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipa_has_Colaborador` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipa_has_Colaborador` (
  `Equipa_idEquipa` INT NOT NULL,
  `Colaborador_ID` INT NOT NULL,
  PRIMARY KEY (`Equipa_idEquipa`, `Colaborador_ID`),
  CONSTRAINT `fk_Equipa_has_Colaborador_Equipa1`
    FOREIGN KEY (`Equipa_idEquipa`)
    REFERENCES `mydb`.`Equipa` (`idEquipa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipa_has_Colaborador_Colaborador1`
    FOREIGN KEY (`Colaborador_ID`)
    REFERENCES `mydb`.`Colaborador` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Equipa_has_Colaborador_Colaborador1_idx` ON `mydb`.`Equipa_has_Colaborador` (`Colaborador_ID` ASC);

CREATE INDEX `fk_Equipa_has_Colaborador_Equipa1_idx` ON `mydb`.`Equipa_has_Colaborador` (`Equipa_idEquipa` ASC);

-- -----------------------------------------------------
-- Table `mydb`.`Task`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Task` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Task` (
  `idTask` INT NOT NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `status` VARCHAR(45) NULL,
  `Workpackage_ID` INT NOT NULL,
  PRIMARY KEY (`idTask`),
  CONSTRAINT `fk_Task_Workpackage1`
    FOREIGN KEY (`Workpackage_ID`)
    REFERENCES `mydb`.`Workpackage` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Task_Workpackage1_idx` ON `mydb`.`Task` (`Workpackage_ID` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`ProductIncrement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`ProductIncrement` ;

CREATE TABLE IF NOT EXISTS `mydb`.`ProductIncrement` (
  `idProductIncrement` INT NOT NULL,
  `numero` INT NULL,
  `descricao` VARCHAR(45) NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `Projeto_idProjeto` INT NOT NULL,
  PRIMARY KEY (`idProductIncrement`),
  CONSTRAINT `fk_ProductIncrement_Projeto1`
    FOREIGN KEY (`Projeto_idProjeto`)
    REFERENCES `mydb`.`Projeto` (`idProjeto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_ProductIncrement_Projeto1_idx` ON `mydb`.`ProductIncrement` (`Projeto_idProjeto` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Sprint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Sprint` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Sprint` (
  `idSprint` INT NOT NULL,
  `status` VARCHAR(45) NULL,
  `numero` VARCHAR(45) NULL,
  `data_inicio` DATE NULL,
  `data_fim` DATE NULL,
  `Backlog_idBacklog` INT NOT NULL,
  `ProductIncrement_idProductIncrement` INT NOT NULL,
  PRIMARY KEY (`idSprint`),
  CONSTRAINT `fk_Sprint_Backlog1`
    FOREIGN KEY (`Backlog_idBacklog`)
    REFERENCES `mydb`.`Backlog` (`idBacklog`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sprint_ProductIncrement1`
    FOREIGN KEY (`ProductIncrement_idProductIncrement`)
    REFERENCES `mydb`.`ProductIncrement` (`idProductIncrement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Sprint_Backlog1_idx` ON `mydb`.`Sprint` (`Backlog_idBacklog` ASC);

CREATE INDEX `fk_Sprint_ProductIncrement1_idx` ON `mydb`.`Sprint` (`ProductIncrement_idProductIncrement` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
