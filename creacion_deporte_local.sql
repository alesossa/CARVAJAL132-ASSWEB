SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`001Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`001Persona` ;

CREATE TABLE IF NOT EXISTS `mydb`.`001Persona` (
  `id001Persona` INT NOT NULL,
  `001Alias` VARCHAR(45) NOT NULL COMMENT 'tabla de  control de personas ',
  `001Nombre_1` VARCHAR(50) NOT NULL,
  `001Nombre_2` VARCHAR(50) NULL,
  `001Apellido_1` VARCHAR(50) NOT NULL,
  `001Apellido_2` VARCHAR(50) NULL,
  `001Contraseña` VARCHAR(45) NOT NULL,
  `001Correo` VARCHAR(50) NOT NULL,
  `001Numero_contacto` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id001Persona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`002Escenario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`002Escenario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`002Escenario` (
  `002Id_Escenario` INT NOT NULL,
  `002Nombre_escenario` VARCHAR(50) NOT NULL,
  `002Id_deporte` INT NOT NULL,
  `002Barrio` VARCHAR(50) NULL,
  `002Direccion` VARCHAR(50) NULL,
  `002Telefono_Esc` VARCHAR(50) NULL,
  `002Fecha` DATETIME NULL,
  `002Horario` TIME NULL,
  PRIMARY KEY (`002Id_Escenario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`003Precios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`003Precios` ;

CREATE TABLE IF NOT EXISTS `mydb`.`003Precios` (
  `003IdPrecios` INT NOT NULL,
  `003Horario` TIME NULL,
  `003Precio` VARCHAR(50) NULL,
  PRIMARY KEY (`003IdPrecios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`004Catalogos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`004Catalogos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`004Catalogos` (
  `004IdCatalogos` INT NOT NULL,
  `004Codigo` INT NULL,
  `004Descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`004IdCatalogos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`001Cat_Deportes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`001Cat_Deportes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`001Cat_Deportes` (
  `001IdCat_Deportes` INT NOT NULL,
  `001Cat_Deporte` VARCHAR(50) NULL,
  PRIMARY KEY (`001IdCat_Deportes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`005Eventos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`005Eventos` ;

CREATE TABLE IF NOT EXISTS `mydb`.`005Eventos` (
  `005IdEventos` INT NOT NULL,
  PRIMARY KEY (`005IdEventos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`006Horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`006Horario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`006Horario` (
  `006IdHorario` INT NOT NULL,
  `006IdEscenario` INT NOT NULL,
  `006Fecha` DATE NULL,
  `006Hora_Inicial` TIME NULL,
  `006Hora_Final` TIME NULL,
  PRIMARY KEY (`006IdHorario`, `006IdEscenario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`007Escenario_Horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`007Escenario_Horario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`007Escenario_Horario` (
  `007IdEscenario` INT NOT NULL,
  `007IdHorario` INT NOT NULL,
  `002Escenario_002Id_Escenario` INT NOT NULL,
  `006Horario_006IdHorario` INT NOT NULL,
  `006Horario_006IdEscenario` INT NOT NULL,
  PRIMARY KEY (`007IdEscenario`, `007IdHorario`),
  CONSTRAINT `fk_007Escenario_Horario_002Escenario`
    FOREIGN KEY (`002Escenario_002Id_Escenario`)
    REFERENCES `mydb`.`002Escenario` (`002Id_Escenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_007Escenario_Horario_006Horario1`
    FOREIGN KEY (`006Horario_006IdHorario` , `006Horario_006IdEscenario`)
    REFERENCES `mydb`.`006Horario` (`006IdHorario` , `006IdEscenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_007Escenario_Horario_002Escenario_idx` ON `mydb`.`007Escenario_Horario` (`002Escenario_002Id_Escenario` ASC);

CREATE INDEX `fk_007Escenario_Horario_006Horario1_idx` ON `mydb`.`007Escenario_Horario` (`006Horario_006IdHorario` ASC, `006Horario_006IdEscenario` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`008Persona_Escenario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`008Persona_Escenario` ;

CREATE TABLE IF NOT EXISTS `mydb`.`008Persona_Escenario` (
  `008IDPersona` INT NOT NULL,
  `008IdEscenario` INT NOT NULL,
  `001Persona_id001Persona` INT NOT NULL,
  `002Escenario_002Id_Escenario` INT NOT NULL,
  PRIMARY KEY (`008IDPersona`, `008IdEscenario`),
  CONSTRAINT `fk_008Persona_Escenario_001Persona1`
    FOREIGN KEY (`001Persona_id001Persona`)
    REFERENCES `mydb`.`001Persona` (`id001Persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_008Persona_Escenario_002Escenario1`
    FOREIGN KEY (`002Escenario_002Id_Escenario`)
    REFERENCES `mydb`.`002Escenario` (`002Id_Escenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_008Persona_Escenario_001Persona1_idx` ON `mydb`.`008Persona_Escenario` (`001Persona_id001Persona` ASC);

CREATE INDEX `fk_008Persona_Escenario_002Escenario1_idx` ON `mydb`.`008Persona_Escenario` (`002Escenario_002Id_Escenario` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`009Reserva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`009Reserva` ;

CREATE TABLE IF NOT EXISTS `mydb`.`009Reserva` (
  `009IDReserva` INT NOT NULL,
  `009IdPersona` INT NULL,
  `009IdEscenario` INT NULL,
  `009IdHorario` VARCHAR(45) NULL,
  `001Persona_id001Persona` INT NOT NULL,
  `002Escenario_002Id_Escenario` INT NOT NULL,
  `006Horario_006IdHorario` INT NOT NULL,
  `006Horario_006IdEscenario` INT NOT NULL,
  PRIMARY KEY (`009IDReserva`),
  CONSTRAINT `fk_009Reserva_001Persona1`
    FOREIGN KEY (`001Persona_id001Persona`)
    REFERENCES `mydb`.`001Persona` (`id001Persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_009Reserva_002Escenario1`
    FOREIGN KEY (`002Escenario_002Id_Escenario`)
    REFERENCES `mydb`.`002Escenario` (`002Id_Escenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_009Reserva_006Horario1`
    FOREIGN KEY (`006Horario_006IdHorario` , `006Horario_006IdEscenario`)
    REFERENCES `mydb`.`006Horario` (`006IdHorario` , `006IdEscenario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_009Reserva_001Persona1_idx` ON `mydb`.`009Reserva` (`001Persona_id001Persona` ASC);

CREATE INDEX `fk_009Reserva_002Escenario1_idx` ON `mydb`.`009Reserva` (`002Escenario_002Id_Escenario` ASC);

CREATE INDEX `fk_009Reserva_006Horario1_idx` ON `mydb`.`009Reserva` (`006Horario_006IdHorario` ASC, `006Horario_006IdEscenario` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
