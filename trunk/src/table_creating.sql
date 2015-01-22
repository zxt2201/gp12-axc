SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Module`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Module` (
  `MName` VARCHAR(45) NOT NULL ,
  `Weighting` INT NULL DEFAULT NULL ,
  PRIMARY KEY (`MName`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Group`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Group` (
  `GName` VARCHAR(45) NOT NULL ,
  `GCompleted` ENUM('Y','N') NULL ,
  `GMark` INT NULL ,
  `Module_MName` VARCHAR(45) NULL ,
  PRIMARY KEY (`GName`) ,
  INDEX `fk_Group_Module1_idx` (`Module_MName` ASC) ,
  CONSTRAINT `fk_Group_Module1`
    FOREIGN KEY (`Module_MName` )
    REFERENCES `mydb`.`Module` (`MName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Students`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`Students` (
  `SName` VARCHAR(45) NOT NULL ,
  `ID` INT NOT NULL ,
  `IMark` INT NULL ,
  `SComplete` ENUM('Y','N') NULL ,
  `Group_GName` VARCHAR(45) NULL ,
  PRIMARY KEY (`SName`, `ID`) ,
  INDEX `fk_Students_Group_idx` (`Group_GName` ASC) ,
  CONSTRAINT `fk_Students_Group`
    FOREIGN KEY (`Group_GName` )
    REFERENCES `mydb`.`Group` (`GName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`PeerMark`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`PeerMark` (
  `PResearch` ENUM('0','1','2','3','4') NULL ,
  `PCreative` ENUM('0','1','2','3','4') NULL ,
  `PCooperation` ENUM('0','1','2','3','4') NULL ,
  `Pcommunication` ENUM('0','1','2','3','4') NULL ,
  `PQuality` ENUM('0','1','2','3','4') NULL ,
  `PAttendance` ENUM('0','1','2','3','4') NULL ,
  `Pcomment` VARCHAR(45) NULL ,
  `Group_GName` VARCHAR(45) NOT NULL ,
  `Students_ID_1` INT NOT NULL ,
  `Students_ID_2` INT NOT NULL ,
  INDEX `fk_PeerMark_Group1_idx` (`Group_GName` ASC) ,
  INDEX `fk_PeerMark_Students1_idx` (`Students_ID_1` ASC, `Students_ID_2` ASC) ,
  PRIMARY KEY (`Group_GName`, `Students_ID_1`, `Students_ID_2`) ,
  CONSTRAINT `fk_PeerMark_Group1`
    FOREIGN KEY (`Group_GName` )
    REFERENCES `mydb`.`Group` (`GName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PeerMark_Students1`
    FOREIGN KEY (`Students_ID_1` , `Students_ID_2` )
    REFERENCES `mydb`.`Students` (`ID` , `ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`StudentsModule`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`StudentsModule` (
  `Module_MName` VARCHAR(45) NOT NULL ,
  `Students_SName` VARCHAR(45) NOT NULL ,
  `Students_ID` INT NOT NULL ,
  PRIMARY KEY (`Module_MName`, `Students_SName`, `Students_ID`) ,
  INDEX `fk_StudentsModule_Students1_idx` (`Students_SName` ASC, `Students_ID` ASC) ,
  CONSTRAINT `fk_StudentsModule_Module1`
    FOREIGN KEY (`Module_MName` )
    REFERENCES `mydb`.`Module` (`MName` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentsModule_Students1`
    FOREIGN KEY (`Students_SName` , `Students_ID` )
    REFERENCES `mydb`.`Students` (`SName` , `ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
