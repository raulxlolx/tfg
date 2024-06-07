-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 11:57:10
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tfg`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `albaran`
--

CREATE TABLE `albaran` (
  `cod_barras` int(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `numero_serie` int(255) NOT NULL,
  `precio` int(255) NOT NULL,
  `precio_iva` int(255) NOT NULL,
  `cantidad` int(255) NOT NULL,
  `importe` int(255) NOT NULL,
  `base_imponible` int(255) NOT NULL,
  `total` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `albaran`
--

INSERT INTO `albaran` (`cod_barras`, `descripcion`, `numero_serie`, `precio`, `precio_iva`, `cantidad`, `importe`, `base_imponible`, `total`) VALUES
(2024413476, '', 0, 0, 0, 0, 0, 529, 640),
(2024426134, '', 0, 0, 0, 0, 0, 0, 0),
(2024446742, 'ad', 0, 12, 15, 1, 12, 12, 15),
(2024447362, '', 0, 0, 0, 0, 0, 529, 640);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `dni` varchar(20) DEFAULT NULL,
  `poblacion` varchar(100) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `codigo_postal` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `email`, `telefono`, `dni`, `poblacion`, `direccion`, `codigo_postal`) VALUES
(18, 'raul hidalgo', '', '637383', '', '', '', ''),
(19, 'paco candela', '', '65434543', '', '', '', ''),
(20, 'drac', '', '', '', '', '', ''),
(21, 'manolo ', '', '3213412341', NULL, NULL, NULL, NULL),
(22, 'candela', '', '23132131', NULL, NULL, NULL, NULL),
(23, 'pedro jimenez', '', '213123', '', '', '', ''),
(24, 'paula perez', '', '4324324324', '', '', '', ''),
(25, 'antonio romero', '', '213213', NULL, NULL, NULL, NULL),
(26, 'luis listan', '', '321312', NULL, NULL, NULL, NULL),
(27, 'Manolo Perez', '', '6543628221', NULL, NULL, NULL, NULL),
(28, 'jose manuel carrero', '', '', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositos`
--

CREATE TABLE `depositos` (
  `codigo_barras` varchar(50) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `resultado_reparacion` int(11) DEFAULT NULL,
  `fecha_entrada` text DEFAULT NULL,
  `fecha_retirada` datetime DEFAULT NULL,
  `datos_deposita` text DEFAULT NULL,
  `problemas` text DEFAULT NULL,
  `solucion` text DEFAULT NULL,
  `contraseña_so` varchar(255) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  `nserie` varchar(255) DEFAULT NULL,
  `albaran` varchar(255) DEFAULT NULL,
  `presupuesto` decimal(10,2) DEFAULT NULL,
  `adelantado` decimal(10,2) DEFAULT NULL,
  `base_imponible` decimal(10,2) DEFAULT NULL,
  `iva` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `empleado` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `depositos`
--

INSERT INTO `depositos` (`codigo_barras`, `id_cliente`, `estado`, `resultado_reparacion`, `fecha_entrada`, `fecha_retirada`, `datos_deposita`, `problemas`, `solucion`, `contraseña_so`, `prioridad`, `nserie`, `albaran`, `presupuesto`, `adelantado`, `base_imponible`, `iva`, `total`, `empleado`) VALUES
('2024413476', 23, 1, 1, '2024-05-22', '0000-00-00 00:00:00', 'dsadd', '', '', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024414023', 20, 3, 2, '2024-05-15', '2024-05-15 19:22:00', 'PORTATIL ASUS', 'no carga', 'no tiene placa rota', '1234', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 2),
('2024418447', 19, 3, 2, '2024-05-15 ', '2024-05-15 19:17:00', 'TORRE GAMING', 'aaaaaaa', 'penes', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024426134', 18, 9, 3, '2024-05-22', '2024-06-06 11:42:00', 'PORTATIL LENOVO', '', '', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024435887', 18, 3, 2, '2024-05-17 ', '2024-05-22 18:12:00', 'TORRE CLONICA', 'pantalla rota', 'cambio pantalla', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024437085', 18, 3, 2, '2024-05-15', '2024-05-22 18:10:00', 'PORTATIL LENOVO', 'pantalla rota ', 'areglar pantalla ', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024446742', 18, 3, 2, '2024-05-22 \r\n\r\n', '2024-05-23 13:11:00', 'PORTATIL ASUS', 'pantall rota', 'cambio pantalla', '1234', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024447362', 19, 3, 2, '2024-05-22 ', '2024-06-04 10:17:00', 'PORTATIL LENOVO', '', '', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024448831', 21, 1, 1, '2024-05-22', NULL, 'PORTATIL LENOVO', '', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024454686', 19, 3, 2, '2024-05-22 ', '2024-05-22 18:08:00', '', '', '', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024455989', 19, 3, 2, '2024-05-15 ', '2024-05-15 19:18:00', 'PORTATIL LENOVO', '', '', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024471409', 25, 1, 1, '2024-05-29 ', NULL, 'PORTATIL HP', 'saaa', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024481947', 22, 1, 1, '2024-05-22 ', NULL, 'PORTATIL ASUS', '', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024484798', 24, 3, 3, '2024-05-24 ', '2024-05-24 15:21:00', 'PORTATIL LENOVO', 'pantalla rota', 'cambio de pantalla', '1234567hola', 3, '', '', 0.00, 0.00, NULL, NULL, NULL, 2),
('2024495222', 19, 3, 2, '2024-05-16 ', '2024-05-16 12:01:00', '', 'cghcghcv', '', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024497241', 18, 3, 2, '2024-05-15 ', '2024-05-15 19:17:00', 'PORTATIL LENOVO', 'pantalla rota', '', '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024532916', 26, 1, 1, '2024-05-29', NULL, 'PORTATIL HP', '', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024663996', 27, 1, 1, '2024-06-06 ', NULL, 'CONSOLA ps5', 'Va lento', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024667489', 18, 1, 1, '2024-06-04 ', NULL, 'PORTATIL LENOVO', 'xczcxc', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('2024674566', 18, 1, 1, '2024-06-04', NULL, 'PORTATIL LENOVO', 'xczczxc', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1),
('202469202', 28, 1, 1, '2024-05-22 ', NULL, 'PORTATIL asus', 'no carga', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 3),
('2024698510', 27, 1, 1, '2024-6-6', NULL, 'CONSOLA xbox', '', NULL, '', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `producto` varchar(50) NOT NULL,
  `marca` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `producto`, `marca`) VALUES
(1, 'PORTATIL', 'Lenovo'),
(4, 'PORTATIL', 'asus'),
(5, 'PORTATIL', 'acer'),
(6, 'CONSOLA', 'ps5'),
(7, 'CONSOLA', 'xbox');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `albaran`
--
ALTER TABLE `albaran`
  ADD PRIMARY KEY (`cod_barras`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `depositos`
--
ALTER TABLE `depositos`
  ADD PRIMARY KEY (`codigo_barras`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `depositos`
--
ALTER TABLE `depositos`
  ADD CONSTRAINT `depositos_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
