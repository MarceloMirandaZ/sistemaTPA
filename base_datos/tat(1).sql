-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2015 a las 00:37:54
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `tat`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activos_fijos`
--

CREATE TABLE IF NOT EXISTS `activos_fijos` (
  `idactivos_fijos` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `nombre` text COLLATE utf8_spanish2_ci,
  `valor` float DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_bin,
  `personal` int(11) NOT NULL,
  `categoria` int(11) NOT NULL,
  `fecha_ingreso` text COLLATE utf8_spanish2_ci,
  `fecha_custodio` text COLLATE utf8_spanish2_ci,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idactivos_fijos`),
  KEY `fk_activos_fijos_personal1_idx` (`personal`),
  KEY `fk_activos_fijos_categoria_activos_fijos1_idx` (`categoria`),
  KEY `fk_activos_fijos_estado_inventario1_idx` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `idcargo` int(11) NOT NULL AUTO_INCREMENT,
  `cargo` text,
  PRIMARY KEY (`idcargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `cargo`
--

INSERT INTO `cargo` (`idcargo`, `cargo`) VALUES
(1, 'Super Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_activos_fijos`
--

CREATE TABLE IF NOT EXISTS `categoria_activos_fijos` (
  `idcategoria_activos_fijos` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idcategoria_activos_fijos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_productos`
--

CREATE TABLE IF NOT EXISTS `categoria_productos` (
  `idcategoria_productos` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idcategoria_productos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `razon_social` text COLLATE utf8_spanish2_ci,
  `ruc` text COLLATE utf8_spanish2_ci,
  `telefono` text COLLATE utf8_spanish2_ci,
  `email` text COLLATE utf8_spanish2_ci,
  `direccion` text COLLATE utf8_spanish2_ci,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idcliente`),
  KEY `fk_cliente_estados_actividad1_idx` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento`
--

CREATE TABLE IF NOT EXISTS `descuento` (
  `iddescuento` int(11) NOT NULL,
  `descuento` text COLLATE utf8_spanish2_ci,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`iddescuento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento_empleado`
--

CREATE TABLE IF NOT EXISTS `descuento_empleado` (
  `iddescuento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish2_ci,
  `valor` float DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`iddescuento`),
  KEY `fk_descuento_tipo_descuento1_idx` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `descuento_rol_pagos`
--

CREATE TABLE IF NOT EXISTS `descuento_rol_pagos` (
  `rol_pagos` int(11) NOT NULL,
  `descuento_empleado` int(11) NOT NULL,
  PRIMARY KEY (`rol_pagos`,`descuento_empleado`),
  KEY `fk_rol_pagos_has_descuento_empleado_descuento_empleado1_idx` (`descuento_empleado`),
  KEY `fk_rol_pagos_has_descuento_empleado_rol_pagos1_idx` (`rol_pagos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_factura`
--

CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `iddetalle_factura` int(11) NOT NULL AUTO_INCREMENT,
  `detalle` text COLLATE utf8_spanish2_ci,
  `cantidad` int(11) DEFAULT NULL,
  `valor_unitario` float DEFAULT NULL,
  `subtotal` float DEFAULT NULL,
  PRIMARY KEY (`iddetalle_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE IF NOT EXISTS `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `nom_empresa` text,
  `alias_empresa` text,
  `bd_empresa` text,
  `estado_empresa` int(11) NOT NULL,
  PRIMARY KEY (`idempresa`),
  KEY `fk_empresa_estados_actividad1_idx` (`estado_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`idempresa`, `nom_empresa`, `alias_empresa`, `bd_empresa`, `estado_empresa`) VALUES
(2, 'tailored app Tech app', 'tat', 'tat', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_actividad`
--

CREATE TABLE IF NOT EXISTS `estado_actividad` (
  `idestado_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `estado` text,
  PRIMARY KEY (`idestado_actividad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `estado_actividad`
--

INSERT INTO `estado_actividad` (`idestado_actividad`, `estado`) VALUES
(1, 'activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_factura`
--

CREATE TABLE IF NOT EXISTS `estado_factura` (
  `idestado_factura` int(11) NOT NULL AUTO_INCREMENT,
  `estado` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idestado_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_inventario`
--

CREATE TABLE IF NOT EXISTS `estado_inventario` (
  `idestado_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  PRIMARY KEY (`idestado_inventario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_cliente`
--

CREATE TABLE IF NOT EXISTS `factura_cliente` (
  `idfactura_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text COLLATE utf8_spanish2_ci,
  `fecha_factura` text COLLATE utf8_spanish2_ci,
  `fecha_creacion` text COLLATE utf8_spanish2_ci,
  `cliente` int(11) NOT NULL,
  `detalle` int(11) NOT NULL,
  `impuesto` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `total` float DEFAULT NULL,
  `autorizacion` text COLLATE utf8_spanish2_ci,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idfactura_cliente`),
  KEY `fk_factura_cliente_cliente1_idx` (`cliente`),
  KEY `fk_factura_cliente_estado_factura1_idx` (`estado`),
  KEY `fk_factura_cliente_detalle_factura1_idx` (`detalle`),
  KEY `fk_factura_cliente_impuesto1_idx` (`impuesto`),
  KEY `fk_factura_cliente_descuento1_idx` (`descuento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura_proveedor`
--

CREATE TABLE IF NOT EXISTS `factura_proveedor` (
  `idfactura_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text COLLATE utf8_spanish2_ci,
  `fecha_factura` text COLLATE utf8_spanish2_ci,
  `fecha_creacion` text COLLATE utf8_spanish2_ci,
  `proveedor` int(11) NOT NULL,
  `detalle` text COLLATE utf8_spanish2_ci,
  `autorizacion` text COLLATE utf8_spanish2_ci,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idfactura_proveedor`),
  KEY `fk_factura_proveedores_proveedores1_idx` (`proveedor`),
  KEY `fk_factura_proveedores_estado_factura1_idx` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impuesto`
--

CREATE TABLE IF NOT EXISTS `impuesto` (
  `idimpuesto` int(11) NOT NULL AUTO_INCREMENT,
  `impuesto` text COLLATE utf8_spanish2_ci,
  `valor` float DEFAULT NULL,
  PRIMARY KEY (`idimpuesto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresos_empleado`
--

CREATE TABLE IF NOT EXISTS `ingresos_empleado` (
  `idingresos_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text COLLATE utf8_spanish2_ci,
  `valor` float DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  PRIMARY KEY (`idingresos_empleado`),
  KEY `fk_ingresos_empleado_tipo_descuento1_idx` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_rol_pagos`
--

CREATE TABLE IF NOT EXISTS `ingreso_rol_pagos` (
  `rol_pagos` int(11) NOT NULL,
  `ingreso_empleado` int(11) NOT NULL,
  PRIMARY KEY (`rol_pagos`,`ingreso_empleado`),
  KEY `fk_rol_pagos_has_ingresos_empleado_ingresos_empleado1_idx` (`ingreso_empleado`),
  KEY `fk_rol_pagos_has_ingresos_empleado_rol_pagos1_idx` (`rol_pagos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso`
--

CREATE TABLE IF NOT EXISTS `permiso` (
  `idpermiso` int(11) NOT NULL AUTO_INCREMENT,
  `permiso` text,
  `pagina` text,
  PRIMARY KEY (`idpermiso`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `permiso`
--

INSERT INTO `permiso` (`idpermiso`, `permiso`, `pagina`) VALUES
(1, 'super administacion', 'superadmin.html');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_cargo`
--

CREATE TABLE IF NOT EXISTS `permiso_cargo` (
  `cargo` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  PRIMARY KEY (`cargo`,`permiso`),
  KEY `fk_roles_has_permisos_permisos1_idx` (`permiso`),
  KEY `fk_roles_has_permisos_roles1_idx` (`cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_empresa`
--

CREATE TABLE IF NOT EXISTS `permiso_empresa` (
  `empresa` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  PRIMARY KEY (`empresa`,`permiso`),
  KEY `fk_empresa_has_permisos_permisos1_idx` (`permiso`),
  KEY `fk_empresa_has_permisos_empresa1_idx` (`empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permiso_personal`
--

CREATE TABLE IF NOT EXISTS `permiso_personal` (
  `personal` int(11) NOT NULL,
  `permiso` int(11) NOT NULL,
  PRIMARY KEY (`personal`,`permiso`),
  KEY `fk_personal_has_permisos_permisos1_idx` (`permiso`),
  KEY `fk_personal_has_permisos_personal1_idx` (`personal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permiso_personal`
--

INSERT INTO `permiso_personal` (`personal`, `permiso`) VALUES
(2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `idpersonal` int(11) NOT NULL AUTO_INCREMENT,
  `nom_personal` text NOT NULL,
  `identificacion` text,
  `telefono` text,
  `email` text,
  `direccion` text,
  `usuario` text,
  `clave` text,
  `cargo` int(11) NOT NULL,
  `empresa` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idpersonal`),
  KEY `fk_personal_empresa_idx` (`empresa`),
  KEY `fk_personal_estados1_idx` (`estado`),
  KEY `fk_personal_roles1_idx` (`cargo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idpersonal`, `nom_personal`, `identificacion`, `telefono`, `email`, `direccion`, `usuario`, `clave`, `cargo`, `empresa`, `estado`) VALUES
(2, 'Marcelo Miranda', '1720259751', '0983732233', 'mmiranda@', 'Carapungo', 'm', 'm', 1, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE IF NOT EXISTS `productos` (
  `idproductos` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text COLLATE utf8_spanish2_ci,
  `nombre` text COLLATE utf8_spanish2_ci,
  `valor` float DEFAULT NULL,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `categoria` int(11) NOT NULL,
  `fecha_ingreso` text COLLATE utf8_spanish2_ci,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idproductos`),
  KEY `fk_productos_categoria_productos1_idx` (`categoria`),
  KEY `fk_productos_estado_inventario1_idx` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE IF NOT EXISTS `proveedor` (
  `idproveedor` int(11) NOT NULL AUTO_INCREMENT,
  `rezon_social` text COLLATE utf8_spanish2_ci,
  `ruc` text COLLATE utf8_spanish2_ci,
  `telefono` text COLLATE utf8_spanish2_ci,
  `email` text COLLATE utf8_spanish2_ci,
  `direccion` text COLLATE utf8_spanish2_ci,
  `descripcion` text COLLATE utf8_spanish2_ci,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`idproveedor`),
  KEY `fk_proveedor_estados_actividad1_idx` (`estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_pagos`
--

CREATE TABLE IF NOT EXISTS `rol_pagos` (
  `idrol_pagos` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` text COLLATE utf8_spanish2_ci,
  `fecha_rol` text COLLATE utf8_spanish2_ci,
  `fecha_creacion` text COLLATE utf8_spanish2_ci,
  `personal` int(11) NOT NULL,
  `empresa` text COLLATE utf8_spanish2_ci,
  `autorizacion` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idrol_pagos`),
  KEY `fk_rol_pagos_personal1_idx` (`personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_descuento`
--

CREATE TABLE IF NOT EXISTS `tipo_descuento` (
  `idtipo_descuento` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` text COLLATE utf8_spanish2_ci,
  PRIMARY KEY (`idtipo_descuento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_empresa_estado`
--
CREATE TABLE IF NOT EXISTS `vista_empresa_estado` (
`alias_empresa` text
,`estado` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_permiso_cargo`
--
CREATE TABLE IF NOT EXISTS `vista_permiso_cargo` (
`cargo` text
,`permiso` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_permiso_empresa`
--
CREATE TABLE IF NOT EXISTS `vista_permiso_empresa` (
`nom_empresa` text
,`permiso` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_permiso_personal`
--
CREATE TABLE IF NOT EXISTS `vista_permiso_personal` (
`idpersonal` int(11)
,`nom_personal` text
,`permiso` text
);
-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_personal`
--
CREATE TABLE IF NOT EXISTS `vista_personal` (
`idpersonal` int(11)
,`nom_personal` text
,`telefono` text
,`email` text
,`direccion` text
,`usuario` text
,`clave` text
,`cargo` text
,`alias_empresa` text
,`estado` text
);
-- --------------------------------------------------------

--
-- Estructura para la vista `vista_empresa_estado`
--
DROP TABLE IF EXISTS `vista_empresa_estado`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_empresa_estado` AS select `ep`.`alias_empresa` AS `alias_empresa`,`et`.`estado` AS `estado` from (`empresa` `ep` join `estado_actividad` `et`) where (`ep`.`estado_empresa` = `et`.`idestado_actividad`);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_permiso_cargo`
--
DROP TABLE IF EXISTS `vista_permiso_cargo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_permiso_cargo` AS select `c`.`cargo` AS `cargo`,`ps`.`permiso` AS `permiso` from ((`cargo` `c` join `permiso` `ps`) join `permiso_cargo` `pc`) where ((`c`.`idcargo` = `pc`.`cargo`) and (`ps`.`idpermiso` = `pc`.`permiso`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_permiso_empresa`
--
DROP TABLE IF EXISTS `vista_permiso_empresa`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_permiso_empresa` AS select `e`.`nom_empresa` AS `nom_empresa`,`ps`.`permiso` AS `permiso` from ((`empresa` `e` join `permiso` `ps`) join `permiso_empresa` `pe`) where ((`e`.`idempresa` = `pe`.`empresa`) and (`ps`.`idpermiso` = `pe`.`permiso`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_permiso_personal`
--
DROP TABLE IF EXISTS `vista_permiso_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_permiso_personal` AS select `p`.`idpersonal` AS `idpersonal`,`p`.`nom_personal` AS `nom_personal`,`ps`.`permiso` AS `permiso` from ((`personal` `p` join `permiso` `ps`) join `permiso_personal` `pp`) where ((`p`.`idpersonal` = `pp`.`personal`) and (`ps`.`idpermiso` = `pp`.`permiso`));

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_personal`
--
DROP TABLE IF EXISTS `vista_personal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_personal` AS select `p`.`idpersonal` AS `idpersonal`,`p`.`nom_personal` AS `nom_personal`,`p`.`telefono` AS `telefono`,`p`.`email` AS `email`,`p`.`direccion` AS `direccion`,`p`.`usuario` AS `usuario`,`p`.`clave` AS `clave`,`c`.`cargo` AS `cargo`,`ep`.`alias_empresa` AS `alias_empresa`,`et`.`estado` AS `estado` from (((`personal` `p` join `cargo` `c`) join `empresa` `ep`) join `estado_actividad` `et`) where ((`p`.`cargo` = `c`.`idcargo`) and (`p`.`empresa` = `ep`.`idempresa`) and (`p`.`estado` = `et`.`idestado_actividad`));

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `activos_fijos`
--
ALTER TABLE `activos_fijos`
  ADD CONSTRAINT `fk_activos_fijos_categoria_activos_fijos1` FOREIGN KEY (`categoria`) REFERENCES `categoria_activos_fijos` (`idcategoria_activos_fijos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activos_fijos_estado_inventario1` FOREIGN KEY (`estado`) REFERENCES `estado_inventario` (`idestado_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_activos_fijos_personal1` FOREIGN KEY (`personal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `fk_cliente_estados_actividad1` FOREIGN KEY (`estado`) REFERENCES `estado_actividad` (`idestado_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `descuento_empleado`
--
ALTER TABLE `descuento_empleado`
  ADD CONSTRAINT `fk_descuento_tipo_descuento1` FOREIGN KEY (`tipo`) REFERENCES `tipo_descuento` (`idtipo_descuento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `descuento_rol_pagos`
--
ALTER TABLE `descuento_rol_pagos`
  ADD CONSTRAINT `fk_rol_pagos_has_descuento_empleado_descuento_empleado1` FOREIGN KEY (`descuento_empleado`) REFERENCES `descuento_empleado` (`iddescuento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_pagos_has_descuento_empleado_rol_pagos1` FOREIGN KEY (`rol_pagos`) REFERENCES `rol_pagos` (`idrol_pagos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD CONSTRAINT `fk_empresa_estados_actividad1` FOREIGN KEY (`estado_empresa`) REFERENCES `estado_actividad` (`idestado_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura_cliente`
--
ALTER TABLE `factura_cliente`
  ADD CONSTRAINT `fk_factura_cliente_cliente1` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_cliente_descuento1` FOREIGN KEY (`descuento`) REFERENCES `descuento` (`iddescuento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_cliente_detalle_factura1` FOREIGN KEY (`detalle`) REFERENCES `detalle_factura` (`iddetalle_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_cliente_estado_factura1` FOREIGN KEY (`estado`) REFERENCES `estado_factura` (`idestado_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_cliente_impuesto1` FOREIGN KEY (`impuesto`) REFERENCES `impuesto` (`idimpuesto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `factura_proveedor`
--
ALTER TABLE `factura_proveedor`
  ADD CONSTRAINT `fk_factura_proveedores_estado_factura1` FOREIGN KEY (`estado`) REFERENCES `estado_factura` (`idestado_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_factura_proveedores_proveedores1` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`idproveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingresos_empleado`
--
ALTER TABLE `ingresos_empleado`
  ADD CONSTRAINT `fk_ingresos_empleado_tipo_descuento1` FOREIGN KEY (`tipo`) REFERENCES `tipo_descuento` (`idtipo_descuento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `ingreso_rol_pagos`
--
ALTER TABLE `ingreso_rol_pagos`
  ADD CONSTRAINT `fk_rol_pagos_has_ingresos_empleado_ingresos_empleado1` FOREIGN KEY (`ingreso_empleado`) REFERENCES `ingresos_empleado` (`idingresos_empleado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rol_pagos_has_ingresos_empleado_rol_pagos1` FOREIGN KEY (`rol_pagos`) REFERENCES `rol_pagos` (`idrol_pagos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permiso_cargo`
--
ALTER TABLE `permiso_cargo`
  ADD CONSTRAINT `fk_roles_has_permisos_permisos1` FOREIGN KEY (`permiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_roles_has_permisos_roles1` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permiso_empresa`
--
ALTER TABLE `permiso_empresa`
  ADD CONSTRAINT `fk_empresa_has_permisos_empresa1` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_empresa_has_permisos_permisos1` FOREIGN KEY (`permiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `permiso_personal`
--
ALTER TABLE `permiso_personal`
  ADD CONSTRAINT `fk_personal_has_permisos_permisos1` FOREIGN KEY (`permiso`) REFERENCES `permiso` (`idpermiso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_has_permisos_personal1` FOREIGN KEY (`personal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `fk_personal_empresa` FOREIGN KEY (`empresa`) REFERENCES `empresa` (`idempresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_estados1` FOREIGN KEY (`estado`) REFERENCES `estado_actividad` (`idestado_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_personal_roles1` FOREIGN KEY (`cargo`) REFERENCES `cargo` (`idcargo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria_productos1` FOREIGN KEY (`categoria`) REFERENCES `categoria_productos` (`idcategoria_productos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_productos_estado_inventario1` FOREIGN KEY (`estado`) REFERENCES `estado_inventario` (`idestado_inventario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_estados_actividad1` FOREIGN KEY (`estado`) REFERENCES `estado_actividad` (`idestado_actividad`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `rol_pagos`
--
ALTER TABLE `rol_pagos`
  ADD CONSTRAINT `fk_rol_pagos_personal1` FOREIGN KEY (`personal`) REFERENCES `personal` (`idpersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
