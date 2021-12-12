-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Fases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Fases` (
  `idFases` INT NOT NULL AUTO_INCREMENT,
  `fases` VARCHAR(25) NULL,
  PRIMARY KEY (`idFases`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jogo` (
  `idJogo` INT NOT NULL AUTO_INCREMENT,
  `Partida` VARCHAR(45) NULL,
  `publico` INT NULL,
  `gols_a_favor` INT NULL,
  `gols_contra` INT NULL,
  `penalti_convertido` INT NULL,
  `chutes` INT NULL,
  `chutes_gol` INT NULL,
  `impedimento` INT NULL,
  `escanteio` INT NULL,
  `cartao_amarelo` INT NULL,
  `cartao_vermelho` INT NULL,
  `expulsao_cartao_amarelo` INT NULL,
  `faltas_cometidas` INT NULL,
  `faltas_sofridas` INT NULL,
  `Fases_idFases` INT NOT NULL,
  PRIMARY KEY (`idJogo`, `Fases_idFases`),
  INDEX `fk_Jogo_Fases_idx` (`Fases_idFases` ASC) VISIBLE,
  CONSTRAINT `fk_Jogo_Fases`
    FOREIGN KEY (`Fases_idFases`)
    REFERENCES `mydb`.`Fases` (`idFases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Times` (
  `idTimes` INT NOT NULL AUTO_INCREMENT,
  `times` VARCHAR(30) NULL,
  PRIMARY KEY (`idTimes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jogo_has_Times`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jogo_has_Times` (
  `Jogo_idJogo` INT NOT NULL,
  `Jogo_Fases_idFases` INT NOT NULL,
  `Times_idTimes` INT NOT NULL,
  PRIMARY KEY (`Jogo_idJogo`, `Jogo_Fases_idFases`, `Times_idTimes`),
  INDEX `fk_Jogo_has_Times_Times1_idx` (`Times_idTimes` ASC) VISIBLE,
  INDEX `fk_Jogo_has_Times_Jogo1_idx` (`Jogo_idJogo` ASC, `Jogo_Fases_idFases` ASC) VISIBLE,
  CONSTRAINT `fk_Jogo_has_Times_Jogo1`
    FOREIGN KEY (`Jogo_idJogo` , `Jogo_Fases_idFases`)
    REFERENCES `mydb`.`Jogo` (`idJogo` , `Fases_idFases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jogo_has_Times_Times1`
    FOREIGN KEY (`Times_idTimes`)
    REFERENCES `mydb`.`Times` (`idTimes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Times_has_Fases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Times_has_Fases` (
  `Times_idTimes` INT NOT NULL,
  `Fases_idFases` INT NOT NULL,
  PRIMARY KEY (`Times_idTimes`, `Fases_idFases`),
  INDEX `fk_Times_has_Fases_Fases1_idx` (`Fases_idFases` ASC) VISIBLE,
  INDEX `fk_Times_has_Fases_Times1_idx` (`Times_idTimes` ASC) VISIBLE,
  CONSTRAINT `fk_Times_has_Fases_Times1`
    FOREIGN KEY (`Times_idTimes`)
    REFERENCES `mydb`.`Times` (`idTimes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Times_has_Fases_Fases1`
    FOREIGN KEY (`Fases_idFases`)
    REFERENCES `mydb`.`Fases` (`idFases`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
