-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2024 a las 14:23:15
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
(1, 'fgsedfsd', '', '543534', NULL, NULL, NULL, NULL),
(2, 'asdassd', '', '324', NULL, NULL, NULL, NULL),
(3, 'dasdsdasd', '', '21213213', NULL, NULL, NULL, NULL),
(4, 'asdasdasd', '', '3254535435', NULL, NULL, NULL, NULL),
(5, 'ytutyutyu', '', '876878', NULL, NULL, NULL, NULL),
(6, 'dsadasda', '', '3244242', NULL, NULL, NULL, NULL),
(7, 'raul', '', '3123213213', NULL, NULL, NULL, NULL),
(8, 'Raúl Hidalgo Carrero', 'raulhidalgocarrero6@gmail.com', '3123213213', NULL, NULL, NULL, NULL),
(9, 'Raúl Hidalgo Carrero', 'raulhidalgocarrero6@gmail.com', '3123213213', NULL, NULL, NULL, NULL),
(10, 'Raúl Hidalgo Carrero', 'raulhidalgocarrero6@gmail.com', '3123213213', NULL, NULL, NULL, NULL),
(11, 'Raúl Hidalgo Carrero', 'raulhidalgocarrero6@gmail.com', '3123213213', NULL, NULL, NULL, NULL),
(12, 'Raúl Hidalgo Carrero', 'raulhidalgocarrero6@gmail.com', '3123213213', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `depositos`
--

CREATE TABLE `depositos` (
  `codigo_barras` varchar(50) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  `resultado_reparacion` int(11) DEFAULT NULL,
  `fecha_entrada` datetime DEFAULT NULL,
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
('', NULL, NULL, NULL, '2024-05-07 18:45:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024438523', NULL, NULL, NULL, '2024-05-08 10:23:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024448629', 8, 1, 1, '2024-05-11 13:15:00', NULL, 'PORTATIL LENOVO', '', NULL, '', 3, '', '', 0.00, 0.00, NULL, NULL, NULL, 2),
('2024463759', 7, 1, 1, '2024-05-09 21:09:00', NULL, 'PORTATIL LENOVO', 'pantalla rota', NULL, '1234', 1, '', '', 0.00, 0.00, NULL, NULL, NULL, 2),
('2024469719', 2, NULL, NULL, '2024-05-08 10:25:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024485620', 6, 1, 1, '2024-05-08 10:47:00', NULL, 'PORTATIL', 'penes', NULL, 'pene43', 3, '321312312', '1', 124.00, 1.00, NULL, NULL, NULL, 2),
('2024490712', 4, NULL, NULL, '2024-05-08 10:31:00', NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1),
('2024492168', 5, 1, 1, '2024-05-08 10:35:00', NULL, 'PORTATIL', 'pened', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
