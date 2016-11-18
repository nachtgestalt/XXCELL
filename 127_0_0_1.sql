-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2016 a las 07:17:38
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `xxcell`
--
CREATE DATABASE IF NOT EXISTS `xxcell` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `xxcell`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `usuario` varchar(10) NOT NULL,
  `contra` varchar(16) NOT NULL,
  `nivel` int(1) NOT NULL,
  `Foto` longblob,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Telefono` varchar(14) NOT NULL,
  `Referencia` text,
  `Ine` longblob,
  `Contratacion` date DEFAULT NULL,
  `InePosterior` longblob,
  `NumEmpleado` int(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`usuario`, `contra`, `nivel`, `Foto`, `Nombre`, `Apellido`, `Direccion`, `Telefono`, `Referencia`, `Ine`, `Contratacion`, `InePosterior`, `NumEmpleado`) VALUES

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID` varchar(13) NOT NULL,
  `Modelo` varchar(15) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `PrecPub` decimal(10,2) NOT NULL,
  `Marca` varchar(15) NOT NULL,
  `Tipo` varchar(30) NOT NULL,
  `PrecDist` decimal(10,2) NOT NULL,
  `Descrip` text NOT NULL,
  `CantidadInicial` int(11) DEFAULT NULL,
  `CantidadActual` int(11) NOT NULL,
  `Entradas` int(11) NOT NULL,
  `Salidas` int(11) NOT NULL,
  `L58` int(11) DEFAULT NULL,
  `L64` int(11) DEFAULT NULL,
  `L127` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID`, `Modelo`, `Nombre`, `PrecPub`, `Marca`, `Tipo`, `PrecDist`, `Descrip`, `CantidadInicial`, `CantidadActual`, `Entradas`, `Salidas`, `L58`, `L64`, `L127`) VALUES
('1', 'g5', 'Mica templada', '50.00', 'Lg', 'Mica', '25.00', 'Mica de las chidas', 50, -6, 0, 6, 10, 30, 10),
('2', 's5', 'tpu negro', '150.00', 'Samsung', 'tpu', '125.00', 'Es el chidori de los tpu', 10, -2, 0, 2, 3, 2, 5),
('3', 'J5', 'Mica oscura', '50.00', 'Samsung', 'Mica', '25.00', 'Mica oscura', 50, 45, 0, 5, 10, 10, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblfolios`
--

CREATE TABLE `tblfolios` (
  `folioinventario` int(10) NOT NULL,
  `folioventa` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblfolios`
--

INSERT INTO `tblfolios` (`folioinventario`, `folioventa`) VALUES
(7, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblinventario`
--

CREATE TABLE `tblinventario` (
  `invfolio` int(5) NOT NULL,
  `invmovimiento` varchar(10) NOT NULL,
  `invfecha` datetime NOT NULL,
  `invcantidad` int(11) NOT NULL,
  `productocodigo` varchar(15) NOT NULL,
  `ventafolio` int(10) NOT NULL,
  `invdescripcion` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblinventario`
--

INSERT INTO `tblinventario` (`invfolio`, `invmovimiento`, `invfecha`, `invcantidad`, `productocodigo`, `ventafolio`, `invdescripcion`) VALUES
(1, 'Salida', '2016-11-11 09:27:37', 2, '1', 1, 'Salida por venta'),
(2, 'Salida', '2016-11-11 09:27:37', 1, '2', 1, 'Salida por venta'),
(3, 'Salida', '2016-11-11 09:27:37', 1, '3', 1, 'Salida por venta'),
(4, 'Salida', '2016-11-11 10:02:35', 4, '1', 2, 'Salida por venta'),
(5, 'Salida', '2016-11-11 10:02:35', 1, '3', 2, 'Salida por venta'),
(6, 'Salida', '2016-11-11 10:02:35', 1, '2', 2, 'Salida por venta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblventadetalle`
--

CREATE TABLE `tblventadetalle` (
  `ventaFolio` int(10) NOT NULL,
  `productoCodigo` varchar(15) NOT NULL,
  `productoNombre` varchar(20) NOT NULL,
  `ventaCantidad` tinyint(3) NOT NULL,
  `productoPrecio` decimal(10,2) NOT NULL,
  `productoCosto` decimal(10,2) DEFAULT NULL,
  `NumLocal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblventadetalle`
--

INSERT INTO `tblventadetalle` (`ventaFolio`, `productoCodigo`, `productoNombre`, `ventaCantidad`, `productoPrecio`, `productoCosto`, `NumLocal`) VALUES
(1, '1', 'Mica templada', 2, '50.00', NULL, ''),
(1, '2', 'tpu negro', 1, '150.00', NULL, ''),
(1, '3', 'Mica oscura', 1, '50.00', NULL, ''),
(2, '1', 'Mica templada', 4, '50.00', NULL, ''),
(2, '3', 'Mica oscura', 1, '50.00', NULL, ''),
(2, '2', 'tpu negro', 1, '150.00', NULL, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblventas`
--

CREATE TABLE `tblventas` (
  `ventaFolio` int(10) NOT NULL,
  `ventaFecha` datetime NOT NULL,
  `ventaProductos` int(10) NOT NULL,
  `ventaImporte` decimal(10,2) NOT NULL,
  `ventaUtilidad` decimal(10,2) DEFAULT NULL,
  `ventaCancelada` varchar(50) NOT NULL,
  `NumLocal` varchar(10) NOT NULL,
  `NumEmpleado` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblventas`
--

INSERT INTO `tblventas` (`ventaFolio`, `ventaFecha`, `ventaProductos`, `ventaImporte`, `ventaUtilidad`, `ventaCancelada`, `NumLocal`, `NumEmpleado`) VALUES
(1, '2016-11-11 09:27:37', 4, '300.00', NULL, '', '', 1),
(2, '2016-11-11 10:02:35', 6, '400.00', NULL, '', '', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `NumEmpleado` (`NumEmpleado`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;