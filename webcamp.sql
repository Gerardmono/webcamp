-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-09-2019 a las 07:13:01
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `webcamp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(60) NOT NULL,
  `editado` datetime NOT NULL,
  `nivel` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `admins`
--

INSERT INTO `admins` (`id_admin`, `usuario`, `nombre`, `password`, `editado`, `nivel`) VALUES
(1, 'mono', 'mono', '$2y$12$xLWiKfIgMsL3FpdLWox9h.h2E/Tll/1tY4jpF4hhXo/Cvbysjh0nC', '2019-09-12 18:50:30', 1),
(3, 'mono1', 'mono1', '$2y$12$5A3NuQlUx4Mso21K50XucO2GJJeaD/xEW1PTl.wTqQLXueN.ioH4e', '0000-00-00 00:00:00', 0),
(10, 'admin', 'admin', '$2y$12$oWY0dkt0yLYg9ei8hS0wHuhiuOmlOhtlXzLKbVhRRmoZKFqedgGzO', '0000-00-00 00:00:00', 1),
(12, '', '', '$2y$12$Ox63HCjo8Xar/UpJiKsHHeQrmREdaXCQRxUd1OV1g0v3HMiBg1E2u', '0000-00-00 00:00:00', 0),
(18, 'mayte', 'Mayte', '$2y$12$ignbGII9G.SBPrcwPZ/mlu0KTLny3SEVWS0RiUUh2tlLTzBqFGprS', '2019-09-13 15:56:37', 0),
(19, 'karla', 'karla', '$2y$12$rC1Q8S95iM8dOXkIdv/V9OWSZGLBHRomhgWKJIqeAHu4ciYQdBb3O', '2019-09-13 15:56:47', 0),
(23, '1', '1', '$2y$12$VyG4YT89PuSs/YzqnV8UOOMTDhaZ6eWxGR1YJRswgf16ijsi/INrC', '0000-00-00 00:00:00', 0),
(26, 'csd', 'scd', '$2y$12$hL2yxug6PfeZiVFR2wt2EOLiRPY3HqZAESfAteZ2r/I4meNAdvsYy', '0000-00-00 00:00:00', 0),
(27, 'qwq', 'qw', '$2y$12$5EeyEgD4M1Rbeev3mwexDOlkGEBePZx3pKpVvUwKfaRjDn2jjJ.fq', '0000-00-00 00:00:00', 0),
(28, 'mosdf', 'ssd', '$2y$12$P.7Ngyv5TY6zz.7TQyJ3Se9RxHQ5y7lq4cHSsF7YHTb46iXOxQOp2', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_evento`
--

CREATE TABLE `categoria_evento` (
  `id_categoria` tinyint(10) NOT NULL,
  `cat_evento` varchar(50) NOT NULL,
  `icono` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categoria_evento`
--

INSERT INTO `categoria_evento` (`id_categoria`, `cat_evento`, `icono`) VALUES
(1, 'Seminarios', 'fas fa-university'),
(2, 'Conferencias', 'fas fa-comment'),
(3, 'Talleres', 'fas fa-code'),
(4, 'amazon', 'fab fa-amazon');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

CREATE TABLE `eventos` (
  `evento_id` tinyint(10) NOT NULL,
  `nombre_evento` varchar(60) NOT NULL,
  `fecha_evento` date NOT NULL,
  `hora_evento` time NOT NULL,
  `id_cat_evento` tinyint(10) NOT NULL,
  `id_inv` tinyint(4) NOT NULL,
  `clave` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`evento_id`, `nombre_evento`, `fecha_evento`, `hora_evento`, `id_cat_evento`, `id_inv`, `clave`) VALUES
(2, 'Responsive Web Design', '2016-12-09', '10:00:00', 3, 1, 'taller_01'),
(3, 'Flexbox', '2016-12-09', '12:00:00', 3, 2, 'taller_02'),
(4, 'HTML5 y CSS3', '2016-12-09', '14:00:00', 3, 3, 'taller_03'),
(5, 'Drupal', '2016-12-09', '17:00:00', 3, 4, 'taller_04'),
(6, 'WordPress', '2016-12-09', '19:00:00', 3, 5, 'taller_05'),
(7, 'Como ser freelancer', '2016-12-09', '10:00:00', 2, 6, 'conf_01'),
(8, 'TecnologÃ­as del Futuro', '2016-12-09', '17:00:00', 2, 1, 'conf_02'),
(9, 'Seguridad en la Web', '2016-12-09', '19:00:00', 2, 2, 'conf_03'),
(10, 'DiseÃ±o UI y UX para mÃ³viles', '2016-12-09', '10:00:00', 1, 6, 'sem_01'),
(11, 'AngularJS', '2016-12-10', '10:00:00', 3, 1, 'taller_06'),
(12, 'PHP y MySQL', '2016-12-10', '12:00:00', 3, 2, 'taller_07'),
(13, 'JavaScript Avanzado', '2016-12-10', '14:00:00', 3, 3, 'taller_08'),
(14, 'SEO en Google', '2016-12-10', '17:00:00', 3, 4, 'taller_09'),
(15, 'De Photoshop a HTML5 y CSS3', '2016-12-10', '19:00:00', 3, 5, 'taller_10'),
(16, 'PHP Intermedio y Avanzado', '2016-12-10', '21:00:00', 3, 6, 'taller_11'),
(17, 'Como crear una tienda online que venda millones en pocos dÃ­', '2016-12-10', '10:00:00', 2, 6, 'conf_04'),
(18, 'Los mejores lugares para encontrar trabajo', '2016-12-10', '17:00:00', 2, 1, 'conf_05'),
(19, 'Pasos para crear un negocio rentable ', '2016-12-10', '19:00:00', 2, 2, 'conf_06'),
(20, 'Aprende a Programar en una maÃ±ana', '2016-12-10', '10:00:00', 1, 3, 'sem_02'),
(21, 'DiseÃ±o UI y UX para mÃ³viles', '2016-12-10', '17:00:00', 1, 5, 'sem_03'),
(22, 'Laravel', '2016-12-11', '10:00:00', 3, 1, 'taller_12'),
(23, 'Crea tu propia API', '2016-12-11', '12:00:00', 3, 2, 'taller_13'),
(24, 'JavaScript y jQuery', '2016-12-11', '14:00:00', 3, 3, 'taller_14'),
(25, 'Creando Plantillas para WordPress', '2016-12-11', '17:00:00', 3, 4, 'taller_15'),
(26, 'Tiendas Virtuales en Magento', '2016-12-11', '19:00:00', 3, 5, 'taller_16'),
(27, 'Como hacer Marketing en lÃ­nea', '2016-12-11', '10:00:00', 2, 6, 'conf_07'),
(28, 'Â¿Con que lenguaje debo empezar?', '2016-12-11', '17:00:00', 2, 2, 'conf_08'),
(29, 'Frameworks y librerias Open Source', '2016-12-11', '19:00:00', 2, 3, 'conf_09'),
(30, 'Creando una App en Android en una maÃ±ana', '2016-12-11', '10:00:00', 1, 4, 'sem_04'),
(31, 'Creando una App en iOS en una tarde', '2016-12-11', '17:00:00', 1, 1, 'sem_05'),
(33, 'mono', '2016-12-01', '10:00:00', 1, 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitados`
--

CREATE TABLE `invitados` (
  `invitado_id` tinyint(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `descripcion` text NOT NULL,
  `url_imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `invitados`
--

INSERT INTO `invitados` (`invitado_id`, `nombre`, `apellido`, `descripcion`, `url_imagen`) VALUES
(1, 'Rafael', 'Bautista', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae modi ipsum aspernatur tempore ipsa incidunt sit voluptates, explicabo vitae illo id qui quisquam asperiores eveniet? Asperiores quaerat laborum necessitatibus fugiat', 'invitado1.jpg'),
(2, 'Shari', 'Herrera', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae modi ipsum aspernatur tempore ipsa incidunt sit voluptates, explicabo vitae illo id qui quisquam asperiores eveniet? Asperiores quaerat laborum necessitatibus fugiat', 'invitado2.jpg'),
(3, 'Gregorio', 'Sanchez', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae modi ipsum aspernatur tempore ipsa incidunt sit voluptates, explicabo vitae illo id qui quisquam asperiores eveniet? Asperiores quaerat laborum necessitatibus fugiat', 'invitado3.jpg'),
(4, 'Susana', 'Rivera', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae modi ipsum aspernatur tempore ipsa incidunt sit voluptates, explicabo vitae illo id qui quisquam asperiores eveniet? Asperiores quaerat laborum necessitatibus fugiat', 'invitado4.jpg'),
(5, 'Harold', 'Garcia', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae modi ipsum aspernatur tempore ipsa incidunt sit voluptates, explicabo vitae illo id qui quisquam asperiores eveniet? Asperiores quaerat laborum necessitatibus fugiat', 'invitado5.jpg'),
(6, 'Susan', 'Sanchez', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Recusandae modi ipsum aspernatur tempore ipsa incidunt sit voluptates, explicabo vitae illo id qui quisquam asperiores eveniet? Asperiores quaerat laborum necessitatibus fugiat', 'invitado6.jpg'),
(9, 'denton', 'denton', '  denton logo', 'icon.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `regalos`
--

CREATE TABLE `regalos` (
  `id_regalo` int(11) NOT NULL,
  `nombre_regalo` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `regalos`
--

INSERT INTO `regalos` (`id_regalo`, `nombre_regalo`) VALUES
(1, 'Pulsera'),
(2, 'Etiquetas'),
(3, 'Plumas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrados`
--

CREATE TABLE `registrados` (
  `id_registrado` bigint(20) UNSIGNED NOT NULL,
  `nombre_registrado` varchar(50) NOT NULL,
  `apellido_registrado` varchar(50) NOT NULL,
  `email_registrado` varchar(100) NOT NULL,
  `fecha_registrado` datetime NOT NULL,
  `pases_articulos` longtext NOT NULL,
  `talleres_registrados` longtext NOT NULL,
  `regalo` int(11) NOT NULL,
  `total_pagado` varchar(50) NOT NULL,
  `pagado` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `registrados`
--

INSERT INTO `registrados` (`id_registrado`, `nombre_registrado`, `apellido_registrado`, `email_registrado`, `fecha_registrado`, `pases_articulos`, `talleres_registrados`, `regalo`, `total_pagado`, `pagado`) VALUES
(3, 'mono', 'mono', 'mono@mono', '2019-09-04 01:40:01', '{"un_dia":1,"pase_completo":2,"camisas":2,"etiquetas":5}', '{"eventos":["conf_01","conf_02","conf_03","taller_09","conf_06","sem_03","taller_16","conf_08","sem_04","sem_05"]}', 1, '108.6', 0),
(4, 'mono', 'mono', 'mono@mono', '2019-09-04 01:40:50', '{"un_dia":1,"pase_completo":2,"camisas":2,"etiquetas":5}', '{"eventos":["conf_01","conf_02","conf_03","taller_09","conf_06","sem_03","taller_16","conf_08","sem_04","sem_05"]}', 1, '158.6', 0),
(5, 'mono', 'mono', 'mono@mono', '2019-09-10 23:40:28', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":1,"etiquetas":1}', '{"eventos":["conf_01","conf_05","conf_06","taller_16","sem_05"]}', 3, '171.3', 0),
(6, 'mono', 'mono', 'mono@mono', '2019-09-10 23:41:23', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":1,"etiquetas":1}', '{"eventos":["conf_01","conf_05","conf_06","taller_16","sem_05"]}', 3, '171.3', 0),
(7, 'mono', 'mono', 'mono@mono', '2019-09-10 23:53:19', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":1,"etiquetas":1}', '{"eventos":["conf_01","conf_05","conf_06","taller_16","sem_05"]}', 3, '171.3', 0),
(8, 'mono', 'mono', 'mono@mono', '2019-09-10 23:53:28', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":1,"etiquetas":1}', '{"eventos":["conf_01","conf_05","conf_06","taller_16","sem_05"]}', 3, '171.3', 0),
(9, 'mono', 'mono', 'mono@mono', '2019-09-10 23:54:37', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(10, 'mono', 'mono', 'mono@mono', '2019-09-10 23:55:00', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(11, 'mono', 'mono', 'mono@mono', '2019-09-10 23:55:12', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(12, 'mono', 'mono', 'mono@mono', '2019-09-10 23:55:34', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(13, 'mono', 'mono', 'mono@mono', '2019-09-11 00:09:12', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(14, 'mono', 'mono', 'mono@mono', '2019-09-11 00:13:46', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(15, 'mono', 'mono', 'mono@mono', '2019-09-11 00:14:44', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(16, 'mono', 'mono', 'mono@mono', '2019-09-11 00:15:23', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_03","conf_06","sem_02"]}', 1, '272.6', 0),
(17, 'mono', 'mono', 'mono@mono', '2019-09-11 00:18:08', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":4,"etiquetas":3}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '143.2', 0),
(18, 'mono', 'mono', 'mono@mono', '2019-09-11 00:40:40', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":4,"etiquetas":3}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '143.2', 0),
(19, 'mono', 'mono', 'mono@mono', '2019-09-11 00:41:18', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":4,"etiquetas":3}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '143.2', 1),
(20, 'mono', 'mono', 'mono@mono', '2019-09-11 00:56:05', '{"un_dia":1,"pase_completo":1,"pase_2dias":1,"camisas":2,"etiquetas":3}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '214.6', 1),
(21, 'mono', 'mono', 'mono@mono', '2019-09-11 00:59:14', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":2,"etiquetas":3}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '214.6', 1),
(22, 'mono', 'mono', 'mono@mono', '2019-09-11 01:00:28', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":2,"etiquetas":3}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '214.6', 0),
(23, 'mono', 'mono', 'mono@mono', '2019-09-11 01:15:41', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '212.6', 0),
(24, 'mono', 'mono', 'mono@mono', '2019-09-11 01:19:58', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":2,"etiquetas":2}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '212.6', 1),
(25, 'mono', 'mono', 'mono@mono', '2019-09-11 01:23:18', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":5,"etiquetas":2}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '240.5', 1),
(26, 'mono', 'mono', 'mono@mono', '2019-09-11 01:23:45', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":5,"etiquetas":2}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '240.5', 0),
(27, 'mono', 'mono', 'mono@mono', '2019-09-11 01:32:35', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":5,"etiquetas":2}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '240.5', 1),
(28, 'mono', 'mono', 'mono@mono', '2019-09-11 01:33:12', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":5,"etiquetas":2}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '240.5', 1),
(29, 'mono', 'mono', 'mono@mono', '2019-09-11 01:33:39', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":1,"etiquetas":5}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '209.3', 0),
(30, 'mono', 'mono', 'mono@mono', '2019-09-11 01:35:17', '{"un_dia":0,"pase_completo":2,"pase_2dias":2,"camisas":1,"etiquetas":5}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '209.3', 0),
(31, 'mono', 'mono', 'mono@mono', '2019-09-11 01:36:25', '{"un_dia":3,"pase_completo":2,"pase_2dias":23,"camisas":1,"etiquetas":5}', '{"eventos":["taller_02","conf_01","conf_03","conf_06","sem_02","taller_15","conf_08"]}', 3, '1244.3', 1),
(32, 'mono', 'mono', 'mono@mono', '2019-09-11 01:41:39', '{"un_dia":1,"pase_completo":0,"pase_2dias":0}', '{"eventos":["conf_01"]}', 2, '30', 1),
(33, 'mono', 'mono', 'mono@mono', '2019-09-11 01:46:59', '{"un_dia":1,"pase_completo":0,"pase_2dias":0,"camisas":2}', '{"eventos":["conf_01"]}', 2, '48.6', 1),
(34, 'sdf', 'sdf', 'mono@mono', '2019-09-11 01:48:20', '{"un_dia":0,"pase_completo":0,"pase_2dias":1,"camisas":1}', '{"eventos":["conf_01","sem_01"]}', 3, '54.3', 1),
(36, 'mono', 'mono', 'mono@mono', '2019-09-11 22:58:43', '{"un_dia":1,"pase_completo":0,"pase_2dias":0}', '{"eventos":["conf_01"]}', 2, '30', 1),
(37, 'mono', 'mono', 'mono@mono', '2019-09-11 23:00:41', '{"un_dia":1,"pase_completo":1,"pase_2dias":0}', '{"eventos":["conf_01"]}', 2, '80', 0),
(38, 'gato', 'gato', 'gato@gato', '2019-09-14 12:47:49', '{"un_dia":0,"pase_completo":2,"pase_2dias":0,"camisas":10,"etiquetas":2}', '{"eventos":["taller_05","conf_03","conf_04","conf_08"]}', 1, '197', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `usuario` (`usuario`);

--
-- Indices de la tabla `categoria_evento`
--
ALTER TABLE `categoria_evento`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`evento_id`),
  ADD KEY `id_cat_evento` (`id_cat_evento`),
  ADD KEY `in_inv` (`id_inv`);

--
-- Indices de la tabla `invitados`
--
ALTER TABLE `invitados`
  ADD PRIMARY KEY (`invitado_id`);

--
-- Indices de la tabla `regalos`
--
ALTER TABLE `regalos`
  ADD PRIMARY KEY (`id_regalo`);

--
-- Indices de la tabla `registrados`
--
ALTER TABLE `registrados`
  ADD PRIMARY KEY (`id_registrado`),
  ADD KEY `regalo` (`regalo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT de la tabla `categoria_evento`
--
ALTER TABLE `categoria_evento`
  MODIFY `id_categoria` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `evento_id` tinyint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT de la tabla `invitados`
--
ALTER TABLE `invitados`
  MODIFY `invitado_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `regalos`
--
ALTER TABLE `regalos`
  MODIFY `id_regalo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `registrados`
--
ALTER TABLE `registrados`
  MODIFY `id_registrado` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `eventos_ibfk_1` FOREIGN KEY (`id_cat_evento`) REFERENCES `categoria_evento` (`id_categoria`),
  ADD CONSTRAINT `eventos_ibfk_2` FOREIGN KEY (`id_inv`) REFERENCES `invitados` (`invitado_id`);

--
-- Filtros para la tabla `registrados`
--
ALTER TABLE `registrados`
  ADD CONSTRAINT `registrados_ibfk_1` FOREIGN KEY (`regalo`) REFERENCES `regalos` (`id_regalo`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
