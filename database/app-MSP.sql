-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-08-2020 a las 18:22:20
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `app-msp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `disponibilidadcamas`
--

CREATE TABLE `disponibilidadcamas` (
  `idHospital` int(11) DEFAULT NULL,
  `idTipoCama` int(11) DEFAULT NULL,
  `disponibilidad` int(11) DEFAULT NULL,
  `IdTipoHospital` int(11) DEFAULT NULL,
  `satus` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluado`
--

CREATE TABLE `evaluado` (
  `idEvaluado` int(11) NOT NULL,
  `IdTipoHospital` int(11) DEFAULT NULL,
  `dirEvaluado` varchar(50) DEFAULT NULL,
  `ciudad` varchar(50) NOT NULL,
  `edad` int(3) NOT NULL,
  `telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluar`
--

CREATE TABLE `evaluar` (
  `idPregunta` int(11) NOT NULL,
  `pColoracionDedos` char(2) DEFAULT '',
  `pDificultadRespirar` char(2) DEFAULT '',
  `pFiebre` char(2) DEFAULT '',
  `pHipertenso` char(2) DEFAULT '',
  `pIESS` char(4) DEFAULT '',
  `cedulaEvaluado` int(11) DEFAULT NULL,
  `sumEvaluacion` smallint(6) DEFAULT NULL,
  `idEvaluado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hospitales`
--

CREATE TABLE `hospitales` (
  `IdHospital` int(11) NOT NULL,
  `IdTipoCama` int(11) DEFAULT NULL,
  `idTipoHospital` int(11) NOT NULL,
  `nombreHosp` varchar(50) DEFAULT NULL,
  `dirHosp` varchar(50) DEFAULT NULL,
  `telfHosp` varchar(50) DEFAULT NULL,
  `latitudHos` int(11) DEFAULT NULL,
  `longitudHos` int(11) DEFAULT NULL,
  `logoAlta` mediumblob DEFAULT NULL,
  `logoMedia` mediumblob DEFAULT NULL,
  `logoEscasa` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `parametros`
--

CREATE TABLE `parametros` (
  `IdParametro` int(11) NOT NULL,
  `desParametro` varchar(50) DEFAULT NULL,
  `parametro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocamas`
--

CREATE TABLE `tipocamas` (
  `IdTipoCama` int(11) NOT NULL,
  `desTipoCama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipohospital`
--

CREATE TABLE `tipohospital` (
  `IdTipoHospital` int(11) NOT NULL,
  `desTipoHospital` varchar(50) DEFAULT NULL,
  `IdHospital` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `disponibilidadcamas`
--
ALTER TABLE `disponibilidadcamas`
  ADD KEY `IXFK_DisponibilidadCamas_Hospitales` (`idHospital`);

--
-- Indices de la tabla `evaluado`
--
ALTER TABLE `evaluado`
  ADD PRIMARY KEY (`idEvaluado`);

--
-- Indices de la tabla `evaluar`
--
ALTER TABLE `evaluar`
  ADD PRIMARY KEY (`idPregunta`),
  ADD KEY `IXFK_Evaluar_Evaluado` (`idEvaluado`);

--
-- Indices de la tabla `hospitales`
--
ALTER TABLE `hospitales`
  ADD PRIMARY KEY (`IdHospital`),
  ADD KEY `IXFK_Hospitales_TipoCamas` (`IdTipoCama`),
  ADD KEY `IXFK_Hospitales_TipoHospital` (`idTipoHospital`);

--
-- Indices de la tabla `parametros`
--
ALTER TABLE `parametros`
  ADD PRIMARY KEY (`IdParametro`);

--
-- Indices de la tabla `tipocamas`
--
ALTER TABLE `tipocamas`
  ADD PRIMARY KEY (`IdTipoCama`);

--
-- Indices de la tabla `tipohospital`
--
ALTER TABLE `tipohospital`
  ADD PRIMARY KEY (`IdTipoHospital`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evaluado`
--
ALTER TABLE `evaluado`
  MODIFY `idEvaluado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT de la tabla `evaluar`
--
ALTER TABLE `evaluar`
  MODIFY `idPregunta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `hospitales`
--
ALTER TABLE `hospitales`
  MODIFY `IdHospital` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `parametros`
--
ALTER TABLE `parametros`
  MODIFY `IdParametro` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocamas`
--
ALTER TABLE `tipocamas`
  MODIFY `IdTipoCama` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipohospital`
--
ALTER TABLE `tipohospital`
  MODIFY `IdTipoHospital` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `disponibilidadcamas`
--
ALTER TABLE `disponibilidadcamas`
  ADD CONSTRAINT `FK_DisponibilidadCamas_Hospitales` FOREIGN KEY (`idHospital`) REFERENCES `hospitales` (`IdHospital`);

--
-- Filtros para la tabla `evaluar`
--
ALTER TABLE `evaluar`
  ADD CONSTRAINT `FK_Evaluar_Evaluado` FOREIGN KEY (`idEvaluado`) REFERENCES `evaluado` (`idEvaluado`);

--
-- Filtros para la tabla `hospitales`
--
ALTER TABLE `hospitales`
  ADD CONSTRAINT `FK_Hospitales_TipoCamas` FOREIGN KEY (`IdTipoCama`) REFERENCES `tipocamas` (`IdTipoCama`),
  ADD CONSTRAINT `FK_Hospitales_TipoHospital` FOREIGN KEY (`idTipoHospital`) REFERENCES `tipohospital` (`IdTipoHospital`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
