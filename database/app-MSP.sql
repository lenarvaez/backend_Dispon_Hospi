/* ---------------------------------------------------- */
/*  Creado por Grupo 1 UTPL		*/
/* 
/*  DBMS       : MySql 						*/
/* ---------------------------------------------------- */

SET FOREIGN_KEY_CHECKS=0
; 
/* Drop Views */

DROP VIEW IF EXISTS `VIEW_A` CASCADE
;

/* Drop Tables */

DROP TABLE IF EXISTS `DisponibilidadCamas` CASCADE
;

DROP TABLE IF EXISTS `Evaluado` CASCADE
;

DROP TABLE IF EXISTS `Evaluar` CASCADE
;

DROP TABLE IF EXISTS `Hospitales` CASCADE
;

DROP TABLE IF EXISTS `Parametros` CASCADE
;

DROP TABLE IF EXISTS `TipoCamas` CASCADE
;

DROP TABLE IF EXISTS `TipoHospital` CASCADE
;

/* Create Tables */

CREATE TABLE `DisponibilidadCamas`
(
	`idHospital` INT NULL,
	`idTipoCama` INT NULL,
	`disponibilidad` INT NULL,
	`IdTipoHospital` INT NULL,
	`satus` VARCHAR(50) NULL
)

;

CREATE TABLE `Evaluado`
(
	`idEvaluado` INT NOT NULL AUTO_INCREMENT,
	`nomEvaluado` VARCHAR(50) NULL,
	`cedEvaluado` INT NULL,
	`IdTipoHospital` INT NULL,
	`dirEvaluado` VARCHAR(50) NULL,
	CONSTRAINT `PK_Evaluado` PRIMARY KEY (`idEvaluado` ASC)
)

;

CREATE TABLE `Evaluar`
(
	`idPregunta` INT NOT NULL AUTO_INCREMENT,
	`pColoracionDedos` CHAR(2) NULL DEFAULT '',
	`pDificultadRespirar` CHAR(2) NULL DEFAULT '',
	`pFiebre` CHAR(2) NULL DEFAULT '',
	`pHipertenso` CHAR(2) NULL DEFAULT '',
	`pIESS` CHAR(4) NULL DEFAULT '',
	`cedulaEvaluado` INT NULL,
	`sumEvaluacion` SMALLINT NULL,
	`idEvaluado` INT NULL,
	CONSTRAINT `PK_Evaluar` PRIMARY KEY (`idPregunta` ASC)
)

;

CREATE TABLE `Hospitales`
(
	`IdHospital` INT NOT NULL AUTO_INCREMENT,
	`IdTipoCama` INT NULL,
	`idTipoHospital` INT NOT NULL,
	`nombreHosp` VARCHAR(50) NULL,
	`dirHosp` VARCHAR(50) NULL,
	`telfHosp` VARCHAR(50) NULL,
	`latitudHos` INT NULL,
	`longitudHos` INT NULL,
	`logoAlta` MEDIUMBLOB NULL,
	`logoMedia` MEDIUMBLOB NULL,
	`logoEscasa` MEDIUMBLOB NULL,
	CONSTRAINT `PK_Hospitales` PRIMARY KEY (`IdHospital` ASC)
)

;

CREATE TABLE `Parametros`
(
	`IdParametro` INT NOT NULL AUTO_INCREMENT,
	`desParametro` VARCHAR(50) NULL,
	`parametro` INT NULL,
	CONSTRAINT `PK_Parametros` PRIMARY KEY (`IdParametro` ASC)
)

;

CREATE TABLE `TipoCamas`
(
	`IdTipoCama` INT NOT NULL AUTO_INCREMENT,
	`desTipoCama` VARCHAR(50) NULL,
	CONSTRAINT `PK_TipoCamas` PRIMARY KEY (`IdTipoCama` ASC)
)

;

CREATE TABLE `TipoHospital`
(
	`IdTipoHospital` INT NOT NULL AUTO_INCREMENT,
	`desTipoHospital` VARCHAR(50) NULL,
	`IdHospital` INT NULL,
	CONSTRAINT `PK_TipoHospital` PRIMARY KEY (`IdTipoHospital` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `DisponibilidadCamas` 
 ADD INDEX `IXFK_DisponibilidadCamas_Hospitales` (`idHospital` ASC)
;

ALTER TABLE `Evaluar` 
 ADD INDEX `IXFK_Evaluar_Evaluado` (`idEvaluado` ASC)
;

ALTER TABLE `Hospitales` 
 ADD INDEX `IXFK_Hospitales_TipoCamas` (`IdTipoCama` ASC)
;

ALTER TABLE `Hospitales` 
 ADD INDEX `IXFK_Hospitales_TipoHospital` (`idTipoHospital` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `DisponibilidadCamas` 
 ADD CONSTRAINT `FK_DisponibilidadCamas_Hospitales`
	FOREIGN KEY (`idHospital`) REFERENCES `Hospitales` (`IdHospital`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Evaluar` 
 ADD CONSTRAINT `FK_Evaluar_Evaluado`
	FOREIGN KEY (`idEvaluado`) REFERENCES `Evaluado` (`idEvaluado`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Hospitales` 
 ADD CONSTRAINT `FK_Hospitales_TipoCamas`
	FOREIGN KEY (`IdTipoCama`) REFERENCES `TipoCamas` (`IdTipoCama`) ON DELETE Restrict ON UPDATE Restrict
;

ALTER TABLE `Hospitales` 
 ADD CONSTRAINT `FK_Hospitales_TipoHospital`
	FOREIGN KEY (`idTipoHospital`) REFERENCES `TipoHospital` (`IdTipoHospital`) ON DELETE Restrict ON UPDATE Restrict
;

SET FOREIGN_KEY_CHECKS=1
; 



