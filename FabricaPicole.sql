-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Fabrica_Picole
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Fabrica_Picole
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Fabrica_Picole` DEFAULT CHARACTER SET utf8 ;
USE `Fabrica_Picole` ;

-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Tipos_de_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Tipos_de_picole` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Tipo_de_embalagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Tipo_de_embalagem` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Ingredientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Ingredientes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Sabores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Sabores` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Picole` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `preco` DECIMAL(8) NOT NULL,
  `Id_sabor` INT NOT NULL,
  `Id_tipo_de_embalagem` INT NOT NULL,
  `Id_tipos_de_picole` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_picole_1_idx` (`Id_sabor` ASC) VISIBLE,
  INDEX `fk_picole_2_idx` (`Id_tipo_de_embalagem` ASC) VISIBLE,
  INDEX `fk_tipos_de_picole_idx` (`Id_tipos_de_picole` ASC) VISIBLE,
  CONSTRAINT `fk_picole_1`
    FOREIGN KEY (`Id_sabor`)
    REFERENCES `Fabrica_Picole`.`Sabores` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_picole_2`
    FOREIGN KEY (`Id_tipo_de_embalagem`)
    REFERENCES `Fabrica_Picole`.`Tipo_de_embalagem` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipos_de_picole`
    FOREIGN KEY (`Id_tipos_de_picole`)
    REFERENCES `Fabrica_Picole`.`Tipos_de_picole` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Ingredientes_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Ingredientes_picole` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_ingredientes` INT NOT NULL,
  `Id_picole` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_ingredientes_picole_2_idx` (`Id_picole` ASC) VISIBLE,
  INDEX `fk_ingredientes_picole_1_idx` (`Id_ingredientes` ASC) VISIBLE,
  CONSTRAINT `fk_ingredientes_picole_1`
    FOREIGN KEY (`Id_ingredientes`)
    REFERENCES `Fabrica_Picole`.`Ingredientes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ingredientes_picole_2`
    FOREIGN KEY (`Id_picole`)
    REFERENCES `Fabrica_Picole`.`Picole` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Aditivos_nutritivos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Aditivos_nutritivos` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Formula_quimica` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Conservantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Conservantes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Aditivos_nutritivos_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Aditivos_nutritivos_picole` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_aditivos_nutritivo` INT NOT NULL,
  `Id_picole` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_aditivos_nutritivos_picole_idx` (`Id_aditivos_nutritivo` ASC) VISIBLE,
  INDEX `fk_aditivos_nutritivos_picole_2_idx` (`Id_picole` ASC) VISIBLE,
  CONSTRAINT `fk_aditivos_nutritivos_picole_1`
    FOREIGN KEY (`Id_aditivos_nutritivo`)
    REFERENCES `Fabrica_Picole`.`Aditivos_nutritivos` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aditivos_nutritivos_picole_2`
    FOREIGN KEY (`Id_picole`)
    REFERENCES `Fabrica_Picole`.`Picole` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Conservantes_picole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Conservantes_picole` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_conservantes` INT NOT NULL,
  `Id_picole` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_conservantes_picole_1_idx` (`Id_conservantes` ASC) VISIBLE,
  INDEX `fk_conservantes_picole_2_idx` (`Id_picole` ASC) VISIBLE,
  CONSTRAINT `fk_conservantes_picole_1`
    FOREIGN KEY (`Id_conservantes`)
    REFERENCES `Fabrica_Picole`.`Conservantes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_conservantes_picole_2`
    FOREIGN KEY (`Id_picole`)
    REFERENCES `Fabrica_Picole`.`Picole` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Lotes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Lotes` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_tipo_de_picole` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_lotes_1_idx` (`Id_tipo_de_picole` ASC) VISIBLE,
  CONSTRAINT `fk_lotes_1`
    FOREIGN KEY (`Id_tipo_de_picole`)
    REFERENCES `Fabrica_Picole`.`Tipos_de_picole` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Revendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Revendedores` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(45) NOT NULL,
  `Razao_social` VARCHAR(100) NOT NULL,
  `Contacto` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Nota_fiscal` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Valor` DECIMAL(8) NOT NULL,
  `Numero_serie` VARCHAR(45) NOT NULL,
  `Descricao` VARCHAR(200) NOT NULL,
  `Id_revendedor` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_nota_fiscal_1_idx` (`Id_revendedor` ASC) VISIBLE,
  CONSTRAINT `fk_nota_fiscal_1`
    FOREIGN KEY (`Id_revendedor`)
    REFERENCES `Fabrica_Picole`.`Revendedores` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fabrica_Picole`.`Lotes_nota_fiscal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fabrica_Picole`.`Lotes_nota_fiscal` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `Id_lotes` INT NOT NULL,
  `Id_nota_fiscal` INT NOT NULL,
  PRIMARY KEY (`Id`),
  INDEX `fk_lotes_nota_fiscal_1_idx` (`Id_lotes` ASC) VISIBLE,
  INDEX `fk_lotes_nota_fiscal_2_idx` (`Id_nota_fiscal` ASC) VISIBLE,
  CONSTRAINT `fk_lotes_nota_fiscal_1`
    FOREIGN KEY (`Id_lotes`)
    REFERENCES `Fabrica_Picole`.`Lotes` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lotes_nota_fiscal_2`
    FOREIGN KEY (`Id_nota_fiscal`)
    REFERENCES `Fabrica_Picole`.`Nota_fiscal` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
