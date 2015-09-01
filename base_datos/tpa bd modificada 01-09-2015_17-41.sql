-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-09-2015 a las 00:40:54
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Estructura de tabla para la tabla `asegurado`
--

CREATE TABLE IF NOT EXISTS `asegurado` (
  `idasegurado` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cliente` text COLLATE utf8_spanish2_ci,
  `apellido_cliente` text COLLATE utf8_spanish2_ci,
  `identificacion` text COLLATE utf8_spanish2_ci,
  `email` text COLLATE utf8_spanish2_ci,
  `telefono` text COLLATE utf8_spanish2_ci,
  `direccion` text COLLATE utf8_spanish2_ci,
  `empresa_idempresa` int(11) NOT NULL,
  PRIMARY KEY (`idasegurado`),
  KEY `fk_cliente_empresa1_idx` (`empresa_idempresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aseguradora`
--

CREATE TABLE IF NOT EXISTS `aseguradora` (
  `idaseguradora` int(11) NOT NULL AUTO_INCREMENT,
  `nom_aseguradora` text COLLATE utf8_spanish2_ci,
  `ruc` text COLLATE utf8_spanish2_ci,
  `email` text COLLATE utf8_spanish2_ci,
  `telefono` text COLLATE utf8_spanish2_ci,
  `direccion` text COLLATE utf8_spanish2_ci,
  `observación` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idaseguradora`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `aseguradora`
--

INSERT INTO `aseguradora` (`idaseguradora`, `nom_aseguradora`, `ruc`, `email`, `telefono`, `direccion`, `observación`) VALUES
(1, 'seguro sucre', '1711111111', 'aseguradora@segurossucre.com', '099999999', 'Dirrección', 'Ninguna');

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
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nom_cliente` text COLLATE utf8_spanish2_ci,
  `apellido_cliente` text COLLATE utf8_spanish2_ci,
  `cedula` text COLLATE utf8_spanish2_ci,
  `email` text COLLATE utf8_spanish2_ci,
  `telefono` text COLLATE utf8_spanish2_ci,
  `direccion` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nom_cliente`, `apellido_cliente`, `cedula`, `email`, `telefono`, `direccion`) VALUES
(1, 'Marcelo', 'Miranda', '1720259751', 'teshack@gmail.com', '0983732233', 'carapungo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `covertura_poliza`
--

CREATE TABLE IF NOT EXISTS `covertura_poliza` (
  `idcovertura_poliza` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idcovertura_poliza`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `covertura_poliza`
--

INSERT INTO `covertura_poliza` (`idcovertura_poliza`, `detalle`) VALUES
(1, 'medicamentos 80%');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependiente_asegurado`
--

CREATE TABLE IF NOT EXISTS `dependiente_asegurado` (
  `iddependiente_asegurado` int(11) NOT NULL AUTO_INCREMENT,
  `nom_dependiente` text COLLATE utf8_spanish2_ci,
  `apellido_dependiente` text COLLATE utf8_spanish2_ci,
  `identificacion_dependiente` text COLLATE utf8_spanish2_ci,
  `email` text COLLATE utf8_spanish2_ci,
  `telefono` text COLLATE utf8_spanish2_ci,
  `direccion` text COLLATE utf8_spanish2_ci,
  `titular` int(11) NOT NULL,
  `tipo_dependencia` int(11) NOT NULL,
  PRIMARY KEY (`iddependiente_asegurado`),
  KEY `fk_dependientes_cliente_cliente1_idx` (`titular`),
  KEY `fk_dependientes_cliente_tipo_dependiente1_idx` (`tipo_dependencia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`idestado`, `estado`) VALUES
(1, 'activo'),
(2, 'inactivo');

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
-- Estructura de tabla para la tabla `poliza`
--

CREATE TABLE IF NOT EXISTS `poliza` (
  `idpoliza` int(11) NOT NULL AUTO_INCREMENT,
  `num_poliza` text COLLATE utf8_spanish2_ci,
  `tipo_contrato` int(11) NOT NULL,
  `tipo_poliza` int(11) NOT NULL,
  `aseguradora` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `prima_poliza` text COLLATE utf8_spanish2_ci,
  `fecha_creacion` text COLLATE utf8_spanish2_ci,
  `fecha_vigencia` text COLLATE utf8_spanish2_ci,
  `estado` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idpoliza`,`cliente`),
  KEY `fk_poliza_tipo_poliza1_idx` (`tipo_poliza`),
  KEY `fk_poliza_tipo_contrato1_idx` (`tipo_contrato`),
  KEY `fk_poliza_cliente1_idx` (`cliente`),
  KEY `fk_poliza_aseguradora1_idx` (`aseguradora`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `poliza`
--

INSERT INTO `poliza` (`idpoliza`, `num_poliza`, `tipo_contrato`, `tipo_poliza`, `aseguradora`, `cliente`, `prima_poliza`, `fecha_creacion`, `fecha_vigencia`, `estado`) VALUES
(1, '0001', 1, 1, 1, 1, '2000', '31-08-2015', '31-08-2016', 'vigente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `poliza_covertura`
--

CREATE TABLE IF NOT EXISTS `poliza_covertura` (
  `tipo_covertura` int(11) NOT NULL,
  `num_poliza` int(11) NOT NULL,
  PRIMARY KEY (`tipo_covertura`,`num_poliza`),
  KEY `fk_tipo_covertura_has_poliza_poliza1_idx` (`num_poliza`),
  KEY `fk_tipo_covertura_has_poliza_tipo_covertura1_idx` (`tipo_covertura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_contrato`
--

CREATE TABLE IF NOT EXISTS `tipo_contrato` (
  `idtipo_contrato` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_contrato` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idtipo_contrato`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tipo_contrato`
--

INSERT INTO `tipo_contrato` (`idtipo_contrato`, `tipo_contrato`) VALUES
(1, 'corporativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_dependiente`
--

CREATE TABLE IF NOT EXISTS `tipo_dependiente` (
  `idtipo_dependiente` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idtipo_dependiente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_poliza`
--

CREATE TABLE IF NOT EXISTS `tipo_poliza` (
  `idtipo_poliza` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idtipo_poliza`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tipo_poliza`
--

INSERT INTO `tipo_poliza` (`idtipo_poliza`, `tipo`) VALUES
(1, 'Medica');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_cliente_poliza`
--
CREATE TABLE IF NOT EXISTS `vista_cliente_poliza` (
`idcliente` int(11)
,`apellido_cliente` text
,`nom_cliente` text
,`cedula` text
,`num_poliza` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_permiso_personal`
--
CREATE TABLE IF NOT EXISTS `vista_permiso_personal` (
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
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_poliza`
--
CREATE TABLE IF NOT EXISTS `vista_poliza` (
`idpoliza` int(11)
,`num_poliza` text
,`tipo_contrato` text
,`tipo` text
,`nom_aseguradora` text
,`nom_cliente` text
,`apellido_cliente` text
,`cedula` text
,`fecha_creacion` text
,`fecha_vigencia` text
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vista_cliente_poliza`
--
DROP TABLE IF EXISTS `vista_cliente_poliza`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cliente_poliza` AS select `c`.`idcliente` AS `idcliente`,`c`.`apellido_cliente` AS `apellido_cliente`,`c`.`nom_cliente` AS `nom_cliente`,`c`.`cedula` AS `cedula`,`p`.`num_poliza` AS `num_poliza` from (`cliente` `c` join `poliza` `p`) where (`p`.`cliente` = `c`.`idcliente`);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_permiso_personal`
--
DROP TABLE IF EXISTS `vista_permiso_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_permiso_personal` AS select `p`.`idpersonal` AS `idpersonal`,`p`.`nom_personal` AS `nom_personal`,`p`.`cedula_personal` AS `cedula_personal`,`p`.`email_personal` AS `email_personal`,`p`.`telefono_personal` AS `telefono_personal`,`p`.`direccion_personal` AS `direccion_personal`,`c`.`cargo` AS `cargo`,`p`.`usuario` AS `usuario`,`p`.`clave` AS `clave`,`e`.`estado` AS `estado`,`p`.`alias_empresa` AS `alias_empresa`,`ps`.`permiso` AS `permiso`,`ps`.`pagina` AS `pagina` from ((((`personal` `p` join `permiso` `ps`) join `cargo` `c`) join `estado` `e`) join `permiso_personal` `pe`) where ((`p`.`idpersonal` = `pe`.`personal`) and (`ps`.`idpermiso` = `pe`.`permiso`) and (`c`.`idcargo` = `p`.`cargo`) and (`e`.`idestado` = `p`.`estado`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personal`
--
DROP TABLE IF EXISTS `vista_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personal` AS select `p`.`idpersonal` AS `idpersonal`,`p`.`nom_personal` AS `nom_personal`,`p`.`cedula_personal` AS `cedula_personal`,`p`.`email_personal` AS `email_personal`,`p`.`telefono_personal` AS `telefono_personal`,`p`.`direccion_personal` AS `direccion_personal`,`c`.`cargo` AS `cargo`,`p`.`usuario` AS `usuario`,`p`.`clave` AS `clave`,`e`.`estado` AS `estado`,`p`.`alias_empresa` AS `alias_empresa` from ((`personal` `p` join `cargo` `c`) join `estado` `e`) where ((`c`.`idcargo` = `p`.`cargo`) and (`e`.`idestado` = `p`.`estado`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_poliza`
--
DROP TABLE IF EXISTS `vista_poliza`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_poliza` AS select `p`.`idpoliza` AS `idpoliza`,`p`.`num_poliza` AS `num_poliza`,`tc`.`tipo_contrato` AS `tipo_contrato`,`tp`.`tipo` AS `tipo`,`a`.`nom_aseguradora` AS `nom_aseguradora`,`c`.`nom_cliente` AS `nom_cliente`,`c`.`apellido_cliente` AS `apellido_cliente`,`c`.`cedula` AS `cedula`,`p`.`fecha_creacion` AS `fecha_creacion`,`p`.`fecha_vigencia` AS `fecha_vigencia` from ((((`cliente` `c` join `poliza` `p`) join `tipo_contrato` `tc`) join `tipo_poliza` `tp`) join `aseguradora` `a`) where (`p`.`cliente` = `c`.`idcliente`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asegurado`
--
ALTER TABLE `asegurado`
  ADD CONSTRAINT `fk_cliente_empresa1` FOREIGN KEY (`empresa_idempresa`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `dependiente_asegurado`
--
ALTER TABLE `dependiente_asegurado`
  ADD CONSTRAINT `fk_dependientes_cliente_cliente1` FOREIGN KEY (`titular`) REFERENCES `asegurado` (`idasegurado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dependientes_cliente_tipo_dependiente1` FOREIGN KEY (`tipo_dependencia`) REFERENCES `tipo_dependiente` (`idtipo_dependiente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

--
-- Filtros para la tabla `poliza`
--
ALTER TABLE `poliza`
  ADD CONSTRAINT `fk_poliza_cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_poliza_tipo_contrato1` FOREIGN KEY (`tipo_contrato`) REFERENCES `tipo_contrato` (`idtipo_contrato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_poliza_tipo_poliza1` FOREIGN KEY (`tipo_poliza`) REFERENCES `tipo_poliza` (`idtipo_poliza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_poliza_aseguradora1` FOREIGN KEY (`aseguradora`) REFERENCES `aseguradora` (`idaseguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `poliza_covertura`
--
ALTER TABLE `poliza_covertura`
  ADD CONSTRAINT `fk_tipo_covertura_has_poliza_poliza1` FOREIGN KEY (`num_poliza`) REFERENCES `poliza` (`idpoliza`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tipo_covertura_has_poliza_tipo_covertura1` FOREIGN KEY (`tipo_covertura`) REFERENCES `covertura_poliza` (`idcovertura_poliza`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
