-- MySQL Script generated by MySQL Workbench
-- Wed Oct 16 11:54:05 2024
-- Model: New Model    Version: 1.0
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
-- Table `mydb`.`typ_samochodu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`typ_samochodu` (
  `id_typu_samochodu` INT NOT NULL,
  `nazwa` VARCHAR(45) NULL,
  PRIMARY KEY (`id_typu_samochodu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`klient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`klient` (
  `id_klient` INT NOT NULL,
  `imie` VARCHAR(45) NULL,
  `nazwisko` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `samochod` INT NULL,
  `email` VARCHAR(45) NULL,
  `typ_samochodu_id_typu_samochodu` INT NOT NULL,
  PRIMARY KEY (`id_klient`, `typ_samochodu_id_typu_samochodu`),
  INDEX `fk_klient_typ_samochodu_idx` (`typ_samochodu_id_typu_samochodu` ASC) VISIBLE,
  CONSTRAINT `fk_klient_typ_samochodu`
    FOREIGN KEY (`typ_samochodu_id_typu_samochodu`)
    REFERENCES `mydb`.`typ_samochodu` (`id_typu_samochodu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Kontrahenci`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kontrahenci` (
  `id_Kontrahenci` INT NOT NULL,
  `imie` VARCHAR(45) NULL,
  `nazwisko` VARCHAR(45) NULL,
  `telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Kontrahenci`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pracownik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pracownik` (
  `id_pracownika` INT NOT NULL,
  `imie` VARCHAR(45) NULL,
  `nazwisko` VARCHAR(45) NULL,
  `zarobki` VARCHAR(45) NULL,
  `stanowisko` VARCHAR(45) NULL,
  PRIMARY KEY (`id_pracownika`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`stanowisko`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`stanowisko` (
  `id_stanowiska` INT NOT NULL,
  `specyfikacja` VARCHAR(45) NULL,
  `usluga` VARCHAR(45) NULL,
  PRIMARY KEY (`id_stanowiska`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`usluga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usluga` (
  `id_uslugi` INT NOT NULL,
  `usluga` VARCHAR(45) NULL,
  `cena` INT NULL,
  PRIMARY KEY (`id_uslugi`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`event` (
  `id_eventu` INT NOT NULL,
  `nazwa` VARCHAR(45) NULL,
  `data` VARCHAR(45) NULL,
  `miejsce` VARCHAR(45) NULL,
  PRIMARY KEY (`id_eventu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`typ`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`typ` (
  `id_typu` INT NOT NULL,
  `typ_eventu` VARCHAR(45) NULL,
  PRIMARY KEY (`id_typu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rozliczenie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rozliczenie` (
  `id_rozliczenia` INT NOT NULL,
  `typ_platnosci` VARCHAR(45) NULL,
  `koszta calego eventu` VARCHAR(45) NULL,
  `pensja pracownikow` VARCHAR(45) NULL,
  PRIMARY KEY (`id_rozliczenia`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;