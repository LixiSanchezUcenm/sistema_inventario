-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-04-2025 a las 19:52:08
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
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `hoja_firmada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones`
--

INSERT INTO `asignaciones` (`id`, `id_impresora`, `usuario`, `PDV`, `asignado_por`, `fecha_asignacion`, `fecha_devolucion`, `activo`, `hoja_firmada`) VALUES
(1, 861, 'enny_rosario_garcia_turcios', 'CATP002', 'Lsanchez', '2025-03-31 19:57:39', NULL, 1, NULL),
(2, 862, 'jairo_otoniel_pineda_lopez', 'CATP003', 'Lsanchez', '2025-03-31 19:59:17', NULL, 1, NULL),
(3, 863, 'melani_danei_echeverria_acosta', 'CATP007', 'Lsanchez', '2025-03-31 20:02:23', NULL, 1, NULL),
(4, 864, 'wendy_carolina_ulloa_mejia', 'CATP009', 'Lsanchez', '2025-03-31 20:05:17', NULL, 1, NULL),
(5, 865, 'yaimy_karolina_zaldivar_canales', 'CATP059', 'Lsanchez', '2025-03-31 20:06:31', NULL, 1, NULL),
(6, 866, 'yesica_marilu_diaz_oviedo', 'CATP010', 'Lsanchez', '2025-03-31 20:07:22', NULL, 1, NULL),
(7, 867, 'gener_omar_castro_rosales', 'CATP013', 'Lsanchez', '2025-03-31 20:08:30', NULL, 1, NULL),
(8, 868, 'patricia_mencia_echaver', 'CATP014', 'Lsanchez', '2025-03-31 20:12:02', NULL, 1, NULL),
(9, 870, 'nelson_david_sanchez_seren', 'CATP017', 'Lsanchez', '2025-03-31 20:13:50', NULL, 1, NULL),
(10, 871, 'ana_beatriz_sosa_escobar', 'CATP024', 'Lsanchez', '2025-03-31 20:15:00', NULL, 1, NULL),
(11, 872, 'julia_ondina_trochez_bueso', 'CATP025', 'Lsanchez', '2025-03-31 20:15:34', NULL, 1, NULL),
(12, 874, 'margie_xiomara_bonilla_ramirez', 'CATP050', 'Lsanchez', '2025-03-31 20:18:28', NULL, 1, NULL),
(13, 875, 'cindy_johana_garcia_hernandez', 'CATP001', 'Lsanchez', '2025-03-31 20:20:06', NULL, 1, NULL),
(14, 876, 'walter_noe_rosales_alvarenga', 'CATP004', 'Lsanchez', '2025-03-31 20:20:41', NULL, 1, NULL),
(15, 877, 'juan_miguel_molina_valle', 'CATP006', 'Lsanchez', '2025-03-31 20:26:15', NULL, 1, NULL),
(16, 878, 'johnny_rolando_reyes_padilla', 'CATP012', 'Lsanchez', '2025-03-31 20:27:46', NULL, 1, NULL),
(17, 879, 'cinthia_joselyn_cruz_martinez', 'CATP054', 'Lsanchez', '2025-03-31 20:28:47', NULL, 1, NULL),
(18, 880, 'robinson_fernandez_muÑoz', 'CAVIP014', 'Lsanchez', '2025-03-31 20:30:59', NULL, 1, NULL),
(19, 881, 'nestor_ely_saavedra_enamorado', 'CATP022', 'Lsanchez', '2025-03-31 20:31:36', NULL, 1, NULL),
(20, 882, 'jenncy_carolina_jimenez_villanueva', 'CATP049', 'Lsanchez', '2025-03-31 20:32:08', NULL, 1, NULL),
(21, 883, 'victor_andy_padilla', 'CATP005', 'Lsanchez', '2025-03-31 20:32:51', NULL, 1, NULL),
(22, 886, 'yahely_abigail_guardado_godoy', 'CATP015', 'Lsanchez', '2025-03-31 20:37:35', NULL, 1, NULL),
(23, 887, 'yahely_abigail_guardado_godoy', 'CATP019', 'Lsanchez', '2025-03-31 20:38:14', '2025-04-01 04:39:02', 0, NULL),
(24, 888, 'jessenia_valesca_marquez_inestrosa', 'CATP021', 'Lsanchez', '2025-03-31 20:40:01', NULL, 1, NULL),
(25, 889, 'nineth_claribel_ramirez_enrriquez', 'CATP016', 'Lsanchez', '2025-03-31 20:40:48', NULL, 1, NULL),
(26, 890, 'sindy_mayely_mejia_reyes', 'CATP020', 'Lsanchez', '2025-03-31 20:41:22', NULL, 1, NULL),
(27, 891, 'maria_robertina_rivera_bautista', 'CATP023', 'Lsanchez', '2025-03-31 20:41:56', '2025-04-01 04:42:42', 0, NULL),
(28, 892, 'xiomara_marlene_ramirez_rodriguez', 'CATP026', 'Lsanchez', '2025-03-31 20:43:39', NULL, 1, NULL),
(29, 893, 'margie_xiomara_bonilla_ramirez', 'CATP050', 'Lsanchez', '2025-03-31 20:44:36', NULL, 1, NULL),
(30, 712, 'alex_josue_gutierre_pereira', 'VNTP051', 'Lsanchez', '2025-03-31 20:52:27', NULL, 1, NULL),
(31, 709, 'josselin_argentina_mejia_santos', 'VNTP073', 'Lsanchez', '2025-03-31 20:54:18', NULL, 1, NULL),
(32, 710, 'josselin_argentina_mejia_santos_(2)', 'VNTP074', 'Lsanchez', '2025-03-31 20:55:19', NULL, 1, NULL),
(33, 711, 'adela_noemi_andrade_mejia', 'VNTP048', 'Lsanchez', '2025-03-31 20:57:24', NULL, 1, NULL),
(34, 713, 'christy_marari_bonilla_sorto', 'VNTP064', 'Lsanchez', '2025-03-31 20:59:29', NULL, 1, NULL),
(35, 714, 'yesenia_leticia_enamorado_velasquez', 'VNTP066', 'Lsanchez', '2025-03-31 21:01:22', NULL, 1, NULL),
(36, 715, 'miriam_jamileth_enamorado_manzanares', 'VNTP067', 'Lsanchez', '2025-03-31 21:02:18', NULL, 1, NULL),
(37, 716, 'mirian_esther_gonzales_herrera', 'VNTP055', 'Lsanchez', '2025-03-31 21:07:06', '2025-04-01 21:19:52', 0, NULL),
(38, 718, 'kerly_janneth_martinez_rosales', 'VNTP052', 'Lsanchez', '2025-03-31 21:10:13', NULL, 1, NULL),
(39, 719, 'lidia_beatriz_mena_martinez', 'VNTP072', 'Lsanchez', '2025-03-31 21:13:06', NULL, 1, NULL),
(40, 720, 'gerson_alexander_gallardo_corrales', 'VNTP070', 'Lsanchez', '2025-03-31 21:13:44', NULL, 1, NULL),
(41, 721, 'guillermo_alberto_ramos_hernandez', 'VNTP081', 'Lsanchez', '2025-03-31 21:14:43', NULL, 1, NULL),
(42, 722, 'nelis_victoria_valle_romero', 'VNTP053', 'Lsanchez', '2025-03-31 21:15:20', NULL, 1, NULL),
(43, 723, 'victor_alfonso_avelar_sinclair', 'VNTP054', 'Lsanchez', '2025-03-31 21:15:51', NULL, 1, NULL),
(44, 724, 'juan_ramon_aguilera_quiroz', 'VNTP059', 'Lsanchez', '2025-03-31 21:16:26', NULL, 1, NULL),
(45, 725, 'kenia_yolani_maldonado_mejia', 'VNTP088', 'Lsanchez', '2025-03-31 21:17:48', NULL, 1, NULL),
(46, 726, 'hector_david_chavez_ortega', 'VNTP118', 'Lsanchez', '2025-03-31 21:19:19', NULL, 1, NULL),
(47, 727, 'dilcia_julissa_umanzor_cabrera', 'VNTP023', 'Lsanchez', '2025-03-31 21:21:30', NULL, 1, NULL),
(48, 728, 'iris_mariana_deras_melgar', 'VNTP069', 'Lsanchez', '2025-03-31 21:22:38', NULL, 1, NULL),
(49, 729, 'sergia_nicholl_mejia_ruiz', 'VNTP058', 'Lsanchez', '2025-03-31 21:23:11', NULL, 1, NULL),
(50, 730, 'mayra_patricia_leiva_almendarez', 'VNTP076', 'Lsanchez', '2025-03-31 21:24:11', NULL, 1, NULL),
(51, 731, 'josselyn_amanda_paz_pineda', 'VNTP077', 'Lsanchez', '2025-03-31 21:25:38', NULL, 1, NULL),
(52, 732, 'yessica_jackeline_linares_martinez', 'VNTP075', 'Lsanchez', '2025-03-31 21:26:36', NULL, 1, NULL),
(53, 733, 'erik_andre_aguilera_escalante', 'VNTP093', 'Lsanchez', '2025-03-31 21:27:49', NULL, 1, NULL),
(54, 986, 'andrea_yessenia_aguilar_carcamo', 'LCTPTELA4', 'Lsanchez', '2025-03-31 21:28:57', NULL, 1, NULL),
(55, 988, 'blanca_melissa_zeron_melendez', 'LCTP14JULIO', 'Lsanchez', '2025-03-31 21:31:13', NULL, 1, NULL),
(56, 989, 'dina_elizabeth_alvarez_barahona', 'LCTPTELA3', 'Lsanchez', '2025-03-31 21:31:54', NULL, 1, NULL),
(57, 990, 'dina_elizabeth_alvarez_barahona_(2)', 'LCTPCDTELA', 'Lsanchez', '2025-03-31 21:33:37', NULL, 1, NULL),
(58, 991, 'kerstin_elizabeth_cruz_castro_(3)', 'LCTPLAISLA', 'Lsanchez', '2025-03-31 21:34:14', '2025-04-01 05:36:47', 0, NULL),
(59, 991, 'kerstin_elizabeth_cruz_castro', 'LCTPLAISLA', 'Lsanchez', '2025-03-31 21:37:38', NULL, 1, NULL),
(60, 993, 'kerstin_elizabeth_cruz_castro_(2)', 'LCTPUNION', 'Lsanchez', '2025-03-31 21:38:22', NULL, 1, NULL),
(61, 992, 'kerstin_elizabeth_cruz_castro_(3)', 'LCTPSANISIDRO', 'Lsanchez', '2025-03-31 21:39:21', NULL, 1, NULL),
(62, 994, 'lesly_gabriela_urbina_arias', 'LCTPARIZONA', 'Lsanchez', '2025-03-31 21:40:59', NULL, 1, NULL),
(63, 995, 'dayana_paola_argueta_jimenez', 'LCTPMUNICIPAL', 'Lsanchez', '2025-03-31 21:41:29', NULL, 1, NULL),
(64, 996, 'santos_ernesto_mencia_osorio', 'LCTPSANTAANA', 'Lsanchez', '2025-03-31 21:41:58', NULL, 1, NULL),
(65, 998, 'adriana_yadira_zelaya_canales_(2)', 'LCTPPORVENIR', 'Lsanchez', '2025-03-31 21:45:18', NULL, 1, NULL),
(66, 1000, 'geydyn_lariseth_barrera_chinchilla', 'LCTPSANJUAN3', 'Lsanchez', '2025-03-31 21:47:34', NULL, 1, NULL),
(67, 950, 'samanta_lujan_garcia', 'CHTP013', 'Lsanchez', '2025-03-31 21:54:21', NULL, 1, NULL),
(68, 951, 'antonio_armando_ineztroza', 'CHTP030', 'Lsanchez', '2025-03-31 21:55:57', NULL, 1, NULL),
(69, 952, 'angel_cesar_casco_velasquez', 'CHTP029', 'Lsanchez', '2025-03-31 21:56:36', NULL, 1, NULL),
(70, 953, 'oliver_orley_paz_guillen', 'CHTP007', 'Lsanchez', '2025-03-31 21:57:16', NULL, 1, NULL),
(71, 954, 'hilda_sonia_murillo_gavarrete', 'CHTP011', 'Lsanchez', '2025-03-31 21:58:29', NULL, 1, NULL),
(72, 955, 'carlos_emilio_urias_manchame', 'CHTP006', 'Lsanchez', '2025-03-31 21:59:27', NULL, 1, NULL),
(73, 956, 'selvin_jeovanny_oviedo_maldonado', 'CHTP010', 'Lsanchez', '2025-03-31 22:00:17', NULL, 1, NULL),
(74, 957, 'brayan_samir_hercules_menjivar', 'CHTP019', 'Lsanchez', '2025-03-31 22:01:22', NULL, 1, NULL),
(75, 958, 'brayan_yobany_vargas_martinez', 'CHTP018', 'Lsanchez', '2025-03-31 22:10:54', '2025-04-01 06:11:51', 0, NULL),
(76, 959, 'jose_ramon_rivera_duran', 'CHTP014', 'Lsanchez', '2025-03-31 22:13:58', NULL, 1, NULL),
(77, 960, 'delmer_josue_altamirano_castro', 'CHTP017', 'Lsanchez', '2025-03-31 22:14:33', NULL, 1, NULL),
(78, 1216, 'mercedes_jackeline_roque_recarte', 'GBTPCONCORDIA2', 'Lsanchez', '2025-03-31 22:17:31', NULL, 1, NULL),
(79, 1217, 'mercedes_jackeline_roque_recarte_(2)', 'GBTPESPERANZA', 'Lsanchez', '2025-03-31 22:18:26', NULL, 1, NULL),
(80, 1218, 'ruth_claude_servellon', 'GBTPSOSA', 'Lsanchez', '2025-03-31 22:19:14', NULL, 1, NULL),
(81, 1219, 'ruth_claude_servellon_(2)', 'GBTPPRADUNIVER', 'Lsanchez', '2025-03-31 22:20:03', NULL, 1, NULL),
(82, 1220, 'ingrid_yaneth_zepeda_zelaya', 'GBTPHATO', 'Lsanchez', '2025-03-31 22:20:41', NULL, 1, NULL),
(83, 936, 'ingrid_yaneth_zepeda_zelaya_(2)', 'GBTPVEGA2', 'Lsanchez', '2025-03-31 22:21:18', NULL, 1, NULL),
(84, 1221, 'fany_rosario_matamoros_martinez_(2)', 'GBTPPEDREGAL', 'Lsanchez', '2025-03-31 22:22:00', NULL, 1, NULL),
(85, 1222, 'fany_rosario_matamoros_martinez_(3)', 'GBTPVILLANUEVA', 'Lsanchez', '2025-03-31 22:22:45', NULL, 1, NULL),
(86, 1223, 'dania_idalmina_figueroa_calix', 'GBTPPINOS', 'Lsanchez', '2025-03-31 22:23:17', NULL, 1, NULL),
(87, 1224, 'dania_idalmina_figueroa_calix_(2)', 'GBTPANILLOP2', 'Lsanchez', '2025-03-31 22:23:58', NULL, 1, NULL),
(88, 1162, 'cristian_omar_perez_perez', 'SRTPCOPR1', 'Lsanchez', '2025-04-01 07:54:48', NULL, 1, NULL),
(89, 1163, 'cristian_omar_perez_perez_(2)', 'SRTPCOPR2', 'Lsanchez', '2025-04-01 07:55:33', NULL, 1, NULL),
(90, 1164, 'lesly_patricia_sanabria', 'SRTPCUCUY1', 'Lsanchez', '2025-04-01 07:58:11', NULL, 1, NULL),
(91, 1165, 'lesly_patricia_sanabria_(2)', 'SRTPCUCUY2', 'Lsanchez', '2025-04-01 07:59:03', NULL, 1, NULL),
(92, 1166, 'katherine_nikol_hernandez_aguilar', 'SRTPTERMINAL', 'Lsanchez', '2025-04-01 08:01:59', NULL, 1, NULL),
(93, 1167, 'katherine_nikol_hernandez_aguilar_(2)', 'SRTPSANTAR1', 'Lsanchez', '2025-04-01 08:03:44', NULL, 1, NULL),
(94, 1168, 'katherine_nikol_hernandez_aguilar_(3)', 'SRTPSANTAR2', 'Lsanchez', '2025-04-01 08:04:23', NULL, 1, NULL),
(95, 1170, 'ledby_zurisaday_gomez_manueles', 'SRTPSANJUAN', 'Lsanchez', '2025-04-01 08:06:31', NULL, 1, NULL),
(96, 1171, 'wendy_maricela_lemus', 'SRTPLAENTRADA', 'Lsanchez', '2025-04-01 08:07:53', NULL, 1, NULL),
(97, 1172, 'wendy_maricela_lemus_(2)', 'SRTPENTRADA2', 'Lsanchez', '2025-04-01 08:09:20', NULL, 1, NULL),
(98, 1173, 'wendy_maricela_lemus_(3)', 'SRTPENTRADA3', 'Lsanchez', '2025-04-01 08:10:31', NULL, 1, NULL),
(99, 1174, 'wendy_maricela_lemus_(4)', 'SRTPENTRADA4', 'Lsanchez', '2025-04-01 08:12:23', NULL, 1, NULL),
(100, 1175, 'delmy_nohemy_benitez', 'SRTPGRACIAS1', 'Lsanchez', '2025-04-01 08:13:07', NULL, 1, NULL),
(101, 1126, 'fanny_melissa_maradiaga_amador', 'SETPLIBERTAD', 'Lsanchez', '2025-04-01 08:25:11', NULL, 1, NULL),
(102, 1127, 'fanny_melissa_maradiaga_amador_(2)', 'SETPVALLE', 'Lsanchez', '2025-04-01 08:26:13', NULL, 1, NULL),
(103, 1128, 'carlos_eduardo_hernandez_zepeda', 'SETPCHOLUTECA', 'Lsanchez', '2025-04-01 08:27:07', NULL, 1, NULL),
(104, 1129, 'carlos_eduardo_hernandez_zepeda_(2)', 'SETPCHOLUTECA2', 'Lsanchez', '2025-04-01 08:27:53', NULL, 1, NULL),
(105, 1130, 'carlos_eduardo_hernandez_zepeda_(3)', 'SETPGUADALUPE', 'Lsanchez', '2025-04-01 08:28:48', NULL, 1, NULL),
(106, 1131, 'kathia_yadira_gunera_cruz', 'SETPNACAOME', 'Lsanchez', '2025-04-01 08:29:41', NULL, 1, NULL),
(107, 1132, 'kathia_yadira_gunera_cruz_(2)', 'SETPNACAOME2', 'Lsanchez', '2025-04-01 08:30:34', NULL, 1, NULL),
(108, 1133, 'emilia_roxana_castillo_castillo', 'SETPMONJARAS', 'Lsanchez', '2025-04-01 08:31:31', NULL, 1, NULL),
(109, 1134, 'emilia_roxana_castillo_castillo_(2)', 'SETPMOJARAS2', 'Lsanchez', '2025-04-01 08:32:16', NULL, 1, NULL),
(110, 1135, 'denys_josue_bonilla_martinez', 'SETPLIBERTAD2', 'Lsanchez', '2025-04-01 08:33:59', NULL, 1, NULL),
(111, 1136, 'bayron_josue_zepeda_flores', 'SETPATERRIZAJE', 'Lsanchez', '2025-04-01 08:34:34', NULL, 1, NULL),
(112, 1137, 'jillian_massiel_hernandez_zepeda', 'SETPTRIUNFO', 'Lsanchez', '2025-04-01 08:35:27', NULL, 1, NULL),
(113, 1138, 'jose_roberto_colindres_espinal', 'SETPSANMARCOS', 'Lsanchez', '2025-04-01 08:36:21', NULL, 1, NULL),
(114, 1139, 'karen_nataly_espinal_rivera', 'SETPSLORENZO1', 'Lsanchez', '2025-04-01 08:38:02', NULL, 1, NULL),
(115, 1140, 'walter_rafael_rico_vasquez', 'SETPSLORENZO2', 'Lsanchez', '2025-04-01 08:40:11', NULL, 1, NULL),
(116, 1141, 'nancy_dariela_castro_chavez', 'SETPNACAOME3', 'Lsanchez', '2025-04-01 08:41:34', NULL, 1, NULL),
(117, 1142, 'yuri_vanesy_avila_euceda', 'SETPLANGUE', 'Lsanchez', '2025-04-01 08:49:36', NULL, 1, NULL),
(118, 1143, 'carlos_enrique_ponce', 'SETPSANTAELENA2', 'Lsanchez', '2025-04-01 08:50:33', NULL, 1, NULL),
(119, 1098, 'jose_ramon_muÑoz_membreÑo', 'TLVIP003', 'Lsanchez', '2025-04-01 08:56:36', NULL, 1, NULL),
(120, 1099, 'jorge_david_zelaya_martinez', 'TLVIP001', 'Lsanchez', '2025-04-01 08:57:24', NULL, 1, NULL),
(121, 1100, 'nelson_arony_vasquez_chavez', 'TLVIP004', 'Lsanchez', '2025-04-01 08:58:44', NULL, 1, NULL),
(122, 1101, 'gustavo_adolfo_mercadal', 'TLVIP006', 'Lsanchez', '2025-04-01 08:59:40', NULL, 1, NULL),
(123, 1102, 'luis_renato_flores_zuniga', 'TLTPCAMPAMEN', 'Lsanchez', '2025-04-01 09:00:42', NULL, 1, NULL),
(124, 1103, 'leyla_xiomara_mendez_acosta', 'TLTPJUTICALPA2', 'Lsanchez', '2025-04-01 09:01:34', NULL, 1, NULL),
(125, 1104, 'carlos_constantino_palma_villafranca', 'TLTPJUTICALPA1', 'Lsanchez', '2025-04-01 09:03:28', NULL, 1, NULL),
(126, 1105, 'dimas_samael_vargas_gonzales', 'TLTPCATACAMAS1', 'Lsanchez', '2025-04-01 09:04:18', NULL, 1, NULL),
(127, 1106, 'dunia_lizeth_argueta_hernandez', 'TLTOJUTICALPA3', 'Lsanchez', '2025-04-01 09:09:36', NULL, 1, NULL),
(128, 1107, 'alian_nectali_ramos_gomez', 'TLTPCATACAMAS5', 'Lsanchez', '2025-04-01 09:16:27', NULL, 1, NULL),
(129, 1108, 'alian_nectali_ramos_gomez_(2)', 'TLTPCATACAMAS5', 'Lsanchez', '2025-04-01 09:17:53', NULL, 1, NULL),
(130, 1109, 'carmen_midence_lopez_belquis_del', 'TLTPSESTEBAN', 'Lsanchez', '2025-04-01 09:19:55', NULL, 1, NULL),
(131, 1110, 'francisco_alejandro_hernandez_alonso', 'TLTPCATACAMAS3', 'Lsanchez', '2025-04-01 09:20:38', NULL, 1, NULL),
(132, 1111, 'francisco_alejandro_hernandez_alonso_(2)', 'TLTPCATACAMAS6', 'Lsanchez', '2025-04-01 09:21:59', NULL, 1, NULL),
(133, 1113, 'juan_enrique_centeno_mejia', 'TLTPGUAIMACA', 'Lsanchez', '2025-04-01 09:34:58', NULL, 1, NULL),
(134, 1114, 'mario_rene_cruz', 'TLTPCATACAMAS4', 'Lsanchez', '2025-04-01 09:35:48', NULL, 1, NULL),
(135, 1115, 'rixy_mabel_rodriguez_osorio', 'TLTPSFCLAPAZ', 'Lsanchez', '2025-04-01 09:36:29', NULL, 1, NULL),
(136, 1117, 'ines_alejandra_padilla_erazo', 'TLTPSFCBECERRA', 'Lsanchez', '2025-04-01 09:37:43', NULL, 1, NULL),
(137, 1118, 'maria_celeste_jimenez_marquez', 'TLTOMDELREAL', 'Lsanchez', '2025-04-01 09:38:30', NULL, 1, NULL),
(138, 1119, 'elsy_yojany_cruz_soza', 'TLTPCONCEPCION', 'Lsanchez', '2025-04-01 09:39:08', NULL, 1, NULL),
(139, 1120, 'pedro_daniel_rivera', 'TUCMD001', 'Lsanchez', '2025-04-01 09:40:56', NULL, 1, NULL),
(140, 1121, 'lesly_iliana_guevara_carcamo', 'TLTP009', 'Lsanchez', '2025-04-01 09:43:11', NULL, 1, NULL),
(141, 1122, 'angel_antonio_rubi_morales', 'TLVIP007', 'Lsanchez', '2025-04-01 09:46:54', NULL, 1, NULL),
(142, 1017, 'yeny_nazareth_quiÑonez_turcios', 'SBTPSABA1', 'Lsanchez', '2025-04-01 09:51:32', NULL, 1, NULL),
(143, 1018, 'eva_delcarmen_rosales_rivera', 'SBTPSONAGU1', 'Lsanchez', '2025-04-01 09:52:24', NULL, 1, NULL),
(144, 1019, 'seyla_fabiola_barralaga_rodriguez', 'SBTPSABA2', 'Lsanchez', '2025-04-01 09:53:00', NULL, 1, NULL),
(145, 1020, 'bessy_erceli_sevilla_hernandez', 'SBTPSABA4', 'Lsanchez', '2025-04-01 09:53:50', NULL, 1, NULL),
(146, 1021, 'glenis_aracely_sanchez', 'SBTPPARMA', 'Lsanchez', '2025-04-01 09:57:05', NULL, 1, NULL),
(147, 1022, 'fanny_melissa_guerra_quezada', 'SBTPSONAGU3', 'Lsanchez', '2025-04-01 09:57:42', NULL, 1, NULL),
(148, 1023, 'eskeylin_danelsi_ruiz_herrera', 'SBTPISLETA', 'Lsanchez', '2025-04-01 09:58:57', NULL, 1, NULL),
(149, 1024, 'ian_wegner_morazan_figueroa', 'SBTPSONAGU2', 'Lsanchez', '2025-04-01 09:59:52', NULL, 1, NULL),
(150, 1025, 'franklyn_alberto_ramos', 'SBTPSONAGU4', 'Lsanchez', '2025-04-01 10:00:45', NULL, 1, NULL),
(151, 1026, 'nayeli_givela_martÍnez_pacheco', 'SBTPSABA3', 'Lsanchez', '2025-04-01 10:02:49', NULL, 1, NULL),
(152, 1027, 'kirian_yolibeth_reyes_moreira', 'SBTPCHUSQUERA', 'Lsanchez', '2025-04-01 10:03:39', NULL, 1, NULL),
(153, 1028, 'karla_nicolle_castro_garcia', 'SBTPSABA5', 'Lsanchez', '2025-04-01 10:04:40', NULL, 1, NULL),
(154, 1029, 'rocio_pamela_cartagena', 'SBTPVUEVAE', 'Lsanchez', '2025-04-01 10:05:36', NULL, 1, NULL),
(155, 1030, 'soany_yaribet_bonilla_borjas', 'SBTPELIXIR', 'Lsanchez', '2025-04-01 10:08:08', NULL, 1, NULL),
(156, 1031, 'carmen_georgina_salomon_mendoza', 'SBTPLOMITAS', 'Lsanchez', '2025-04-01 10:09:05', NULL, 1, NULL),
(157, 1032, 'angie_maribel_romero_sanchez', 'SBTP21ABRIL', 'Lsanchez', '2025-04-01 10:11:19', NULL, 1, NULL),
(158, 1033, 'larixa_johana_rodas_mendez', 'SBTPELIXIR2', 'Lsanchez', '2025-04-01 10:12:07', NULL, 1, NULL),
(159, 1034, 'dana_darleny_lopez_soliz(2)', 'SBTPTOMALA', 'Lsanchez', '2025-04-01 10:17:13', NULL, 1, NULL),
(160, 1035, 'olvin_onan_ochoa', 'SBVIP002', 'Lsanchez', '2025-04-01 10:18:36', NULL, 1, NULL),
(161, 1036, 'luis_eliazar_contreras_sevilla', 'SBVIP003', 'Lsanchez', '2025-04-01 10:22:44', NULL, 1, NULL),
(162, 1037, 'dayron_javier_serrano_sanchez', 'SBVIP005', 'Lsanchez', '2025-04-01 10:23:35', NULL, 1, NULL),
(163, 1039, 'elvin_adonay_gonzales_mejia', 'SBVIP006', 'Lsanchez', '2025-04-01 10:26:29', NULL, 1, NULL),
(164, 1040, 'jose_wilson_alvarez_jimenez', 'SBVIP007', 'Lsanchez', '2025-04-01 10:27:26', NULL, 1, NULL),
(165, 1041, 'carlos_edilverto_castro_mendoza', 'TLCMD001', 'Lsanchez', '2025-04-01 10:29:48', NULL, 1, NULL),
(166, 1042, 'elsy_yojani_garcia_portillo', 'SBTP027', 'Lsanchez', '2025-04-01 10:31:10', NULL, 1, NULL),
(167, 1044, 'lariza_yamileth_romero_ocampo', 'SBTP022', 'Lsanchez', '2025-04-01 10:35:28', NULL, 1, NULL),
(168, 1045, 'deysi_maria_artiaga_dueÑas', 'SBTP023', 'Lsanchez', '2025-04-01 10:40:05', NULL, 1, NULL),
(169, 1046, 'dina_yesenia_turcios_castillo', 'SBTP025', 'Lsanchez', '2025-04-01 10:41:38', NULL, 1, NULL),
(170, 1047, 'ever_omiht_cartagena_ordoÑez', 'SBTPPALTO', 'Lsanchez', '2025-04-01 10:42:46', NULL, 1, NULL),
(171, 1048, 'cristhian_yoel_aplicano_velasquez', 'SBVIP009', 'Lsanchez', '2025-04-01 10:52:16', NULL, 1, NULL),
(172, 1049, 'elmer_yasir_gonzales_hernandez', 'SBVIP010', 'Lsanchez', '2025-04-01 10:56:36', '2025-04-01 19:12:10', 0, NULL),
(173, 1352, 'reynaldo_francisco_castillo_cruz', 'GBGRN004', 'Lsanchez', '2025-04-01 12:05:57', '2025-04-01 20:06:52', 0, NULL),
(174, 1335, 'daniel_alexander_callejas_fajardo', 'VNGRN001', 'Lsanchez', '2025-04-01 12:49:14', NULL, 1, NULL),
(175, 1336, 'edder_josue_claros_orellana', 'VNGRN002', 'Lsanchez', '2025-04-01 12:51:27', NULL, 1, NULL),
(176, 1337, 'juan_francisco_villacorta_diaz', 'VNGRN004', 'Lsanchez', '2025-04-01 12:52:54', NULL, 1, NULL),
(177, 1338, 'luis_alonso_urquia_miranda', 'VNGRN005', 'Lsanchez', '2025-04-01 12:53:52', NULL, 1, NULL),
(178, 1339, 'eduardo_cruz_alvarado', 'VNGRN006', 'Lsanchez', '2025-04-01 12:55:41', NULL, 1, NULL),
(179, 1340, 'luis_gerardo_castro', 'VNGRN007', 'Lsanchez', '2025-04-01 12:56:27', NULL, 1, NULL),
(180, 1343, 'abel_doblado__cardoza', 'VNGRN003', 'Lsanchez', '2025-04-01 13:01:14', NULL, 1, NULL),
(181, 1346, 'jose_darwin_ordoÑez_villalta', 'SEGRN001', 'Lsanchez', '2025-04-01 13:06:35', NULL, 1, NULL),
(182, 1347, 'david_orlando_castillo_barahona', 'GBGRN001', 'Lsanchez', '2025-04-01 13:07:30', NULL, 1, NULL),
(183, 1348, 'jose_isaias_hernandez_ordonez', 'GBGRN002', 'Lsanchez', '2025-04-01 13:08:22', NULL, 1, NULL),
(184, 1349, 'wilmer_sanchez_hernandez', 'GBGRN003', 'Lsanchez', '2025-04-01 13:09:35', NULL, 1, NULL),
(185, 1350, 'reynaldo_francisco_castillo_cruz', 'GBGRN004', 'Lsanchez', '2025-04-01 13:10:40', '2025-04-01 21:36:12', 0, NULL),
(186, 1353, 'hernan_mejia_tabora', 'SRGRN001', 'Lsanchez', '2025-04-01 13:13:28', NULL, 1, NULL),
(187, 1354, 'hernan_mejia_tabora', 'SRGRN001', 'Lsanchez', '2025-04-01 13:14:30', NULL, 1, NULL),
(188, 716, 'angel_enrique_valladares_najera', 'TUCMD002', 'Lsanchez', '2025-04-01 13:21:16', NULL, 1, NULL),
(189, 734, 'carlos_roberto_miles_mejia', 'VNTP057', 'Lsanchez', '2025-04-01 13:27:41', '2025-04-01 21:41:50', 0, NULL),
(190, 734, 'carlos_roberto_miles_mejia', 'VNTP057', 'Lsanchez', '2025-04-01 13:43:42', NULL, 1, NULL),
(191, 735, 'rene_arturo_escoto_villeda', 'VNTP089', 'Lsanchez', '2025-04-01 13:47:43', NULL, 1, NULL),
(192, 737, 'tania_sarahi_castillo_enamorado', 'VNTP060', 'Lsanchez', '2025-04-01 13:49:43', NULL, 1, NULL),
(193, 738, 'claudia_patricia_ramos_molina', 'VNTP050', 'Lsanchez', '2025-04-01 13:50:27', NULL, 1, NULL),
(194, 739, 'gabriela_jazmin_amador_pineda', 'VNTP049', 'Lsanchez', '2025-04-01 13:51:10', NULL, 1, NULL),
(195, 740, 'enida_aurora_trejo_varela', 'VNTP012', 'Lsanchez', '2025-04-01 13:52:27', '2025-04-01 21:53:15', 0, NULL),
(196, 741, 'silvia_magdalena_turcios', 'VNTP090', 'Lsanchez', '2025-04-01 13:54:52', '2025-04-01 21:55:29', 0, NULL),
(197, 742, 'lindy_guadalupe_garcia_hernandez', 'VNTP095', 'Lsanchez', '2025-04-01 13:56:47', NULL, 1, NULL),
(198, 743, 'belkis_denissa_ramos_amaya', 'VNTP092', 'Lsanchez', '2025-04-01 13:57:58', NULL, 1, NULL),
(199, 744, 'xiomara_guardado_hernandez', 'VNTP003', 'Lsanchez', '2025-04-01 14:04:19', NULL, 1, NULL),
(200, 745, 'fernando_alonso_rivera_ortiz', 'VNTP098', 'Lsanchez', '2025-04-01 14:05:43', NULL, 1, NULL),
(201, 746, 'carol_patricia_acosta_cantillano', 'VNTP026', 'Lsanchez', '2025-04-01 14:07:25', NULL, 1, NULL),
(202, 747, 'silvia_magdalena_turcios', 'VNTP022', 'Lsanchez', '2025-04-01 14:09:31', NULL, 1, NULL),
(203, 748, 'jeymi_karina_madrid_muÑoz', 'VNTP107', 'Lsanchez', '2025-04-01 14:11:13', NULL, 1, NULL),
(204, 749, 'berta_lidia_rodriguez_sevilla', 'VNTP029', 'Lsanchez', '2025-04-01 14:14:01', NULL, 1, NULL),
(205, 750, 'dorcas_cantillano_aleman', 'VNTP099', 'Lsanchez', '2025-04-01 14:14:58', NULL, 1, NULL),
(206, 751, 'eylyn_danely_lemus_caballero', 'VNTP001', 'Lsanchez', '2025-04-01 14:15:48', NULL, 1, NULL),
(207, 752, 'lourdes_garcia_toro', 'VNTP017', 'Lsanchez', '2025-04-01 14:18:23', NULL, 1, NULL),
(208, 753, 'mayra_efigenia_ventura_delcid', 'VNTP020', 'Lsanchez', '2025-04-01 14:19:14', NULL, 1, NULL),
(209, 754, 'elsa_del_carmen_santos_reyes', 'VNTP047', 'Lsanchez', '2025-04-01 14:20:41', NULL, 1, NULL),
(210, 755, 'bianca_josely_palacios', 'VNTP032', 'Lsanchez', '2025-04-01 14:21:38', NULL, 1, NULL),
(211, 756, 'keyri_odalis_corea_escalante', 'VNTP034', 'Lsanchez', '2025-04-01 14:22:49', NULL, 1, NULL),
(212, 757, 'alex_fernando_sagastume_rios', 'VNTP005', 'Lsanchez', '2025-04-01 14:24:05', NULL, 1, NULL),
(213, 758, 'bayron_josue_caballero_zuniga', 'VNTP009', 'Lsanchez', '2025-04-01 14:26:03', NULL, 1, NULL),
(214, 759, 'keyli_excely_cantllano_hercules', 'VNTP010', 'Lsanchez', '2025-04-01 14:27:21', NULL, 1, NULL),
(215, 760, 'lenny_aracely_martinez_castellon', 'VNTP036', 'Lsanchez', '2025-04-01 14:28:33', NULL, 1, NULL),
(216, 761, 'wendy_diosely_rivera_rivera', 'VNTP040', 'Lsanchez', '2025-04-01 14:29:31', NULL, 1, NULL),
(217, 762, 'claudia_yesenia_zuniga_muÑoz', 'VNTP006', 'Lsanchez', '2025-04-01 14:30:42', NULL, 1, NULL),
(218, 763, 'lourdes_xiomara_madrid(q)', 'VNTP133', 'Lsanchez', '2025-04-01 14:33:13', NULL, 1, NULL),
(219, 764, 'yuni_yulibeth_trochez_sagastume', 'VNTP007', 'Lsanchez', '2025-04-01 14:35:32', NULL, 1, NULL),
(220, 765, 'ever_agenor_arriaga_hernandez', 'VNTP008', 'Lsanchez', '2025-04-01 14:36:07', NULL, 1, NULL),
(221, 766, 'norma_luz_cantillano', 'VNTP097', 'Lsanchez', '2025-04-01 14:37:15', NULL, 1, NULL),
(222, 767, 'juan_carlos_pineda', 'VNTP024', 'Lsanchez', '2025-04-01 14:38:20', NULL, 1, NULL),
(223, 768, 'doris_liliana_de_la_rosa_guevara', 'VNTP091', 'Lsanchez', '2025-04-01 14:41:22', NULL, 1, NULL),
(224, 894, 'franklin_obed_bonilla_castellon', 'CATP055', 'Lsanchez', '2025-04-01 14:43:22', NULL, 1, NULL),
(225, 895, 'vicente_dubon_lopez', 'CATP030', 'Lsanchez', '2025-04-01 14:45:19', NULL, 1, NULL),
(226, 896, 'rony_javier_perdomo_perdomo', 'CATP029', 'Lsanchez', '2025-04-01 14:46:19', NULL, 1, NULL),
(227, 897, 'maira_lopez_vega', 'CATP046', 'Lsanchez', '2025-04-01 14:47:47', NULL, 1, NULL),
(228, 898, 'suamy_fabiola_chavez_diaz', 'CATP031', 'Lsanchez', '2025-04-01 14:48:53', NULL, 1, NULL),
(229, 899, 'keily_marian_escobar_reyes', 'CATP032', 'Lsanchez', '2025-04-01 14:51:04', '2025-04-01 22:52:13', 0, NULL),
(230, 854, 'maryuri_mirieth_lopez_gamez', 'CATP033', 'Lsanchez', '2025-04-01 14:54:36', '2025-04-01 22:55:16', 0, NULL),
(231, 900, 'lidia_aracely_flores_rodriguez', 'CATP034', 'Lsanchez', '2025-04-01 15:03:55', NULL, 1, NULL),
(232, 901, 'isaac_donaire_lopez', 'CATP039', 'Lsanchez', '2025-04-01 15:04:47', NULL, 1, NULL),
(233, 902, 'karla_waleska_urbina_lopez', 'CATP056', 'Lsanchez', '2025-04-01 15:06:11', NULL, 1, NULL),
(234, 903, 'elsa_patricia_romero_erazo', 'CATP058', 'Lsanchez', '2025-04-01 15:07:20', NULL, 1, NULL),
(235, 904, 'nancy_carolina_palacios_hernandez', 'CATP057', 'Lsanchez', '2025-04-01 15:08:14', NULL, 1, NULL),
(236, 905, 'david_jonatan_cantillanos_carcamo', 'CAVIP010', 'Lsanchez', '2025-04-01 15:09:41', NULL, 1, NULL),
(237, 906, 'mainor_rigoberto_puerto_torres', 'CATP035', 'Lsanchez', '2025-04-01 15:10:25', NULL, 1, NULL),
(238, 907, 'jenifer_karina_pavon_ben', 'CATP036', 'Lsanchez', '2025-04-01 15:11:05', NULL, 1, NULL),
(239, 908, 'paula_angelica_lopez_mendez', 'CATP037', 'Lsanchez', '2025-04-01 15:11:50', NULL, 1, NULL),
(240, 909, 'norma_elizabeth_maldonado_osorio', 'CATP041', 'Lsanchez', '2025-04-01 15:12:48', NULL, 1, NULL),
(241, 910, 'cesia_abigail_guerrero_maldonado', 'CATP052', 'Lsanchez', '2025-04-01 15:16:38', NULL, 1, NULL),
(242, 911, 'marlen_enemecia_fuentez_enamorado', 'CATP044', 'Lsanchez', '2025-04-01 15:18:08', NULL, 1, NULL),
(243, 912, 'jessica_cedillos_perez', 'CATP048', 'Lsanchez', '2025-04-01 15:19:07', NULL, 1, NULL),
(250, 1357, 'Lsanchez', 'VNCI001', 'Lsanchez', '2025-04-09 08:39:29', '2025-04-13 04:14:42', 0, 'hoja_250_1744232771.pdf'),
(251, 1358, 'Lsanchez', 'VNGRN001', 'Lsanchez', '2025-04-10 19:50:50', '2025-04-14 01:14:55', 0, NULL),
(252, 1357, 'Lsanchez', 'VNGRN001', 'Lsanchez', '2025-04-12 20:15:11', '2025-04-14 02:23:14', 0, NULL),
(253, 1358, 'Lsanchez', 'VNCI001', 'Lsanchez', '2025-04-13 17:15:50', NULL, 1, NULL);

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
  `id_computadora` int(11) DEFAULT NULL,
  `id_componente` int(11) NOT NULL,
  `planta` varchar(255) NOT NULL,
  `asignado_por` varchar(50) NOT NULL,
  `fecha_asignacion` datetime DEFAULT current_timestamp(),
  `fecha_devolucion` datetime DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `id_usuario` varchar(50) NOT NULL,
  `hoja_firmada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones_componentes`
--

INSERT INTO `asignaciones_componentes` (`id`, `id_computadora`, `id_componente`, `planta`, `asignado_por`, `fecha_asignacion`, `fecha_devolucion`, `activo`, `id_usuario`, `hoja_firmada`) VALUES
(75, 33, 7, '1', 'Lsanchez', '2025-04-07 21:48:28', '2025-04-11 04:30:46', 0, 'Lsanchez', NULL),
(78, 33, 6, '2', 'Lsanchez', '2025-04-10 04:11:30', '2025-04-11 04:30:49', 0, 'Lsanchez', NULL),
(80, 34, 7, '1', 'Lsanchez', '2025-04-11 04:31:37', NULL, 1, 'Lsanchez', NULL),
(81, NULL, 12, '3', 'Lsanchez', '2025-04-11 05:16:34', '2025-04-11 23:47:51', 0, 'nayely_ayala', NULL),
(82, 34, 6, '1', 'Lsanchez', '2025-04-11 23:42:55', '2025-04-14 16:13:51', 0, 'Lsanchez', NULL),
(83, NULL, 12, '1', 'Lsanchez', '2025-04-11 23:50:31', NULL, 1, 'Lsanchez', NULL),
(84, NULL, 14, '5', 'Lsanchez', '2025-04-12 17:51:47', NULL, 1, 'Lsanchez', NULL),
(85, NULL, 9, '2', 'Lsanchez', '2025-04-13 03:48:22', '2025-04-13 03:48:34', 0, 'Lsanchez', NULL);

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
  `observaciones` text DEFAULT NULL,
  `hoja_firmada` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaciones_computadora`
--

INSERT INTO `asignaciones_computadora` (`id`, `id_computadora`, `id_usuario`, `planta`, `asignado_por`, `fecha_asignacion`, `fecha_devolucion`, `activo`, `causa_solicitud`, `procedencia`, `observaciones`, `hoja_firmada`) VALUES
(6, 33, 'nayely_ayala', '1', 'Lsanchez', '2025-04-12 19:56:46', '2025-04-14 03:41:34', 0, '', '', '', NULL),
(7, 34, 'Lsanchez', '3', 'Lsanchez', '2025-04-12 19:57:01', '2025-04-14 03:40:48', 0, '', '', '', NULL),
(8, 33, 'nayely_ayala', '4', 'Lsanchez', '2025-04-13 19:42:28', '2025-04-14 03:42:54', 0, '', '', '', NULL),
(9, 34, 'Lsanchez', '6', 'Lsanchez', '2025-04-13 19:42:39', NULL, 1, '', '', '', NULL);

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
  `id_tipo` int(11) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `fecha_vencimiento_garantia` date DEFAULT NULL,
  `proveedor_garantia` varchar(100) DEFAULT NULL,
  `N_garantia` varchar(50) DEFAULT NULL,
  `garantia_archivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `componentes`
--

INSERT INTO `componentes` (`id`, `serial`, `modelo`, `id_marca`, `estado_id`, `ubicacion`, `asignada`, `id_tipo`, `fecha_compra`, `fecha_vencimiento_garantia`, `proveedor_garantia`, `N_garantia`, `garantia_archivo`) VALUES
(6, 'MON456789', 'UltraSharp 27', 3, 1, 'Almacén IT', 0, 13, '2025-01-01', '2025-04-15', 'Acosa', 'Nt333-7', NULL),
(7, 'MSE112233', 'M185', 3, 1, '1', 1, 7, '2025-03-01', '2025-04-10', 'Dell', 'Nhur45-4', NULL),
(8, 'KBD445566', 'K120', 6, 1, 'Almacén IT', 0, 2, '2025-04-01', '2025-04-06', 'Dell', 'N-3r34', NULL),
(9, 'PRJ564738', 'EB-X41', 4, 1, 'Almacén IT', 0, 15, NULL, NULL, NULL, NULL, NULL),
(10, 'MON456788', 'SP3f33', 5, 1, '2', 1, 1, NULL, NULL, NULL, NULL, NULL),
(11, '9876543210', 'HP LASERJET PRO', 1, 1, 'Almacén IT', 0, 16, NULL, NULL, NULL, NULL, NULL),
(12, 'ABC123456', 'Toyota Corolla 2023', 7, 1, '1', 1, 17, NULL, NULL, NULL, NULL, NULL),
(13, 'MB123456789', 'MOCHILA EXECUTIVE', 8, 1, 'Almacén IT', 0, 18, NULL, NULL, NULL, NULL, NULL),
(14, 'CAR-TOY-8899', 'Hilux 4x4', 7, 1, '5', 1, 17, NULL, NULL, NULL, NULL, NULL),
(15, 'ZC10L-2024-0001', 'ZC10L', 9, 1, 'Almacén IT', 0, 20, NULL, NULL, NULL, NULL, NULL);

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
  `N_garantia` varchar(50) NOT NULL,
  `garantia_archivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `computadoras`
--

INSERT INTO `computadoras` (`id`, `serial`, `modelo`, `id_marca`, `id_tipo`, `disco`, `ram`, `procesador`, `sistema_operativo`, `estado_actual`, `ubicacion`, `asignada`, `anio`, `fecha_compra`, `fecha_vencimiento_garantia`, `proveedor_garantia`, `N_garantia`, `garantia_archivo`) VALUES
(33, '3DKPT43', 'INSPIRON 3493', 3, 1, '256 SDD', '16.0 GB', 'I3-1005G1', 'WINDOWS 11', 4, 'Almacén de IT', 0, 2015, '2025-02-01', '2025-05-02', 'Dell', '23', 'CONTROL DE ACTIVIDADES REALIZADAS EN LA EMPRESA.pdf'),
(34, '3DKPT44', 'LAPTITUP 2530', 3, 2, '256 GB SSD', '16', 'intelcore i 3', 'WINDOWS 11', 1, '6', 1, 2022, NULL, NULL, '', '', NULL);

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
(9, 'IT'),
(4, 'Practica'),
(8, 'VENTAS');

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
(2, 'TRANSCASA'),
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
(4, 'Rescatada', 1),
(5, 'Revisión', 0),
(6, 'Obsoleta', 0),
(8, 'Robada', 0),
(14, 'Dañada', 0);

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
(1, 'USA3YKA22100967', 'Mantenimiento', '', 'Lsanchez', '2025-04-01 02:42:27'),
(2, 'USA3YKA22102407', 'DAÑADA', '', 'Lsanchez', '2025-04-01 03:11:05'),
(3, 'USA3YKA22102059', 'Dañada', '', 'Lsanchez', '2025-04-01 03:46:59'),
(4, 'USA3YKA22102061', 'Dañada', '', 'Lsanchez', '2025-04-01 03:47:47'),
(5, 'USA3YKA22102407', 'Dañada', '', 'Lsanchez', '2025-04-01 03:51:00'),
(6, 'USA3YKA22101059', 'Dañada', '', 'Lsanchez', '2025-04-01 04:11:24'),
(7, 'USAGTKA23091403', 'Mantenimiento', '', 'Lsanchez', '2025-04-01 18:06:40'),
(8, 'USA3YKA22101155', 'Dañada', '', 'Lsanchez', '2025-04-01 20:51:55'),
(9, 'USA3YKA22101156', 'Dañada', '', 'Lsanchez', '2025-04-01 20:55:05'),
(10, '09090909', 'Rescatada', '', 'Lsanchez', '2025-04-14 16:29:32');

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

--
-- Volcado de datos para la tabla `historial_estados_componentes`
--

INSERT INTO `historial_estados_componentes` (`id`, `serial`, `nuevo_estado`, `comentario`, `usuario`, `fecha`) VALUES
(7, 'ABC123456', '2', '', 'Lsanchez', '2025-04-11 21:48:23'),
(8, 'ABC123456', '1', '', 'Lsanchez', '2025-04-11 21:49:58'),
(9, 'MON456789', '14', 'No funciona', 'Lsanchez', '2025-04-14 16:54:30'),
(12, 'MON456789', '1', 'Reparada', 'Lsanchez', '2025-04-14 16:54:52');

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
(1, '3DKPT43', '4', 'Equipo reparado', 'Lsanchez', '2025-04-14 16:51:07');

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
  `N_garantia` varchar(50) NOT NULL,
  `garantia_archivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `impresoras`
--

INSERT INTO `impresoras` (`id`, `serial`, `modelo`, `id_marca`, `id_tipo`, `estado_actual`, `asignada`, `ubicacion`, `fecha_compra`, `fecha_vencimiento_garantia`, `proveedor_garantia`, `N_garantia`, `garantia_archivo`) VALUES
(709, 'USA3YKA22102338', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP073', NULL, NULL, '', '', NULL),
(710, 'USA3YKA22102467', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP074', NULL, NULL, '', '', NULL),
(711, 'USA3YKA22100333', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP048', NULL, NULL, '', '', NULL),
(712, 'USA3YKA22102405', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP051', NULL, NULL, '', '', NULL),
(713, 'USA3YKA22102331', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP064', NULL, NULL, '', '', NULL),
(714, 'USA3YKA22102332', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP066', NULL, NULL, '', '', NULL),
(715, 'USA3YKA22100323', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP067', NULL, NULL, '', '', NULL),
(716, 'USA3YKA22101084', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TUCMD002', NULL, NULL, '', '', NULL),
(717, 'USA3YKA22102440', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(718, 'USA3YKA22102407', 'Bixolom SPP-210', 1, 1, 'Dañada', 1, 'VNTP052', NULL, NULL, '', '', NULL),
(719, 'USA3YKA22102403', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP072', NULL, NULL, '', '', NULL),
(720, 'USA3YKA22101332', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP070', NULL, NULL, '', '', NULL),
(721, 'USA3YKA22100336', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP081', NULL, NULL, '', '', NULL),
(722, 'USA3YKA22102335', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP053', NULL, NULL, '', '', NULL),
(723, 'USA3YKA22100335', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP054', NULL, NULL, '', '', NULL),
(724, 'USA3YKA22100334', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP059', NULL, NULL, '', '', NULL),
(725, 'USA3YKA22100325', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP088', NULL, NULL, '', '', NULL),
(726, 'USA3YKA22101083', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP118', NULL, NULL, '', '', NULL),
(727, 'USA3YKA22101086', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP023', NULL, NULL, '', '', NULL),
(728, 'USA3YKA22100328', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP069', NULL, NULL, '', '', NULL),
(729, 'USA3YKA22100330', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP058', NULL, NULL, '', '', NULL),
(730, 'USA3YKA22100313', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP076', NULL, NULL, '', '', NULL),
(731, 'USA3YKA22102339', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP077', NULL, NULL, '', '', NULL),
(732, 'USA3YKA22102438', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP075', NULL, NULL, '', '', NULL),
(733, 'USA3YKA22021083', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP093', NULL, NULL, '', '', NULL),
(734, 'USA3YKA22100318', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP057', NULL, NULL, '', '', NULL),
(735, 'USA3YKA22102455', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP089', NULL, NULL, '', '', NULL),
(736, 'USA3YKA22102337', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(737, 'USA3YKA22102340', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP060', NULL, NULL, '', '', NULL),
(738, 'USA3YKA22100319', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP050', NULL, NULL, '', '', NULL),
(739, 'USA3YKA22100332', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP049', NULL, NULL, '', '', NULL),
(740, 'USA3YKA22102449', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(741, 'USA3YKA22102329', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(742, 'USA3YKA22102336', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP095', NULL, NULL, '', '', NULL),
(743, 'USA3YKA22102333', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP092', NULL, NULL, '', '', NULL),
(744, 'USA3YKA22102401', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP003', NULL, NULL, '', '', NULL),
(745, 'USA3YKA22100329', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP098', NULL, NULL, '', '', NULL),
(746, 'USA3YKA22102410', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP026', NULL, NULL, '', '', NULL),
(747, 'USA3YKA19082551', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP022', NULL, NULL, '', '', NULL),
(748, 'USA3YKA22100331', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP107', NULL, NULL, '', '', NULL),
(749, 'USA3YKA22101054', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP029', NULL, NULL, '', '', NULL),
(750, 'USA3YKA22102433', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP099', NULL, NULL, '', '', NULL),
(751, 'USA3YKA22102490', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP001', NULL, NULL, '', '', NULL),
(752, 'USA3YKA22102428', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP017', NULL, NULL, '', '', NULL),
(753, 'USA3YKA22102435', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP020', NULL, NULL, '', '', NULL),
(754, 'USA3YKA22102402', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP047', NULL, NULL, '', '', NULL),
(755, 'USA3YKA22102330', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP032', NULL, NULL, '', '', NULL),
(756, 'USA3YKA22102492', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP034', NULL, NULL, '', '', NULL),
(757, 'USA3YKA22100327', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP005', NULL, NULL, '', '', NULL),
(758, 'USA3YKA22102465', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP009', NULL, NULL, '', '', NULL),
(759, 'USA3YKA22102470', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP010', NULL, NULL, '', '', NULL),
(760, 'USA3YKA22100326', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP036', NULL, NULL, '', '', NULL),
(761, 'USA3YKA22102513', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP040', NULL, NULL, '', '', NULL),
(762, 'USA3YKA22102517', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP006', NULL, NULL, '', '', NULL),
(763, 'USA3YKA22102437', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP133', NULL, NULL, '', '', NULL),
(764, 'USA3YKA22102487', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP007', NULL, NULL, '', '', NULL),
(765, 'USA3YKA22102454', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP008', NULL, NULL, '', '', NULL),
(766, 'USA3YKA22102436', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP097', NULL, NULL, '', '', NULL),
(767, 'USA3YKA22102406', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP024', NULL, NULL, '', '', NULL),
(768, 'USA3YKA22102495', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'VNTP091', NULL, NULL, '', '', NULL),
(769, 'USA3YKA22100324', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(770, 'USA3YKA22102485', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(771, 'USA3YKA22102450', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(772, 'USA3YKA22102404', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(773, 'USA3YKA22100315', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(774, 'USA3YKA22102439', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(775, 'USA3YKA22102489', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(776, 'USA3YKA22101066', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(777, 'USA3YKA22102444', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(778, 'USA3YKA22101088', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(779, 'USA3YKA22101073', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(780, 'USA3YKA22101319', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(781, 'USA3YKA22101068', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(782, 'USA3YKA22102367', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(783, 'USA3YKA22102459', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(784, 'USA3YKA22102334', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(785, 'USA3YKA22102496', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(786, 'USA3YKA22102488', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(787, 'USA3YKA22102430', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(788, 'USA3YKA22102426', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(789, 'USA3YKA22102460', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(790, 'USA3YKA22102486', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(791, 'USA3YKA22102458', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(792, 'USA3YKA22102456', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(793, 'USA3YKA22102457', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(794, 'USA3YKA22102431', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(795, 'USA3YKA22102443', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(796, 'USA3YKA22102484', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(797, 'USA3YKA22102478', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(798, 'USA3YKA22102477', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(799, 'USA3YKA22102429', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(800, 'USA3YKA22102427', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(801, 'USA3YKA22102425', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(802, 'USA3YKA22102432', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(803, 'USA3YKA22102434', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(804, 'USA3YKA22102483', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(805, 'USA3YKA22102482', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(806, 'USA3YKA22102481', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(807, 'USA3YKA22102476', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(808, 'USA3YKA22102475', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(809, 'USA3YKA22102474', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(810, 'USA3YKA22102473', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(811, 'USA3YKA22102479', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(812, 'USA3YKA22102480', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(813, 'USA3YKA19082546', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(814, 'USA3YKA19082544', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(815, 'USA3YKA19082545', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(816, 'USA3YKA19082543', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(817, 'USA3YKA22102547', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(818, 'USA3YKA22102548', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(819, 'USA3YKA19082549', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(820, 'USA3YKA19082542', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(821, 'USA3YKA19082541', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(822, 'USA3YKA19082552', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(823, 'USA3YKA22102409', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(824, 'USA3YKA22102494', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(825, 'USA3YKA22102442', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(826, 'USA3YKA22102493', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(827, 'USA3YKA22021081', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(828, 'USA3YKA22100317', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(829, 'USA3YKA22102469', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(830, 'USA3YKA22102472', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(831, 'USA3YKA22102462', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(832, 'USA3YKA22102461', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(833, 'USA3YKA22100320', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(834, 'USA3YKA22102466', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(835, 'USA3YKA22102468', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(836, 'USA3YKA22102463', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(837, 'USA3YKA22102452', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(838, 'USA3YKA22102491', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(839, 'USA3YKA22102451', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(840, 'USA3YKA22101081', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(841, 'USA3YKA22021075', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(842, 'USA3YKA22102471', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(843, 'USA3YKA22102453', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(844, 'USA3YKA22100879', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(845, 'USA3YKA22100873', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(846, 'USA3YKA22100866', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(847, 'USA3YKA22101026', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(848, 'USA3YKA19082550', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(849, 'USA3YKA22100877', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(850, 'USA3YKA22100884', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(851, 'USA3YKA22100883', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(852, 'USA3YKA22101112', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(853, 'USA3YKA22101141', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(854, 'USA3YKA22101156', 'Bixolom SPP-210', 1, 1, 'Dañada', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(855, 'USA3YKA22100867', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(856, 'USA3YKA22100868', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(857, 'USA3YKA22100821', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(858, 'USA3YKA22100822', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(859, 'USA3YKA22032606', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(860, 'USA3YKA22032605', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(861, 'USA3YKA22101261', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP002', NULL, NULL, '', '', NULL),
(862, 'USA3YKA22101262', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP003', NULL, NULL, '', '', NULL),
(863, 'USA3YKA22101263', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP007', NULL, NULL, '', '', NULL),
(864, 'USA3YKA22101265', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP009', NULL, NULL, '', '', NULL),
(865, 'USA3YKA22101266', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP059', NULL, NULL, '', '', NULL),
(866, 'USA3YKA22101267', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP010', NULL, NULL, '', '', NULL),
(867, 'USA3YKA22101268', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP013', NULL, NULL, '', '', NULL),
(868, 'USA3YKA22101269', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP014', NULL, NULL, '', '', NULL),
(869, 'USA3YKA22101270', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(870, 'USA3YKA22101271', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP017', NULL, NULL, '', '', NULL),
(871, 'USA3YKA22101272', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP024', NULL, NULL, '', '', NULL),
(872, 'USA3YKA22101201', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP025', NULL, NULL, '', '', NULL),
(873, 'USA3YKA22101202', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(874, 'USA3YKA22101203', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP050', NULL, NULL, '', '', NULL),
(875, 'USA3YKA22101205', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP001', NULL, NULL, '', '', NULL),
(876, 'USA3YKA22101206', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP004', NULL, NULL, '', '', NULL),
(877, 'USA3YKA22101207', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP006', NULL, NULL, '', '', NULL),
(878, 'USA3YKA22101208', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP012', NULL, NULL, '', '', NULL),
(879, 'USA3YKA22101209', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP054', NULL, NULL, '', '', NULL),
(880, 'USA3YKA22101210', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CAVIP014', NULL, NULL, '', '', NULL),
(881, 'USA3YKA22101211', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP022', NULL, NULL, '', '', NULL),
(882, 'USA3YKA22101204', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP049', NULL, NULL, '', '', NULL),
(883, 'USA3YKA22100961', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP005', NULL, NULL, '', '', NULL),
(884, 'USA3YKA22102052', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(885, 'USA3YKA22100962', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(886, 'USA3YKA22100963', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP015', NULL, NULL, '', '', NULL),
(887, 'USA3YKA22101250', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(888, 'USA3YKA22100964', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP021', NULL, NULL, '', '', NULL),
(889, 'USA3YKA22100965', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP016', NULL, NULL, '', '', NULL),
(890, 'USA3YKA22100966', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP020', NULL, NULL, '', '', NULL),
(891, 'USA3YKA22100967', 'Bixolom SPP-210', 1, 1, 'Mantenimiento', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(892, 'USA3YKA22100968', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP026', NULL, NULL, '', '', NULL),
(893, 'USA3YKA22100969', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP050', NULL, NULL, '', '', NULL),
(894, 'USA3YKA22100970', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP055', NULL, NULL, '', '', NULL),
(895, 'USA3YKA22100971', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP030', NULL, NULL, '', '', NULL),
(896, 'USA3YKA22100972', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP029', NULL, NULL, '', '', NULL),
(897, 'USA3YKA22101153', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP046', NULL, NULL, '', '', NULL),
(898, 'USA3YKA22101154', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP031', NULL, NULL, '', '', NULL),
(899, 'USA3YKA22101155', 'Bixolom SPP-210', 1, 1, 'Dañada', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(900, 'USA3YKA22101157', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP034', NULL, NULL, '', '', NULL),
(901, 'USA3YKA22101158', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP039', NULL, NULL, '', '', NULL),
(902, 'USA3YKA22101159', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP056', NULL, NULL, '', '', NULL),
(903, 'USA3YKA22101160', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP058', NULL, NULL, '', '', NULL),
(904, 'USA3YKA22101161', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP057', NULL, NULL, '', '', NULL),
(905, 'USA3YKA22101162', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CAVIP010', NULL, NULL, '', '', NULL),
(906, 'USA3YKA22101163', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP035', NULL, NULL, '', '', NULL),
(907, 'USA3YKA22101249', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP036', NULL, NULL, '', '', NULL),
(908, 'USA3YKA22101076', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP037', NULL, NULL, '', '', NULL),
(909, 'USA3YKA22101251', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP041', NULL, NULL, '', '', NULL),
(910, 'USA3YKA22101252', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP052', NULL, NULL, '', '', NULL),
(911, 'USA3YKA22101253', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP044', NULL, NULL, '', '', NULL),
(912, 'USA3YKA22101254', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CATP048', NULL, NULL, '', '', NULL),
(913, 'USA3YKA22101255', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(914, 'USA3YKA22101256', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(915, 'USA3YKA22101257', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(916, 'USA3YKA22101258', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(917, 'USA3YKA22101259', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(918, 'USA3YKA22101260', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(919, 'USA3YKA22102041', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(920, 'USA3YKA22102042', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(921, 'USA3YKA22102043', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(922, 'USA3YKA22102044', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(923, 'USA3YKA22102045', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(924, 'USA3YKA22102046', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(925, 'USA3YKA22102047', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(926, 'USA3YKA22102048', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(927, 'USA3YKA22102049', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(928, 'USA3YKA22102050', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(929, 'USA3YKA22102051', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(930, 'USA3YKA22101264', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(931, 'USA3YKA22101164', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(932, 'USA3YKA22101212', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(933, 'USA3YKA22101075', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(934, 'USA3YKA22101301', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(935, 'USA3YKA22101067', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(936, 'USA3YKA22101008', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPVEGA2', NULL, NULL, '', '', NULL),
(937, 'USA3YKA22100999', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(938, 'USA3YKA22101341', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(939, 'USA3YKA22100870', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(940, 'USA3YKA22100888', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(941, 'USA3YKA22100880', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(942, 'USA3YKA22100865', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(943, 'USA3YKA22100876', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(944, 'USA3YAKAA100875', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(945, 'USA3YKA22100869', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(946, 'USA3YKA22100874', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(947, 'USA3YKA22032608', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(948, 'USA3YKA22032613', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(949, 'USA3YKA22032672', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(950, 'USA3YKA22101321', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP013', NULL, NULL, '', '', NULL),
(951, 'USA3YKA22101322', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP030', NULL, NULL, '', '', NULL),
(952, 'USA3YKA22101323', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP029', NULL, NULL, '', '', NULL),
(953, 'USA3YKA22101324', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP007', NULL, NULL, '', '', NULL),
(954, 'USA3YKA22101325', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP011', NULL, NULL, '', '', NULL),
(955, 'USA3YKA22101326', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP006', NULL, NULL, '', '', NULL),
(956, 'USA3YKA22101327', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP010', NULL, NULL, '', '', NULL),
(957, 'USA3YKA22101330', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP019', NULL, NULL, '', '', NULL),
(958, 'USA3YKA22101059', 'Bixolom SPP-210', 1, 1, 'Dañada', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(959, 'USA3YKA22101331', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP014', NULL, NULL, '', '', NULL),
(960, 'USA3YKA22101032', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'CHTP017', NULL, NULL, '', '', NULL),
(961, 'USA3YKA22102038', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(962, 'USA3YKA22101329', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(963, 'USA3YKA22102029', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(964, 'USA3YKA22102030', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(965, 'USA3YKA22102031', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(966, 'USA3YKA22102032', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(967, 'USA3YKA22102033', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(968, 'USA3YKA22102034', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(969, 'USA3YKA22102035', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(970, 'USA3YKA22102036', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(971, 'USA3YKA22102037', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(972, 'USA3YKA22101077', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(973, ' USA3YKA22101078', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(974, 'USA3YKA22101344', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(975, 'USA3YKA22101053', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(976, 'USA3YKA22101178', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(977, 'USA3YKA22100887', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(978, 'USA3YKA22100878', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(979, 'USA3YKA22101107', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(980, 'USA3YKA22101109', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(981, 'USA3YKA22101177', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(982, 'USA3YKA22101180', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(983, 'USA3YKA22101328', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(984, 'USA3YKA22101070', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(985, 'USA3YKA22101179', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(986, 'USA3YKA22102093', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPTELA4', NULL, NULL, '', '', NULL),
(987, 'USA3YKA22102083', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(988, 'USA3YKA22102084', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTP14JULIO', NULL, NULL, '', '', NULL),
(989, 'USA3YKA22102085', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPTELA3', NULL, NULL, '', '', NULL),
(990, 'USA3YKA22102086', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPCDTELA', NULL, NULL, '', '', NULL),
(991, 'USA3YKA22102053', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPLAISLA', NULL, NULL, '', '', NULL),
(992, 'USA3YKA22102087', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPSANISIDRO', NULL, NULL, '', '', NULL),
(993, 'USA3YKA22102088', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPUNION', NULL, NULL, '', '', NULL),
(994, 'USA3YKA22102054', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPARIZONA', NULL, NULL, '', '', NULL),
(995, 'USA3YKA22102055', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPMUNICIPAL', NULL, NULL, '', '', NULL),
(996, 'USA3YKA22102056', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPSANTAANA', NULL, NULL, '', '', NULL),
(997, 'USA3YKA22102057', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(998, 'USA3YKA22102060', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'LCTPPORVENIR', NULL, NULL, '', '', NULL),
(999, 'USA3YKA22102059', 'Bixolom SPP-210', 1, 1, 'Dañada', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1000, 'USA3YKA22102061', 'Bixolom SPP-210', 1, 1, 'Dañada', 1, 'LCTPSANJUAN3', NULL, NULL, '', '', NULL),
(1001, 'USA3YKA22102063', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1002, 'USA3YKA22102064', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1003, 'USA3YKA22102089', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1004, 'USA3YKA22102090', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1005, 'USA3YKA22102091', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1006, 'USA3YKA22102092', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1007, 'USA3YKA22102094', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1008, 'USA3YKA22102095', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1009, 'USA3YKA22102096', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1010, 'USA3YKA22102097', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1011, 'USA3YKA22102058', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1012, 'USA3YKA22100925', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1013, 'USA3YKA22101288', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1014, 'USA3YKA22101128', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1015, 'USA3YKA22101127', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1016, 'USA3YKA22101287', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1017, 'USA3YKA22101170', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSABA1', NULL, NULL, '', '', NULL),
(1018, 'USA3YKA22100988', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSONAGU1', NULL, NULL, '', '', NULL),
(1019, 'USA3YKA22100992', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSABA2', NULL, NULL, '', '', NULL),
(1020, 'USA3YKA22100991', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSABA4', NULL, NULL, '', '', NULL),
(1021, 'USA3YKA22101168', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPPARMA', NULL, NULL, '', '', NULL),
(1022, 'USA3YKA22100995', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSONAGU3', NULL, NULL, '', '', NULL),
(1023, 'USA3YKA22100987', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPISLETA', NULL, NULL, '', '', NULL),
(1024, 'USA3YKA22100994', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSONAGU2', NULL, NULL, '', '', NULL),
(1025, 'USA3YKA22101334', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSONAGU4', NULL, NULL, '', '', NULL),
(1026, 'USA3YKA22101335', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSABA3', NULL, NULL, '', '', NULL),
(1027, 'USA3YKA22100985', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPCHUSQUERA', NULL, NULL, '', '', NULL),
(1028, 'USA3YKA22102106', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPSABA5', NULL, NULL, '', '', NULL),
(1029, 'USA3YKA22102107', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPVUEVAE', NULL, NULL, '', '', NULL),
(1030, 'USA3YKA22101226', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPELIXIR', NULL, NULL, '', '', NULL),
(1031, 'USA3YKA22101227', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPLOMITAS', NULL, NULL, '', '', NULL),
(1032, 'USA3YKA22101232', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTP21ABRIL', NULL, NULL, '', '', NULL),
(1033, 'USA3YKA22101235', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPELIXIR2', NULL, NULL, '', '', NULL),
(1034, 'USA3YKA22101236', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPTOMALA', NULL, NULL, '', '', NULL),
(1035, 'USA3YKA22102077', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBVIP002', NULL, NULL, '', '', NULL),
(1036, 'USA3YKA22101174', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBVIP003', NULL, NULL, '', '', NULL),
(1037, 'USA3YKA22101173', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBVIP005', NULL, NULL, '', '', NULL),
(1038, 'USA3YKA22100986', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1039, 'USA3YKA22100993', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBVIP006', NULL, NULL, '', '', NULL),
(1040, 'USA3YKA22100990', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBVIP007', NULL, NULL, '', '', NULL),
(1041, 'USA3YKA22102082', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLCMD001', NULL, NULL, '', '', NULL),
(1042, 'USA3YKA22100936', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTP027', NULL, NULL, '', '', NULL),
(1043, 'USA3YKA22100935', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1044, 'USA3YKA22100934', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTP022', NULL, NULL, '', '', NULL),
(1045, 'USA3YKA22100933', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTP023', NULL, NULL, '', '', NULL),
(1046, 'USA3YKA22100929', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTP025', NULL, NULL, '', '', NULL),
(1047, 'USA3YKA22102074', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBTPPALTO', NULL, NULL, '', '', NULL),
(1048, 'USA3YKA00102081', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SBVIP009', NULL, NULL, '', '', NULL),
(1049, 'USA3YKA22102078', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1050, 'USA3YKA22100989', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1051, 'USA3YKA22101336', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1052, 'USA3YKA22100996', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1053, 'USA3YKA22101230', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1054, 'USA3YKA22100951', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1055, 'USA3YKA22100054', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1056, 'USA3YKA22100950', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1057, 'USA3YKA22100953', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1058, 'USA3YKA22100957', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1059, 'USA3YKA22100949', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1060, 'USA3YKA22101231', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1061, 'USA3YKA22101228', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1062, 'USA3YKA22101233', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1063, 'USA3YKA22101234', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1064, 'USA3YKA22101229', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1065, 'USA3YKA22100958', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1066, 'USA3YKA22102108', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1067, 'USA3YKA22102109', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1068, 'USA3YKA22102105', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1069, 'USA3YKA22102111', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1070, 'USA3YKA22102110', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1071, 'USA3YKA22101167', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1072, 'USA3YKA22101166', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1073, 'USA3YKA22101333', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1074, 'USA3YKA22101169', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1075, 'USA3YKA22102098', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1076, 'USA3YKA22101171', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1077, 'USA3YKA22102100', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1078, 'USA3YKA22102062', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1079, 'USA3YKA22102099', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1080, 'USA3YKA22101175', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1081, 'USA3YKA22101172', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1082, 'USA3YKA22102112', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1083, 'USA3YKA22101165', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1084, 'USA3YKA22102080', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1085, 'USA3YKA22100930', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1086, 'USA3YKA22101187', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1087, 'USA3YKA22101186', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1088, 'USA3YKA22101185', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1089, 'USA3YKA22101082', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1090, 'USA3YKA22101188', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1091, 'USA3YKA22100931', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1092, 'USA3YKA22101146', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1093, 'USA3YKA22101150', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1094, 'USA3YKA22101151', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1095, 'USA3YKA22101149', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1096, 'USA3YKA22101145', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1097, 'USA3YKA22101320', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1098, 'USA3YKA22101273', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLVIP003', NULL, NULL, '', '', NULL),
(1099, 'USA3YKA22101274', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLVIP001', NULL, NULL, '', '', NULL),
(1100, 'USA3YKA22101275', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLVIP004', NULL, NULL, '', '', NULL),
(1101, 'USA3YKA22101276', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLVIP006', NULL, NULL, '', '', NULL),
(1102, 'USA3YKA22101277', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCAMPAMEN', NULL, NULL, '', '', NULL),
(1103, 'USA3YKA22101278', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPJUTICALPA2', NULL, NULL, '', '', NULL),
(1104, 'USA3YKA22101279', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPJUTICALPA1', NULL, NULL, '', '', NULL),
(1105, 'USA3YKA22101280', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCATACAMAS1', NULL, NULL, '', '', NULL),
(1106, 'USA3YKA22101281', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTOJUTICALPA3', NULL, NULL, '', '', NULL),
(1107, 'USA3YKA22101283', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCATACAMAS5', NULL, NULL, '', '', NULL),
(1108, 'USA3YKA22101282', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCATACAMAS5', NULL, NULL, '', '', NULL),
(1109, 'USA3YKA22101284', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPSESTEBAN', NULL, NULL, '', '', NULL),
(1110, 'USA3YKA22101317', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCATACAMAS3', NULL, NULL, '', '', NULL),
(1111, 'USA3YKA22101318', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCATACAMAS6', NULL, NULL, '', '', NULL),
(1112, 'USA3YKA22101316', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1113, 'USA3YKA22101309', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPGUAIMACA', NULL, NULL, '', '', NULL),
(1114, 'USA3YKA22101315', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCATACAMAS4', NULL, NULL, '', '', NULL),
(1115, 'USA3YKA22101314', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPSFCLAPAZ', NULL, NULL, '', '', NULL),
(1116, 'USA3YKA22101313', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1117, 'USA3YKA22101312', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPSFCBECERRA', NULL, NULL, '', '', NULL),
(1118, 'USA3YKA22101311', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTOMDELREAL', NULL, NULL, '', '', NULL),
(1119, 'USA3YKA22101310', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTPCONCEPCION', NULL, NULL, '', '', NULL),
(1120, 'USA3YKA22101085', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TUCMD001', NULL, NULL, '', '', NULL),
(1121, 'USA3YKA22101304', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLTP009', NULL, NULL, '', '', NULL),
(1122, 'USA3YKA22101181', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'TLVIP007', NULL, NULL, '', '', NULL),
(1123, 'USA3YKA22101183', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1124, 'USA3YKA22101184', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1125, 'USA3YKA22101182', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1126, 'USA3YKA22102018', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPLIBERTAD', NULL, NULL, '', '', NULL),
(1127, 'USA3YKA22102019', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPVALLE', NULL, NULL, '', '', NULL),
(1128, 'USA3YKA22102020', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPCHOLUTECA', NULL, NULL, '', '', NULL),
(1129, 'USA3YKA22102021', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPCHOLUTECA2', NULL, NULL, '', '', NULL),
(1130, 'USA3YKA22101009', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPGUADALUPE', NULL, NULL, '', '', NULL),
(1131, 'USA3YKA22101010', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPNACAOME', NULL, NULL, '', '', NULL),
(1132, 'USA3YKA22101011', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPNACAOME2', NULL, NULL, '', '', NULL),
(1133, 'USA3YKA22101012', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPMONJARAS', NULL, NULL, '', '', NULL),
(1134, 'USA3YKA22101013', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPMOJARAS2', NULL, NULL, '', '', NULL),
(1135, 'USA3YKA22101014', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPLIBERTAD2', NULL, NULL, '', '', NULL),
(1136, 'USA3YKA22101015', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPATERRIZAJE', NULL, NULL, '', '', NULL),
(1137, 'USA3YKA22101016', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPTRIUNFO', NULL, NULL, '', '', NULL),
(1138, 'USA3YKA22101017', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPSANMARCOS', NULL, NULL, '', '', NULL),
(1139, 'USA3YKA22101018', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPSLORENZO1', NULL, NULL, '', '', NULL),
(1140, 'USA3YKA22101019', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPSLORENZO2', NULL, NULL, '', '', NULL),
(1141, 'USA3YKA22101123', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPNACAOME3', NULL, NULL, '', '', NULL),
(1142, 'USA3YKA22102122', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPLANGUE', NULL, NULL, '', '', NULL),
(1143, 'USA3YKA22102023', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SETPSANTAELENA2', NULL, NULL, '', '', NULL),
(1144, 'USA3YKA22102024', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1145, 'USA3YKA22102025', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1146, 'USA3YKA22102026', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1147, 'USA3YKA22102027', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1148, 'USA3YKA22102028', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1149, 'USA3YKA22101124', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1150, 'USA3YKA22101121', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1151, 'USA3YKA22101122', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1152, 'USA3YKA22101286', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1153, 'USA3YKA22101285', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1154, 'USA3YKA22101020', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1155, 'USA3YKA22101126', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1156, 'USA3YKA22101120', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1157, 'USA3YKA22102441', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1158, 'USA3YKA22101308', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1159, 'USA3YKA22102039', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1160, 'USA3YKA22102040', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1161, 'USA3YKA22100926', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1162, 'USA3YKA22101238', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPCOPR1', NULL, NULL, '', '', NULL),
(1163, 'USA3YKA22101239', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPCOPR2', NULL, NULL, '', '', NULL),
(1164, 'USA3YKA22101240', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPCUCUY1', NULL, NULL, '', '', NULL),
(1165, 'USA3YKA22101241', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPCUCUY2', NULL, NULL, '', '', NULL),
(1166, 'USA3YKA22101242', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPTERMINAL', NULL, NULL, '', '', NULL),
(1167, 'USA3YKA22101243', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPSANTAR1', NULL, NULL, '', '', NULL),
(1168, 'USA3YKA22101244', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPSANTAR2', NULL, NULL, '', '', NULL),
(1169, 'USA3YKA22101245', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1170, 'USA3YKA22101246', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPSANJUAN', NULL, NULL, '', '', NULL),
(1171, 'USA3YKA22101247', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPLAENTRADA', NULL, NULL, '', '', NULL),
(1172, 'USA3YKA22101248', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPENTRADA2', NULL, NULL, '', '', NULL),
(1173, 'USA3YKA22101129', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPENTRADA3', NULL, NULL, '', '', NULL),
(1174, 'USA3YKA22101130', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPENTRADA4', NULL, NULL, '', '', NULL),
(1175, 'USA3YKA22101131', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'SRTPGRACIAS1', NULL, NULL, '', '', NULL),
(1176, 'USA3YKA22101132', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1177, 'USA3YKA22101133', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1178, 'USA3YKA22101134', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1179, 'USA3YKA22101125', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1180, 'USA3YKA22101135', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1181, 'USA3YKA22101136', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1182, 'USA3YKA22101137', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1183, 'USA3YKA22101138', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1184, 'USA3YKA22101139', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1185, 'USA3YKA22101140', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1186, 'USA3YKA22101189', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1187, 'USA3YKA22101190', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1188, 'USA3YKA22101191', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1189, 'USA3YKA22101192', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1190, 'USA3YKA22101193', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1191, 'USA3YKA22101194', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1192, 'USA3YKA22101195', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1193, 'USA3YKA22101196', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1194, 'USA3YKA22101197', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1195, 'USA3YKA22101198', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1196, 'USA3YKA22101199', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1197, 'USA3YKA22101200', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1198, 'USA3YKA22100973', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1199, 'USA3YKA22100974', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1200, 'USA3YKA22100975', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1201, 'USA3YKA22100976', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL);
INSERT INTO `impresoras` (`id`, `serial`, `modelo`, `id_marca`, `id_tipo`, `estado_actual`, `asignada`, `ubicacion`, `fecha_compra`, `fecha_vencimiento_garantia`, `proveedor_garantia`, `N_garantia`, `garantia_archivo`) VALUES
(1202, 'USA3YKA22100977', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1203, 'USA3YKA22101079', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1204, 'USA3YKA22100927', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1205, 'USA3YKA22100928', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1206, 'USA3YKA22100978', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1207, 'USA3YKA22100932', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1208, 'USA3YKA22101237', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1209, 'USA3YKA22102464', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1210, 'USA3YKA22101293', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1211, 'USA3YKA22101296', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1212, 'USA3YKA22101294', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1213, 'USA3YKA22101295', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1214, 'USA3YKA22100981', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1215, 'USA3YKA22100984', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1216, 'USA3YKA22101002', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPCONCORDIA2', NULL, NULL, '', '', NULL),
(1217, 'USA3YKA22101003', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPESPERANZA', NULL, NULL, '', '', NULL),
(1218, 'USA3YKA22101006', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPSOSA', NULL, NULL, '', '', NULL),
(1219, 'USA3YKA22101007', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPPRADUNIVER', NULL, NULL, '', '', NULL),
(1220, 'USA3YKA22101213', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPHATO', NULL, NULL, '', '', NULL),
(1221, 'USA3YKA22101217', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPPEDREGAL', NULL, NULL, '', '', NULL),
(1222, 'USA3YKA22101218', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPVILLANUEVA', NULL, NULL, '', '', NULL),
(1223, 'USA3YKA22101223', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPPINOS', NULL, NULL, '', '', NULL),
(1224, 'USA3YKA22101222', 'Bixolom SPP-210', 1, 1, 'Buena', 1, 'GBTPANILLOP2', NULL, NULL, '', '', NULL),
(1225, 'USA3YKA22100982', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1226, 'USA3YKA22100983', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1227, 'USA3YKA22100997', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1228, 'USA3YKA22101219', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1229, 'USA3YKA22101064', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1230, 'USA3YKA22101063', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1231, 'USA3YKA22101058', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1232, 'USA3YKA22101057', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1233, 'USA3YKA22101061', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1234, 'USA3YKA22101062', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1235, 'USA3YKA22101065', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1236, 'USA3YKA22102065', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1237, 'USA3YKA22102066', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1238, 'USA3YKA33101060', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1239, 'USA3YKA22101118', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1240, 'USA3YKA22100998', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1241, 'USA3YKA22101000', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1242, 'USA3YKA22101001', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1243, 'USA3YKA22101005', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1244, 'USA3YKA22101004', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1245, 'USA3YKA22101215', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1246, 'USA3YKA22101214', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1247, 'USA3YKA22101216', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1248, 'USA3YKA22101220', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1249, 'USA3YKA22101221', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1250, 'USA3YKA22101224', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1251, 'USA3YKA22102068', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1252, 'USA3YKA22102071', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1253, 'USA3YKA22102075', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1254, 'USA3YKA22101299', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1255, 'USA3YKA22101300', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1256, 'USA3YKA22101303', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1257, 'USA3YKA22101305', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1258, 'USA3YKA22101074', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1259, 'USA3YKA22100952', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1260, 'USA3YKA22101117', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1261, 'USA3YKA22101087', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1262, 'USA3YKA22100979', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1263, 'USA3YKA22100980', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1264, 'USA3YKA22102070', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1265, 'USA3YKA22102073', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1266, 'USA3YKA22101297', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1267, 'USA3YKA22101302', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1268, 'USA3YKA22101306', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1269, 'USA3YKA22101307', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1270, 'USA3YKA22100955', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1271, 'USA3YKA22101225', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1272, 'USA3YKA22100960', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1273, 'USA3YKA22100956', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1274, 'USA3YKA22100959', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1275, 'USA3YKA22102069', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1276, 'USA3YKA22102076', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1277, 'USA3YKA22101298', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1278, 'USA3YKA22101069', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1279, 'USA3YKA22100321', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1280, 'USA3YKA22102072', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1281, 'USA3YKA22101119', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1282, 'USA3YKA22102509', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1283, 'USA3YKA22101291', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1284, 'USA3YKA22101292', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1285, 'USA3YKA22101289', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1286, 'USA3YKA22101290', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1287, 'USA3YKA22101143', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1288, 'USA3YKA22101148', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1289, 'USA3YKA22101147', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1290, 'USA3YKA22101152', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1291, 'USA3YKA22101144', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1292, 'USA3YKA22100871', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1293, 'USA3YKA22100793', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1294, 'USA3YKA22032557', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1295, 'USA3YKA22100872', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1296, 'USA3YKA22111344', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1297, 'USA3YKA22100322', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1298, 'USA3YKA22101110', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1299, 'USA3YKA22102550', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1300, 'USA3YKA22101142', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1301, 'USA3YKA22032607', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1302, 'USA3YKA22032614', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1303, 'USA3YKA22032616', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1304, 'USA3YKA22032667', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1305, 'USA3YKA22100824', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1306, 'USA3YKA22100825', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1307, 'USA3YKA22100826', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1308, 'USA3YKA22100827', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1309, 'USA3YKA24010345', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1310, 'USA3YKA24010347', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1311, 'USA3YKA24010348', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1312, 'USA3YKA24010349', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1313, 'USA3YKA24010350', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1314, 'USA3YKA24010351', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1315, 'USA3YKA24010352', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1316, 'USA3YKA24010354', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1317, 'USA3YKA24010355', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1318, 'USA3YKA24010356', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1319, 'USA3YKA24010357', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1320, 'USA3YKA24010358', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1321, 'USA3YKA24010359', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1322, 'USA3YKA24010360', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1323, 'USA3YKA22100818', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1324, 'USA3YKA22100809', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1325, 'USA3YKA22100806', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1326, 'USA3YKA22100796', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1327, 'USA3YKA24010368', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1328, 'USA3YKA24010381', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1329, 'USA3YKA24010382', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1330, 'USA3YKA24010377', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1331, 'USA3YKA24010379', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1332, 'USA3YKA24010378', 'Bixolom SPP-210', 1, 1, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1335, 'USAGTKA23091393', 'SPP-R310', 1, 2, 'Buena', 1, 'VNGRN001', NULL, NULL, '', '', NULL),
(1336, 'USAGTKA23091394', 'SPP-R310', 1, 2, 'Buena', 1, 'VNGRN002', NULL, NULL, '', '', NULL),
(1337, 'USAGTKA23091395', 'SPP-R310', 1, 2, 'Buena', 1, 'VNGRN004', NULL, NULL, '', '', NULL),
(1338, 'USAGTKA23091396', 'SPP-R310', 1, 2, 'Buena', 1, 'VNGRN005', NULL, NULL, '', '', NULL),
(1339, 'USAGTKA23091397', 'SPP-R310', 1, 2, 'Buena', 1, 'VNGRN006', NULL, NULL, '', '', NULL),
(1340, 'USAGTKA23091398', 'SPP-R310', 1, 2, 'Buena', 1, 'VNGRN007', NULL, NULL, '', '', NULL),
(1341, 'USAGTKA23091410', 'SPP-R310', 1, 2, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1342, 'USAGTKA23091415', 'SPP-R310', 1, 2, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1343, 'USAGTKA23091416', 'SPP-R310', 1, 2, 'Buena', 1, 'VNGRN003', NULL, NULL, '', '', NULL),
(1344, 'USAGTKA23091399', 'SPP-R310', 1, 2, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1345, 'USAGTKA23091400', 'SPP-R310', 1, 2, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1346, 'USAGTKA23091409', 'SPP-R310', 1, 2, 'Buena', 1, 'SEGRN001', NULL, NULL, '', '', NULL),
(1347, 'USAGTKA23091411', 'SPP-R310', 1, 2, 'Buena', 1, 'GBGRN001', NULL, NULL, '', '', NULL),
(1348, 'USAGTKA23091412', 'SPP-R310', 1, 2, 'Buena', 1, 'GBGRN002', NULL, NULL, '', '', NULL),
(1349, 'USAGTKA23091413', 'SPP-R310', 1, 2, 'Buena', 1, 'GBGRN003', NULL, NULL, '', '', NULL),
(1350, 'USAGTKA23091414', 'SPP-R310', 1, 2, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1351, 'USAGTKA23091402', 'SPP-R310', 1, 2, 'Buena', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1352, 'USAGTKA23091403', 'SPP-R310', 1, 2, 'Mantenimiento', 0, 'Almacén IT', NULL, NULL, '', '', NULL),
(1353, 'USAGTKA23091404', 'SPP-R310', 1, 2, 'Buena', 1, 'SRGRN001', NULL, NULL, '', '', NULL),
(1354, 'USAGTKA23091401', 'SPP-R310', 1, 2, 'Buena', 1, 'SRGRN001', NULL, NULL, '', '', NULL),
(1357, '09090909', 'SPP-R200III', 1, 2, 'Rescatada', 0, 'Almacén IT', '2025-02-01', '2025-05-01', 'Acosa', 'Nt333-7', NULL),
(1358, 'R58R71L5XQK', 'GALAXY A02', 2, 3, 'Buena', 1, 'VNCI001', NULL, NULL, '', '', NULL);

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
(1, 'BIXOLON'),
(2, 'SAMSUNG');

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
(3, 'DELL'),
(4, 'EPSON'),
(1, 'HP'),
(2, 'LENOVO'),
(6, 'LOGITECH'),
(8, 'OFFICE SUPPLIES'),
(5, 'SONY'),
(7, 'TOYOTA'),
(9, 'ZEBRA');

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
(1, 'Lista los equipos de PDV registrados', 'listas todos los equipos de punto de venta registrados'),
(2, 'Reportes de activos por usuario', 'Permite exportar activos asignados he historiales de activos de un usuario'),
(4, 'Reportes de activos', 'Imprimir hojas de asignación y exportar listados de los activos periféricos y no perifericos'),
(5, 'Usuarios', 'Listado de los usuarios registrados'),
(6, 'Importación de registros', 'Permite realizar importaciones a distintos módulos del sistema'),
(7, 'Asignar equipos de PDV', 'asignación de equipos de PDV a usuarios'),
(8, 'Historial Equipos de PDV', 'Lista las impresoras asignadas y sus historiales'),
(9, 'Listar estados de los equipos de PDV', 'Permite el cambio de estado de los equipos, ver graficas y ver el historial de estados.'),
(11, 'Lista los equipos de oficina registrados', 'Listas todos los equipos de oficina registrados	'),
(12, 'Asignar equipos de oficina', 'Asignación de equipos de oficina a usuarios '),
(13, 'Listar equipos de oficina', 'Permite el cambio de estado de los equipos, ver graficas y ver el historial de estados.	'),
(14, 'Historial asignaciones de computadoras', 'Historial de las asignaciones de la computadoras'),
(15, 'Listar Activos', 'Permite ver los activos periféricos y no periféricos registrados en el sistema'),
(18, 'Historial de asignaciones de los activos', 'Historial de las asignaciones de los activos'),
(19, 'Reportes de equipos de oficina', 'Imprimir hojas de asignación y exportar listados de los equipos de oficina asignados'),
(20, 'Reportes de equipos de PDV', 'Imprimir hojas de asignación y exportar listados de los equipos de PDV asignados	'),
(21, 'Empresa', 'Crud de la empresa,planta y PDV que se manejan en ella'),
(22, 'Gestion de equipos de PDV', 'Agrega los tipos y las marcas de los equipos de PDV'),
(23, 'Gestion de los equipos de oficina y PDV', 'Gestiona las marcas y los tipos de los equipos de oficina y PDV'),
(27, 'niveles de acceso', 'Registra los accesos del sistema'),
(28, 'Estados ', 'Gestiona los estados de todos los activos del sistema'),
(29, 'Crear usuario', 'Este acceso permite crear nuevos usuario al sistema'),
(30, 'Crear Departamento', 'Crear departamentos para los usuarios'),
(31, 'Eliminar Usuario', 'Permite eliminar los usuarios registrados'),
(33, 'Editar Usuario', 'Permitir editar la información de lo usuarios'),
(34, 'Crear equipos de PDV', 'Permite ingresar los datos de nuevos equipos al sistema'),
(36, 'Editar equipos de PDV', 'Permite editar todos los activos de PDV registrados en el sistema'),
(37, 'Eliminar equipos de PDV', 'Permite eliminar equipos de PDV registrados en el sistema'),
(39, 'Garantías de PDV', 'Gestiona y lista las garantías de los equipos de PDV'),
(40, 'Finalizar Asignación de equipos de PDV', 'Permite finalizar la asignación de los equipos de PDV y regresarlos al almacen'),
(41, 'Agregar equipos de oficina', 'Permite registrar equipos de oficina al sistema'),
(42, 'Editar Equipo de oficina', 'Permite editar los equipos de oficina registrados en el sistema'),
(43, 'Eliminar equipo de oficina', 'Permite eliminar los equipos de oficina registrados en el sistema'),
(45, 'Garantias de los equipos de oficina', 'Gestiona y lista las garantías de los equipos de oficina'),
(46, 'Finalizar Asignación de equipos de oficina', 'Permite finalizar la asignación de los equipos de oficina y regresarlos al almacén	'),
(47, 'Crear Activos', 'Permite crear activos periféricos y no periféricos'),
(49, 'Editar Activos ', 'Permite editar los activos periféricos y no periféricos'),
(50, 'Eliminar Activos', 'Permite eliminar los activos periféricos y no periféricos registrados en el sistema	'),
(51, 'Garantias de activos', 'Gestiona y lista las garantías de los activos periféricos y no periféricos'),
(52, 'CRUD tipo de activo', 'Permite crear el tipo de activo y seleccionar si es periférico o no'),
(53, 'Asignar activos', 'Asignación de activos periféricos y no periféricos a usuarios y computadoras'),
(54, 'Listar estados de los activos', 'Permite el cambio de estado de los activos, ver graficas y ver el historial de estados.'),
(55, 'Finalizar Asignación de activos ', 'Permite finalizar la asignación de los activos y regresarlos al almacén	');

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
(1, 'VILLANUEVA', 1),
(2, 'GUANÁBANO', 1),
(3, 'CALPULES', 1),
(4, 'LA CEIBA', 1),
(5, 'SANTA ROSA', 1),
(6, 'TULIN', 1),
(7, 'SABÁ', 1),
(8, 'EL CHILE', 1),
(9, 'SANTA ELENA', 1),
(10, 'SAN MATÍAS', 1),
(11, 'GAS VEHICULAR – SPS', 1),
(12, 'GAS VEHICULAR -TGU', 1);

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
('CACI001', 'CALPULES AUTOCONSUMO', 3),
('CAPB001', 'PLANTA CALPULES - CAJA', 3),
('CATP001', 'TDA.LIMA # 1', 3),
('CATP002', 'TDA.PALERMO', 3),
('CATP003', 'TDA.GUAYMITAS', 3),
('CATP004', 'TDA.GUAYMITAS (MEZAPA)', 3),
('CATP005', 'TDA.ANDY GAS', 3),
('CATP006', 'TDA.LIMA SAN JUAN', 3),
('CATP007', 'TDA.PRIMAVERA CHOLOMA (1)', 3),
('CATP008', 'TDA.SOLANO', 3),
('CATP009', 'TDA.CHOLOMA CENTRO', 3),
('CATP010', 'TDA. CERRO VERDE', 3),
('CATP011', 'TDA.GRACIAS A DIOS', 3),
('CATP012', 'TDA.NUEVO SAN JUAN', 3),
('CATP013', 'TDA.PRIMAVERA CHOLOMA (2)', 3),
('CATP014', 'TDA.PRIMAVERA CHOLOMA (EL BANCO)', 3),
('CATP015', 'TDA. CIUDAD NUEVA (SINAI)', 3),
('CATP016', 'TDA.MONTEBELLO (SANTA ANA)', 3),
('CATP017', 'TDA.PROGRESO #1 (PROGRESO 2)', 3),
('CATP018', 'PLANTA CALPULES (COSMUL)', 3),
('CATP019', 'TDA. CIUDAD NUEVA (NUEVA INVERSION)', 3),
('CATP020', 'PLANTA CALPULES (CENTRAL)', 3),
('CATP021', 'TDA.PRADERA', 3),
('CATP022', 'PLANTA CALPULES (KITUR)', 3),
('CATP023', 'TDA.LOS CASTAÑOS (RIO BLANCO 2)', 3),
('CATP024', 'TDA.PROGRESO #1 (CENTENARIO)', 3),
('CATP025', 'TDA.PROGRESO #1 (BENDECK)', 3),
('CATP026', 'TDA.VALLE DE SULA (ISLAS DEL PROGRESO)', 3),
('CATP027', 'TDA.SOLANO (LIBERTAD)', 3),
('CATP028', 'TDA.SATELITE (REPARTO L)', 3),
('CATP029', 'TDA.LAS BRISAS', 3),
('CATP030', 'TDA.SAN CARLOS DE SULA', 3),
('CATP031', 'TDA.EL BENQUE', 3),
('CATP032', 'TDA.SATELITE', 3),
('CATP033', 'TDA.LOMAS DE SAN JUAN', 3),
('CATP034', 'TDA. SANDOVAL', 3),
('CATP035', 'TDA.LA UNION', 3),
('CATP036', 'TDA.CABANAS', 3),
('CATP037', 'PLANTA CALPULES (LA PLANETA)', 3),
('CATP038', 'TDA.BARANDILLAS', 3),
('CATP039', 'TDA.MEDINA #2', 3),
('CATP040', 'TDA.NERY GAS (TIKAMAYA)', 3),
('CATP041', 'TDA.LIMA LA PAZ', 3),
('CATP042', 'TDA. CIUDAD NUEVA', 3),
('CATP043', 'TDA.NERY GAS (REAL DEL CAMPO)', 3),
('CATP044', 'PLANTA CALPULES (SAUCE)', 3),
('CATP045', 'TDA.LAS PALMAS', 3),
('CATP046', 'TDA.ANDALUCIA', 3),
('CATP047', 'TDA.ANDY GAS (PARAISO 3)', 3),
('CATP048', 'TIENDA LAS BRISAS #2', 3),
('CATP049', 'TDA. FELIPE ZELAYA', 3),
('CATP050', 'TDA.EL BENQUE (LEMPIRA)', 3),
('CATP051', 'TDA.ANDALUCIA (SUNCERY)', 3),
('CATP052', 'TDA. LIMA LA PAZ (ORO VERDE)', 3),
('CATP053', 'TDA. SAN CARLOS 2', 3),
('CATP054', 'TDA.LIMA # 1 (SITRATERCO)', 3),
('CATP055', 'TDA.VALLE DE SULA (FRONTERA)', 3),
('CATP056', 'TDA.NERY GAS', 3),
('CATP057', 'TDA.ANDALUCIA #2', 3),
('CATP058', 'TDA. CIUDAD NUEVA (CIUDAD NUEVA 2)', 3),
('CATP059', 'TDA.VICTORIA', 3),
('CATP060', 'TDA PALERMO(BRISAS DEL ULUA)', 3),
('CATP061', 'TDA PALERMO(COROCOL#2)', 3),
('CATP062', 'TDA PALERMO(SAN ISIDRO)', 3),
('CATP063', 'TDA PALERMO(QUEBRADA SECA)', 3),
('CATP064', 'TDA LIMA LA PAZ(VEINTE)', 3),
('CATP065', 'TDA CHOLOMA CENTRO(LOS PRADOS)', 3),
('CATP066', 'TDA VICTORIA(SINOR)', 3),
('CATP067', 'PLANTA CALPULES (SANTA MARTHA)', 3),
('CATP068', 'TDA.PALERMO(FLORES DE MAYO)', 3),
('CATP069', 'TDA.PALERMO(Q.YORO)', 3),
('CATP070', 'TDA.PRIMAVERA CHOLOMA (JUTUOSA)', 3),
('CATP071', 'TDA.LIMA # 1(AMERICANA)', 3),
('CATP072', 'TDA. LAS BRISAS(UNIVERSIDAD#1)', 3),
('CATP073', 'TDA. LAS BRISAS(UNIVERSIDAD#2)', 3),
('CATP074', 'TDA.ANDALUCIA (EL MANGAL)', 3),
('CATP075', 'TDA.PALERMO(#2)', 3),
('CATP076', 'TDA.LAS BRISAS(RIO B.#3)', 3),
('CATP077', 'TDA. SOLANO(SAN MIGUEL)', 3),
('CATPCELEO', 'CELEO GONZALEZ', 3),
('CAVIP001', 'PLANTA CALPULES - VIP 01', 3),
('CAVIP002', 'PLANTA CALPULES - VIP 02', 3),
('CAVIP003', 'PLANTA CALPULES - VIP 03', 3),
('CAVIP004', 'PLANTA CALPULES - VIP 04', 3),
('CAVIP005', 'PLANTA CALPULES - VIP 05', 3),
('CAVIP006', 'PLANTA CALPULES - VIP 06', 3),
('CAVIP007', 'PLANTA CALPULES - VIP 07', 3),
('CAVIP008', 'PLANTA CALPULES - VIP 08', 3),
('CAVIP009', 'PLANTA CALPULES - VIP 10', 3),
('CAVIP010', 'PLANTA CALPULES - VIP 12', 3),
('CAVIP011', 'PLANTA CALPULES - VIP 14', 3),
('CAVIP012', 'PLANTA CALPULES - VIP 11', 3),
('CAVIP013', 'PLANTA CALPULES - VIP 13', 3),
('CAVIP014', 'PLANTA CALPULES - VIP 15', 3),
('CHCI001', 'EL CHILE  AUTOCONSUMO', 8),
('CHCMD001', 'PLANTA EL CHILE (CAMION 1)', 8),
('CHGRN001', 'EL CHILE GRANEL 1', 8),
('CHPB001', 'PLANTA EL CHILE (CAJA)', 8),
('CHTP001', 'S.A TDA.BARACOA', 8),
('CHTP004', 'TDA.NUEVOS HORIZONTES', 8),
('CHTP005', 'TDA.LA ROCA', 8),
('CHTP006', 'TDA.SAN ISIDRO', 8),
('CHTP007', 'TDA.SAN RAMON (1)', 8),
('CHTP010', 'TDA.15 CALLE', 8),
('CHTP011', 'TDA.EL PORVENIR (CH)', 8),
('CHTP013', 'TDA.TULIAN RIO', 8),
('CHTP014', 'TDA.OMOA (1)', 8),
('CHTP016', 'TDA.EL PARAISO', 8),
('CHTP017', 'TDA.CUYAMEL', 8),
('CHTP018', 'TDA.TEGUCIGALPITA', 8),
('CHTP019', 'TDA.POTRERILLOS (CH1)', 8),
('CHTP020', 'TDA.POTRERILLOS (CH2)', 8),
('CHTP021', 'PLANTA EL CHILE (1)', 8),
('CHTP024', 'TDA.MEDINA (CH)', 8),
('CHTP025', 'TDA. GUANACASTALES', 8),
('CHTP026', 'TDA.EL SAUCE', 8),
('CHTP029', 'TDA.URRACO PUEBLO', 8),
('CHTP030', 'TDA.URRACO PUEBLO #2', 8),
('CHTP031', 'TDA.KILOMETRO 45', 8),
('CHTP032', 'TDA.OMOA (2)', 8),
('CHTP033', 'TDA.TULIAN RIO #2', 8),
('CHTP034', 'TDA.EL PARAISO(2)', 8),
('CHTP035', 'S.A TDA.BARACOA (2)', 8),
('CHTP036', 'S.A TDA.BARACOA(CAMPANA)', 8),
('CHTP037', 'PLANTA EL CHILE (1) (CHAMECONCITO)', 8),
('CHVIP003', 'PLANTA EL CHILE (VIP 03)', 8),
('CHVIP006', 'PLANTA EL CHILE (VIP 10)', 8),
('CHVIP009', 'PLANTA EL CHILE (VIP11)', 8),
('CHVIP010', 'PLANTA EL CHILE (VIP 02)', 8),
('CHVIP011', 'PLANTA EL CHILE (VIP 04)', 8),
('CHVIP012', 'PLANTA EL CHILE (VIP 01)', 8),
('CHVIP013', 'PLANTA EL CHILE (VIP 05)', 8),
('GBCI001', 'GUANABANO AUTOCONSUMO', 2),
('GBCM001', 'PLANTA GUANABANO CAMION#1', 2),
('GBCM002', 'PLANTA GUANABANO CAMION#2', 2),
('GBCM003', 'PLANTA GUANABANO CAMION#3', 2),
('GBCM004', 'PLANTA GUANABANO CAMION#4', 2),
('GBCM005', 'PLANTA GUANABANO CAMION#5', 2),
('GBCM006', 'TROPIGAS GUANABANO CAMION #6', 2),
('GBGRN001', 'GUANABANO GRANEL 1', 2),
('GBGRN002', 'GUANABANO GRANEL 2', 2),
('GBGRN003', 'GUANABANO GRANEL 3', 2),
('GBGRN004', 'GUANABANO GRANEL 4', 2),
('GBPBCAJA1', 'PLANTA GUANABANO (CAJA)', 2),
('GBTP022', 'TDA. EL PORVENIR (GB)', 2),
('GBTP023', 'TDA.LOARQUE(2)', 2),
('GBTP024', 'TDA.LAS TORRES(2)', 2),
('GBTP025', 'TDA.LAS TORRES(3)', 2),
('GBTP026', 'TDA.TOROCAGUA (2)', 2),
('GBTP027', 'TDA. TEUPASENTI', 2),
('GBTP028', 'TDA.BOULEVARD SUYAPA (2)', 2),
('GBTP21FEBR', 'TDA. 21 DE FEBRERO', 2),
('GBTPANILLOP1', 'TDA.ANILLO PERIFERICO', 2),
('GBTPANILLOP2', 'ANILLO PERIFERICO 2', 2),
('GBTPBUVARDSUY', 'TDA.BOULEVARD SUYAPA', 2),
('GBTPCERROGRA', 'TDA.CERRO GRANDE', 2),
('GBTPCERROGRA2', 'TDA.CERRO GRANDE #2', 2),
('GBTPCOMAYA1', 'TDA.COMAYAGUA #1', 2),
('GBTPCOMAYA2', 'TDA.COMAYAGUA #2', 2),
('GBTPCOMAYA3', 'TDA.COMAYAGUA #2 (COMAYAGUA 3)', 2),
('GBTPCOMAYA4', 'TDA. COMAYAGUA #4', 2),
('GBTPCONCORDIA', 'TDA.CONCORDIA', 2),
('GBTPCONCORDIA2', 'TDA.CONCORDIA 2', 2),
('GBTPCRUCITAS', 'TDA.LAS CRUCITAS', 2),
('GBTPDANLI', 'TDA.DANLI', 2),
('GBTPDANLI2', 'TIENDA DANLI#2', 2),
('GBTPELCARRIZAL', 'TDA.EL CARRIZAL', 2),
('GBTPESPERANZA', 'TDA.LA ESPERANZA', 2),
('GBTPHATO', 'TDA.HATO', 2),
('GBTPKENNEDY', 'TDA.KENNEDY', 2),
('GBTPKENNEDY2', 'TDA.KENNEDY #2', 2),
('GBTPLIBERTAD', 'TDA.LA LIBERTAD', 2),
('GBTPLOARQUE', 'TDA.LOARQUE', 2),
('GBTPMARCALA', 'TDA.MARCALA', 2),
('GBTPMARCALA2', 'TDA.MARCALA 2', 2),
('GBTPMONSEFIALLO', 'TDA.MONSEÑOR FIALLOS', 2),
('GBTPOBELISCO', 'TDA.OBELISCO', 2),
('GBTPPARAISO', 'TDA. EL PARAISO', 2),
('GBTPPAZ', 'TDA.LA PAZ', 2),
('GBTPPAZ2', 'TDA.LA PAZ #2', 2),
('GBTPPEDREGAL', 'TDA.PEDREGAL', 2),
('GBTPPINOS', 'TDA.LOS PINOS', 2),
('GBTPPRADUNIVER', 'TDA.PRADOS UNIVERSITARIOS', 2),
('GBTPRESCENTROA', 'TDA.RESIDENCIAL CENTRO', 2),
('GBTPSANPABLO', 'TDA.SAN PABLO', 2),
('GBTPSANPABLO2', 'TDA.SAN PABLO (2)', 2),
('GBTPSOSA', 'TDA.LA SOSA', 2),
('GBTPTALANGA', 'TDA.TALANGA', 2),
('GBTPTALANGA2', 'TDA.TALANGA 2', 2),
('GBTPTOROCAG', 'TDA.TOROCAGUA', 2),
('GBTPTORRES', 'TDA.LAS TORRES', 2),
('GBTPTROJES', 'TDA.TROJES', 2),
('GBTPVEGA', 'TDA.LA VEGA', 2),
('GBTPVEGA2', 'TDA LA VEGA #2', 2),
('GBTPVILLADELA', 'TDA.VILLADELA', 2),
('GBTPVILLANUEVA', 'TDA.VILLANUEVA', 2),
('GBVIP001', 'PLANTA GUANABANO (VIP1)', 2),
('GBVIP003', 'PLANTA GUANABANO (VIP3)', 2),
('GBVIP004', 'PLANTA GUANABANO (VIP4)', 2),
('GBVIP005', 'CEDIS LA GRANJA - VIP 5', 2),
('GBVIP007', 'CEDIS LA GRANJA - VIP 7', 2),
('GBVIP009', 'CEDIS LA GRANJA - VIP 9', 2),
('GBVIP010', 'CEDIS LA GRANJA - VIP 10', 2),
('GBVIP011', 'PLANTA GUANABANO (VIP 11)', 2),
('GBVIP012', 'PLANTA GUANABANO (VIP12)', 2),
('GBVIP013', 'PLANTA GUANABANO (VIP13)', 2),
('GBVIP014', 'TDA.COMAYAGUA #1 - VIP 14', 2),
('GBVIP015', 'TDA.COMAYAGUA #1 - VIP 15', 2),
('GBVIP016', 'TDA.COMAYAGUA #1 - VIP 16', 2),
('GBVIP018', 'TDA.DANLI - VIP 18', 2),
('GBVIP019', 'CEDIS LA GRANJA - VIP 19', 2),
('GBVIP020', 'PLANTA GUANABANO (VIP20)', 2),
('GBVIP021', 'TDA.DANLI - VIP 21', 2),
('GBVIP022', 'CEDIS LA GRANJA - VIP 22', 2),
('GBVIP023', 'CEDIS LA GRANJA - VIP 23', 2),
('GBVIP024', 'PLANTA GUANABANO (VIP 24)', 2),
('GBVIP025', 'PLANTA GUANABANO (VIP25)', 2),
('GBVIP026', 'PLANTA GUANABANO (VIP 26)', 2),
('GBVIP027', 'CEDIS LA GRANJA - VIP 6', 2),
('GBVIP028', 'CEDIS LA GRANJA - VIP 8', 2),
('GBVIP029', 'PLANTA GUANABANO (VIP 17)', 2),
('GBVIP030', 'PLANTA GUANABANO (VIP2)', 2),
('LCCI001', 'LA CEIBA AUTOCONSUMO', 4),
('LCCMD001', 'PLANTA LA CEIBA (CAMION)', 4),
('LCGRN001', 'LA CEIBA GRANEL 1', 4),
('LCPBCAJA1', 'PLANTA CEIBA (CAJA)', 4),
('LCTP14JULIO', 'TDA.14 DE JULIO', 4),
('LCTPARIZONA', 'TDA.ARIZONA', 4),
('LCTPBOMEJIA', 'PLANTA CEIBA (BMEJIA)', 4),
('LCTPCDTELA', 'TDA.C.D.TELA', 4),
('LCTPENCENADA', 'TDA.TELA (ENCENADA)', 4),
('LCTPJUTIAPA', 'TDA.JUTIAPA', 4),
('LCTPLAISLA', 'PLANTA CEIBA (LA ISLA)', 4),
('LCTPMASICA', 'TDA.MASICA', 4),
('LCTPMK17', 'TDA.KM 17', 4),
('LCTPMUNICIPAL', 'PLANTA CEIBA (MUNI)', 4),
('LCTPPINO', 'TDA.EL PINO', 4),
('LCTPPORVENIR', 'TDA.EL PORVENIR', 4),
('LCTPPRADERA', 'TDA. EL CONFITE (PRADERA)', 4),
('LCTPSAMBOK', 'PLANTA CEIBA (SAMBO)', 4),
('LCTPSANISIDRO', 'TDA.SAN ISIDRO (CEIBA)', 4),
('LCTPSANJUAN3', 'TDA.SAN JUAN 3', 4),
('LCTPSANTAANA', 'TDA.SAN FRANCISCO (SANTA ANA)', 4),
('LCTPSIERRAPINA', 'TDA.SAN ISIDRO (CEIBA SIERRA)', 4),
('LCTPTELA', 'TDA.TELA', 4),
('LCTPTELA3', 'TDA.C.D.TELA (TELA3)', 4),
('LCTPTELA4', 'TDA.TELA (TELA4)', 4),
('LCTPUNION', 'PLANTA CEIBA (UNION)', 4),
('LCTPVILLANEE', 'TDA.14 DE JULIO (VILLANEE)', 4),
('LCVIP003', 'PLANTA CEIBA (VIP3)', 4),
('LCVIP006', 'PLANTA CEIBA (VIP6)', 4),
('LCVIP007', 'PLANTA CEIBA (VIP7)', 4),
('LCVIP008', 'PLANTA CEIBA (VIP1)', 4),
('SBCI001', 'SABA  AUTOCONSUMO', 7),
('SBCMD003', 'PLANTA SABA CAMION # 3', 7),
('SBGRN001', 'SABA GRANEL', 7),
('SBPBCAJA1', 'PLANTA SABA - CAJA', 7),
('SBTP022', 'TDA. TEGUAJAL', 7),
('SBTP023', 'TDA. COYOLES #2', 7),
('SBTP024', 'TDA TRUJILLO #2', 7),
('SBTP025', 'TDA TOCOA#11', 7),
('SBTP026', 'TDA SAN LUIS #2', 7),
('SBTP027', 'TDA AGRICULTOR', 7),
('SBTP028', 'TDA SALAMA#2', 7),
('SBTP029', 'TDA NUEVA OLANCHITO #9', 7),
('SBTP030', 'TDA ELIXIR#3', 7),
('SBTP031', 'TDA SONAGUERA #5', 7),
('SBTP032', 'TDA.ACHIOTE#2', 7),
('SBTP033', 'TDA ESPERANZA BONITO', 7),
('SBTP21ABRIL', 'TDA. 21 DE ABRIL', 7),
('SBTPBORIENTAL', 'TDA. BONITO ORIENTAL', 7),
('SBTPBORIENTAL2', 'TDA. BONITO ORIENTAL (2)', 7),
('SBTPBORIENTAL3', 'TDA. BONITO ORIENTAL 3', 7),
('SBTPCEIBITA', 'TDA.TOCOA #1 (CEIBITA)', 7),
('SBTPCHORRERA', 'TDA.COYOLES (CHO)', 7),
('SBTPCHUSQUERA', 'TDA.SONAGUERA (CHURRU)', 7),
('SBTPCOROCITO', 'TDA. BONITO ORIENTAL (COROCITO)', 7),
('SBTPELIXIR', 'TDA. ELIXIR', 7),
('SBTPELIXIR2', 'TDA. ELIXIR (2)', 7),
('SBTPISLETA', 'TDA.SONAGUERA (ISLETAS)', 7),
('SBTPLAUVA', 'PLANTA SABA - LA UVA', 7),
('SBTPLOMITAS', 'TDA. SABA 1 (LOMITAS)', 7),
('SBTPMENDEZ', 'TDA.OLANCHITO #1 (MENDEZ)', 7),
('SBTPOLANCHI1', 'TDA.OLANCHITO #1', 7),
('SBTPOLANCHI5', 'TDA.OLANCHITO #2 (5)', 7),
('SBTPOLANCHITO2', 'TDA.OLANCHITO #2', 7),
('SBTPOLANCHITO3', 'TDA.OLANCHITO #2 (3)', 7),
('SBTPOLANCHITO4', 'TDA.OLANCHITO #2 (4)', 7),
('SBTPOLANCHITO6', 'TDA.OLANCHITO #2 (6)', 7),
('SBTPOLANCHITO7', 'TDA.OLANCHITO #1 (7)', 7),
('SBTPOLANCHITO8', 'TDA. OLANCHITO 8', 7),
('SBTPPALTO', 'TDA.SONAGUERA (P.ALTO)', 7),
('SBTPPARMA', 'TDA.SONAGUERA (PA)', 7),
('SBTPQUEBRADAARE', 'TDA.TOCOA #3 (Q. A.)', 7),
('SBTPSABA1', 'TDA. SABA 1', 7),
('SBTPSABA2', 'TDA. SABA 2', 7),
('SBTPSABA3', 'TDA. SABA (3)', 7),
('SBTPSABA4', 'TDA. SABA 4', 7),
('SBTPSABA5', 'TDA. SABA (5)', 7),
('SBTPSALAMA', 'TDA.SALAMA', 7),
('SBTPSANLUIS', 'TDA.TEPUSTECA (S.L)', 7),
('SBTPSONAGU1', 'TDA.SONAGUERA 1', 7),
('SBTPSONAGU2', 'TDA.SONAGUERA (2)', 7),
('SBTPSONAGU3', 'TDA.SONAGUERA (3)', 7),
('SBTPSONAGU4', 'TDA.SONAGUERA (4)', 7),
('SBTPTEPUSTECA', 'TDA.TEPUSTECA', 7),
('SBTPTOCOA1', 'TDA.TOCOA #1', 7),
('SBTPTOCOA10', 'TDA.TOCOA #10', 7),
('SBTPTOCOA2', 'TDA.TOCOA #3 (2)', 7),
('SBTPTOCOA4', 'TDA.TOCOA #3 (4)', 7),
('SBTPTOCOA5', 'TDA.TOCOA #3 (5)', 7),
('SBTPTOCOA6', 'TDA.TOCOA #1 (6)', 7),
('SBTPTOCOA7', 'TDA.TOCOA #1 (7)', 7),
('SBTPTOCOA8', 'TDA.TOCOA #1 (8)', 7),
('SBTPTOCOA9', 'TDA.TOCOA #9', 7),
('SBTPTOMALA', 'TDA. TOMALÁ', 7),
('SBTPTOMALA001', 'TDA. ACHIOTE', 7),
('SBTPTOMALA002', 'TDA. TOCOA 3', 7),
('SBTPTRUJILLO', 'TDA.TRUJILLO', 7),
('SBTPVUEVAE', 'TDA.JUTIAPA (NUEVA E)', 7),
('SBTPZAMORA', 'TDA.ZAMORA', 7),
('SBVIP002', 'PLANTA SABA (VIP2)', 7),
('SBVIP003', 'PLANTA SABA (VIP3)', 7),
('SBVIP004', 'PLANTA SABA (VIP4)', 7),
('SBVIP005', 'PLANTA SABA (VIP5)', 7),
('SBVIP006', 'PLANTA SABA (VIP6)', 7),
('SBVIP007', 'PLANTA SABA (VIP7)', 7),
('SBVIP008', 'PLANTA SABA (VIP8)', 7),
('SBVIP009', 'PLANTA SABA VIP # 9', 7),
('SBVIP010', 'PLANTA SABA VIP # 10', 7),
('SBVIP011', 'PLANTA SABA VIP #11', 7),
('SECI001', 'SANTA ELENA AUTOCONSUMO', 9),
('SECMD001', 'PLANTA SANTA ELENA CAMION # 1', 9),
('SECMD002', 'TROPIGAS SANTA ELENA CAMION # 2', 9),
('SEGRN001', 'SANTA ELENA GRANEL 1', 9),
('SEPBCAJA1', 'PLANTA SANTA ELENA (CAJA)', 9),
('SETP004', 'TDA. SAN JERONIMO', 9),
('SETP005', 'TDA.RENACER', 9),
('SETP006', 'TDA.GOASCORAN', 9),
('SETP007', 'TDA.SAN LORENZO (3)', 9),
('SETP008', 'TDA.SAN LORENZO (4)', 9),
('SETP009', 'TDA.LAS COLINAS', 9),
('SETPATERRIZAJE', 'EL ATERRIZAJE', 9),
('SETPCHOLUTECA', 'TDA.CHOLUTECA', 9),
('SETPCHOLUTECA2', 'TDA.CHOLUTECA (2)', 9),
('SETPGUADALUPE', 'TDA.CHOLUTECA (GUADALUPE)', 9),
('SETPLANGUE', 'TDA. LANGUE', 9),
('SETPLIBERTAD', 'TDA. LA LIBERTAD', 9),
('SETPLIBERTAD2', 'TDA. LA LIBERTAD (2)', 9),
('SETPMOJARAS2', 'TDA.MONJARAS (2)', 9),
('SETPMONJARAS', 'TDA.MONJARAS', 9),
('SETPNACAOME', 'TDA.NACAOME (1)', 9),
('SETPNACAOME2', 'TDA.NACAOME (2)', 9),
('SETPNACAOME3', 'TDA.NACAOME (3)', 9),
('SETPSANMARCOS', 'TDA. SAN MARCOS #1 (S.E)', 9),
('SETPSANTAELENA2', 'PLANTA SANTA ELENA (2)', 9),
('SETPSLORENZO1', 'TDA.SAN LORENZO (1)', 9),
('SETPSLORENZO2', 'TDA.SAN LORENZO (2)', 9),
('SETPTRIUNFO', 'TDA. EL TRIUNFO', 9),
('SETPVALLE', 'TDA.VALLE', 9),
('SEVIP001', 'PLANTA SANTA ELENA - VIP 01', 9),
('SEVIP002', 'PLANTA SANTA ELENA - VIP 02', 9),
('SEVIP003', 'PLANTA SANTA ELENA - VIP 03', 9),
('SEVIP004', 'PLANTA SANTA ELENA - VIP 04', 9),
('SEVIP005', 'PLANTA SANTA ELENA - VIP 05', 9),
('SEVIP006', 'PLANTA SANTA ELENA - VIP 06', 9),
('SEVIP008', 'PLANTA SANTA ELENA - VIP 08', 9),
('SEVIP009', 'PLANTA SANTA ELENA - VIP 09', 9),
('SEVIP010', 'PLANTA SANTA ELENA - VIP 07', 9),
('SRCI001', 'SANTA ROSA AUTOCONSUMO', 5),
('SRCMD001', 'PLANTA SANTA ROSA (CAMION 2)', 5),
('SRGRN001', 'SANTA ROSA GRANEL 1', 5),
('SRPBCAJA1', 'PLANTA SANTA ROSA (CAJA)', 5),
('SRTP007', 'TDA.LEPAERA(2)', 5),
('SRTP008', 'TDA.OCOTEPEQUE 3 (SINUAPA1)', 5),
('SRTP009', 'TDA. SANTA ROSA 4', 5),
('SRTP010', 'TDA.CUCUYAGUA (3)', 5),
('SRTP011', 'PLANTA SANTA ROSA (TDA 6)', 5),
('SRTPCOPR1', 'TDA.COPAN RUINAS (1)', 5),
('SRTPCOPR2', 'TDA.COPAN RUINAS (2)', 5),
('SRTPCUCUY1', 'TDA.CUCUYAGUA (1)', 5),
('SRTPCUCUY2', 'TDA.CUCUYAGUA (2)', 5),
('SRTPENTRADA2', 'TDA.LA ENTRADA #2', 5),
('SRTPENTRADA3', 'TDA.LA ENTRADA #3', 5),
('SRTPENTRADA4', 'TDA.LA ENTRADA #2 (4)', 5),
('SRTPGRACIAS1', 'TDA.GRACIAS (1)', 5),
('SRTPGRACIAS2', 'TDA.GRACIAS (2)', 5),
('SRTPGRACIAS3', 'TDA.GRACIAS (3)', 5),
('SRTPLAENTRADA', 'TDA.LA ENTRADA', 5),
('SRTPLEPAERA', 'TDA.LEPAERA', 5),
('SRTPOCOTEP1', 'TDA.OCOTEPEQUE (1)', 5),
('SRTPOCOTEP2', 'TDA.OCOTEPEQUE (2)', 5),
('SRTPOCOTEP3', 'TDA.OCOTEPEQUE 3', 5),
('SRTPOCOTEP4', 'TDA.OCOTEPEQUE (4)', 5),
('SRTPOCOTEP5', 'TDA.OCOTEPEQUE (5)', 5),
('SRTPOCOTEP6', 'TDA.OCOTEPEQUE (6)', 5),
('SRTPSANJUAN', 'TDA.SAN JUAN', 5),
('SRTPSANMARC1', 'TDA.SAN MARCOS (1)', 5),
('SRTPSANMARC2', 'TDA.SAN MARCOS (2)', 5),
('SRTPSANMARC3', 'TDA.SAN MARCOS (3)', 5),
('SRTPSANTAR1', 'PLANTA SANTA ROSA (TDA 1)', 5),
('SRTPSANTAR2', 'PLANTA SANTA ROSA (2)', 5),
('SRTPSANTAR3', 'PLANTA SANTA ROSA (3)', 5),
('SRTPSANTARITA', 'TDA.SANTA RITA', 5),
('SRTPTERMINAL', 'PLANTA SANTA ROSA (TERMINAL)', 5),
('SRVIP001', 'PLANTA SANTA ROSA (VIP 1)', 5),
('SRVIP002', 'TDA.OCOTEPEQUE (VIP 2)', 5),
('SRVIP003', 'TDA.LA ENTRADA #2 (VIP 03)', 5),
('SRVIP004', 'PLANTA SANTA ROSA (VIP 4)', 5),
('SRVIP005', 'PLANTA SANTA ROSA (VIP 5)', 5),
('SRVIP006', 'TDA.GRACIAS (VIP 6)', 5),
('SRVIP007', 'TDA.SAN MARCOS (VIP 7)', 5),
('SRVIP008', 'PLANTA SANTA ROSA (VIP 8)', 5),
('SRVIP009', 'TDA.COPAN RUINAS (VIP 9)', 5),
('SRVIP011', 'PLANTA SANTA ROSA (VIP 11)', 5),
('SRVIP012', 'PLANTA SANTA ROSA (VIP 12)', 5),
('SRVIP013', 'TDA.OCOTEPEQUE (VIP13)', 5),
('SRVIP016', 'PLANTA SANTA ROSA (VIP 14)', 5),
('SRVIP017', 'TDA.LA ENTRADA #2 (VIP 010)', 5),
('SRVIP018', 'TDA.LEPAERA(VIP 16)', 5),
('TLCMD001', 'PLANTA SABA (CAMION1)', 7),
('TLCMD002', 'PLANTA SABA (CAMION2)', 7),
('TLPBCAJA1', 'PLANTA TULIN (CAJA)', 6),
('TLPCATACAMAS2', 'TDA.CATACAMAS # 2', 6),
('TLTOJUTICALPA3', 'TDA.JUTICALPA # 3', 6),
('TLTOMDELREAL', 'TDA.STA. MARIA DEL REAL', 6),
('TLTP009', 'TDA.JUTICALPA # 1(LA GRANJA)', 6),
('TLTPCAMPAMEN', 'TDA.CAMPAMENTO', 6),
('TLTPCATACAMAS1', 'TDA.CATACAMAS #1', 6),
('TLTPCATACAMAS3', 'TDA.CATACAMAS #3', 6),
('TLTPCATACAMAS4', 'TDA.CATACAMAS #4', 6),
('TLTPCATACAMAS5', 'TDA.CATACAMAS #2 (5)', 6),
('TLTPCATACAMAS6', 'TDA.CATACAMAS #3 (6)', 6),
('TLTPCONCEPCION', 'TDA. CONCEPCIÓN', 6),
('TLTPGUAIMACA', 'TDA.GUAIMACA', 6),
('TLTPJUTICALPA1', 'TDA.JUTICALPA # 1', 6),
('TLTPJUTICALPA2', 'TDA.JUTICALPA # 2', 6),
('TLTPJUTICALPA4', 'TDA.JUTICALPA #4', 6),
('TLTPJUTIQUILE', 'TDA. JUTIQUILE', 6),
('TLTPSESTEBAN', 'TDA.SAN ESTEBAN', 6),
('TLTPSFCBECERRA', 'TDA.SAN FCO. DE BECERRA', 6),
('TLTPSFCLAPAZ', 'TDA.SAN FCO. DE LA PAZ', 6),
('TLVIP001', 'PLANTA TULIN (VIP1)', 6),
('TLVIP002', 'PLANTA TULIN (VIPCATACAMAS2)', 6),
('TLVIP003', 'PLANTA TULIN (VIP2)', 6),
('TLVIP004', 'PLANTA TULIN (VIP4)', 6),
('TLVIP006', 'PLANTA TULIN (VIP6)', 6),
('TLVIP007', 'PLANTA TULIN (VIP CATACAMAS #3)', 6),
('TUCI001', 'TULIN AUTOCONSUMO', 6),
('TUCMD001', 'TROPIGAS TULIN CAMION #1', 6),
('TUCMD002', 'TROPIGAS TULIN CAMION #2', 6),
('TUTP007', 'TDA.GUALACO', 6),
('TUTP008', 'TDA.JUTICALPA #5', 6),
('VNCI001', 'VILLANUEVA AUTOCONSUMO', 1),
('VNCMD001', 'PLANTA VILLANUEVA - (CAMION)', 1),
('VNCMD002', 'PLANTA VILLANUEVA - (CAMION 2)', 1),
('VNCMD003', 'DIGAS (CAMION)', 1),
('VNGRN001', 'VILLANUEVA GRANEL 1', 1),
('VNGRN002', 'VILLANUEVA GRANEL 2', 1),
('VNGRN003', 'VILLANUEVA GRANEL 3', 1),
('VNGRN004', 'VILLANUEVA GRANEL 4', 1),
('VNGRN005', 'VILLANUEVA GRANEL 5', 1),
('VNGRN006', 'VILLANUEVA GRANEL 6', 1),
('VNGRN007', 'VILLANUEVA GRANEL 7', 1),
('VNGRN008', 'VILLANUEVA GRANEL 8', 1),
('VNGRNDEMO001', 'DEMO APP (PRUEBAS IT)', 1),
('VNPB001', 'PLANTA VILLANUEVA - CAJA', 1),
('VNTP001', 'PLANTA VILLANUEVA - (B. VISTA 2)', 1),
('VNTP002', 'TDA.PIMIENTA', 1),
('VNTP003', 'TDA.SAN MANUEL', 1),
('VNTP004', 'TDA.SAN MANUEL (#2)', 1),
('VNTP005', 'TDA.STA. BARBARA', 1),
('VNTP006', 'TDA.STA. BARBARA (#2)', 1),
('VNTP007', 'TDA.STA. BARBARA (#3)', 1),
('VNTP008', 'TDA.STA. BARBARA (#4)', 1),
('VNTP009', 'TDA.STA. BARBARA (GALERAS 1)', 1),
('VNTP010', 'TDA.STA. BARBARA (GALERAS 2)', 1),
('VNTP011', 'TDA.ESPERANZA # 1', 1),
('VNTP012', 'TDA.ESPERANZA #3', 1),
('VNTP013', 'TDA.ESPERANZA # 2', 1),
('VNTP014', 'TDA.TAULABE', 1),
('VNTP015', 'TDA.YOJOA', 1),
('VNTP016', 'TDA.SANTA CRUZ (1)', 1),
('VNTP017', 'TDA.SANTA CRUZ (2)', 1),
('VNTP018', 'TDA.PEÑA BLANCA #1', 1),
('VNTP019', 'TDA.PEÑA BLANCA #2', 1),
('VNTP020', 'TDA.RIO LINDO #1', 1),
('VNTP021', 'TDA.DOS CAMINOS #2', 1),
('VNTP022', 'TDA. VILLANUEVA #4', 1),
('VNTP023', 'TDA.CALAN', 1),
('VNTP024', 'TDA.DOS CAMINOS #1', 1),
('VNTP025', 'TDA.DOS CAMINOS 1 (#3)', 1),
('VNTP026', 'TDA.VILLANUEVA #1', 1),
('VNTP028', 'TDA.VILLANUEVA #2', 1),
('VNTP029', 'TDA.VILLANUEVA #2 (REGALO DE DIOS)', 1),
('VNTP031', 'TDA.SIGUATEPEQUE #1', 1),
('VNTP032', 'TDA.AZACUALPA', 1),
('VNTP033', 'TDA.EL NEGRITO', 1),
('VNTP034', 'TDA.LA FLECHA', 1),
('VNTP035', 'TDA.LA FLECHA (QUIMISTAN)', 1),
('VNTP036', 'TDA.SULA', 1),
('VNTP037', 'TDA.POTRERILLOS', 1),
('VNTP038', 'TDA.POTRERILLOS (4)', 1),
('VNTP039', 'TDA.POTRERILLOS #2', 1),
('VNTP040', 'TDA.TRINIDAD', 1),
('VNTP041', 'TDA.LAS VEGAS', 1),
('VNTP042', 'TDA.SANTA RITA #1', 1),
('VNTP043', 'TDA.SANTA RITA #2', 1),
('VNTP044', 'TDA.MORAZAN', 1),
('VNTP046', 'DIGAS', 1),
('VNTP047', 'TDA. PROGRESO #8', 1),
('VNTP048', 'TDA.MONTEFRESCO', 1),
('VNTP049', 'TDA.MONTEFRESCO (UNION)', 1),
('VNTP050', 'TDA.GUAMILITO', 1),
('VNTP051', 'TDA.SANTA MARTHA', 1),
('VNTP052', 'TDA.SANTA MARTHA (BRISAS DEL CARMEN)', 1),
('VNTP053', 'TDA.SANTA MARTHA (RIVERA H.)', 1),
('VNTP054', 'TDA.SANTA MARTHA (LOS ANGELES)', 1),
('VNTP055', 'TDA. CIRCUNVALACION', 1),
('VNTP056', 'TDA. CIRCUNVALACION (BOGRAN 2)', 1),
('VNTP057', 'TDA.15/20', 1),
('VNTP058', 'TDA.15/20 (CABANAS)', 1),
('VNTP059', 'TDA.COFRADIA #1', 1),
('VNTP060', 'TDA.CHAMELECON', 1),
('VNTP061', 'TDA.CHAMELECON (#2)', 1),
('VNTP063', 'TDA.CHAMELECON (#4)', 1),
('VNTP064', 'TDA.CHOLOMA #1', 1),
('VNTP066', 'TDA.CHOLOMA (#3)', 1),
('VNTP067', 'TDA.CHOLOMA (#4)', 1),
('VNTP068', 'TDA.LOPEZ ARELLANO 1', 1),
('VNTP069', 'TDA.LOPEZ ARELLANO 9', 1),
('VNTP070', 'TDA.LOPEZ ARELLANO 10', 1),
('VNTP072', 'TDA.PAZ BARAHONA (#2)', 1),
('VNTP073', 'TDA.LUSIANA', 1),
('VNTP074', 'TDA.LUSIANA (2)', 1),
('VNTP075', 'TDA.RAPIDO CONCEPCION', 1),
('VNTP076', 'TDA.RAPIDO CONCEPCION (SAN PEDRO)', 1),
('VNTP077', 'TDA.RAPIDO CONCEPCION (DIPROGAS)', 1),
('VNTP079', 'TDA.YORO #2', 1),
('VNTP081', 'TDA.LOS CASTAÑOS', 1),
('VNTP083', 'TDA.EL PLAN', 1),
('VNTP084', 'TDA.EL PLAN (SABANA)', 1),
('VNTP085', 'TDA.PROGRESO #7', 1),
('VNTP087', 'TDA.REAL DEL PUENTE (VILLAS DEL RIO)', 1),
('VNTP088', 'TDA.SAN JORGE', 1),
('VNTP089', 'TDA.SAN JORGE (BRISAS)', 1),
('VNTP090', 'TDA.VILLANUEVA #3', 1),
('VNTP091', 'TDA.VILLANUEVA #3 (SANTA FE)', 1),
('VNTP092', 'TDA.SANTIAGO', 1),
('VNTP093', 'TDA.MEDINA #1', 1),
('VNTP094', 'TDA.SAN ANTONIO', 1),
('VNTP095', 'TDA.PORVENIR, SAN MANUEL', 1),
('VNTP097', 'TDA.CEDIS PROGRESO #1 (PORVENIR)', 1),
('VNTP098', 'TDA.VILLA REAL', 1),
('VNTP099', 'TDA.VILLA REAL (SIBONEY)', 1),
('VNTP100', 'TDA.VILLA REAL (SIBONEY #2)', 1),
('VNTP101', 'TDA.CEDIS SIGUATEPEQUE', 1),
('VNTP102', 'TDA.CEDIS SIGUATEPEQUE (2)', 1),
('VNTP103', 'Tda.Rio Lindo #3', 1),
('VNTP104', 'TDA.RIO LINDO #3 (2)', 1),
('VNTP105', 'TDA. SIGUATEPEQUE #5', 1),
('VNTP107', 'TDA.CEDIS VILLANUEVA #1 (BENDICION)', 1),
('VNTP108', 'TDA.JESUS DE OTORO', 1),
('VNTP109', 'TDA.POTRERILLOS #3', 1),
('VNTP110', 'TDA.SIGUATEPEQUE #3', 1),
('VNTP111', 'BUENA VISTA#1', 1),
('VNTP112', 'LA LIBERTAD', 1),
('VNTP114', 'TDA.ESPERANZA # 4', 1),
('VNTP115', 'TDA.ESPERANZA # 5', 1),
('VNTP116', 'TDA.ESPERANZA # 6', 1),
('VNTP117', 'TDA. RIO LINDO # 4', 1),
('VNTP118', 'TDA. BOGRAN # 3', 1),
('VNTP119', 'TDA.DOS CAMINOS #2 (4)', 1),
('VNTP120', 'TDA.TAULABE 2', 1),
('VNTP121', 'TDA.EL PLAN 2', 1),
('VNTP122', 'TDA.EL PLAN 3', 1),
('VNTP123', 'TDA.SIGUATEPEQUE (2)', 1),
('VNTP124', 'TDA.SANTA RITA #2(3)', 1),
('VNTP125', 'TDA.DOS CAMINOS #2 (5)', 1),
('VNTP126', 'TDA.VILLA REAL (PUEBLO NUEVO)', 1),
('VNTP127', 'TDA.STA. BARBARA(#5)', 1),
('VNTP128', 'TDA.SANTA CRUZ (3)', 1),
('VNTP129', 'TDA.REAL DEL PUENTE (VILLAS DEL RIO#2)', 1),
('VNTP130', 'TDA.REAL DEL PUENTE (VILLAS DEL RIO#3)', 1),
('VNTP131', 'TDA.CHOLOMA (#5)', 1),
('VNTP132', 'TDA.CHOLOMA (#6)', 1),
('VNTP133', 'TDA. QUIMISTAN', 1),
('VNVIP001', 'PLANTA VILLANUEVA - VIP 02', 1),
('VNVIP003', 'PLANTA VILLANUEVA - VIP 04', 1),
('VNVIP004', 'PLANTA VILLANUEVA - VIP 05', 1),
('VNVIP005', 'PLANTA VILLANUEVA - VIP 06', 1),
('VNVIP006', 'PLANTA VILLANUEVA - VIP 07', 1),
('VNVIP007', 'PLANTA VILLANUEVA - VIP 08', 1),
('VNVIP008', 'PLANTA VILLANUEVA - VIP 09', 1),
('VNVIP009', 'PLANTA VILLANUEVA - VIP 10', 1),
('VNVIP010', 'PLANTA VILLANUEVA - VIP 12', 1),
('VNVIP011', 'PLANTA VILLANUEVA - VIP 13', 1),
('VNVIP012', 'PLANTA VILLANUEVA - VIP 14', 1),
('VNVIP013', 'PLANTA VILLANUEVA - VIP 15', 1),
('VNVIP014', 'PLANTA VILLANUEVA - VIP 16', 1),
('VNVIP015', 'PLANTA VILLANUEVA - VIP 17', 1),
('VNVIP018', 'PLANTA VILLANUEVA - VIP 22', 1),
('VNVIP020', 'PLANTA VILLANUEVA - VIP 26', 1),
('VNVIP022', 'PLANTA VILLANUEVA - VIP 38', 1),
('VNVIP023', 'PLANTA VILLANUEVA - VIP 29', 1),
('VNVIP024', 'PLANTA VILLANUEVA - VIP 30', 1),
('VNVIP025', 'PLANTA VILLANUEVA - VIP 35', 1),
('VNVIP026', 'PLANTA VILLANUEVA - VIP 36', 1),
('VNVIP027', 'PLANTA VILLANUEVA - VIP 37', 1),
('VNVIP028', 'PLANTA VILLANUEVA - VIP 39', 1),
('VNVIP029', 'PLANTA VILLANUEVA - VIP 40', 1),
('VNVIP030', 'PLANTA VILLANUEVA - VIP 42', 1),
('VNVIP031', 'PLANTA VILLANUEVA - VIP 43', 1),
('VNVIP032', 'PLANTA VILLANUEVA - VIP 34', 1),
('VNVIP033', 'PLANTA VILLANUEVA - VIP 01', 1),
('VNVIP034', 'TDA.SIGUATEPEQUE #1 (VIP 19)', 1),
('VNVIP035', 'TDA.YORO #2 (VIP 20)', 1);

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
(3, 'Sin Acceso'),
(5, 'usuarios');

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
(22, 1, 1, 0),
(36, 1, 6, 1),
(39, 1, 7, 1),
(40, 1, 8, 1),
(43, 1, 9, 1),
(46, 1, 2, 1),
(47, 1, 11, 1),
(48, 1, 12, 0),
(49, 1, 13, 1),
(50, 1, 14, 1),
(51, 1, 15, 1),
(56, 1, 18, 1),
(57, 1, 19, 1),
(58, 1, 4, 1),
(60, 1, 20, 1),
(62, 1, 5, 1),
(63, 1, 21, 1),
(64, 1, 22, 1),
(72, 1, 23, 1),
(73, 1, 27, 1),
(74, 1, 28, 1),
(95, 5, 1, 1),
(98, 5, 8, 1),
(103, 1, 29, 0),
(105, 1, 30, 1),
(106, 1, 31, 1),
(107, 1, 33, 1),
(109, 1, 34, 1),
(111, 1, 36, 1),
(112, 1, 37, 1),
(113, 1, 39, 1),
(114, 1, 40, 1),
(115, 1, 41, 1),
(117, 1, 42, 1),
(118, 1, 43, 1),
(120, 1, 45, 1),
(121, 1, 47, 1),
(122, 1, 49, 1),
(124, 1, 50, 1),
(125, 1, 51, 1),
(127, 1, 52, 1),
(130, 1, 53, 1),
(131, 1, 54, 1),
(132, 1, 55, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_componentes`
--

DROP TABLE IF EXISTS `tipos_componentes`;
CREATE TABLE `tipos_componentes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `es_periferico` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = Periférico, 0 = No periférico'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_componentes`
--

INSERT INTO `tipos_componentes` (`id`, `nombre`, `es_periferico`) VALUES
(1, 'MONITOR', 1),
(2, 'TECLADO', 1),
(7, 'MOUSE', 1),
(9, 'TELEVISOR', 1),
(11, 'USB', 1),
(13, 'UPS', 1),
(15, 'PROYECTOR', 0),
(16, 'IMPRESORA LASER', 1),
(17, 'VEHICULO', 0),
(18, 'MOCHILA DE OFICINA', 0),
(19, 'CAMARA DE SEGURIDAD', 0),
(20, 'IMPRESORA DE CARNET', 0);

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
(2, 'DESKTOP'),
(1, 'LAPTOP');

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
(2, 'GRANEL'),
(1, 'PORTATIL'),
(3, 'TELEFONO');

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
  `tipo_telefono` enum('Corporativo','Personal') DEFAULT NULL,
  `IMEI` varchar(50) DEFAULT NULL,
  `jefe_inmediato` varchar(100) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `planta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `nombre`, `contrasena`, `rol`, `telefono`, `tipo_telefono`, `IMEI`, `jefe_inmediato`, `departamento_id`, `planta`) VALUES
('abel_doblado__cardoza', 'ABEL DOBLADO  CARDOZA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('abel_stanly_sanchez_isaula', 'ABEL STANLY SANCHEZ ISAULA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('ada_argentina_henriquez_pacheco(consumo)', 'ADA ARGENTINA HENRIQUEZ PACHECO(CONSUMO)', NULL, 3, '', 'Personal', '', '', 8, '7'),
('adela_noemi_andrade_mejia', 'ADELA NOEMI ANDRADE MEJIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('adoniran_quezada_villanueva(t)', 'ADONIRAN QUEZADA VILLANUEVA(T)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('adriana_yadira_zelaya_canales', 'ADRIANA YADIRA ZELAYA CANALES', NULL, 3, '', 'Personal', '', '', 8, '4'),
('adriana_yadira_zelaya_canales_(2)', 'ADRIANA YADIRA ZELAYA CANALES (2)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('adriana_yadira_zelaya_canales_(3)', 'ADRIANA YADIRA ZELAYA CANALES (3)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('adriana_yadira_zelaya_canales_(4)', 'ADRIANA YADIRA ZELAYA CANALES (4)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('ady_joan_diaz_echeverria', 'ADY JOAN DIAZ ECHEVERRIA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('alejandra_catalina_benavides_escalante', 'ALEJANDRA CATALINA BENAVIDES ESCALANTE', NULL, 3, '', 'Personal', '', '', 8, '2'),
('alejandra_esther_puerto_ortiz', 'ALEJANDRA ESTHER PUERTO ORTIZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('alexis_adalid_ortiz_canales', 'ALEXIS ADALID ORTIZ CANALES', NULL, 3, '', 'Personal', '', '', 8, '2'),
('alexis_de_jesus_viera', 'ALEXIS DE JESUS VIERA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('alexis_de_jesus_viera_(2)', 'ALEXIS DE JESUS VIERA (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('alex_fernando_brizuela_murcia', 'ALEX FERNANDO BRIZUELA MURCIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('alex_fernando_sagastume_rios', 'ALEX FERNANDO SAGASTUME RIOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('alex_josue_gutierre_pereira', 'ALEX JOSUE GUTIERRE PEREIRA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('aleyda_natalia_hernandez_figueroa', 'ALEYDA NATALIA HERNANDEZ FIGUEROA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('aleyda_natalia_hernandez_figueroa_(2)', 'ALEYDA NATALIA HERNANDEZ FIGUEROA (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('alian_nectali_ramos_gomez', 'ALIAN NECTALI RAMOS GOMEZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('alian_nectali_ramos_gomez_(2)', 'ALIAN NECTALI RAMOS GOMEZ (2)', NULL, 3, '', 'Personal', '', '', 8, '6'),
('allan_alberto_andino_calderon', 'ALLAN ALBERTO ANDINO CALDERON', NULL, 3, '', 'Personal', '', '', 8, '1'),
('allan_fabricio_escoto_romero', 'ALLAN FABRICIO ESCOTO ROMERO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('alma_brionix_lagos', 'ALMA BRIONIX LAGOS', NULL, 3, '', 'Personal', '', '', 8, '9'),
('ana_beatriz_sosa_escobar', 'ANA BEATRIZ SOSA ESCOBAR', NULL, 3, '', 'Personal', '', '', 8, '3'),
('ana_iris_martinez_rodriguez', 'ANA IRIS MARTINEZ RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('ana_iris_martinez_rodriguez(2)', 'ANA IRIS MARTINEZ RODRIGUEZ(2)', NULL, 3, '', 'Personal', '', '', 8, '7'),
('ana_luisa_torres_suazo', 'ANA LUISA TORRES SUAZO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ana_luisa_torres_suazo_(2)', 'ANA LUISA TORRES SUAZO (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('andrea_yacil_urbina_beltran_urbina_beltran', 'ANDREA YACIL URBINA BELTRAN URBINA BELTRAN', NULL, 3, '', 'Personal', '', '', 8, '1'),
('andrea_yessenia_aguilar_carcamo', 'ANDREA YESSENIA AGUILAR CARCAMO', NULL, 3, '', 'Personal', '', '', 8, '4'),
('angel_antonio_rubi_morales', 'ANGEL ANTONIO RUBI MORALES', NULL, 3, '', 'Personal', '', '', 8, '6'),
('angel_cesar_casco_velasquez', 'ANGEL CESAR CASCO VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '8'),
('angel_enrique_valladares_najera', 'ANGEL ENRIQUE VALLADARES NAJERA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('angie_gabriela_moya_santos', 'ANGIE GABRIELA MOYA SANTOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('angie_maribel_romero_sanchez', 'ANGIE MARIBEL ROMERO SANCHEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('antonio_armando_ineztroza', 'ANTONIO ARMANDO INEZTROZA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('antony_yoel_miranda_lopez', 'ANTONY YOEL MIRANDA LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('aracely_lopez_manzanarez', 'ARACELY LOPEZ MANZANAREZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('arlen_osmel_oyuela_carranza', 'ARLEN OSMEL OYUELA CARRANZA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('armando_napoleon_tercero_rapalo', 'ARMANDO NAPOLEON TERCERO RAPALO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('arnold_daniel_ramos_miranda', 'ARNOLD DANIEL RAMOS MIRANDA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('arnulfo_lopez_arzu', 'ARNULFO LOPEZ ARZU', NULL, 3, '', 'Personal', '', '', 8, '4'),
('arnulfo_rivera_blanco', 'ARNULFO RIVERA BLANCO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ashley_nahomy_vÁsquez_madrid(consumo)', 'ASHLEY NAHOMY VÁSQUEZ MADRID(CONSUMO)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('astrid_cecilia_lopez_manzanarez', 'ASTRID CECILIA LOPEZ MANZANAREZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('astrid_merary_benitez_palacios', 'ASTRID MERARY BENITEZ PALACIOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('autoconsumo_planta__calpules', 'AUTOCONSUMO PLANTA  CALPULES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('baudilio_arriaga_gonzales', 'BAUDILIO ARRIAGA GONZALES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('bayron_josue_caballero_zuniga', 'BAYRON JOSUE CABALLERO ZUNIGA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('bayron_josue_erazo_lara', 'BAYRON JOSUE ERAZO LARA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('bayron_josue_zepeda_flores', 'BAYRON JOSUE ZEPEDA FLORES', NULL, 3, '', 'Personal', '', '', 8, '9'),
('belkis_denissa_ramos_amaya', 'BELKIS DENISSA RAMOS AMAYA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('berta_lidia_cantarero_ayala', 'BERTA LIDIA CANTARERO AYALA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('berta_lidia_rodriguez_sevilla', 'BERTA LIDIA RODRIGUEZ SEVILLA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('bessy_erceli_sevilla_hernandez', 'BESSY ERCELI SEVILLA HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('bianca_josely_palacios', 'BIANCA JOSELY PALACIOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('blanca_edith_padilla_arias', 'BLANCA EDITH PADILLA ARIAS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('blanca_melissa_zeron_melendez', 'BLANCA MELISSA ZERON MELENDEZ', NULL, 3, '', 'Personal', '', '', 8, '4'),
('brayan_samir_hercules_menjivar', 'BRAYAN SAMIR HERCULES MENJIVAR', NULL, 3, '', 'Personal', '', '', 8, '8'),
('brayan_samir_hercules_menjivar_(2)', 'BRAYAN SAMIR HERCULES MENJIVAR (2)', NULL, 3, '', 'Personal', '', '', 8, '8'),
('brayan_yobany_vargas_martinez', 'BRAYAN YOBANY VARGAS MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '8'),
('carlos_alberto_urbina_aguilar', 'CARLOS ALBERTO URBINA AGUILAR', NULL, 3, '', 'Personal', '', '', 8, '4'),
('carlos_ariel_funes_gonzales', 'CARLOS ARIEL FUNES GONZALES', NULL, 3, '', 'Personal', '', '', 8, '8'),
('carlos_constantino_palma_villafranca', 'CARLOS CONSTANTINO PALMA VILLAFRANCA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('carlos_edilverto_castro_mendoza', 'CARLOS EDILVERTO CASTRO MENDOZA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('carlos_eduardo_hernandez_zepeda', 'CARLOS EDUARDO HERNANDEZ ZEPEDA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('carlos_eduardo_hernandez_zepeda_(2)', 'CARLOS EDUARDO HERNANDEZ ZEPEDA (2)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('carlos_eduardo_hernandez_zepeda_(3)', 'CARLOS EDUARDO HERNANDEZ ZEPEDA (3)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('carlos_emilio_urias_manchame', 'CARLOS EMILIO URIAS MANCHAME', NULL, 3, '', 'Personal', '', '', 8, '8'),
('carlos_enrique_ponce', 'CARLOS ENRIQUE PONCE', NULL, 3, '', 'Personal', '', '', 8, '9'),
('carlos_gustavo_bonilla_amaya', 'CARLOS GUSTAVO BONILLA AMAYA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('carlos_ivan_murillo_ortega', 'CARLOS IVAN MURILLO ORTEGA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('carlos_javier_benson_villatoro', 'CARLOS JAVIER BENSON VILLATORO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('carlos_javier_guerrero_euceda', 'CARLOS JAVIER GUERRERO EUCEDA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('carlos_luis_martines_argueta', 'CARLOS LUIS MARTINES ARGUETA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('carlos_miguel_salgado_soto', 'CARLOS MIGUEL SALGADO SOTO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('carlos_roberto_miles_mejia', 'CARLOS ROBERTO MILES MEJIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('carlos_ruben_flores_flores', 'CARLOS RUBEN FLORES FLORES', NULL, 3, '', 'Personal', '', '', 8, '2'),
('carmen_georgina_salomon_mendoza', 'CARMEN GEORGINA SALOMON MENDOZA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('carmen_midence_lopez_belquis_del', 'CARMEN MIDENCE LOPEZ BELQUIS DEL', NULL, 3, '', 'Personal', '', '', 8, '6'),
('carmen_patricia_espinoza_papp', 'CARMEN PATRICIA ESPINOZA PAPP', NULL, 3, '', 'Personal', '', '', 8, '7'),
('carmen_suyapa_rudon', 'CARMEN SUYAPA RUDON', NULL, 3, '', 'Personal', '', '', 8, '4'),
('carmen_suyapa_rudon_(2)', 'CARMEN SUYAPA RUDON (2)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('carol_patricia_acosta_cantillano', 'CAROL PATRICIA ACOSTA CANTILLANO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('cassie_alexandra_izaguirre_guzman', 'CASSIE ALEXANDRA IZAGUIRRE GUZMAN', NULL, 3, '', 'Personal', '', '', 8, '1'),
('celia_maria_rapalo', 'CELIA MARIA RAPALO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('cesar_manuel_bustamente ', 'CESAR MANUEL BUSTAMENTE ', NULL, 3, '', 'Personal', '', '', 8, '8'),
('cesar_yovany_mejia_alvarado', 'CESAR YOVANY MEJIA ALVARADO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('cesia_abigail_guerrero_maldonado', 'CESIA ABIGAIL GUERRERO MALDONADO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('chelsea_gabriela_lazo_velasquez', 'CHELSEA GABRIELA LAZO VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('christy_marari_bonilla_sorto', 'CHRISTY MARARI BONILLA SORTO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('cindy_gisel_alvarado_dominguez', 'CINDY GISEL ALVARADO DOMINGUEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('cindy_johana_garcia_hernandez', 'CINDY JOHANA GARCIA HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('cinthia_alejandra_turcios(consumo)', 'CINTHIA ALEJANDRA TURCIOS(CONSUMO)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('cinthia_joselyn_cruz_martinez', 'CINTHIA JOSELYN CRUZ MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('cintia_lizeth_carcamo_castillo', 'CINTIA LIZETH CARCAMO CASTILLO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('claudia_fabiola_rodriguez(consumo)', 'CLAUDIA FABIOLA RODRIGUEZ(CONSUMO)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('claudia_patricia_ramos_molina', 'CLAUDIA PATRICIA RAMOS MOLINA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('claudia_vanesa_flores_varela', 'CLAUDIA VANESA FLORES VARELA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('claudia_yesenia_zuniga_muÑoz', 'CLAUDIA YESENIA ZUNIGA MUÑOZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('consepcion_del_carmen_maradiaga_alfaro', 'CONSEPCION DEL CARMEN MARADIAGA ALFARO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('cornelio_de_jesus_almendares_serrano', 'CORNELIO DE JESUS ALMENDARES SERRANO', NULL, 3, '', 'Personal', '', '', 8, '5'),
('cristhian_andres_martinez_figueroa', 'CRISTHIAN ANDRES MARTINEZ FIGUEROA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('cristhian_humberto_caceres_fuentes', 'CRISTHIAN HUMBERTO CACERES FUENTES', NULL, 3, '', 'Personal', '', '', 8, '2'),
('cristhian_humberto_caceres_fuentes_(2)', 'CRISTHIAN HUMBERTO CACERES FUENTES (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('cristhian_yoel_aplicano_velasquez', 'CRISTHIAN YOEL APLICANO VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('cristian_omar_perez_perez', 'CRISTIAN OMAR PEREZ PEREZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('cristian_omar_perez_perez_(2)', 'CRISTIAN OMAR PEREZ PEREZ (2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('cristobal_edgardo_juarez_santiago', 'CRISTOBAL EDGARDO JUAREZ SANTIAGO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('dagoberto_carcamo_garcia', 'DAGOBERTO CARCAMO GARCIA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('dana_carolina_padilla_sosa', 'DANA CAROLINA PADILLA SOSA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('dana_darleny_lopez_soliz(2)', 'DANA DARLENY LOPEZ SOLIZ(2)', NULL, 3, '', 'Personal', '', '', 8, '7'),
('dania_idalmina_figueroa_calix', 'DANIA IDALMINA FIGUEROA CALIX', NULL, 3, '', 'Personal', '', '', 8, '2'),
('dania_idalmina_figueroa_calix_(2)', 'DANIA IDALMINA FIGUEROA CALIX (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('dania_nadin_marquez', 'DANIA NADIN MARQUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('dania_odali_erazo_contreras', 'DANIA ODALI ERAZO CONTRERAS', NULL, 3, '', 'Personal', '', '', 8, '2'),
('dania_odali_erazo_contreras_(2)', 'DANIA ODALI ERAZO CONTRERAS (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('dania_odali_erazo_contreras_(3)', 'DANIA ODALI ERAZO CONTRERAS (3)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('daniel_alexander_callejas_fajardo', 'DANIEL ALEXANDER CALLEJAS FAJARDO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('daniel_alexander_callejas_fajardo(3sar)', 'DANIEL ALEXANDER CALLEJAS FAJARDO(3SAR)', NULL, 3, '', 'Personal', '', '', 8, '1'),
('daniel_humberto_aguilar_gonzalez', 'DANIEL HUMBERTO AGUILAR GONZALEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('daniel_johary_garcia_melendez', 'DANIEL JOHARY GARCIA MELENDEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('dany_velimir_oyuela_muÑoz', 'DANY VELIMIR OYUELA MUÑOZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('darwin_yuvini_reyes', 'DARWIN YUVINI REYES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('david_jonatan_cantillanos_carcamo', 'DAVID JONATAN CANTILLANOS CARCAMO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('david_orlando_castillo_barahona', 'DAVID ORLANDO CASTILLO BARAHONA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('dayana_gisell_erazo_mejia', 'DAYANA GISELL ERAZO MEJIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('dayana_paola_argueta_jimenez', 'DAYANA PAOLA ARGUETA JIMENEZ', NULL, 3, '', 'Personal', '', '', 8, '4'),
('dayron_javier_serrano_sanchez', 'DAYRON JAVIER SERRANO SANCHEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('deisy_maricela_rodriguez_pineda', 'DEISY MARICELA RODRIGUEZ PINEDA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('delmer_eraldo_gamez_espinoza', 'DELMER ERALDO GAMEZ ESPINOZA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('delmer_josue_altamirano_castro', 'DELMER JOSUE ALTAMIRANO CASTRO', NULL, 3, '', 'Personal', '', '', 8, '8'),
('delmy_nohemy_benitez', 'DELMY NOHEMY BENITEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('delmy_nohemy_benitez_(2)', 'DELMY NOHEMY BENITEZ (2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('delmy_nohemy_benitez_(3)', 'DELMY NOHEMY BENITEZ (3)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('demo_app', 'DEMO APP', NULL, 3, '', 'Personal', '', '', 8, '1'),
('denis_andres_alvarado_velasquez', 'DENIS ANDRES ALVARADO VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('denys_josue_bonilla_martinez', 'DENYS JOSUE BONILLA MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('deysi_maria_artiaga_dueÑas', 'DEYSI MARIA ARTIAGA DUEÑAS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('deysi_maria_mejia_palacios', 'DEYSI MARIA MEJIA PALACIOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('diana_abigail_gonzalez_lemus', 'DIANA ABIGAIL GONZALEZ LEMUS', NULL, 3, '', 'Personal', '', '', 8, '3'),
('diana_leopoldina_pax_diaz', 'DIANA LEOPOLDINA PAX DIAZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('diksy_vanesa_belisle_mejia', 'DIKSY VANESA BELISLE MEJIA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('dilcia_julissa_umanzor_cabrera', 'DILCIA JULISSA UMANZOR CABRERA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('dilcia_marleny_bulnes_almendares', 'DILCIA MARLENY BULNES ALMENDARES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('dilcia_yamileth_borjas_del_cid', 'DILCIA YAMILETH BORJAS DEL CID', NULL, 3, '', 'Personal', '', '', 8, '7'),
('dimas_samael_vargas_gonzales', 'DIMAS SAMAEL VARGAS GONZALES', NULL, 3, '', 'Personal', '', '', 8, '6'),
('dina_abigail_hernandez_antunez', 'DINA ABIGAIL HERNANDEZ ANTUNEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('dina_elizabeth_alvarez_barahona', 'DINA ELIZABETH ALVAREZ BARAHONA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('dina_elizabeth_alvarez_barahona_(2)', 'DINA ELIZABETH ALVAREZ BARAHONA (2)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('dina_yesenia_turcios_castillo', 'DINA YESENIA TURCIOS CASTILLO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('diosara_michel_gonzalez_aguilar', 'DIOSARA MICHEL GONZALEZ AGUILAR', NULL, 3, '', 'Personal', '', '', 8, '1'),
('donis_javier_osorto_quevedo', 'DONIS JAVIER OSORTO QUEVEDO', NULL, 3, '', 'Personal', '', '', 8, '9'),
('dorcas_cantillano_aleman', 'DORCAS CANTILLANO ALEMAN', NULL, 3, '', 'Personal', '', '', 8, '1'),
('doris_emlda_berrios_padilla', 'DORIS EMLDA BERRIOS PADILLA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('doris_emlda_berrios_padilla_(2)', 'DORIS EMLDA BERRIOS PADILLA (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('doris_liliana_de_la_rosa_guevara', 'DORIS LILIANA DE LA ROSA GUEVARA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('douglas_fabricio_sanchez_escaÑo', 'DOUGLAS FABRICIO SANCHEZ ESCAÑO', NULL, 3, '', 'Personal', '', '', 8, '9'),
('dunia_lizeth_argueta_hernandez', 'DUNIA LIZETH ARGUETA HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('dunia_lizeth_perez_lendos', 'DUNIA LIZETH PEREZ LENDOS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('edar_danilo_licona', 'EDAR DANILO LICONA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('edder_josue_claros_orellana', 'EDDER JOSUE CLAROS ORELLANA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('edgardo_antonio_villanueva_gomez', 'EDGARDO ANTONIO VILLANUEVA GOMEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('edgar_samuel_reyes_orellana', 'EDGAR SAMUEL REYES ORELLANA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('edgar_samuel_reyes_orellana_(2)', 'EDGAR SAMUEL REYES ORELLANA (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('eduardo_cruz_alvarado', 'EDUARDO CRUZ ALVARADO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('eduardo_josue_alvarado_guevara', 'EDUARDO JOSUE ALVARADO GUEVARA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('edwin_alexander_delcid_ponce', 'EDWIN ALEXANDER DELCID PONCE', NULL, 3, '', 'Personal', '', '', 8, '1'),
('edwin_bladimir_lopez_paredez(1)', 'EDWIN BLADIMIR LOPEZ PAREDEZ(1)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('edwin_daniel_mendoza_perez', 'EDWIN DANIEL MENDOZA PEREZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('edwin_francisco_zepeda_salvador', 'EDWIN FRANCISCO ZEPEDA SALVADOR', NULL, 3, '', 'Personal', '', '', 8, '2'),
('edwin_francisco_zepeda_salvador_(2)', 'EDWIN FRANCISCO ZEPEDA SALVADOR (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('edy_santiago_cabrera_caceres', 'EDY SANTIAGO CABRERA CACERES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('efrain_vasquez_martinez', 'EFRAIN VASQUEZ MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '8'),
('eleazar_david_amador_palacios', 'ELEAZAR DAVID AMADOR PALACIOS', NULL, 3, '', 'Personal', '', '', 8, '2'),
('elias_jonathan_cardenas_orellana', 'ELIAS JONATHAN CARDENAS ORELLANA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('elmer_dagoberto_aguirre_sanchez', 'ELMER DAGOBERTO AGUIRRE SANCHEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('elmer_noe_mejia_sandoval', 'ELMER NOE MEJIA SANDOVAL', NULL, 3, '', 'Personal', '', '', 8, '8'),
('elmer_yasir_gonzales_hernandez', 'ELMER YASIR GONZALES HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('elsa_del_carmen_santos_reyes', 'ELSA DEL CARMEN SANTOS REYES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('elsa_patricia_romero_erazo', 'ELSA PATRICIA ROMERO ERAZO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('elsy_yojani_garcia_portillo', 'ELSY YOJANI GARCIA PORTILLO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('elsy_yojany_cruz_soza', 'ELSY YOJANY CRUZ SOZA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('elvin_adonay_gonzales_mejia', 'ELVIN ADONAY GONZALES MEJIA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('elvir_vasquez_juana_evangelista', 'ELVIR VASQUEZ JUANA EVANGELISTA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('elvir_vasquez_juana_evangelista_(2)', 'ELVIR VASQUEZ JUANA EVANGELISTA (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('emilia_roxana_castillo_castillo', 'EMILIA ROXANA CASTILLO CASTILLO', NULL, 3, '', 'Personal', '', '', 8, '9'),
('emilia_roxana_castillo_castillo_(2)', 'EMILIA ROXANA CASTILLO CASTILLO (2)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('emilson_geovany_corea_corea_', 'EMILSON GEOVANY COREA COREA ', NULL, 3, '', 'Personal', '', '', 8, '8'),
('enida_aurora_trejo_varela', 'ENIDA AURORA TREJO VARELA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('enny_rosario_garcia_turcios', 'ENNY ROSARIO GARCIA TURCIOS', NULL, 3, '', 'Personal', '', '', 8, '3'),
('erik_andre_aguilera_escalante', 'ERIK ANDRE AGUILERA ESCALANTE', NULL, 3, '', 'Personal', '', '', 8, '1'),
('eskeylin_danelsi_ruiz_herrera', 'ESKEYLIN DANELSI RUIZ HERRERA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('esly_yamileth_murillo_velasquez', 'ESLY YAMILETH MURILLO VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('esmerling_geovany_romero_vega', 'ESMERLING GEOVANY ROMERO VEGA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('estefanny_loany_padilla_ramos', 'ESTEFANNY LOANY PADILLA RAMOS', NULL, 3, '', 'Personal', '', '', 8, '3'),
('eva_delcarmen_rosales_rivera', 'EVA DELCARMEN ROSALES RIVERA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('evelyn_aguilar_solano_(consumo)', 'EVELYN AGUILAR SOLANO (CONSUMO)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('evelyn_lizeth_chavez_perdomo', 'EVELYN LIZETH CHAVEZ PERDOMO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('ever_agenor_arriaga_hernandez', 'EVER AGENOR ARRIAGA HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('ever_omiht_cartagena_ordoÑez', 'EVER OMIHT CARTAGENA ORDOÑEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('eylyn_danely_lemus_caballero', 'EYLYN DANELY LEMUS CABALLERO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('fadys_judit_velasquez_enamorado', 'FADYS JUDIT VELASQUEZ ENAMORADO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('fanny_melissa_guerra_quezada', 'FANNY MELISSA GUERRA QUEZADA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('fanny_melissa_maradiaga_amador', 'FANNY MELISSA MARADIAGA AMADOR', NULL, 3, '', 'Personal', '', '', 8, '9'),
('fanny_melissa_maradiaga_amador_(2)', 'FANNY MELISSA MARADIAGA AMADOR (2)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('fany_bustillo_lizardo', 'FANY BUSTILLO LIZARDO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('fany_rosario_matamoros_martinez', 'FANY ROSARIO MATAMOROS MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('fany_rosario_matamoros_martinez_(2)', 'FANY ROSARIO MATAMOROS MARTINEZ (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('fany_rosario_matamoros_martinez_(3)', 'FANY ROSARIO MATAMOROS MARTINEZ (3)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('felix_amilcar_guillen_sanchez', 'FELIX AMILCAR GUILLEN SANCHEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('fermin_garcia_alfaro', 'FERMIN GARCIA ALFARO', NULL, 3, '', 'Personal', '', '', 8, '9'),
('fernando_alonso_rivera_ortiz', 'FERNANDO ALONSO RIVERA ORTIZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('fiama_estefany_amaya_castro ', 'FIAMA ESTEFANY AMAYA CASTRO ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('francisco_alejandro_hernandez_alonso', 'FRANCISCO ALEJANDRO HERNANDEZ ALONSO', NULL, 3, '', 'Personal', '', '', 8, '6'),
('francisco_alejandro_hernandez_alonso_(2)', 'FRANCISCO ALEJANDRO HERNANDEZ ALONSO (2)', NULL, 3, '', 'Personal', '', '', 8, '6'),
('francisco_alonzo_bonilla_delcid', 'FRANCISCO ALONZO BONILLA DELCID', NULL, 3, '', 'Personal', '', '', 8, '1'),
('francisco_andony_rodriguez_vargas', 'FRANCISCO ANDONY RODRIGUEZ VARGAS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('francis_geroan_medina_vasquez', 'FRANCIS GEROAN MEDINA VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('franklin_obed_bonilla_castellon', 'FRANKLIN OBED BONILLA CASTELLON', NULL, 3, '', 'Personal', '', '', 8, '3'),
('franklin_obed_lopez_vasquez', 'FRANKLIN OBED LOPEZ VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('franklyn_alberto_ramos', 'FRANKLYN ALBERTO RAMOS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('frany_josue_funez_chavez', 'FRANY JOSUE FUNEZ CHAVEZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('fredy_geovany_cruz_rios', 'FREDY GEOVANY CRUZ RIOS', NULL, 3, '', 'Personal', '', '', 8, '6'),
('fredy_omar_espinal_fajardo', 'FREDY OMAR ESPINAL FAJARDO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('gabriela_jazmin_amador_pineda', 'GABRIELA JAZMIN AMADOR PINEDA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('gabriel_turcios_verde', 'GABRIEL TURCIOS VERDE', NULL, 3, '', 'Personal', '', '', 8, '3'),
('gener_omar_castro_rosales', 'GENER OMAR CASTRO ROSALES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('germain_santamaria_bonilla', 'GERMAIN SANTAMARIA BONILLA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('german_alejandro_pineda_lorenzo', 'GERMAN ALEJANDRO PINEDA LORENZO', NULL, 3, '', 'Personal', '', '', 8, '5'),
('german_donaldo_medina_diaz', 'GERMAN DONALDO MEDINA DIAZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('german_evelio_zaldivar_montes', 'GERMAN EVELIO ZALDIVAR MONTES', NULL, 3, '', 'Personal', '', '', 8, '8'),
('german_santos_carcamo_banegas', 'GERMAN SANTOS CARCAMO BANEGAS', NULL, 3, '', 'Personal', '', '', 8, '2'),
('gersin_joel_rivera_reyes', 'GERSIN JOEL RIVERA REYES', NULL, 3, '', 'Personal', '', '', 8, '8'),
('gerson_alexander_gallardo_corrales', 'GERSON ALEXANDER GALLARDO CORRALES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('geydyn_lariseth_barrera_chinchilla', 'GEYDYN LARISETH BARRERA CHINCHILLA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('gina_ivett_canales_oseguera', 'GINA IVETT CANALES OSEGUERA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('gina_ivett_canales_oseguera_(2)', 'GINA IVETT CANALES OSEGUERA (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('gladis_ondina_mejia_amaya', 'GLADIS ONDINA MEJIA AMAYA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('gladys_danubia_pasos_benitez', 'GLADYS DANUBIA PASOS BENITEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('glenis_aracely_sanchez', 'GLENIS ARACELY SANCHEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('guillermo_alberto_ramos_hernandez', 'GUILLERMO ALBERTO RAMOS HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('guillermo_alejandro_huete_zepeda', 'GUILLERMO ALEJANDRO HUETE ZEPEDA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('gustavo_adolfo_mercadal', 'GUSTAVO ADOLFO MERCADAL', NULL, 3, '', 'Personal', '', '', 8, '6'),
('harlam_manuel_flores_licona', 'HARLAM MANUEL FLORES LICONA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('hector_david_chavez_ortega', 'HECTOR DAVID CHAVEZ ORTEGA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('hector_eligio_castellanos_villanueva', 'HECTOR ELIGIO CASTELLANOS VILLANUEVA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('heidi_mariel_paz_hernandez', 'HEIDI MARIEL PAZ HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('herman_ariel_ventura_herrera', 'HERMAN ARIEL VENTURA HERRERA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('hernan_mejia_tabora', 'HERNAN MEJIA TABORA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('hilda_sonia_murillo_gavarrete', 'HILDA SONIA MURILLO GAVARRETE', NULL, 3, '', 'Personal', '', '', 8, '8'),
('homeer_fernando_escobar_ordoÑez', 'HOMEER FERNANDO ESCOBAR ORDOÑEZ', NULL, 3, '', 'Personal', '', '', 8, '4'),
('hugo_otoniel_flores_ortez', 'HUGO OTONIEL FLORES ORTEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ian_wegner_morazan_figueroa', 'IAN WEGNER MORAZAN FIGUEROA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('ines_alejandra_padilla_erazo', 'INES ALEJANDRA PADILLA ERAZO', NULL, 3, '', 'Personal', '', '', 8, '6'),
('ingrid_yaneth_zepeda_zelaya', 'INGRID YANETH ZEPEDA ZELAYA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ingrid_yaneth_zepeda_zelaya_(2)', 'INGRID YANETH ZEPEDA ZELAYA (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('iris_mariana_deras_melgar', 'IRIS MARIANA DERAS MELGAR', NULL, 3, '', 'Personal', '', '', 8, '1'),
('irma_lupi_ortiz', 'IRMA LUPI ORTIZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('isaac_donaire_lopez', 'ISAAC DONAIRE LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('isamary_isabel_balenzuela_martinez', 'ISAMARY ISABEL BALENZUELA MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('ivan_alfredo_sarmiento_canales', 'IVAN ALFREDO SARMIENTO CANALES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jairo_donaldo_muÑoz_muÑoz', 'JAIRO DONALDO MUÑOZ MUÑOZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('jairo_otoniel_pineda_lopez', 'JAIRO OTONIEL PINEDA LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jairo_samuel_martinez_rodas', 'JAIRO SAMUEL MARTINEZ RODAS', NULL, 3, '', 'Personal', '', '', 8, '6'),
('jarvin_david_reyes_funez', 'JARVIN DAVID REYES FUNEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('javer_enrique_najera', 'JAVER ENRIQUE NAJERA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('javier_danilo_rivera', 'JAVIER DANILO RIVERA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('javier_eduardo_lara_ramirez', 'JAVIER EDUARDO LARA RAMIREZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('jeimy_scarleth_amaya_castro', 'JEIMY SCARLETH AMAYA CASTRO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jenifer_karina_pavon_ben', 'JENIFER KARINA PAVON BEN', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jenncy_carolina_jimenez_villanueva', 'JENNCY CAROLINA JIMENEZ VILLANUEVA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jennifer_suhail_guevara_alvarado', 'JENNIFER SUHAIL GUEVARA ALVARADO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jennyfer_susette_hernandez_guevara', 'JENNYFER SUSETTE HERNANDEZ GUEVARA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jenny_jullisa_andrade_andino', 'JENNY JULLISA ANDRADE ANDINO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('jenny_jullisa_andrade_andino_(2)', 'JENNY JULLISA ANDRADE ANDINO (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('jenny_maritza_garcia_rodriguez', 'JENNY MARITZA GARCIA RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jerry_dionisio_canizales_macedo', 'JERRY DIONISIO CANIZALES MACEDO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('jessenia_valesca_marquez_inestrosa', 'JESSENIA VALESCA MARQUEZ INESTROSA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jessica_cedillos_perez', 'JESSICA CEDILLOS PEREZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jeymi_karina_madrid_muÑoz', 'JEYMI KARINA MADRID MUÑOZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jhonny_alessandro_calderon_perlas ', 'JHONNY ALESSANDRO CALDERON PERLAS ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jillian_massiel_hernandez_zepeda', 'JILLIAN MASSIEL HERNANDEZ ZEPEDA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('jimy_alexander_caldedor_avelar', 'JIMY ALEXANDER CALDEDOR AVELAR', NULL, 3, '', 'Personal', '', '', 8, '1'),
('joaquin_francisco_toro_pineda', 'JOAQUIN FRANCISCO TORO PINEDA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('joel_alexander_caballero_rodriguez', 'JOEL ALEXANDER CABALLERO RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('johnny_rolando_reyes_padilla', 'JOHNNY ROLANDO REYES PADILLA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jonnior_alexander_varela_muÑoz', 'JONNIOR ALEXANDER VARELA MUÑOZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('jorge_alberto_lopez_santos', 'JORGE ALBERTO LOPEZ SANTOS', NULL, 3, '', 'Personal', '', '', 8, '4'),
('jorge_antonio_morales_triminio', 'JORGE ANTONIO MORALES TRIMINIO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jorge_arturo_solis_rivera', 'JORGE ARTURO SOLIS RIVERA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jorge_david_zelaya_martinez', 'JORGE DAVID ZELAYA MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('jorge_luis_zelaya_solis', 'JORGE LUIS ZELAYA SOLIS', NULL, 3, '', 'Personal', '', '', 8, '4'),
('jose_alberto_barrera_ortiz', 'JOSE ALBERTO BARRERA ORTIZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('jose_alberto_machado_vasquez', 'JOSE ALBERTO MACHADO VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jose_antonio_mejia_orellana', 'JOSE ANTONIO MEJIA ORELLANA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('jose_arturo_barrientos', 'JOSE ARTURO BARRIENTOS', NULL, 3, '', 'Personal', '', '', 8, '8'),
('jose_candido_tacho_cruz', 'JOSE CANDIDO TACHO CRUZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jose_darwin_ordoÑez_villalta', 'JOSE DARWIN ORDOÑEZ VILLALTA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('jose_edgardo_garcia_vasquez', 'JOSE EDGARDO GARCIA VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jose_edgardo_perez', 'JOSE EDGARDO PEREZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jose_edgardo_urquia_mercado', 'JOSE EDGARDO URQUIA MERCADO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jose_ezequiel_muÑoz_castellanos', 'JOSE EZEQUIEL MUÑOZ CASTELLANOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jose_francisco_mejoa_ramires', 'JOSE FRANCISCO MEJOA RAMIRES', NULL, 3, '', 'Personal', '', '', 8, '5'),
('jose_isaias_hernandez_ordonez', 'JOSE ISAIAS HERNANDEZ ORDONEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('jose_isamir_najar_burgos', 'JOSE ISAMIR NAJAR BURGOS', NULL, 3, '', 'Personal', '', '', 8, '9'),
('jose_jonathan_martinez_navarro', 'JOSE JONATHAN MARTINEZ NAVARRO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('jose_lino_vasquez_gomez', 'JOSE LINO VASQUEZ GOMEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jose_luis_aleman', 'JOSE LUIS ALEMAN', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jose_manuel_puerto', 'JOSE MANUEL PUERTO', NULL, 3, '', 'Personal', '', '', 8, '8'),
('jose_melvis_ramos_ramirez', 'JOSE MELVIS RAMOS RAMIREZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jose_noel_alvarenga_alas', 'JOSE NOEL ALVARENGA ALAS', NULL, 3, '', 'Personal', '', '', 8, '8'),
('jose_obdulio_orellana_ramirez', 'JOSE OBDULIO ORELLANA RAMIREZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('jose_ramon_muÑoz_membreÑo', 'JOSE RAMON MUÑOZ MEMBREÑO', NULL, 3, '', 'Personal', '', '', 8, '6'),
('jose_ramon_rivera_duran', 'JOSE RAMON RIVERA DURAN', NULL, 3, '', 'Personal', '', '', 8, '8'),
('jose_roberto_colindres_espinal', 'JOSE ROBERTO COLINDRES ESPINAL', NULL, 3, '', 'Personal', '', '', 8, '9'),
('jose_wilson_alvarez_jimenez', 'JOSE WILSON ALVAREZ JIMENEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('josselin_argentina_mejia_santos', 'JOSSELIN ARGENTINA MEJIA SANTOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('josselin_argentina_mejia_santos_(2)', 'JOSSELIN ARGENTINA MEJIA SANTOS (2)', NULL, 3, '', 'Personal', '', '', 8, '1'),
('josselyn_amanda_paz_pineda', 'JOSSELYN AMANDA PAZ PINEDA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('josue_omar_mejia_vargas', 'JOSUE OMAR MEJIA VARGAS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('josue_rodriguez_paz', 'JOSUE RODRIGUEZ PAZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('juana_araceli_claros_zelaya', 'JUANA ARACELI CLAROS ZELAYA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('juan_antonio_mejia_zelaya', 'JUAN ANTONIO MEJIA ZELAYA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('juan_carlos_argueta_ochoa', 'JUAN CARLOS ARGUETA OCHOA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('juan_carlos_pineda', 'JUAN CARLOS PINEDA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('juan_enrique_centeno_mejia', 'JUAN ENRIQUE CENTENO MEJIA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('juan_francisco_villacorta_diaz', 'JUAN FRANCISCO VILLACORTA DIAZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('juan_jose_corea_barahona', 'JUAN JOSE COREA BARAHONA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('juan_jose_rivas_macoi', 'JUAN JOSE RIVAS MACOI', NULL, 3, '', 'Personal', '', '', 8, '4'),
('juan_miguel_molina_valle', 'JUAN MIGUEL MOLINA VALLE', NULL, 3, '', 'Personal', '', '', 8, '5'),
('juan_ramon_aguilera_quiroz', 'JUAN RAMON AGUILERA QUIROZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('juan_ramon_molina_amaya', 'JUAN RAMON MOLINA AMAYA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('julia_ondina_trochez_bueso', 'JULIA ONDINA TROCHEZ BUESO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('julio_aroldo_jimenez', 'JULIO AROLDO JIMENEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('julio_cesar_duarte_espinoza', 'JULIO CESAR DUARTE ESPINOZA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('julio_santos_villanueva_cuellas', 'JULIO SANTOS VILLANUEVA CUELLAS', NULL, 3, '', 'Personal', '', '', 8, '5'),
('julissa_carolina_muÑoz_velasquez', 'JULISSA CAROLINA MUÑOZ VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('jymmy_arnaldo_cruz_alvarado', 'JYMMY ARNALDO CRUZ ALVARADO', NULL, 3, '', 'Personal', '', '', 8, '8'),
('karen_jojaha_hernandez_tejada', 'KAREN JOJAHA HERNANDEZ TEJADA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('karen_meliza_ulloa_ulloa', 'KAREN MELIZA ULLOA ULLOA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('karen_meliza_ulloa_ulloa(2)', 'KAREN MELIZA ULLOA ULLOA(2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('karen_meliza_ulloa_ulloa(3)', 'KAREN MELIZA ULLOA ULLOA(3)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('karen_nataly_espinal_rivera', 'KAREN NATALY ESPINAL RIVERA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('karen_nataly_espinal_rivera_(2)', 'KAREN NATALY ESPINAL RIVERA (2)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('karina_martinez_benavidez', 'KARINA MARTINEZ BENAVIDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('karla_damaris_guzman_euceda', 'KARLA DAMARIS GUZMAN EUCEDA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('karla_dayana_garcia_vasquez', 'KARLA DAYANA GARCIA VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('karla_nicolle_castro_garcia', 'KARLA NICOLLE CASTRO GARCIA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('karla_waleska_urbina_lopez', 'KARLA WALESKA URBINA LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('karla_yasmin_rivas_acosta', 'KARLA YASMIN RIVAS ACOSTA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('karla_yasmin_rivas_acosta(2)', 'KARLA YASMIN RIVAS ACOSTA(2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('karla_yesenia_rivera_mejia', 'KARLA YESENIA RIVERA MEJIA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('katherine_nikol_hernandez_aguilar', 'KATHERINE NIKOL HERNANDEZ AGUILAR', NULL, 3, '', 'Personal', '', '', 8, '5'),
('katherine_nikol_hernandez_aguilar_(2)', 'KATHERINE NIKOL HERNANDEZ AGUILAR (2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('katherine_nikol_hernandez_aguilar_(3)', 'KATHERINE NIKOL HERNANDEZ AGUILAR (3)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('kathia_yadira_gunera_cruz', 'KATHIA YADIRA GUNERA CRUZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('kathia_yadira_gunera_cruz_(2)', 'KATHIA YADIRA GUNERA CRUZ (2)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('keily_marian_escobar_reyes', 'KEILY MARIAN ESCOBAR REYES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('kelsin_oxmaryvarela_serrano', 'KELSIN OXMARYVARELA SERRANO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('keneth_javier_urbina_mejÍa', 'KENETH JAVIER URBINA MEJÍA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('keneth_josue_coello_barahona', 'KENETH JOSUE COELLO BARAHONA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('kenia_yolani_maldonado_mejia', 'KENIA YOLANI MALDONADO MEJIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('keren_elizabeth_guerrero_maldonado', 'KEREN ELIZABETH GUERRERO MALDONADO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('kerin_mauricio__pineda_pineda(2)', 'KERIN MAURICIO  PINEDA PINEDA(2)', NULL, 3, '', 'Personal', '', '', 8, '1'),
('kerlin_daniel_ramos', 'KERLIN DANIEL RAMOS', NULL, 3, '', 'Personal', '', '', 8, '8'),
('kerly_janneth_martinez_rosales', 'KERLY JANNETH MARTINEZ ROSALES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('kerstin_elizabeth_cruz_castro', 'KERSTIN ELIZABETH CRUZ CASTRO', NULL, 3, '', 'Personal', '', '', 8, '4'),
('kerstin_elizabeth_cruz_castro_(2)', 'KERSTIN ELIZABETH CRUZ CASTRO (2)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('kerstin_elizabeth_cruz_castro_(3)', 'KERSTIN ELIZABETH CRUZ CASTRO (3)', NULL, 3, '', 'Personal', '', '', 8, '4'),
('kevin_adalid_mendez_lopez', 'KEVIN ADALID MENDEZ LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('kevin_alberto_alvarado_garcia', 'KEVIN ALBERTO ALVARADO GARCIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('kevin_geovany_alvarado_aguilera', 'KEVIN GEOVANY ALVARADO AGUILERA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('keyla_rina_hernandez_antunez', 'KEYLA RINA HERNANDEZ ANTUNEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('keyla_walquidia_hernÁndez_fernandez(2)', 'KEYLA WALQUIDIA HERNÁNDEZ FERNANDEZ(2)', NULL, 3, '', 'Personal', '', '', 8, '7'),
('keyli_excely_cantllano_hercules', 'KEYLI EXCELY CANTLLANO HERCULES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('keyri_odalis_corea_escalante', 'KEYRI ODALIS COREA ESCALANTE', NULL, 3, '', 'Personal', '', '', 8, '1'),
('kirian_yolibeth_reyes_moreira', 'KIRIAN YOLIBETH REYES MOREIRA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('kristel_nallely_machado_velÁsquez', 'KRISTEL NALLELY MACHADO VELÁSQUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('kristel_nallely_machado_velÁsquez(ch)', 'KRISTEL NALLELY MACHADO VELÁSQUEZ(CH)', NULL, 3, '', 'Personal', '', '', 8, '8'),
('kristel_nallely_machado_velÁsquez(tl)', 'KRISTEL NALLELY MACHADO VELÁSQUEZ(TL)', NULL, 3, '', 'Personal', '', '', 8, '6'),
('larixa_johana_rodas_mendez', 'LARIXA JOHANA RODAS MENDEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('lariza_yamileth_romero_ocampo', 'LARIZA YAMILETH ROMERO OCAMPO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('lazaro_de_jesus_romero_veliz', 'LAZARO DE JESUS ROMERO VELIZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('ledby_zurisaday_gomez_manueles', 'LEDBY ZURISADAY GOMEZ MANUELES', NULL, 3, '', 'Personal', '', '', 8, '5'),
('ledys_carminda_valladares_corrales', 'LEDYS CARMINDA VALLADARES CORRALES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lenny_aracely_martinez_castellon', 'LENNY ARACELY MARTINEZ CASTELLON', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lesly_gabriela_urbina_arias', 'LESLY GABRIELA URBINA ARIAS', NULL, 3, '', 'Personal', '', '', 8, '4'),
('lesly_iliana_guevara_carcamo', 'LESLY ILIANA GUEVARA CARCAMO', NULL, 3, '', 'Personal', '', '', 8, '6'),
('lesly_patricia_sanabria', 'LESLY PATRICIA SANABRIA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('lesly_patricia_sanabria_(2)', 'LESLY PATRICIA SANABRIA (2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('lesly_patricia_sanabria_(3)', 'LESLY PATRICIA SANABRIA (3)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('leyla_xiomara_mendez_acosta', 'LEYLA XIOMARA MENDEZ ACOSTA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('lidia_aracely_flores_rodriguez', 'LIDIA ARACELY FLORES RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('lidia_beatriz_mena_martinez', 'LIDIA BEATRIZ MENA MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lidia_marcela_portillo_zapata', 'LIDIA MARCELA PORTILLO ZAPATA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lidia_suyapa_tinoco_villanueva', 'LIDIA SUYAPA TINOCO VILLANUEVA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('lidia_vanessa_martinez_guardado', 'LIDIA VANESSA MARTINEZ GUARDADO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lilian_lisseth_arriaga_perdomo', 'LILIAN LISSETH ARRIAGA PERDOMO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lindy_guadalupe_garcia_hernandez', 'LINDY GUADALUPE GARCIA HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lourdes_garcia_toro', 'LOURDES GARCIA TORO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lourdes_xiomara_madrid', 'LOURDES XIOMARA MADRID', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lourdes_xiomara_madrid(q)', 'LOURDES XIOMARA MADRID(Q)', NULL, 3, '', 'Personal', '', '', 8, '1'),
('lourdes_yadira_aguiluz_aguiriano', 'LOURDES YADIRA AGUILUZ AGUIRIANO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('Lsanchez', 'Lixi Nayely Sanchez Ayala', '$2y$10$Zd2dzgpMZZbLiXYTgpxQ4eM4afUhz26n0wmWZsbjb4CxLFD6vIdJ6', 1, '89824240', 'Corporativo', '358711756334231', 'Luciano Baide', 9, '1'),
('luis_alonso_urquia_miranda', 'LUIS ALONSO URQUIA MIRANDA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('luis_alonzo_garcia_villanueva', 'LUIS ALONZO GARCIA VILLANUEVA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('luis_alonzo_lagos_trujillo', 'LUIS ALONZO LAGOS TRUJILLO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('luis_eliazar_contreras_sevilla', 'LUIS ELIAZAR CONTRERAS SEVILLA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('luis_enrique_lopez_sanchez', 'LUIS ENRIQUE LOPEZ SANCHEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('luis_ernesto_blandin_reyes', 'LUIS ERNESTO BLANDIN REYES', NULL, 3, '', 'Personal', '', '', 8, '2'),
('luis_fernando_claros_hernandez', 'LUIS FERNANDO CLAROS HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '8'),
('luis_fernando_hernandez_valladades', 'LUIS FERNANDO HERNANDEZ VALLADADES', NULL, 3, '', 'Personal', '', '', 8, '2'),
('luis_fernando_hernandez_valladares', 'LUIS FERNANDO HERNANDEZ VALLADARES', NULL, 3, '', 'Personal', '', '', 8, '2'),
('luis_gerardo_castro', 'LUIS GERARDO CASTRO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('luis_renato_flores_zuniga', 'LUIS RENATO FLORES ZUNIGA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('madeline_ibeth_alvarez_montes', 'MADELINE IBETH ALVAREZ MONTES', NULL, 3, '', 'Personal', '', '', 8, '9'),
('magna_yamileth_kuthe_molina', 'MAGNA YAMILETH KUTHE MOLINA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('mainor_rigoberto_puerto_torres', 'MAINOR RIGOBERTO PUERTO TORRES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('maira_lopez_vega', 'MAIRA LOPEZ VEGA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('maira_margarita_ansora_castillo', 'MAIRA MARGARITA ANSORA CASTILLO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('marbelina_tinoco_echeverria', 'MARBELINA TINOCO ECHEVERRIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('marcela_iveth_hernandez_perez', 'MARCELA IVETH HERNANDEZ PEREZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('marcela_iveth_hernandez_perez_(2)', 'MARCELA IVETH HERNANDEZ PEREZ (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('marcos_david_santos_hernandez', 'MARCOS DAVID SANTOS HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('marcos_humberto_figueroa_martinez', 'MARCOS HUMBERTO FIGUEROA MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '4'),
('marco_tulio_perez_quezada', 'MARCO TULIO PEREZ QUEZADA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('marely_hernandez_villeda', 'MARELY HERNANDEZ VILLEDA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('margie_xiomara_bonilla_ramirez', 'MARGIE XIOMARA BONILLA RAMIREZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('maria_catalina_rodriguez_flores', 'MARIA CATALINA RODRIGUEZ FLORES', NULL, 3, '', 'Personal', '', '', 8, '7'),
('maria_celeste_jimenez_marquez', 'MARIA CELESTE JIMENEZ MARQUEZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('maria_del_carmen_mejia_herrera', 'MARIA DEL CARMEN MEJIA HERRERA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('maria_dolores_vasquez_aleman', 'MARIA DOLORES VASQUEZ ALEMAN', NULL, 3, '', 'Personal', '', '', 8, '1'),
('maria_elizabet_alvarado_diaz', 'MARIA ELIZABET ALVARADO DIAZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('maria_robertina_rivera_bautista', 'MARIA ROBERTINA RIVERA BAUTISTA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('mario_alberto_flores_garcia', 'MARIO ALBERTO FLORES GARCIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('mario_ernesto_jimenez', 'MARIO ERNESTO JIMENEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('mario_gerardo_vasquez_zelaya', 'MARIO GERARDO VASQUEZ ZELAYA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('mario_noel_castellanos_garcia', 'MARIO NOEL CASTELLANOS GARCIA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('mario_rene_cruz', 'MARIO RENE CRUZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('maritza_odilia_mejia_garcia', 'MARITZA ODILIA MEJIA GARCIA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('marlen_enemecia_fuentez_enamorado', 'MARLEN ENEMECIA FUENTEZ ENAMORADO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('marlon_alberto_lobo_valdez', 'MARLON ALBERTO LOBO VALDEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('marlon_javier_hernandez', 'MARLON JAVIER HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('marlon_joaquin_meza_pineda', 'MARLON JOAQUIN MEZA PINEDA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('marvin_antonio_vega_espino', 'MARVIN ANTONIO VEGA ESPINO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('marvin_yovanny_amador_hernandez', 'MARVIN YOVANNY AMADOR HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('maryuri_mirieth_lopez_gamez', 'MARYURI MIRIETH LOPEZ GAMEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('mayra_efigenia_ventura_delcid', 'MAYRA EFIGENIA VENTURA DELCID', NULL, 3, '', 'Personal', '', '', 8, '1'),
('mayra_grisel_quesada_beltran', 'MAYRA GRISEL QUESADA BELTRAN', NULL, 3, '', 'Personal', '', '', 8, '7'),
('mayra_izamar_paz_velasquez', 'MAYRA IZAMAR PAZ VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('mayra_nohemy_reyes_orellana', 'MAYRA NOHEMY REYES ORELLANA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('mayra_patricia_leiva_almendarez', 'MAYRA PATRICIA LEIVA ALMENDAREZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('melani_danei_echeverria_acosta', 'MELANI DANEI ECHEVERRIA ACOSTA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('melvin_audy_moreno_rodriguez', 'MELVIN AUDY MORENO RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('melvin_david_martinez_godoy', 'MELVIN DAVID MARTINEZ GODOY', NULL, 3, '', 'Personal', '', '', 8, '1'),
('melvin_javier_mejia_howard', 'MELVIN JAVIER MEJIA HOWARD', NULL, 3, '', 'Personal', '', '', 8, '8'),
('mercedes_jackeline_roque_recarte', 'MERCEDES JACKELINE ROQUE RECARTE', NULL, 3, '', 'Personal', '', '', 8, '2'),
('mercedes_jackeline_roque_recarte_(2)', 'MERCEDES JACKELINE ROQUE RECARTE (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('merlin_juliette_rodriguez', 'MERLIN JULIETTE RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('merlin_omar_moran_pineda', 'MERLIN OMAR MORAN PINEDA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('meza_alvarado_mario_milton', 'MEZA ALVARADO MARIO MILTON', NULL, 3, '', 'Personal', '', '', 8, '2'),
('miguel_angel_menjivar_velasquez', 'MIGUEL ANGEL MENJIVAR VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('miguel_angel_rivera_tabora', 'MIGUEL ANGEL RIVERA TABORA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('miriam_jamileth_enamorado_manzanares', 'MIRIAM JAMILETH ENAMORADO MANZANARES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('mirian_esther_gonzales_herrera', 'MIRIAN ESTHER GONZALES HERRERA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('mirlan_abigail_hernandez_zambrano', 'MIRLAN ABIGAIL HERNANDEZ ZAMBRANO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('mirlan_abigail_hernandez_zambrano_(2)', 'MIRLAN ABIGAIL HERNANDEZ ZAMBRANO (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('mirna_dalila_hernandez_castro', 'MIRNA DALILA HERNANDEZ CASTRO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('misael_pineda_mendoza', 'MISAEL PINEDA MENDOZA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('nahomy_dayana_urquia_sanchez', 'NAHOMY DAYANA URQUIA SANCHEZ', NULL, 3, '', 'Personal', '', '', 8, '1');
INSERT INTO `usuarios` (`usuario`, `nombre`, `contrasena`, `rol`, `telefono`, `tipo_telefono`, `IMEI`, `jefe_inmediato`, `departamento_id`, `planta`) VALUES
('naiki_elizabeth_pineda_echevarria', 'NAIKI ELIZABETH PINEDA ECHEVARRIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('nancy_carolina_palacios_hernandez', 'NANCY CAROLINA PALACIOS HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('nancy_dariela_castro_chavez', 'NANCY DARIELA CASTRO CHAVEZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('nayeli_givela_martÍnez_pacheco', 'NAYELI GIVELA MARTÍNEZ PACHECO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('nayely_ayala', 'NAYELY AYALA', '$2y$10$PU4bc5KNXqbd4W4xXRn4FegzU1FOoo8cUHtXwfVRPvswCd2slIRPy', 5, '', '', '', 'Luciano Bayden', 4, '1'),
('nelis_victoria_valle_romero', 'NELIS VICTORIA VALLE ROMERO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('nelly_beatriz_mateo_hernandez', 'NELLY BEATRIZ MATEO HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('nelly_beatriz_mateo_hernandez(2)', 'NELLY BEATRIZ MATEO HERNANDEZ(2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('nelson_arony_vasquez_chavez', 'NELSON ARONY VASQUEZ CHAVEZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('nelson_david_sanchez_seren', 'NELSON DAVID SANCHEZ SEREN', NULL, 3, '', 'Personal', '', '', 8, '3'),
('nelson_gaspar_garcia_reyes', 'NELSON GASPAR GARCIA REYES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('nery_felipe_mendez_osorto', 'NERY FELIPE MENDEZ OSORTO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('nestor_ely_saavedra_enamorado', 'NESTOR ELY SAAVEDRA ENAMORADO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('nilson_fernando_castrio_herrera', 'NILSON FERNANDO CASTRIO HERRERA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('nineth_claribel_ramirez_enrriquez', 'NINETH CLARIBEL RAMIREZ ENRRIQUEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('nixa_loany__cabrera_guifarro', 'NIXA LOANY  CABRERA GUIFARRO', NULL, 3, '', 'Personal', '', '', 8, '6'),
('nixcia_roxana_leon_melgar', 'NIXCIA ROXANA LEON MELGAR', NULL, 3, '', 'Personal', '', '', 8, '7'),
('nixon_vaguely_orellana_claros', 'NIXON VAGUELY ORELLANA CLAROS', NULL, 3, '', 'Personal', '', '', 8, '3'),
('nora_betsabe_zelaya_padilla', 'NORA BETSABE ZELAYA PADILLA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('norman_valderramos_madrid', 'NORMAN VALDERRAMOS MADRID', NULL, 3, '', 'Personal', '', '', 8, '3'),
('norma_elizabeth_maldonado_osorio', 'NORMA ELIZABETH MALDONADO OSORIO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('norma_luz_cantillano', 'NORMA LUZ CANTILLANO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('norma_maribel_garcia_nuÑez', 'NORMA MARIBEL GARCIA NUÑEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('odalmys_ignacia_dominguez', 'ODALMYS IGNACIA DOMINGUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('ody_emil_avaloy_salgado', 'ODY EMIL AVALOY SALGADO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('olbin_irene_madrid_paz', 'OLBIN IRENE MADRID PAZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('oliver_orley_paz_guillen', 'OLIVER ORLEY PAZ GUILLEN', NULL, 3, '', 'Personal', '', '', 8, '8'),
('olvin_armando_flores_elvir', 'OLVIN ARMANDO FLORES ELVIR', NULL, 3, '', 'Personal', '', '', 8, '9'),
('olvin_onan_ochoa', 'OLVIN ONAN OCHOA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('omar_mauricio_cortez_vasquez', 'OMAR MAURICIO CORTEZ VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '5'),
('omar_mauricio_cortez_vasquez_(2)', 'OMAR MAURICIO CORTEZ VASQUEZ (2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('omar_mauricio_cortez_vasquez_(3)', 'OMAR MAURICIO CORTEZ VASQUEZ (3)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('omar_mauricio_cortez_vasquez_(4)', 'OMAR MAURICIO CORTEZ VASQUEZ (4)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('omar_mauricio_cortez_vasquez_(5)', 'OMAR MAURICIO CORTEZ VASQUEZ (5)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('omar_zaldivar_licona', 'OMAR ZALDIVAR LICONA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('orbelina_gonzales_morales', 'ORBELINA GONZALES MORALES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('osaman_geovany_castro_alcerro', 'OSAMAN GEOVANY CASTRO ALCERRO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('oscar_gerardo_giron_lopez', 'OSCAR GERARDO GIRON LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('oscar_jose_fuentes_mendez', 'OSCAR JOSE FUENTES MENDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('oscar_valdiviezo', 'OSCAR VALDIVIEZO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('osman_rodrigo_guzman_medina', 'OSMAN RODRIGO GUZMAN MEDINA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('osmeyra_daressa_herrera_hernandez', 'OSMEYRA DARESSA HERRERA HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('oswaldo_jose_mendoza_cruz', 'OSWALDO JOSE MENDOZA CRUZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('oswaldo_jose_mendoza_cruz_(2)', 'OSWALDO JOSE MENDOZA CRUZ (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('patricia_mencia_echaver', 'PATRICIA MENCIA ECHAVER', NULL, 3, '', 'Personal', '', '', 8, '3'),
('patricia_yolibeth_martinez_cantarero', 'PATRICIA YOLIBETH MARTINEZ CANTARERO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('paula_angelica_lopez_mendez', 'PAULA ANGELICA LOPEZ MENDEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('pedro_daniel_rivera', 'PEDRO DANIEL RIVERA', NULL, 3, '', 'Personal', '', '', 8, '6'),
('ramon_azael_zuniga_velasquez', 'RAMON AZAEL ZUNIGA VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('regina_marcela_alvarez_burgos', 'REGINA MARCELA ALVAREZ BURGOS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('rene_arturo_escoto_villeda', 'RENE ARTURO ESCOTO VILLEDA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('reynaldo_francisco_castillo_cruz', 'REYNALDO FRANCISCO CASTILLO CRUZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ricardo_antonio_lagos_peralta', 'RICARDO ANTONIO LAGOS PERALTA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('ricardo_ventura_hernÁndez', 'RICARDO VENTURA HERNÁNDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('rigoberto_regalado_hernandez', 'RIGOBERTO REGALADO HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('rigoberto_villanueva_chacon', 'RIGOBERTO VILLANUEVA CHACON', NULL, 3, '', 'Personal', '', '', 8, '5'),
('rixy_mabel_rodriguez_osorio', 'RIXY MABEL RODRIGUEZ OSORIO', NULL, 3, '', 'Personal', '', '', 8, '6'),
('robinson_fernandez_muÑoz', 'ROBINSON FERNANDEZ MUÑOZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('rocio_pamela_cartagena', 'ROCIO PAMELA CARTAGENA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('rodas_iscoa_ramon_arturo', 'RODAS ISCOA RAMON ARTURO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('roger_antonio_funez_figueroa', 'ROGER ANTONIO FUNEZ FIGUEROA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('roger_ulices_garcia_amaya', 'ROGER ULICES GARCIA AMAYA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('romulo_jose_velasquez_andino', 'ROMULO JOSE VELASQUEZ ANDINO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ronald_daneri_martinez_velasquez', 'RONALD DANERI MARTINEZ VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ronald_dario_sanches_reyes', 'RONALD DARIO SANCHES REYES', NULL, 3, '', 'Personal', '', '', 8, '7'),
('ronald_orlando_alvarez_martel', 'RONALD ORLANDO ALVAREZ MARTEL', NULL, 3, '', 'Personal', '', '', 8, '9'),
('ronal_antonio_diaz', 'RONAL ANTONIO DIAZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('rony_javier_perdomo_perdomo', 'RONY JAVIER PERDOMO PERDOMO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('roque_vidal_ordoÑez_lopez', 'ROQUE VIDAL ORDOÑEZ LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('rosa_amelia_peÑa_rosales', 'ROSA AMELIA PEÑA ROSALES', NULL, 3, '', 'Personal', '', '', 8, '5'),
('ruben_neptali_palma_solorzano', 'RUBEN NEPTALI PALMA SOLORZANO', NULL, 3, '', 'Personal', '', '', 8, '9'),
('rufino_edgardo_landaverde_garcia', 'RUFINO EDGARDO LANDAVERDE GARCIA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('ruth_claude_servellon', 'RUTH CLAUDE SERVELLON', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ruth_claude_servellon_(2)', 'RUTH CLAUDE SERVELLON (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ruth_enamorado_caballero', 'RUTH ENAMORADO CABALLERO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('ruth_jeaneth_kuthe_molina', 'RUTH JEANETH KUTHE MOLINA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('samanta_lujan_garcia', 'SAMANTA LUJAN GARCIA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('samuel_cruz_hernandez', 'SAMUEL CRUZ HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('samuel__portillo_orellana', 'SAMUEL  PORTILLO ORELLANA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('santos_ernesto_mencia_osorio', 'SANTOS ERNESTO MENCIA OSORIO', NULL, 3, '', 'Personal', '', '', 8, '4'),
('santos_gustavo_romero_zuniga', 'SANTOS GUSTAVO ROMERO ZUNIGA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('santos_norena_solorzano_cruz', 'SANTOS NORENA SOLORZANO CRUZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('sarahi_flores_reyes', 'SARAHI FLORES REYES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('sara_dimia_flores_rivas', 'SARA DIMIA FLORES RIVAS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('sara_zaday_trochez_lopez', 'SARA ZADAY TROCHEZ LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('saul_antonio_maradiaga_valle', 'SAUL ANTONIO MARADIAGA VALLE', NULL, 3, '', 'Personal', '', '', 8, '2'),
('seily_dayanni_santos_alvarez', 'SEILY DAYANNI SANTOS ALVAREZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('selvin_jeovanny_oviedo_maldonado', 'SELVIN JEOVANNY OVIEDO MALDONADO', NULL, 3, '', 'Personal', '', '', 8, '8'),
('sergia_nicholl_mejia_ruiz', 'SERGIA NICHOLL MEJIA RUIZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('sergio_daniel_gonzalez_salgado', 'SERGIO DANIEL GONZALEZ SALGADO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('seyla_fabiola_barralaga_rodriguez', 'SEYLA FABIOLA BARRALAGA RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '7'),
('sherlin_dariela_matamoros_umaÑa', 'SHERLIN DARIELA MATAMOROS UMAÑA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('silvia_magdalena_turcios', 'SILVIA MAGDALENA TURCIOS', NULL, 3, '', 'Personal', '', '', 8, '1'),
('silvia_magdalena_turcios_(2)', 'SILVIA MAGDALENA TURCIOS (2)', NULL, 3, '', 'Personal', '', '', 8, '1'),
('sindy_mayely_mejia_reyes', 'SINDY MAYELY MEJIA REYES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('sivia_malquisia_ordoÑez_reyes', 'SIVIA MALQUISIA ORDOÑEZ REYES', NULL, 3, '', 'Personal', '', '', 8, '7'),
('soany_yaribet_bonilla_borjas', 'SOANY YARIBET BONILLA BORJAS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('stefanny_michell_gonzales_perez_(2)', 'STEFANNY MICHELL GONZALES PEREZ (2)', NULL, 3, '', 'Personal', '', '', 8, '7'),
('suamy_fabiola_chavez_diaz', 'SUAMY FABIOLA CHAVEZ DIAZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('suani_rubi_medina_castillo', 'SUANI RUBI MEDINA CASTILLO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('suany_lizeth_chavarria_velazquez', 'SUANY LIZETH CHAVARRIA VELAZQUEZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('suhani_yudith_nuÑez_valle', 'SUHANI YUDITH NUÑEZ VALLE', NULL, 3, '', 'Personal', '', '', 8, '5'),
('suhani_yudith_nuÑez_valle_(2)', 'SUHANI YUDITH NUÑEZ VALLE (2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('tania_sarahi_castillo_enamorado', 'TANIA SARAHI CASTILLO ENAMORADO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('tania_yanira_bustamante_aguilar', 'TANIA YANIRA BUSTAMANTE AGUILAR', NULL, 3, '', 'Personal', '', '', 8, '7'),
('tirso_alvarado_machado', 'TIRSO ALVARADO MACHADO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('tirso_alvarado_machado_(2)', 'TIRSO ALVARADO MACHADO (2)', NULL, 3, '', 'Personal', '', '', 8, '2'),
('ventas_buenas_vista', 'VENTAS BUENAS VISTA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('ventas_tda_celeo', 'VENTAS TDA CELEO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('venta_en_planta_calpules', 'VENTA EN PLANTA CALPULES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('venta_en_planta_el_chile', 'VENTA EN PLANTA EL CHILE', NULL, 3, '', 'Personal', '', '', 8, '8'),
('venta_en_planta_guanabano', 'VENTA EN PLANTA GUANABANO', NULL, 3, '', 'Personal', '', '', 8, '2'),
('venta_en_planta_la_ceiba', 'VENTA EN PLANTA LA CEIBA', NULL, 3, '', 'Personal', '', '', 8, '4'),
('venta_en_planta_saba', 'VENTA EN PLANTA SABA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('venta_en_planta_santa_elena', 'VENTA EN PLANTA SANTA ELENA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('venta_en_planta_santa_rosa', 'VENTA EN PLANTA SANTA ROSA', NULL, 3, '', 'Personal', '', '', 8, '5'),
('venta_en_planta_tulin', 'VENTA EN PLANTA TULIN', NULL, 3, '', 'Personal', '', '', 8, '6'),
('venta_en_planta_villanueva', 'VENTA EN PLANTA VILLANUEVA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('vicente_dubon_lopez', 'VICENTE DUBON LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('vicente_flores_hernandez', 'VICENTE FLORES HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '8'),
('victor_alfonso_avelar_sinclair', 'VICTOR ALFONSO AVELAR SINCLAIR', NULL, 3, '', 'Personal', '', '', 8, '1'),
('victor_andy_padilla', 'VICTOR ANDY PADILLA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('victor_giron_jose', 'VICTOR GIRON JOSE', NULL, 3, '', 'Personal', '', '', 8, '2'),
('victor_manuel_chicas_toron', 'VICTOR MANUEL CHICAS TORON', NULL, 3, '', 'Personal', '', '', 8, '8'),
('victor_manuel_murcia_padilla', 'VICTOR MANUEL MURCIA PADILLA', NULL, 3, '', 'Personal', '', '', 8, '2'),
('vilma_yaritza_fajardo_cardona', 'VILMA YARITZA FAJARDO CARDONA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('waldina_yamileth_arevalo_serrano', 'WALDINA YAMILETH AREVALO SERRANO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('walter_alexander_fuentes_bejarano', 'WALTER ALEXANDER FUENTES BEJARANO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('walter_alexander_vallecillo', 'WALTER ALEXANDER VALLECILLO', NULL, 3, '', 'Personal', '', '', 8, '7'),
('walter_javier_velasquez_manzanares', 'WALTER JAVIER VELASQUEZ MANZANARES', NULL, 3, '', 'Personal', '', '', 8, '1'),
('walter_noe_rosales_alvarenga', 'WALTER NOE ROSALES ALVARENGA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('walter_rafael_rico_vasquez', 'WALTER RAFAEL RICO VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '9'),
('walter_rafael_rico_vasquez_(2)', 'WALTER RAFAEL RICO VASQUEZ (2)', NULL, 3, '', 'Personal', '', '', 8, '9'),
('walter_yojary_romero_mejia', 'WALTER YOJARY ROMERO MEJIA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('wendoly_roversy_triminio_baquedano', 'WENDOLY ROVERSY TRIMINIO BAQUEDANO', NULL, 3, '', 'Personal', '', '', 8, '9'),
('wendy_carolina_ramos_molina', 'WENDY CAROLINA RAMOS MOLINA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('wendy_carolina_ulloa_mejia', 'WENDY CAROLINA ULLOA MEJIA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('wendy_diosely_rivera_rivera', 'WENDY DIOSELY RIVERA RIVERA', NULL, 3, '', 'Personal', '', '', 8, '1'),
('wendy_maricela_lemus', 'WENDY MARICELA LEMUS', NULL, 3, '', 'Personal', '', '', 8, '5'),
('wendy_maricela_lemus_(2)', 'WENDY MARICELA LEMUS (2)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('wendy_maricela_lemus_(3)', 'WENDY MARICELA LEMUS (3)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('wendy_maricela_lemus_(4)', 'WENDY MARICELA LEMUS (4)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('wilfredo_zelaya_vasquez', 'WILFREDO ZELAYA VASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('wilmer_sanchez_hernandez', 'WILMER SANCHEZ HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('wilson_adan_lainez_ruiz', 'WILSON ADAN LAINEZ RUIZ', NULL, 3, '', 'Personal', '', '', 8, '6'),
('wilson_omar_lopÉz_mejia', 'WILSON OMAR LOPÉZ MEJIA', NULL, 3, '', 'Personal', '', '', 8, '8'),
('xiomara_guardado_hernandez', 'XIOMARA GUARDADO HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('xiomara_marlene_ramirez_rodriguez', 'XIOMARA MARLENE RAMIREZ RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '3'),
('yadira_judith_ventura_lopez', 'YADIRA JUDITH VENTURA LOPEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('yahely_abigail_guardado_godoy', 'YAHELY ABIGAIL GUARDADO GODOY', NULL, 3, '', 'Personal', '', '', 8, '3'),
('yahely_abigail_guardado_godoy_2', 'YAHELY ABIGAIL GUARDADO GODOY 2', NULL, 3, '', 'Personal', '', '', 8, '3'),
('yaimy_karolina_zaldivar_canales', 'YAIMY KAROLINA ZALDIVAR CANALES', NULL, 3, '', 'Personal', '', '', 8, '3'),
('yansi_yanexa_sanchez_santos', 'YANSI YANEXA SANCHEZ SANTOS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('yeny_nazareth_quiÑonez_turcios', 'YENY NAZARETH QUIÑONEZ TURCIOS', NULL, 3, '', 'Personal', '', '', 8, '7'),
('yerlin_xiomara_nolasco_hernandez', 'YERLIN XIOMARA NOLASCO HERNANDEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('yesenia_leticia_enamorado_velasquez', 'YESENIA LETICIA ENAMORADO VELASQUEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('yesica_carolina_banegas_vega', 'YESICA CAROLINA BANEGAS VEGA', NULL, 3, '', 'Personal', '', '', 8, '7'),
('yesica_marilu_diaz_oviedo', 'YESICA MARILU DIAZ OVIEDO', NULL, 3, '', 'Personal', '', '', 8, '3'),
('yessica_jackeline_linares_martinez', 'YESSICA JACKELINE LINARES MARTINEZ', NULL, 3, '', 'Personal', '', '', 8, '1'),
('yoni_edgardo_rivera_padilla', 'YONI EDGARDO RIVERA PADILLA', NULL, 3, '', 'Personal', '', '', 8, '3'),
('yosely_yaqueline_bonilla_sorto', 'YOSELY YAQUELINE BONILLA SORTO', NULL, 3, '', 'Personal', '', '', 8, '1'),
('yovany_francisco_ruiz_sÁnchez', 'YOVANY FRANCISCO RUIZ SÁNCHEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('yunior_david_caceres_elvir', 'YUNIOR DAVID CACERES ELVIR', NULL, 3, '', 'Personal', '', '', 8, '5'),
('yunior_david_caceres_elvir(vip)', 'YUNIOR DAVID CACERES ELVIR(VIP)', NULL, 3, '', 'Personal', '', '', 8, '5'),
('yuni_yulibeth_trochez_sagastume', 'YUNI YULIBETH TROCHEZ SAGASTUME', NULL, 3, '', 'Personal', '', '', 8, '1'),
('yuri_vanesy_avila_euceda', 'YURI VANESY AVILA EUCEDA', NULL, 3, '', 'Personal', '', '', 8, '9'),
('zirce_crisanta_zamora_rodriguez', 'ZIRCE CRISANTA ZAMORA RODRIGUEZ', NULL, 3, '', 'Personal', '', '', 8, '2'),
('zirce_crisanta_zamora_rodriguez_2', 'ZIRCE CRISANTA ZAMORA RODRIGUEZ 2', NULL, 3, '', 'Personal', '', '', 8, '2');

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
  ADD KEY `asignado_por` (`asignado_por`),
  ADD KEY `fk_id_usuario` (`id_usuario`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT de la tabla `asignaciones_componentes`
--
ALTER TABLE `asignaciones_componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `asignaciones_computadora`
--
ALTER TABLE `asignaciones_computadora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `componentes`
--
ALTER TABLE `componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `computadoras`
--
ALTER TABLE `computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empresas`
--
ALTER TABLE `empresas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `historial_estados`
--
ALTER TABLE `historial_estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `historial_estados_componentes`
--
ALTER TABLE `historial_estados_componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `historial_estados_computadoras`
--
ALTER TABLE `historial_estados_computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `impresoras`
--
ALTER TABLE `impresoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1361;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `marcas_computadoras`
--
ALTER TABLE `marcas_computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `modulos`
--
ALTER TABLE `modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `plantas`
--
ALTER TABLE `plantas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles_modulos`
--
ALTER TABLE `roles_modulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT de la tabla `tipos_componentes`
--
ALTER TABLE `tipos_componentes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tipos_computadoras`
--
ALTER TABLE `tipos_computadoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipos_impresoras`
--
ALTER TABLE `tipos_impresoras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `asignaciones_componentes_ibfk_3` FOREIGN KEY (`asignado_por`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_computadoras` FOREIGN KEY (`id_computadora`) REFERENCES `computadoras` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`usuario`) ON DELETE CASCADE;

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
