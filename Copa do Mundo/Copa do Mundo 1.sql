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
-- Table `mydb`.`Cadastros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cadastros` (
  `idCadastros` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `idade` VARCHAR(45) NULL,
  `CPF_ou_equivalente` VARCHAR(15) NULL,
  PRIMARY KEY (`idCadastros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comissao_Tecnica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comissao_Tecnica` (
  `idComissao_Tecnica` INT NOT NULL AUTO_INCREMENT,
  `cargo` VARCHAR(20) NULL,
  `Cadastros_idCadastros` INT NOT NULL,
  PRIMARY KEY (`idComissao_Tecnica`, `Cadastros_idCadastros`),
  INDEX `fk_Comissao_Tecnica_Cadastros1_idx` (`Cadastros_idCadastros` ASC) VISIBLE,
  CONSTRAINT `fk_Comissao_Tecnica_Cadastros1`
    FOREIGN KEY (`Cadastros_idCadastros`)
    REFERENCES `mydb`.`Cadastros` (`idCadastros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Grupos` (
  `idGrupos` INT NOT NULL AUTO_INCREMENT,
  `Fases` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idGrupos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Selecoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Selecoes` (
  `idSelecoes` INT NOT NULL AUTO_INCREMENT,
  `nome_selecoes` VARCHAR(30) NULL,
  `participacao_copas` INT NULL,
  `Comissao_Tecnica_idComissao_Tecnica` INT NOT NULL DEFAULT 1,
  `Comissao_Tecnica_Cadastros_idCadastros` INT NOT NULL DEFAULT 1,
  `Grupos_idGrupos` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idSelecoes`, `Comissao_Tecnica_idComissao_Tecnica`, `Comissao_Tecnica_Cadastros_idCadastros`, `Grupos_idGrupos`),
  INDEX `fk_Selecoes_Comissao_Tecnica1_idx` (`Comissao_Tecnica_idComissao_Tecnica` ASC, `Comissao_Tecnica_Cadastros_idCadastros` ASC) VISIBLE,
  INDEX `fk_Selecoes_Grupos1_idx` (`Grupos_idGrupos` ASC) VISIBLE,
  CONSTRAINT `fk_Selecoes_Comissao_Tecnica1`
    FOREIGN KEY (`Comissao_Tecnica_idComissao_Tecnica` , `Comissao_Tecnica_Cadastros_idCadastros`)
    REFERENCES `mydb`.`Comissao_Tecnica` (`idComissao_Tecnica` , `Cadastros_idCadastros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Selecoes_Grupos1`
    FOREIGN KEY (`Grupos_idGrupos`)
    REFERENCES `mydb`.`Grupos` (`idGrupos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Partida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Partida` (
  `idPartida` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NULL,
  `quantidade_publico` INT NULL,
  `hora_inicio` DATETIME NULL,
  `hora_fim` DATETIME NULL,
  PRIMARY KEY (`idPartida`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estadio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estadio` (
  `idEstadio` INT NOT NULL AUTO_INCREMENT,
  `nome_estadio` VARCHAR(20) NOT NULL,
  `localizacao_cidade` VARCHAR(25) NULL,
  `capacidade` INT NOT NULL,
  PRIMARY KEY (`idEstadio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Jogadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Jogadores` (
  `idJogadores` INT NOT NULL AUTO_INCREMENT,
  `posicao_campo` VARCHAR(15) NULL,
  `is_reserva` VARCHAR(3) NULL,
  `time_atual` VARCHAR(25) NULL,
  `quantidadeGols` INT NULL,
  `Cadastros_idCadastros` INT NOT NULL,
  PRIMARY KEY (`idJogadores`, `Cadastros_idCadastros`),
  INDEX `fk_Jogadores_Cadastros_idx` (`Cadastros_idCadastros` ASC) VISIBLE,
  CONSTRAINT `fk_Jogadores_Cadastros`
    FOREIGN KEY (`Cadastros_idCadastros`)
    REFERENCES `mydb`.`Cadastros` (`idCadastros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Arbitragem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Arbitragem` (
  `idArbitragem` INT NOT NULL AUTO_INCREMENT,
  `cargo_arbitros` VARCHAR(20) NULL DEFAULT 'nada',
  `Cadastros_idCadastros` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`idArbitragem`, `Cadastros_idCadastros`),
  INDEX `fk_Arbitragem_Cadastros1_idx` (`Cadastros_idCadastros` ASC) VISIBLE,
  CONSTRAINT `fk_Arbitragem_Cadastros1`
    FOREIGN KEY (`Cadastros_idCadastros`)
    REFERENCES `mydb`.`Cadastros` (`idCadastros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Resultado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Resultado` (
  `idResultado` INT NOT NULL AUTO_INCREMENT,
  `quantidade_gols` INT NOT NULL,
  `substituicoes` INT NOT NULL,
  `cartoes` INT NOT NULL,
  `vencedor` VARCHAR(30) NULL,
  PRIMARY KEY (`idResultado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estadio_has_Partida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estadio_has_Partida` (
  `Estadio_idEstadio` INT NOT NULL,
  `Partida_idPartida` INT NOT NULL,
  PRIMARY KEY (`Estadio_idEstadio`, `Partida_idPartida`),
  INDEX `fk_Estadio_has_Partida_Partida1_idx` (`Partida_idPartida` ASC) VISIBLE,
  INDEX `fk_Estadio_has_Partida_Estadio1_idx` (`Estadio_idEstadio` ASC) VISIBLE,
  CONSTRAINT `fk_Estadio_has_Partida_Estadio1`
    FOREIGN KEY (`Estadio_idEstadio`)
    REFERENCES `mydb`.`Estadio` (`idEstadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estadio_has_Partida_Partida1`
    FOREIGN KEY (`Partida_idPartida`)
    REFERENCES `mydb`.`Partida` (`idPartida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Estadio_has_Selecoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Estadio_has_Selecoes` (
  `Estadio_idEstadio` INT NOT NULL,
  `Selecoes_idSelecoes` INT NOT NULL,
  `Selecoes_Comissao_Tecnica_idComissao_Tecnica` INT NOT NULL,
  `Selecoes_Comissao_Tecnica_Cadastros_idCadastros` INT NOT NULL,
  PRIMARY KEY (`Estadio_idEstadio`, `Selecoes_idSelecoes`, `Selecoes_Comissao_Tecnica_idComissao_Tecnica`, `Selecoes_Comissao_Tecnica_Cadastros_idCadastros`),
  INDEX `fk_Estadio_has_Selecoes_Selecoes1_idx` (`Selecoes_idSelecoes` ASC, `Selecoes_Comissao_Tecnica_idComissao_Tecnica` ASC, `Selecoes_Comissao_Tecnica_Cadastros_idCadastros` ASC) VISIBLE,
  INDEX `fk_Estadio_has_Selecoes_Estadio1_idx` (`Estadio_idEstadio` ASC) VISIBLE,
  CONSTRAINT `fk_Estadio_has_Selecoes_Estadio1`
    FOREIGN KEY (`Estadio_idEstadio`)
    REFERENCES `mydb`.`Estadio` (`idEstadio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Estadio_has_Selecoes_Selecoes1`
    FOREIGN KEY (`Selecoes_idSelecoes` , `Selecoes_Comissao_Tecnica_idComissao_Tecnica` , `Selecoes_Comissao_Tecnica_Cadastros_idCadastros`)
    REFERENCES `mydb`.`Selecoes` (`idSelecoes` , `Comissao_Tecnica_idComissao_Tecnica` , `Comissao_Tecnica_Cadastros_idCadastros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Partida_has_Selecoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Partida_has_Selecoes` (
  `Partida_idPartida` INT NOT NULL,
  `Selecoes_idSelecoes` INT NOT NULL,
  `Selecoes_Comissao_Tecnica_idComissao_Tecnica` INT NOT NULL,
  `Selecoes_Comissao_Tecnica_Cadastros_idCadastros` INT NOT NULL,
  `Selecoes_Grupos_idGrupos` INT NOT NULL,
  PRIMARY KEY (`Partida_idPartida`, `Selecoes_idSelecoes`, `Selecoes_Comissao_Tecnica_idComissao_Tecnica`, `Selecoes_Comissao_Tecnica_Cadastros_idCadastros`, `Selecoes_Grupos_idGrupos`),
  INDEX `fk_Partida_has_Selecoes_Selecoes1_idx` (`Selecoes_idSelecoes` ASC, `Selecoes_Comissao_Tecnica_idComissao_Tecnica` ASC, `Selecoes_Comissao_Tecnica_Cadastros_idCadastros` ASC, `Selecoes_Grupos_idGrupos` ASC) VISIBLE,
  CONSTRAINT `fk_Partida_has_Selecoes_Partida1`
    FOREIGN KEY (`Partida_idPartida`)
    REFERENCES `mydb`.`Partida` (`idPartida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Partida_has_Selecoes_Selecoes1`
    FOREIGN KEY (`Selecoes_idSelecoes` , `Selecoes_Comissao_Tecnica_idComissao_Tecnica` , `Selecoes_Comissao_Tecnica_Cadastros_idCadastros` , `Selecoes_Grupos_idGrupos`)
    REFERENCES `mydb`.`Selecoes` (`idSelecoes` , `Comissao_Tecnica_idComissao_Tecnica` , `Comissao_Tecnica_Cadastros_idCadastros` , `Grupos_idGrupos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
