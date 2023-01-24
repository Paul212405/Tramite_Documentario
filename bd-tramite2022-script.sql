-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 10, 2022 at 08:28 AM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
create database tramite2022;
use tramite2022;
--
-- Database: `tramite2022`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumno`
--

CREATE TABLE IF NOT EXISTS `alumno` (
  `codigo_universitario` varchar(10) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `idescuela` int(11) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `celular` varchar(9) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado` int(1) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `apellidos` varchar(250) DEFAULT NULL,
  `nombres` varchar(250) DEFAULT NULL,
  KEY `FK_alumno_usuario` (`idusuario`),
  KEY `FK_alumno_escuela` (`idescuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alumno`
--

INSERT INTO `alumno` (`codigo_universitario`, `dni`, `idescuela`, `email`, `celular`, `direccion`, `estado`, `idusuario`, `apellidos`, `nombres`) VALUES
('1231231233', '12312312', 3, 'jacunia@mailinator.com', '987987987', 'CALLE LOS RIOS 123', 1, 7, 'ACUÃ±A ACEBEDO', 'JOSE MIGUEL'),
(NULL, NULL, NULL, NULL, NULL, NULL, 0, 11, NULL, NULL),
(NULL, NULL, NULL, NULL, NULL, NULL, 0, 12, NULL, NULL),
(NULL, NULL, NULL, NULL, NULL, NULL, 0, 13, NULL, NULL),
('313201002', '12341234', 3, 'nmalachy@mailinator.com', '987987765', 'RANDOM DIRECTION #456', 1, 14, 'NICHOLLS', 'MALACHY');

-- --------------------------------------------------------

--
-- Table structure for table `area`
--

CREATE TABLE IF NOT EXISTS `area` (
  `idarea` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(200) NOT NULL,
  PRIMARY KEY (`idarea`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `area`
--

INSERT INTO `area` (`idarea`, `area`) VALUES
(1, 'Grados y Titulos'),
(2, 'Registros Academicos'),
(3, 'Decanato'),
(4, 'Oficina de bienestar universitario');

-- --------------------------------------------------------

--
-- Table structure for table `egresado`
--

CREATE TABLE IF NOT EXISTS `egresado` (
  `dni` varchar(8) DEFAULT NULL,
  `idescuela` int(11) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado` int(1) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `apellidos` varchar(250) DEFAULT NULL,
  `nombres` varchar(250) DEFAULT NULL,
  `celular` varchar(9) DEFAULT NULL,
  KEY `FK_egresado_usuario` (`idusuario`),
  KEY `FK_egresado_escuela` (`idescuela`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `egresado`
--

INSERT INTO `egresado` (`dni`, `idescuela`, `direccion`, `estado`, `idusuario`, `email`, `apellidos`, `nombres`, `celular`) VALUES
('75835456', 2, 'LIMA', 1, 2, 'juan@gmail.com', 'ROBERTO FLORES', 'JUAN SOSA', '965676452'),
(NULL, NULL, NULL, 0, 8, NULL, NULL, NULL, NULL),
('76767676', 5, 'AV. PRIMAVERA #456', 1, 15, 'randomvalue@mailinator.com', 'CROSSLEY', 'MANON', '765765123'),
(NULL, NULL, NULL, 0, 16, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `escuela`
--

CREATE TABLE IF NOT EXISTS `escuela` (
  `idescuela` int(11) NOT NULL AUTO_INCREMENT,
  `escuela` varchar(200) NOT NULL,
  `idfacultad` int(11) NOT NULL,
  PRIMARY KEY (`idescuela`),
  KEY `FK_escuela_facultad` (`idfacultad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `escuela`
--

INSERT INTO `escuela` (`idescuela`, `escuela`, `idfacultad`) VALUES
(2, 'Educacion Inicial', 1),
(3, 'Ingenieria de Sistemas', 2),
(4, 'Educacion Primaria', 1),
(5, 'Ingenieria Industrial', 2);

-- --------------------------------------------------------

--
-- Table structure for table `estadocuenta`
--

CREATE TABLE IF NOT EXISTS `estadocuenta` (
  `idestadocuenta` int(11) NOT NULL AUTO_INCREMENT,
  `estadocuenta` varchar(100) NOT NULL,
  PRIMARY KEY (`idestadocuenta`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `estadocuenta`
--

INSERT INTO `estadocuenta` (`idestadocuenta`, `estadocuenta`) VALUES
(1, 'Por confirmar'),
(2, 'Habilitado');

-- --------------------------------------------------------

--
-- Table structure for table `estadotramite`
--

CREATE TABLE IF NOT EXISTS `estadotramite` (
  `idestadotramite` int(11) NOT NULL AUTO_INCREMENT,
  `estadotramite` varchar(200) NOT NULL,
  PRIMARY KEY (`idestadotramite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `estadotramite`
--

INSERT INTO `estadotramite` (`idestadotramite`, `estadotramite`) VALUES
(1, 'Registrado'),
(2, 'Rechazado'),
(3, 'En Revision'),
(4, 'Aceptado');

-- --------------------------------------------------------

--
-- Table structure for table `facultad`
--

CREATE TABLE IF NOT EXISTS `facultad` (
  `idfacultad` int(11) NOT NULL AUTO_INCREMENT,
  `facultad` varchar(200) NOT NULL,
  PRIMARY KEY (`idfacultad`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `facultad`
--

INSERT INTO `facultad` (`idfacultad`, `facultad`) VALUES
(1, 'Facultad de Educacion'),
(2, 'Facultad de Ingeniería Industrial, Sistema e Informática');

-- --------------------------------------------------------

--
-- Table structure for table `historialtramite`
--

CREATE TABLE IF NOT EXISTS `historialtramite` (
  `idhistorialtramite` int(11) NOT NULL AUTO_INCREMENT,
  `idtramite` varchar(12) NOT NULL,
  `fechaactualizacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idestadotramite` int(11) NOT NULL,
  PRIMARY KEY (`idhistorialtramite`),
  KEY `FK_historial_tramite` (`idtramite`),
  KEY `FK_historial_estado` (`idestadotramite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `historialtramite`
--

INSERT INTO `historialtramite` (`idhistorialtramite`, `idtramite`, `fechaactualizacion`, `idestadotramite`) VALUES
(56, '2022141mp0', '2022-08-10 07:55:07', 1),
(57, '2022141mp0', '2022-08-10 07:55:49', 3),
(58, '2022141mp0', '2022-08-10 07:57:50', 4),
(59, '20221511hz', '2022-08-10 08:04:55', 1),
(60, '2022152w9u6', '2022-08-04 14:06:32', 1),
(61, '2022152r78p', '2022-08-04 08:08:08', 1),
(62, '20221446ysx', '2022-08-07 17:13:18', 1),
(63, '20221420ud', '2022-08-08 19:14:38', 1),
(64, '2022173fy9i', '2022-08-10 08:17:36', 1),
(65, '20221511hz', '2022-08-10 08:24:57', 2);

-- --------------------------------------------------------

--
-- Table structure for table `institucion`
--

CREATE TABLE IF NOT EXISTS `institucion` (
  `ruc` varchar(11) DEFAULT NULL,
  `razonsocial` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `telefono` varchar(7) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado` int(1) NOT NULL,
  `idusuario` int(11) NOT NULL,
  KEY `FK_institucion_usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `institucion`
--

INSERT INTO `institucion` (`ruc`, `razonsocial`, `email`, `telefono`, `direccion`, `estado`, `idusuario`) VALUES
('23546363324', 'MONOS SAC S.A.', 'mono@gmail.com', '6675687', 'TUPAC', 1, 3),
(NULL, NULL, NULL, NULL, NULL, 0, 6),
('98721398127', 'RANDOM EBOOKS S.A.C', 'rebooks@mailinator.com', '1238712', 'CALLE EL OLIVAR #123', 1, 17);

-- --------------------------------------------------------

--
-- Table structure for table `motivo`
--

CREATE TABLE IF NOT EXISTS `motivo` (
  `idmotivo` int(11) NOT NULL AUTO_INCREMENT,
  `motivo` varchar(200) NOT NULL,
  PRIMARY KEY (`idmotivo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `motivo`
--

INSERT INTO `motivo` (`idmotivo`, `motivo`) VALUES
(1, 'Faltan Requisitos'),
(2, 'Documento mal enviado'),
(3, 'Documentos incorrectos'),
(4, 'Otro (especifique)');

-- --------------------------------------------------------

--
-- Table structure for table `observacion`
--

CREATE TABLE IF NOT EXISTS `observacion` (
  `idobservacion` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `idtramite` varchar(12) NOT NULL,
  `idmotivo` int(11) NOT NULL,
  PRIMARY KEY (`idobservacion`),
  KEY `FK_observa_motivo` (`idmotivo`),
  KEY `FK_observa_tramite` (`idtramite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `observacion`
--

INSERT INTO `observacion` (`idobservacion`, `descripcion`, `idtramite`, `idmotivo`) VALUES
(15, 'Estimado(a) estudiante, usted todavia no egresa.', '20221511hz', 4);

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE IF NOT EXISTS `personal` (
  `codigo_administrativo` varchar(10) DEFAULT NULL,
  `dni` varchar(8) DEFAULT NULL,
  `idescuela` int(11) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `celular` varchar(9) DEFAULT NULL,
  `direccion` varchar(250) DEFAULT NULL,
  `estado` int(1) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `apellidos` varchar(250) DEFAULT NULL,
  `nombres` varchar(250) DEFAULT NULL,
  `idarea` int(11) DEFAULT NULL,
  KEY `FK_personal_usuario` (`idusuario`),
  KEY `FK_personal_escuela` (`idescuela`),
  KEY `FK_personal_area` (`idarea`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`codigo_administrativo`, `dni`, `idescuela`, `email`, `celular`, `direccion`, `estado`, `idusuario`, `apellidos`, `nombres`, `idarea`) VALUES
('3333333333', '12312311', 3, 'personal3@mailinator.com', '987987987', 'Direccion random 1', 1, 4, 'apellidos de prueba', 'Nombres de prueba ', 1),
('9999999999', '99999999', 3, 'personal3@personal.com', '987987987', 'Direccion #123', 1, 9, 'Personal Apellidos', 'Personal Nombres', 2),
('1231231231', '14561456', 4, 'personal2@personal.com', '987987987', 'Direccion random 1', 1, 10, 'Chan', 'Nombre Personal 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tipotramite`
--

CREATE TABLE IF NOT EXISTS `tipotramite` (
  `idtipotramite` int(11) NOT NULL AUTO_INCREMENT,
  `tipotramite` varchar(200) NOT NULL,
  PRIMARY KEY (`idtipotramite`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `tipotramite`
--

INSERT INTO `tipotramite` (`idtipotramite`, `tipotramite`) VALUES
(1, 'DECLARACION DE EGRESADO'),
(2, 'TITULO PROFESIONAL'),
(3, 'DUPLICADO DE CARNET UNIVERSITARIO'),
(4, 'MATRICULA EXTEMPORANEO'),
(5, 'RESERVA DE MATRICULA'),
(6, 'HISTORIAL ACADEMICO'),
(7, 'CONSTANCIA DE ESTUDIOS'),
(8, 'EXHONERACION DE MATRICULA'),
(9, 'DOCUMENTACION UNIVERSITARIA'),
(10, 'COMEDOR');

-- --------------------------------------------------------

--
-- Table structure for table `tipousuario`
--

CREATE TABLE IF NOT EXISTS `tipousuario` (
  `idtipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipousuario` varchar(200) NOT NULL,
  PRIMARY KEY (`idtipousuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `tipousuario`
--

INSERT INTO `tipousuario` (`idtipousuario`, `tipousuario`) VALUES
(1, 'Alumno'),
(2, 'Egresado'),
(3, 'Institucion'),
(4, 'Personal'),
(5, 'administrador');

-- --------------------------------------------------------

--
-- Table structure for table `tramite`
--

CREATE TABLE IF NOT EXISTS `tramite` (
  `idtramite` varchar(12) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idarea` int(11) NOT NULL,
  `idtipotramite` int(11) NOT NULL,
  `fecharegistro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `asunto` varchar(250) NOT NULL,
  `password` varchar(11) NOT NULL,
  PRIMARY KEY (`idtramite`),
  KEY `FK_tramite_usuario` (`idusuario`),
  KEY `FK_tramite_area` (`idarea`),
  KEY `FK_tramite_tipo` (`idtipotramite`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tramite`
--

INSERT INTO `tramite` (`idtramite`, `idusuario`, `idarea`, `idtipotramite`, `fecharegistro`, `asunto`, `password`) VALUES
('2022141mp0', 14, 1, 5, '2022-08-10 07:55:07', 'Solicito una reserva de matricula 1', 'hn2o4xo2z63'),
('20221420ud', 14, 2, 9, '2022-08-10 08:14:38', 'Solicito mi carnet universitario', '0kc7xsmwff'),
('20221446ysx', 14, 4, 10, '2022-08-10 08:13:18', 'Solicitud de ingreso al comedor', 'm734uwtwyn9'),
('20221511hz', 15, 1, 2, '2022-08-10 08:04:55', 'Solicito mi titulo universitario', '66e0fbgat'),
('2022152r78p', 15, 2, 8, '2022-08-10 08:08:08', 'Solicito la exhoneracion de mi ultima matricula', 'b2po2y3sjbt'),
('2022152w9u6', 15, 2, 7, '2022-08-10 08:06:32', 'Solicito mi certificado de estudios', '59th2i4mgjx'),
('2022173fy9i', 17, 3, 9, '2022-08-10 08:17:36', 'Reporte de ingreso de bienes y servicios', '0ec3rzvx738');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `idtipousuario` int(11) NOT NULL,
  `idestadocuenta` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `FK_usuario_estado` (`idestadocuenta`),
  KEY `FK_usuario_tipo` (`idtipousuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`idusuario`, `username`, `password`, `idtipousuario`, `idestadocuenta`) VALUES
(1, 'Paul', 'hrh4674g3g5', 1, 2),
(2, 'Juan', 'hrh4674g3g5', 2, 2),
(3, 'Logan', 'hrh4674g3g5', 3, 2),
(4, 'personalgrados', 'hrh4674g3g5', 4, 2),
(5, 'administrador', 'administrador', 5, 2),
(6, 'institucionrandom', '123123123', 3, 2),
(7, 'alumno123', '123123123', 1, 2),
(8, 'egresado123', '123123123', 2, 1),
(9, 'personalregistros', '123123123', 4, 2),
(10, 'personal2', 'personal2', 4, 2),
(11, 'alumnorandom', 'alumnorandom', 1, 1),
(12, '313201088', 'mQ85K64YG', 1, 2),
(13, '313201121', 'WK88655Hw', 1, 2),
(14, '313201002', '673HDGy6y', 1, 2),
(15, '313201011', '5h22HSpJg', 2, 2),
(16, '313201027', '2wPP4j2H8', 2, 2),
(17, '313201004', 'mP8Y797FQ', 3, 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `FK_alumno_escuela` FOREIGN KEY (`idescuela`) REFERENCES `escuela` (`idescuela`),
  ADD CONSTRAINT `FK_alumno_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Constraints for table `egresado`
--
ALTER TABLE `egresado`
  ADD CONSTRAINT `FK_egresado_escuela` FOREIGN KEY (`idescuela`) REFERENCES `escuela` (`idescuela`),
  ADD CONSTRAINT `FK_egresado_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Constraints for table `escuela`
--
ALTER TABLE `escuela`
  ADD CONSTRAINT `FK_escuela_facultad` FOREIGN KEY (`idfacultad`) REFERENCES `facultad` (`idfacultad`);

--
-- Constraints for table `historialtramite`
--
ALTER TABLE `historialtramite`
  ADD CONSTRAINT `FK_historial_estado` FOREIGN KEY (`idestadotramite`) REFERENCES `estadotramite` (`idestadotramite`),
  ADD CONSTRAINT `FK_historial_tramite` FOREIGN KEY (`idtramite`) REFERENCES `tramite` (`idtramite`);

--
-- Constraints for table `institucion`
--
ALTER TABLE `institucion`
  ADD CONSTRAINT `FK_institucion_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Constraints for table `observacion`
--
ALTER TABLE `observacion`
  ADD CONSTRAINT `FK_observa_motivo` FOREIGN KEY (`idmotivo`) REFERENCES `motivo` (`idmotivo`),
  ADD CONSTRAINT `FK_observa_tramite` FOREIGN KEY (`idtramite`) REFERENCES `tramite` (`idtramite`);

--
-- Constraints for table `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `FK_personal_area` FOREIGN KEY (`idarea`) REFERENCES `area` (`idarea`),
  ADD CONSTRAINT `FK_personal_escuela` FOREIGN KEY (`idescuela`) REFERENCES `escuela` (`idescuela`),
  ADD CONSTRAINT `FK_personal_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Constraints for table `tramite`
--
ALTER TABLE `tramite`
  ADD CONSTRAINT `FK_tramite_area` FOREIGN KEY (`idarea`) REFERENCES `area` (`idarea`),
  ADD CONSTRAINT `FK_tramite_tipo` FOREIGN KEY (`idtipotramite`) REFERENCES `tipotramite` (`idtipotramite`),
  ADD CONSTRAINT `FK_tramite_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Constraints for table `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_estado` FOREIGN KEY (`idestadocuenta`) REFERENCES `estadocuenta` (`idestadocuenta`),
  ADD CONSTRAINT `FK_usuario_tipo` FOREIGN KEY (`idtipousuario`) REFERENCES `tipousuario` (`idtipousuario`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
