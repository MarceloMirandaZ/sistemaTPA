-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2015 a las 00:36:43
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tpa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idcargo`, `cargo`) VALUES
(1, 'administrador'),
(2, 'agente sucre'),
(3, 'agente tpa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `estado`) VALUES
(1, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` text COLLATE utf8_spanish2_ci,
  `pagina` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `permiso`, `pagina`) VALUES
(1, 'configuraciones', 'configuraciones.html'),
(2, 'reclamos', 'crearreclamo.html'),
(3, 'Gestionar Reclamo', 'gestionarreclamo.html'),
(4, 'reporte reclamos', 'reportereclamos.html');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_personal`
--

CREATE TABLE IF NOT EXISTS `permiso_personal` (
  `personal` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  PRIMARY KEY (`personal`,`permiso`),
  KEY `fk_empleado_has_permiso_permiso1_idx` (`permiso`),
  KEY `fk_empleado_has_permiso_empleado1_idx` (`personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `permiso_personal`
--

INSERT INTO `permiso_personal` (`personal`, `permiso`) VALUES
(3, 1),
(1, 2),
(1, 4),
(2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `idpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personal` text COLLATE utf8_spanish2_ci,
  `cedula_personal` text COLLATE utf8_spanish2_ci,
  `email_personal` text COLLATE utf8_spanish2_ci,
  `telefono_personal` text COLLATE utf8_spanish2_ci,
  `direccion_personal` text COLLATE utf8_spanish2_ci,
  `cargo` int(11) NOT NULL,
  `usuario` text COLLATE utf8_spanish2_ci,
  `clave` text COLLATE utf8_spanish2_ci,
  `alias_empresa` text COLLATE utf8_spanish2_ci,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idpersonal`),
  KEY `fk_empleado_estado_idx` (`estado`),
  KEY `fk_empleado_cargo1_idx` (`cargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idpersonal`, `nom_personal`, `cedula_personal`, `email_personal`, `telefono_personal`, `direccion_personal`, `cargo`, `usuario`, `clave`, `alias_empresa`, `estado`) VALUES
(1, 'agente seguros sucre', '17', '@', '09', 'd', 2, 'sucre', 'sucre', 'tpa', 1),
(2, 'otro agente sucre', '17', '@', '22', 'd', 2, 'sucre2', 'sucre2', 'tpa', 1),
(3, 'administrador tpa', '17', '@', '22', 'd', 1, 'admin', 'admin', 'tpa', 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_permiso_personal`
--
CREATE TABLE IF NOT EXISTS `vista_permiso_personal` (
`idpersonal` int(11)
,`nom_personal` text
,`permiso` text
,`pagina` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_personal`
--
CREATE TABLE IF NOT EXISTS `vista_personal` (
`idpersonal` int(11)
,`nom_personal` text
,`cedula_personal` text
,`email_personal` text
,`telefono_personal` text
,`direccion_personal` text
,`cargo` text
,`usuario` text
,`clave` text
,`estado` text
,`alias_empresa` text
,`permiso` text
,`pagina` text
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vista_permiso_personal`
--
DROP TABLE IF EXISTS `vista_permiso_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_permiso_personal` AS select `p`.`idpersonal` AS `idpersonal`,`p`.`nom_personal` AS `nom_personal`,`ps`.`permiso` AS `permiso`,`ps`.`pagina` AS `pagina` from ((`personal` `p` join `permiso` `ps`) join `permiso_personal` `pe`) where ((`p`.`idpersonal` = `pe`.`personal`) and (`ps`.`idpermiso` = `pe`.`permiso`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personal`
--
DROP TABLE IF EXISTS `vista_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personal` AS select `p`.`idpersonal` AS `idpersonal`,`p`.`nom_personal` AS `nom_personal`,`p`.`cedula_personal` AS `cedula_personal`,`p`.`email_personal` AS `email_personal`,`p`.`telefono_personal` AS `telefono_personal`,`p`.`direccion_personal` AS `direccion_personal`,`c`.`cargo` AS `cargo`,`p`.`usuario` AS `usuario`,`p`.`clave` AS `clave`,`e`.`estado` AS `estado`,`p`.`alias_empresa` AS `alias_empresa`,`ps`.`permiso` AS `permiso`,`ps`.`pagina` AS `pagina` from ((((`personal` `p` join `permiso` `ps`) join `cargo` `c`) join `estado` `e`) join `permiso_personal` `pe`) where ((`p`.`idpersonal` = `pe`.`personal`) and (`ps`.`idpermiso` = `pe`.`permiso`) and (`c`.`idcargo` = `p`.`cargo`) and (`e`.`idestado` = `p`.`estado`));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `permiso_personal`
--
ALTER TABLE `permiso_personal`
  ADD CONSTRAINT `fk_empleado_has_permiso_empleado1` FOREIGN KEY (`personal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_has_permiso_permiso1` FOREIGN KEY (`permiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_empleado_cargo1` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empleado_estado` FOREIGN KEY (`estado`) REFERENCES `estado` (`idestado`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
