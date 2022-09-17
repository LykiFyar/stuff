-- MySQL Workbench Forward Engineering

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
  `ID` INT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Equipa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipa` (
  `idEquipa` INT NOT NULL,
  `n_elementos` INT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipa`))
ENGINE = InnoDB;

CREATE INDEX `fk_Equipa_Projeto_idx` ON `mydb`.`Equipa` (`Projeto_ID` ASC);


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
-- Table `mydb`.`Workpackage`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Workpackage` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Workpackage` (
  `ID` INT NOT NULL,
  `date_init` DATETIME NULL,
  `status` VARCHAR(45) NULL,
  `nome` VARCHAR(45) NULL,
  `Colaborador_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_Workpackage_Colaborador1`
    FOREIGN KEY (`Colaborador_ID`)
    REFERENCES `mydb`.`Colaborador` (`ID`);

CREATE INDEX `fk_Workpackage_Colaborador1_idx` ON `mydb`.`Workpackage` (`Colaborador_ID` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`Equipa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Equipa` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Equipa` (
  `idEquipa` INT NOT NULL,
  `n_elementos` INT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipa`))
ENGINE = InnoDB;


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

CREATE INDEX `fk_Equipa_has_Colaborador_Colaborador1_idx` ON 
`mydb`.`Equipa_has_Colaborador` (`Colaborador_ID` ASC);

 CREATE INDEX `fk_Equipa_has_Colaborador_Equipa1_idx` ON 
 `mydb`.`Equipa_has_Colaborador` (`Equipa_idEquipa` ASC);



-- ALTER Table

Alter Table Equipa 
	DROP COLUMN `n_elementos`; 
    
ALTER TABLE Equipa
	ADD COLUMN `n_elementos` int; 
    
ALTER TABLE Equipa
	MODIFY COLUMN `n_elementos` varchar(50); 

ALTER TABLE Equipa
	MODIFY COLUMN `n_elementos` int; 

-- INSERT 



INSERT INTO `Equipa`
(`idEquipa`,
`nome`,
`n_elementos`)
VALUES
(1,"Jellyfish",9);

SELECT * from  `Equipa`;

INSERT INTO `Colaborador` (`ID`, `perfil`, `nome`)
VALUES
(1, "DevOps Engineer", "João Rafael");

INSERT INTO `Colaborador` (`ID`, `perfil`, `nome`)
VALUES
(1, "SCRUM Master", "Carolina");

SELECT * from `Colaborador`;

INSERT INTO `Equipa_has_Colaborador`
(`Equipa_idEquipa`,
`Colaborador_ID`)
VALUES
(1,2);

SELECT * from `Equipa_has_Colaborador`;

-- UPDATE

UPDATE `mydb`.`Equipa` 
SET 
    `n_elementos` = 19
WHERE
    `idEquipa` = 1;



-- DELETE

DELETE FROM `Equipa`
WHERE
    `idEquipa` = 1;





SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
