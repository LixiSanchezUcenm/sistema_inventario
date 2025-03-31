-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-03-2025 a las 02:00:08
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_inventario`
--
CREATE DATABASE IF NOT EXISTS `sistema_inventario` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sistema_inventario`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `CambiarEstadoImpresora`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CambiarEstadoImpresora` (IN `p_serial` VARCHAR(50), IN `p_estado_nuevo` ENUM('Buena','En Mantenimiento','Robada','Obsoleta'), IN `p_usuario` VARCHAR(50))   BEGIN
    DECLARE estado_anterior ENUM('Buena', 'En Mantenimiento', 'Robada', 'Obsoleta');

    -- Obtener el estado actual de la impresora
    SELECT estado_actual INTO estado_anterior
    FROM Impresoras
    WHERE serial = p_serial;

    -- Actualizar el estado de la impresora
    UPDATE Impresoras
    SET estado_actual = p_estado_nuevo
    WHERE serial = p_serial;

    -- Registrar el cambio de estado en el historial
    INSERT INTO Historial_Estados (serial, estado_anterior, estado_nuevo, cambiado_por)
    VALUES (p_serial, estado_anterior, p_estado_nuevo, p_usuario);

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

DROP TABLE IF EXISTS `asignaciones`;
CREATE TABLE `asignaciones` (
  `id` int(11) NOT NULL,
  `id_impresora` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `PDV` varchar(100) NOT NULL,
  `asignado_por` varchar(50) NOT NULL,
  `fecha_asignacion` datetime DEFAULT current_timestamp(),
  `fecha_devolucion` datetime DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones`
--

INSERT INTO `asignaciones` (`id`, `id_impresora`, `usuario`, `PDV`, `asignado_por`, `fecha_asignacion`, `fecha_devolucion`, `activo`) VALUES
(3, 3, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-02-22 20:09:51', '2025-02-23 03:10:10', 0),
(5, 3, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-02-22 20:11:06', '2025-02-23 22:21:30', 0),
(6, 3, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-02-23 15:46:36', '2025-02-25 16:02:01', 0),
(7, 4, 'Asanchez', 'VP0002', 'Lsanchez', '2025-02-23 16:05:49', '2025-02-24 23:47:20', 0),
(8, 6, 'Asanchez', 'VP0002', 'Lsanchez', '2025-02-24 08:31:06', '2025-02-24 15:31:30', 0),
(12, 6, 'Asanchez', 'VP0003', 'Lsanchez', '2025-02-24 20:56:47', '2025-02-25 04:45:04', 0),
(14, 6, 'Lsanchez', 'VP0003', 'Lsanchez', '2025-02-25 09:02:32', '2025-03-01 03:45:58', 0),
(15, 3, 'Nayala', 'VP0002', 'Lsanchez', '2025-02-25 14:24:59', '2025-03-01 03:45:56', 0),
(18, 10, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-02-26 08:23:48', '2025-02-26 15:24:49', 0),
(25, 5, 'Asanchez', 'VP0002', 'Lsanchez', '2025-03-01 10:29:53', '2025-03-02 04:41:30', 0),
(35, 6, 'Asanchez', 'VP0001', 'Lsanchez', '2025-03-01 11:00:37', '2025-03-01 18:02:49', 0),
(36, 14, 'Asanchez', 'VP0001', 'Lsanchez', '2025-03-01 11:03:15', '2025-03-02 04:41:38', 0),
(37, 3, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-03-01 15:02:07', '2025-03-02 04:41:34', 0),
(38, 4, 'Asanchez', 'VP0003', 'Lsanchez', '2025-03-01 21:02:37', '2025-03-02 04:41:36', 0),
(39, 10, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-03-01 21:39:32', '2025-03-02 04:41:32', 0),
(40, 12, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-03-01 21:40:50', '2025-03-02 04:41:27', 0),
(41, 3, 'Lsanchez', 'VP0001', 'Lsanchez', '2025-03-01 21:42:09', NULL, 1),
(42, 4, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-03-01 21:43:43', NULL, 1),
(43, 6, 'Asanchez', 'VP0003', 'Lsanchez', '2025-03-01 21:43:49', '2025-03-28 16:23:08', 0),
(44, 12, 'Lsanchez', 'VP0002', 'Lsanchez', '2025-03-01 21:46:58', '2025-03-19 02:50:21', 0),
(45, 12, 'Lsanchez', 'VP0003', 'Lsanchez', '2025-03-20 09:49:25', '2025-03-22 03:15:32', 0),
(46, 5, 'Nayala', 'VP0005', 'Lsanchez', '2025-03-22 22:14:02', NULL, 1),
(47, 12, 'Nayala', 'VP0001', 'Lsanchez', '2025-03-24 13:06:30', NULL, 1),
(48, 14, 'Lsanchez', 'VP0005', 'Lsanchez', '2025-03-28 08:49:12', NULL, 1),
(49, 19, 'wnavas', 'CA001', 'Lsanchez', '2025-03-30 17:31:28', NULL, 1),
(50, 54, 'juan_peres', 'CA001', 'Lsanchez', '2025-03-30 17:50:58', NULL, 1);

--
-- Disparadores `asignaciones`
--
DROP TRIGGER IF EXISTS `after_insert_asignacion`;
DELIMITER $$
CREATE TRIGGER `after_insert_asignacion` AFTER INSERT ON `asignaciones` FOR EACH ROW BEGIN
    UPDATE Impresoras
    SET ubicacion = (SELECT descripcion FROM Puntos_venta WHERE PDV = NEW.PDV),
        asignada = TRUE
    WHERE id = NEW.id_impresora;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `after_update_devolucion`;
DELIMITER $$
CREATE TRIGGER `after_update_devolucion` AFTER UPDATE ON `asignaciones` FOR EACH ROW BEGIN
    IF NEW.fecha_devolucion IS NOT NULL THEN
        UPDATE Impresoras
        SET ubicacion = 'Almacén IT',
            asignada = FALSE
        WHERE id = NEW.id_impresora;
    END IF;
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `before_insert_asignacion`;
DELIMITER $$
CREATE TRIGGER `before_insert_asignacion` BEFORE INSERT ON `asignaciones` FOR EACH ROW BEGIN
    DECLARE estado_impresora VARCHAR(50);
    SELECT estado_actual INTO estado_impresora FROM Impresoras WHERE id = NEW.id_impresora;
    IF estado_impresora IN ('En Mantenimiento', 'Robada', 'Obsoleta') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede asignar una impresora que está en mantenimiento, robada o es obsoleta.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones_componentes`
--

DROP TABLE IF EXISTS `asignaciones_componentes`;
CREATE TABLE `asignaciones_componentes` (
  `id` int(11) NOT NULL,
  `id_computadora` int(11) NOT NULL,
  `id_componente` int(11) NOT NULL,
  `planta` varchar(255) NOT NULL,
  `asignado_por` varchar(50) NOT NULL,
  `fecha_asignacion` datetime DEFAULT current_timestamp(),
  `fecha_devolucion` datetime DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones_componentes`
--

INSERT INTO `asignaciones_componentes` (`id`, `id_computadora`, `id_componente`, `planta`, `asignado_por`, `fecha_asignacion`, `fecha_devolucion`, `activo`) VALUES
(2, 10, 12, '2', 'lsanchez', '2025-03-14 23:10:14', '2025-03-19 04:14:49', 0),
(3, 8, 9, '2', 'Lsanchez', '2025-03-18 15:36:15', '2025-03-19 03:48:29', 0),
(4, 8, 17, '1', 'Lsanchez', '2025-03-18 15:36:31', '2025-03-19 03:48:29', 0),
(6, 10, 14, '1', 'Lsanchez', '2025-03-19 03:20:09', '2025-03-19 04:17:27', 0),
(7, 7, 9, '1', 'Lsanchez', '2025-03-19 03:31:10', '2025-03-19 04:13:27', 0),
(8, 8, 17, '1', 'Lsanchez', '2025-03-19 03:44:41', '2025-03-19 03:48:29', 0),
(9, 7, 12, '1', 'Lsanchez', '2025-03-19 04:20:42', '2025-03-19 04:23:08', 0),
(11, 7, 9, '1', 'Lsanchez', '2025-03-19 04:48:23', '2025-03-19 04:48:46', 0),
(13, 7, 9, '1', 'Lsanchez', '2025-03-19 15:07:15', '2025-03-19 17:01:45', 0),
(14, 8, 12, '1', 'Lsanchez', '2025-03-19 15:08:27', NULL, 1),
(15, 8, 9, '1', 'Lsanchez', '2025-03-19 17:09:33', NULL, 1),
(16, 8, 19, '1', 'Lsanchez', '2025-03-19 17:09:55', '2025-03-19 17:10:18', 0),
(17, 8, 17, '2', 'Lsanchez', '2025-03-20 16:36:21', '2025-03-20 17:29:50', 0),
(18, 7, 22, '', 'Lsanchez', '2025-03-20 10:29:25', '2025-03-21 05:02:39', 0),
(19, 17, 14, '1', 'Lsanchez', '2025-03-20 22:25:23', '2025-03-21 05:02:42', 0),
(20, 17, 21, '1', 'Lsanchez', '2025-03-20 22:25:32', '2025-03-20 22:27:20', 0),
(21, 17, 17, '1', 'Lsanchez', '2025-03-20 22:27:39', '2025-03-21 05:02:44', 0),
(22, 13, 22, '2', 'Lsanchez', '2025-03-22 22:46:58', NULL, 1),
(23, 13, 21, '18', 'Lsanchez', '2025-03-28 17:38:53', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones_computadora`
--

DROP TABLE IF EXISTS `asignaciones_computadora`;
CREATE TABLE `asignaciones_computadora` (
  `id` int(11) NOT NULL,
  `id_computadora` int(11) NOT NULL,
  `id_usuario` varchar(50) NOT NULL,
  `planta` varchar(255) NOT NULL,
  `asignado_por` varchar(50) NOT NULL,
  `fecha_asignacion` datetime DEFAULT current_timestamp(),
  `fecha_devolucion` datetime DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `causa_solicitud` text DEFAULT NULL,
  `procedencia` text DEFAULT NULL,
  `observaciones` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones_computadora`
--

INSERT INTO `asignaciones_computadora` (`id`, `id_computadora`, `id_usuario`, `planta`, `asignado_por`, `fecha_asignacion`, `fecha_devolucion`, `activo`, `causa_solicitud`, `procedencia`, `observaciones`) VALUES
(12, 8, 'Lsanchez', '2', 'Lsanchez', '2025-03-14 15:05:22', '2025-03-19 03:16:34', 0, 'No tenia equipo', 'Nuevo', 'Ninguna'),
(14, 10, 'Asanchez', '1', 'Lsanchez', '2025-03-18 20:05:51', '2025-03-19 03:07:30', 0, '', '', ''),
(15, 10, 'Lsanchez', '2', 'Lsanchez', '2025-03-18 20:15:58', '2025-03-19 03:20:42', 0, '', '', ''),
(16, 7, 'Asanchez', '1', 'Lsanchez', '2025-03-18 20:30:47', '2025-03-19 03:32:46', 0, 'q', 'q', 'q'),
(17, 8, 'Asanchez', '1', 'Lsanchez', '2025-03-18 20:44:56', '2025-03-19 03:48:29', 0, '', '', ''),
(18, 7, 'Asanchez', '1', 'Lsanchez', '2025-03-19 07:52:02', NULL, 1, '', '', ''),
(19, 8, 'Asanchez', '1', 'Lsanchez', '2025-03-19 07:56:13', NULL, 1, '', '', ''),
(20, 9, 'Asanchez', '1', 'Lsanchez', '2025-03-19 13:50:31', '2025-03-19 20:50:56', 0, '', '', ''),
(21, 9, 'Lsanchez', '1', 'Lsanchez', '2025-03-19 15:57:05', '2025-03-19 23:53:24', 0, '', '', ''),
(22, 10, 'Lsanchez', '2', 'Lsanchez', '2025-03-19 16:52:12', '2025-03-19 23:53:21', 0, '', '', ''),
(23, 13, 'Nayala', '2', 'Lsanchez', '2025-03-19 19:52:05', NULL, 1, '', '', ''),
(24, 9, 'Lsanchez', '2', 'Lsanchez', '2025-03-19 20:04:50', NULL, 1, '', '', ''),
(25, 10, 'Nayala', '2', 'Lsanchez', '2025-03-19 20:05:18', NULL, 1, '', '', ''),
(26, 17, 'Asanchez', '2', 'Lsanchez', '2025-03-20 11:27:49', '2025-03-20 22:26:28', 0, '', '', ''),
(27, 17, 'Nayala', '1', 'Lsanchez', '2025-03-20 15:26:45', NULL, 1, '', '', ''),
(28, 18, 'Asanchez', '18', 'Lsanchez', '2025-03-28 09:44:42', NULL, 1, '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `componentes`
--

DROP TABLE IF EXISTS `componentes`;
CREATE TABLE `componentes` (
  `id` int(11) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `ubicacion` varchar(255) NOT NULL DEFAULT 'Almacén IT',
  `asignada` tinyint(1) NOT NULL DEFAULT 0,
  `id_tipo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id`, `serial`, `modelo`, `id_marca`, `estado_id`, `ubicacion`, `asignada`, `id_tipo`) VALUES
(9, 'CN-019M93-LO300-45K-066L-A04', 'Laptitud 2530', 8, 1, '1', 1, 4),
(12, 'USA3YKA22100822', 'Laptitud 2530', 1, 1, '1', 1, 6),
(14, 'USA3YKA22100824', 'SPP-R200III', 8, 1, 'Almacén IT', 0, 4),
(17, 'USA3YKA22100826', 'Laptitud 2530', 1, 1, 'Almacén IT', 0, 1),
(19, 'CN-019M93-LO300-45K-066L-A06', 'tin-6g', 7, 1, 'Almacén IT', 0, 4),
(21, 'CN-019M93-LO300-45K-066L-A09', 'Laptitud 2530', 8, 1, '18', 1, 1),
(22, 'CN-019M93-LO300-45K-066L-A08', 'Laptitud 2530', 8, 4, '2', 1, 1),
(23, '1232eef2', '123ewe', 1, 1, 'Almacén IT', 0, 8),
(24, '789012', '124eer', 8, 1, 'Almacén IT', 0, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computadoras`
--

DROP TABLE IF EXISTS `computadoras`;
CREATE TABLE `computadoras` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `modelo` varchar(255) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `disco` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `procesador` varchar(255) DEFAULT NULL,
  `sistema_operativo` varchar(255) DEFAULT NULL,
  `estado_actual` int(11) NOT NULL,
  `ubicacion` varchar(255) DEFAULT NULL,
  `asignada` tinyint(1) DEFAULT 0,
  `anio` int(4) NOT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_vencimiento_garantia` date DEFAULT NULL,
  `proveedor_garantia` varchar(100) NOT NULL,
  `N_garantia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `computadoras`
--

INSERT INTO `computadoras` (`id`, `serial`, `modelo`, `id_marca`, `id_tipo`, `disco`, `ram`, `procesador`, `sistema_operativo`, `estado_actual`, `ubicacion`, `asignada`, `anio`, `fecha_compra`, `fecha_vencimiento_garantia`, `proveedor_garantia`, `N_garantia`) VALUES
(7, 'J7H61B3', 'E176FPC', 1, 1, '256 GB SSD', '16', 'I5-1145G7', 'WINDOWS 11', 1, '1', 1, 2021, '2025-03-24', '2025-03-30', 'Dell', 'Nhur45-4'),
(8, '1MZXL44', 'OPTIPLEX 7010', 1, 3, '512 SDD', '16', 'I5-13500', 'WINDOWS 11', 1, '1', 1, 2023, '2025-02-01', '2025-03-01', 'Acosa', 'Vigente'),
(9, 'J7H61B5', 'SPP-R200III', 5, 3, '512 SDD', '16', 'I5-1145G7', 'WINDOWS 11', 1, '2', 1, 2021, NULL, NULL, '', 'Vigente'),
(10, '1MZXL45', 'Laptitud 2530', 8, 3, '512 SDD', '10', 'I5-1045G7', 'WINDOWS 10', 4, '2', 1, 2023, NULL, NULL, '', 'Vigente'),
(13, 'JM3N43', '3F344', 5, 3, '512 SDD', '16', 'intelcore i 3', 'WINDOWS 11', 4, '2', 1, 2019, NULL, NULL, '', 'Vigente'),
(17, 'J7H61B7', 'Laptitud 2530', 1, 1, '120 sdd', '15 G', 'I5-13500', 'WINDOWS 10', 1, '1', 1, 2023, NULL, NULL, '', 'Vigente'),
(18, 'J7H61B9', 'Laptitud 2510', 1, 1, '512 SDD', '15 G', 'I5-1145G7', 'WINDOWS 11', 1, '18', 1, 2021, '2025-03-02', '2025-04-02', 'Acosa', 'Vigente'),
(29, 'ABC12345', 'E176FPC2', 1, 1, '512', '17', 'Intel Core i7', 'WINDOWS 11', 1, 'Almacén IT', 0, 2005, NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `conteo_impresoras`
-- (Véase abajo para la vista actual)
--
DROP VIEW IF EXISTS `conteo_impresoras`;
CREATE TABLE `conteo_impresoras` (
`estado_actual` varchar(50)
,`total` bigint(21)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`) VALUES
(5, 'Caja'),
(4, 'contabilidad'),
(3, 'IT'),
(2, 'RECURSOS HUMANOS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresas`
--

DROP TABLE IF EXISTS `empresas`;
CREATE TABLE `empresas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empresas`
--

INSERT INTO `empresas` (`id`, `nombre`) VALUES
(1, 'Tropigas Honduras S.A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `permite_asignacion` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `nombre`, `permite_asignacion`) VALUES
(1, 'Buena', 1),
(2, 'Mantenimiento', 0),
(4, 'rescatada', 1),
(5, 'revision', 0),
(6, 'obsoleta', 0),
(8, 'Robada', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados`
--

DROP TABLE IF EXISTS `historial_estados`;
CREATE TABLE `historial_estados` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `nuevo_estado` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_estados`
--

INSERT INTO `historial_estados` (`id`, `serial`, `nuevo_estado`, `comentario`, `usuario`, `fecha`) VALUES
(107, 'USA3YKA22100789', 'Buena', '', 'Lsanchez', '2025-03-30 23:44:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados_componentes`
--

DROP TABLE IF EXISTS `historial_estados_componentes`;
CREATE TABLE `historial_estados_componentes` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `nuevo_estado` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_estados_computadoras`
--

DROP TABLE IF EXISTS `historial_estados_computadoras`;
CREATE TABLE `historial_estados_computadoras` (
  `id` int(11) NOT NULL,
  `serial` varchar(255) NOT NULL,
  `nuevo_estado` varchar(50) NOT NULL,
  `comentario` text NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_estados_computadoras`
--

INSERT INTO `historial_estados_computadoras` (`id`, `serial`, `nuevo_estado`, `comentario`, `usuario`, `fecha`) VALUES
(26, 'J7H61B5', '1', '', 'Lsanchez', '2025-03-24 17:19:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `impresoras`
--

DROP TABLE IF EXISTS `impresoras`;
CREATE TABLE `impresoras` (
  `id` int(11) NOT NULL,
  `serial` varchar(50) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `estado_actual` varchar(50) NOT NULL DEFAULT 'Buena',
  `asignada` tinyint(1) DEFAULT 0,
  `ubicacion` varchar(100) DEFAULT 'Almacén IT',
  `fecha_compra` date DEFAULT NULL,
  `fecha_vencimiento_garantia` date DEFAULT NULL,
  `proveedor_garantia` varchar(100) NOT NULL,
  `N_garantia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `impresoras`
--

INSERT INTO `impresoras` (`id`, `serial`, `modelo`, `id_marca`, `id_tipo`, `estado_actual`, `asignada`, `ubicacion`, `fecha_compra`, `fecha_vencimiento_garantia`, `proveedor_garantia`, `N_garantia`) VALUES
(3, 'USA3YKA22100821', 'SPP-R200III', 1, 3, 'obsoleta', 1, 'San isidro', '2025-01-01', '2025-03-25', 'Acosa', 'Nt333-9'),
(4, 'USA3YKA22100824', 'SPP-R200III', 1, 1, 'Buena', 1, 'Potrerillo 1', '2025-03-04', '2025-03-22', 'Acosa', 'Vigente'),
(5, 'USA3YKA22100822', 'SPP-R200III', 1, 3, 'Buena', 1, 'VP0005', '2025-01-01', '2025-03-21', 'Acosa', 'N-3r34'),
(6, 'USA3YKA22100825', 'SPP-R200III', 1, 1, 'revision', 0, 'Almacén IT', '2025-03-24', '2025-04-24', 'Dell', 'hk3-2r3443'),
(10, 'USA3YKA22100826', 'SPP-R200III', 1, 3, 'Mantenimiento', 0, 'Almacén IT', '2025-03-01', '2025-03-27', 'Acosa', 'Vigente'),
(12, 'USA3YKA22100827', 'SPP-R200III', 1, 1, 'Buena', 1, 'VP0001', '2025-02-01', '2025-03-24', 'Dell', 'Vigente'),
(14, 'USA3YKA22100823', 'SPP-R200III', 1, 3, 'rescatada', 1, 'VP0005', '2025-02-02', '2025-03-23', 'Acosa', 'Vigente'),
(19, 'USA3YKA22100789', 'SPP-R200III', 1, 1, 'Buena', 1, 'CA001', '2025-03-20', '2025-03-25', 'del', 'Vigente'),
(52, 'USA3YKA22100127', 'SPP-R200III', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', ''),
(54, 'USA3YKA22100432', 'SPP-R200III', 1, 1, 'Buena', 1, 'CA001', NULL, NULL, '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id`, `nombre`) VALUES
(1, 'BIXOLON');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas_computadoras`
--

DROP TABLE IF EXISTS `marcas_computadoras`;
CREATE TABLE `marcas_computadoras` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `marcas_computadoras`
--

INSERT INTO `marcas_computadoras` (`id`, `nombre`) VALUES
(5, 'Acer'),
(7, 'Asus'),
(1, 'Dell'),
(8, 'HP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

DROP TABLE IF EXISTS `modulos`;
CREATE TABLE `modulos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Impresoras', 'Lista las funciones de las impresoras'),
(2, 'computadoras', 'Lista las funciones de las computadoras'),
(3, 'Componetes', 'Lista las funciones de los componetes'),
(4, 'Reportes', 'Lista los reportes de las impresoras y computadoras'),
(5, 'usuarios', 'Listado de los usuarios'),
(6, 'configuracion', 'Distintas configuraciones del programa'),
(7, 'asignar', 'asignación de impresoras'),
(8, 'historial impresoras', 'Lista las impresoras asignadas y sus historiales'),
(9, 'listar impresoras', 'Lista los estados de las impresoras'),
(10, 'crud impresoras', 'Lista, Eliminar, Modifica las impresoras'),
(11, 'crud computadoras', 'Lista, Elimina y Guarda los datos de las computadoras'),
(12, 'asignar computadoras', 'Asignación de computadoras a usuarios'),
(13, 'listar computadoras', 'Listar los estados de las computadoras'),
(14, 'Historial asignaciones de computadoras', 'Historial de las asignaciones de la computadoras'),
(15, 'crud componentes', 'Listar, Modificar, Guardar y eliminar los componentes de las computadoras'),
(16, 'asignacion componentes', 'Asigna los componentes a las computadoras'),
(17, 'listar estado de los componentes', 'Lista los estados de los componentes'),
(18, 'historial de asignaciones de componentes', 'Historial de las asignaciones de los componentes'),
(19, 'reportes computadoras', 'Imprimir hojas de asignación y exportar listado de computadoras'),
(20, 'reportes impresoras', 'Imprimir hojas de asignación y exportar listado de las impresoras'),
(21, 'Empresa', 'Crud de la empresa,planta y PDV que se manejan en ella'),
(22, 'gestion de impresoras', 'Agrega los tipos y las marcas de las impresoras'),
(23, 'gestion de computadoras y componentes', 'Gestiona las marcas y los tipos de los componentes y computadoras'),
(26, 'importaciones', 'Importar los datos al programa'),
(27, 'niveles de acceso', 'Registra los accesos del sistema'),
(28, 'Estados', 'Gestiona los estados de los activos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plantas`
--

DROP TABLE IF EXISTS `plantas`;
CREATE TABLE `plantas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_empresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `plantas`
--

INSERT INTO `plantas` (`id`, `nombre`, `id_empresa`) VALUES
(1, 'Chile', 1),
(2, 'La Ceiba', 1),
(5, 'Villanueva', 1),
(18, 'VILLANUEVA', 1),
(19, 'GUANÁBANO', 1),
(20, 'CALPULES', 1),
(21, 'LA CEIBA', 1),
(22, 'SANTA ROSA', 1),
(23, 'TULIN', 1),
(24, 'SABÁ', 1),
(25, 'EL CHILE', 1),
(26, 'SANTA ELENA', 1),
(27, 'SAN MATÍAS', 1),
(28, 'GAS VEHICULAR – SPS', 1),
(29, 'GAS VEHICULAR -TGU', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puntos_venta`
--

DROP TABLE IF EXISTS `puntos_venta`;
CREATE TABLE `puntos_venta` (
  `PDV` varchar(100) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_planta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puntos_venta`
--

INSERT INTO `puntos_venta` (`PDV`, `descripcion`, `id_planta`) VALUES
('CA001', 'centro aguilar', 23),
('VP0001', 'San isidro', 2),
('VP0002', 'Potrerillo 1', 1),
('VP0003', 'toncotin', 2),
('VP0005', 'san manuel 1', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`) VALUES
(1, 'administrador'),
(2, 'Empleados'),
(3, 'Sin Acceso'),
(4, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_modulos`
--

DROP TABLE IF EXISTS `roles_modulos`;
CREATE TABLE `roles_modulos` (
  `id` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `modulo_id` int(11) NOT NULL,
  `permiso` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles_modulos`
--

INSERT INTO `roles_modulos` (`id`, `rol_id`, `modulo_id`, `permiso`) VALUES
(22, 1, 1, 1),
(24, 1, 3, 1),
(36, 1, 6, 1),
(39, 1, 7, 1),
(40, 1, 8, 1),
(43, 1, 9, 1),
(44, 1, 10, 1),
(46, 1, 2, 1),
(47, 1, 11, 1),
(48, 1, 12, 1),
(49, 1, 13, 1),
(50, 1, 14, 1),
(51, 1, 15, 1),
(53, 1, 16, 1),
(54, 1, 17, 1),
(56, 1, 18, 1),
(57, 1, 19, 1),
(58, 1, 4, 1),
(60, 1, 20, 1),
(62, 1, 5, 1),
(63, 1, 21, 1),
(64, 1, 22, 1),
(70, 1, 26, 1),
(72, 1, 23, 1),
(73, 1, 27, 1),
(74, 1, 28, 1),
(82, 2, 1, 1),
(87, 2, 8, 1),
(88, 2, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_componentes`
--

DROP TABLE IF EXISTS `tipos_componentes`;
CREATE TABLE `tipos_componentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_componentes`
--

INSERT INTO `tipos_componentes` (`id`, `nombre`) VALUES
(8, 'Cargador'),
(1, 'Monitor'),
(6, 'Mouse'),
(4, 'Teclado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_computadoras`
--

DROP TABLE IF EXISTS `tipos_computadoras`;
CREATE TABLE `tipos_computadoras` (
  `id` int(11) NOT NULL,
  `tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_computadoras`
--

INSERT INTO `tipos_computadoras` (`id`, `tipo`) VALUES
(3, 'desktop'),
(1, 'Laptop');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_impresoras`
--

DROP TABLE IF EXISTS `tipos_impresoras`;
CREATE TABLE `tipos_impresoras` (
  `id` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_impresoras`
--

INSERT INTO `tipos_impresoras` (`id`, `tipo`) VALUES
(3, 'Granel'),
(1, 'Portatil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `rol` int(11) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `IMEI` varchar(50) DEFAULT NULL,
  `jefe_inmediato` varchar(100) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `planta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `nombre`, `contrasena`, `rol`, `telefono`, `IMEI`, `jefe_inmediato`, `departamento_id`, `planta`) VALUES
('Asanchez', 'Ana Sanchez', '$2y$10$kesC/4URW/uxnDVhupXW.e3NExexSdZuAtHBoGUXrqTJa8jrbr6MS', 2, '32019242', '4234324', 'luciano baide', 2, '1'),
('juan_peres', 'Juan Peres', NULL, 3, '', '', '', 2, '1'),
('Lsanchez', 'Lixi Nayely Sanchez Ayala', '$2y$10$2xADVtnArnBAO50ebuZu/epy623dekUJ53ysAk5k5uqB9l7d6exNK', 1, '89824240', '212234324', 'luciano baide', 4, '2'),
('Nayala', 'Nayely Ayala', '$2y$10$Q6g4KSvxTbLw8KAypuO7COFDq1.3NVx/ELLrJogwfg6Lq/ciyMJ6.', 3, '31019098', '4234324', 'luciano baide', 3, '2'),
('wnavas', 'wendi ordoñez', '$2y$10$HlGN4Er8tiu.zQiU9r8rBOscqPqpx2yflLZu9avtty3t0XbO.9O7q', 3, '123', '322', 'luci', 2, '1');

-- --------------------------------------------------------

--
-- Estructura para la vista `conteo_impresoras`
--
DROP TABLE IF EXISTS `conteo_impresoras`;

DROP VIEW IF EXISTS `conteo_impresoras`;
CREATE VIEW `conteo_impresoras`  AS SELECT `impresoras`.`estado_actual` AS `estado_actual`, count(0) AS `total` FROM `impresoras` GROUP BY `impresoras`.`estado_actual` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_impresora` (`id_impresora`),
  ADD KEY `usuario` (`usuario`),
  ADD KEY `PDV` (`PDV`),
  ADD KEY `asignado_por` (`asignado_por`);

--
-- Indices de la tabla `asignaciones_componentes`
--
ALTER TABLE `asignaciones_componentes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_computadora` (`id_computadora`),
  ADD KEY `id_componente` (`id_componente`),
  ADD KEY `asignado_por` (`asignado_por`);

--
-- Indices de la tabla `asignaciones_computadora`
--
ALTER TABLE `asignaciones_computadora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_computadora` (`id_computadora`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `asignado_por` (`asignado_por`);

--
-- Indices de la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `estado_id` (`estado_id`);

--
-- Indices de la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_tipo` (`id_tipo`),
  ADD KEY `estado_actual` (`estado_actual`),
  ADD KEY `idx_computadora_id` (`id`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `empresas`
--
ALTER TABLE `empresas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_estados_componentes`
--
ALTER TABLE `historial_estados_componentes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `historial_estados_computadoras`
--
ALTER TABLE `historial_estados_computadoras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `impresoras`
--
ALTER TABLE `impresoras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial` (`serial`),
  ADD UNIQUE KEY `serial_2` (`serial`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `marcas_computadoras`
--
ALTER TABLE `marcas_computadoras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_empresa` (`id_empresa`);

--
-- Indices de la tabla `puntos_venta`
--
ALTER TABLE `puntos_venta`
  ADD PRIMARY KEY (`PDV`),
  ADD KEY `id_planta` (`id_planta`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `roles_modulos`
--
ALTER TABLE `roles_modulos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rol_id` (`rol_id`,`modulo_id`),
  ADD KEY `modulo_id` (`modulo_id`);

--
-- Indices de la tabla `tipos_componentes`
--
ALTER TABLE `tipos_componentes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tipos_computadoras`
--
ALTER TABLE `tipos_computadoras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `tipos_impresoras`
--
ALTER TABLE `tipos_impresoras`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tipo` (`tipo`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `fk_departamento` (`departamento_id`),
  ADD KEY `idx_usuario` (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `asignaciones_componentes`
--
ALTER TABLE `asignaciones_componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `asignaciones_computadora`
--
ALTER TABLE `asignaciones_computadora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `computadoras`
--
ALTER TABLE `computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `historial_estados_componentes`
--
ALTER TABLE `historial_estados_componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `historial_estados_computadoras`
--
ALTER TABLE `historial_estados_computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `impresoras`
--
ALTER TABLE `impresoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `marcas_computadoras`
--
ALTER TABLE `marcas_computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `plantas`
--
ALTER TABLE `plantas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles_modulos`
--
ALTER TABLE `roles_modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT de la tabla `tipos_componentes`
--
ALTER TABLE `tipos_componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `tipos_computadoras`
--
ALTER TABLE `tipos_computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tipos_impresoras`
--
ALTER TABLE `tipos_impresoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_impresora`) REFERENCES `impresoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`PDV`) REFERENCES `puntos_venta` (`PDV`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_4` FOREIGN KEY (`asignado_por`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `asignaciones_componentes`
--
ALTER TABLE `asignaciones_componentes`
  ADD CONSTRAINT `asignaciones_componentes_ibfk_1` FOREIGN KEY (`id_computadora`) REFERENCES `computadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_componentes_ibfk_2` FOREIGN KEY (`id_componente`) REFERENCES `componentes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_componentes_ibfk_3` FOREIGN KEY (`asignado_por`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `asignaciones_computadora`
--
ALTER TABLE `asignaciones_computadora`
  ADD CONSTRAINT `asignaciones_computadora_ibfk_1` FOREIGN KEY (`id_computadora`) REFERENCES `computadoras` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_computadora_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_computadora_ibfk_3` FOREIGN KEY (`asignado_por`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `componentes`
--
ALTER TABLE `componentes`
  ADD CONSTRAINT `componentes_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas_computadoras` (`id`),
  ADD CONSTRAINT `componentes_ibfk_2` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`);

--
-- Filtros para la tabla `computadoras`
--
ALTER TABLE `computadoras`
  ADD CONSTRAINT `computadoras_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas_computadoras` (`id`),
  ADD CONSTRAINT `computadoras_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_computadoras` (`id`),
  ADD CONSTRAINT `computadoras_ibfk_3` FOREIGN KEY (`estado_actual`) REFERENCES `estados` (`id`);

--
-- Filtros para la tabla `impresoras`
--
ALTER TABLE `impresoras`
  ADD CONSTRAINT `impresoras_ibfk_1` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `impresoras_ibfk_2` FOREIGN KEY (`id_tipo`) REFERENCES `tipos_impresoras` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `plantas`
--
ALTER TABLE `plantas`
  ADD CONSTRAINT `plantas_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `puntos_venta`
--
ALTER TABLE `puntos_venta`
  ADD CONSTRAINT `puntos_venta_ibfk_1` FOREIGN KEY (`id_planta`) REFERENCES `plantas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `roles_modulos`
--
ALTER TABLE `roles_modulos`
  ADD CONSTRAINT `roles_modulos_ibfk_1` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `roles_modulos_ibfk_2` FOREIGN KEY (`modulo_id`) REFERENCES `modulos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_departamento` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
