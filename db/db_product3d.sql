-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 01:28:44
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_product3d`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `description`) VALUES
(1, 'Hogar', 'Articulos del hogar impresos en 3d muy resistentes.'),
(2, 'Juegos', 'Un juego es la actividad que realiza uno o más jugadores, empleando su imaginación o herramientas para crear una situación con un número determinado de reglas, donde puede o no haber ganadores y perdedores.'),
(10, 'Articulados', 'Nuestros productos articulados son de gran calidad, muy resistentes.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `description` text NOT NULL,
  `type_filament` varchar(45) NOT NULL,
  `img` text NOT NULL,
  `stock` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `description`, `type_filament`, `img`, `stock`, `id_category`) VALUES
(1, 'Jabonera', 2000, 'Una jabonera impresa en 3D con una gran resistencia al agua.', 'PLA', 'https://http2.mlstatic.com/D_NQ_NP_869322-MLA48738838583_012022-O.jpg', 2, 1),
(2, 'Maceta Calavera', 4000, 'Muy resiste con una terminacion perfecta, ideal para decorar la casa!', 'PTG', 'https://images.cults3d.com/sIGst69OPOo5SsJTNYksmkCG_dU=/https://files.cults3d.com/uploaders/19805748/illustration-file/8d9a3041-ef00-418d-a5df-88d18f7e558f/3D-Print-STL-Skull-Plant-Pot.jpg', 1, 1),
(3, 'Ajedrez', 5000, 'Gran calidad, con un terminado perfecto una obra de arte!', 'PLA', 'https://media.printables.com/media/prints/1067/images/6918_be7588b3-71cd-4e02-bad7-d0ec9d715745/thumbs/cover/1280x960/jpg/white_set.webp', 5, 2),
(4, 'Tetris', 1950, 'Tetris realizado en PLA muy resistente y divertido!', 'PTG', 'https://3dprint.com/wp-content/uploads/2016/04/3dp_ten3dpthings_games_tetris_1.jpg', 5, 2),
(9, 'Lapicero', 1400, 'Hermoso lapicero muy practico para poder guardar todas tus cosas.', 'PTG', 'https://es.digitaltrends.com/wp-content/uploads/2018/02/portada.jpg?fit=1500%2C1000&p=1', 2, 1),
(20, 'Stand para tel', 1500, 'Muy practico, para un uso cotidiano ', 'PLA', 'https://i.pinimg.com/736x/b6/26/1f/b6261f58a289a04e05647f72cb51ff9b.jpg', 32, 1),
(26, 'Maceta Negra ', 1500, 'Muy buen terminado, ideal para decorar tu casa!', 'PETG', 'img/634461ff051f5.jpg', 6, 1),
(27, 'Dragon articulado', 3000, 'Dragon articulado, de varios colores, gran calidad.', 'PLA', 'img/6344631049c19.jpg', 4, 10),
(28, 'Mano articulada', 1850, 'Excelente para personas que dibujan, tiene un gran terminado, se puede ralizar en varios tamaños.', 'PETG', 'img/634463e1f3c34.jpg', 2, 1),
(33, 'Javonera', 2000, 'wssdasf', 'PTG', '', 22, 10),
(35, 'Mini Basquet', 1800, 'Mini basquet muy divertido, ideal para la oficina.', 'PLA', '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `password` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `password`) VALUES
(1, 'admin', '$2y$10$APLQCme6jOPcbBI7s1FKAuAqzLCW8RbVy/Uivyjwe.Ra1FrpXBoti');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_gender` (`id_category`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
