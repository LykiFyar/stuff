-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema alunosAR
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `alunosAR` ;

-- -----------------------------------------------------
-- Schema alunosAR
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `alunosAR` DEFAULT CHARACTER SET utf8 ;
USE `alunosAR` ;

-- -----------------------------------------------------
-- Table `alunosAR`.`curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alunosAR`.`curso` ;

CREATE TABLE IF NOT EXISTS `alunosAR`.`curso` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  `sigla` VARCHAR(45) NULL,
  `grau` VARCHAR(45) NULL,
  `duracao` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alunosAR`.`aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alunosAR`.`aluno` ;

CREATE TABLE IF NOT EXISTS `alunosAR`.`aluno` (
  `nr` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `genero` VARCHAR(45) NULL,
  `localidade` VARCHAR(45) NULL,
  `curso` INT NOT NULL,
  PRIMARY KEY (`nr`),
  INDEX `fk_aluno_curso1_idx` (`curso` ASC),
  CONSTRAINT `fk_aluno_curso1`
    FOREIGN KEY (`curso`)
    REFERENCES `alunosAR`.`curso` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alunosAR`.`atleta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alunosAR`.`atleta` ;

CREATE TABLE IF NOT EXISTS `alunosAR`.`atleta` (
  `aluno_nr` INT NOT NULL,
  `modalidade` VARCHAR(45) NOT NULL,
  `escalao` INT NOT NULL,
  PRIMARY KEY (`aluno_nr`),
  INDEX `fk_atleta_aluno_idx` (`aluno_nr` ASC),
  CONSTRAINT `fk_atleta_aluno`
    FOREIGN KEY (`aluno_nr`)
    REFERENCES `alunosAR`.`aluno` (`nr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alunosAR`.`professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alunosAR`.`professor` ;

CREATE TABLE IF NOT EXISTS `alunosAR`.`professor` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `departamento` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alunosAR`.`disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alunosAR`.`disciplina` ;

CREATE TABLE IF NOT EXISTS `alunosAR`.`disciplina` (
  `id` INT NOT NULL,
  `designacao` VARCHAR(45) NULL,
  `responsavel` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_disciplina_professor1_idx` (`responsavel` ASC),
  CONSTRAINT `fk_disciplina_professor1`
    FOREIGN KEY (`responsavel`)
    REFERENCES `alunosAR`.`professor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `alunosAR`.`disciplina_has_aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `alunosAR`.`disciplina_has_aluno` ;

CREATE TABLE IF NOT EXISTS `alunosAR`.`disciplina_has_aluno` (
  `disciplina` INT NOT NULL,
  `aluno` INT NOT NULL,
  `nota` INT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`disciplina`, `aluno`, `data`),
  INDEX `fk_disciplina_has_aluno_aluno1_idx` (`aluno` ASC),
  INDEX `fk_disciplina_has_aluno_disciplina1_idx` (`disciplina` ASC),
  CONSTRAINT `fk_disciplina_has_aluno_disciplina1`
    FOREIGN KEY (`disciplina`)
    REFERENCES `alunosAR`.`disciplina` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_disciplina_has_aluno_aluno1`
    FOREIGN KEY (`aluno`)
    REFERENCES `alunosAR`.`aluno` (`nr`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
