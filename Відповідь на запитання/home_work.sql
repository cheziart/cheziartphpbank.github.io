-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 04 2019 г., 14:49
-- Версия сервера: 10.3.13-MariaDB
-- Версия PHP: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `home work`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `user_id`, `balance`, `currency_id`) VALUES
(1, 1, 1010, 1),
(2, 1, 14324, 2),
(3, 2, 124, 2),
(4, 2, 4354, 3),
(5, 3, 54656, 1),
(6, 3, 56, 3),
(8, 4, 78, 2),
(7, 4, 6546, 3),
(9, 5, 678, 1),
(10, 5, 67867, 3),
(12, 6, 345435, 2),
(11, 6, 23432, 3),
(13, 7, 4545, 1),
(14, 7, 656, 2),
(15, 8, 9098, 2),
(16, 8, 7657, 3),
(18, 9, 5646465, 1),
(17, 9, 456546, 3),
(19, 10, 7686, 2),
(20, 10, 456, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `amounts`
--

CREATE TABLE `amounts` (
  `id` int(11) NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `amounts`
--

INSERT INTO `amounts` (`id`, `cashbox_id`, `value`, `quantity`) VALUES
(6, 1, 100, 100),
(5, 1, 200, 100),
(4, 1, 500, 100),
(7, 2, 50, 100),
(3, 2, 100, 100),
(2, 2, 200, 100),
(1, 2, 500, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `cashboxes`
--

CREATE TABLE `cashboxes` (
  `id` int(11) NOT NULL,
  `city` varchar(30) NOT NULL,
  `model` varchar(10) NOT NULL,
  `currency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `cashboxes`
--

INSERT INTO `cashboxes` (`id`, `city`, `model`, `currency_id`) VALUES
(1, 'Полтава', 'Модель1', 3),
(2, 'Київ', 'Модель2', 1),
(3, 'Полтава', 'Модель1', 2),
(4, 'Полтава', 'Модель1', 1),
(5, 'Київ', 'Модель2', 2),
(6, 'Київ', 'Модель2', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `sign` varchar(5) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `currencies`
--

INSERT INTO `currencies` (`id`, `sign`, `name`) VALUES
(1, '$', 'Dollar'),
(3, '€', 'Євро'),
(2, '₴', 'Гривня');

-- --------------------------------------------------------

--
-- Структура таблицы `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `cashbox_id` int(11) NOT NULL,
  `acouny_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `logs`
--

INSERT INTO `logs` (`id`, `date`, `cashbox_id`, `acouny_id`, `amount`) VALUES
(1, '2019-08-17 00:00:00', 1, 6, 50),
(2, '2019-08-10 00:00:00', 2, 1, 30),
(3, '2019-08-16 00:00:00', 5, 7, 20),
(4, '2019-08-31 00:00:00', 3, 2, 10),
(5, '2019-08-12 00:00:00', 4, 18, 23),
(6, '2019-08-10 00:00:00', 4, 6, 31),
(7, '2019-08-27 00:00:00', 5, 6, 45),
(8, '2019-08-03 00:00:00', 1, 15, 16),
(9, '2019-08-14 00:00:00', 3, 4, 78),
(10, '2019-08-03 00:00:00', 4, 10, 56),
(11, '2019-08-30 00:00:00', 2, 15, 34),
(12, '2019-08-28 00:00:00', 1, 11, 52);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `age`) VALUES
(7, 'Євгеній', 30),
(10, 'Андрій', 41),
(8, 'Віталік', 56),
(9, 'Вадім', 42),
(3, 'Діма', 34),
(4, 'Марина', 19),
(2, 'Настя', 26),
(1, 'Олег', 18),
(5, 'Олексій', 31),
(6, 'Олена', 28);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD UNIQUE KEY `user_id_currency_id` (`user_id`,`currency_id`) USING BTREE,
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `amounts`
--
ALTER TABLE `amounts`
  ADD UNIQUE KEY `cashbox_id_value` (`cashbox_id`,`value`) USING BTREE,
  ADD KEY `value` (`value`);

--
-- Индексы таблицы `cashboxes`
--
ALTER TABLE `cashboxes`
  ADD KEY `id` (`id`),
  ADD KEY `currency_id` (`currency_id`) USING BTREE;

--
-- Индексы таблицы `currencies`
--
ALTER TABLE `currencies`
  ADD UNIQUE KEY `sign` (`sign`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `logs`
--
ALTER TABLE `logs`
  ADD KEY `acouny_id` (`acouny_id`),
  ADD KEY `cashbox_id` (`cashbox_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `id` (`id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `accounts_ibfk_2` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Ограничения внешнего ключа таблицы `amounts`
--
ALTER TABLE `amounts`
  ADD CONSTRAINT `amounts_ibfk_1` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`);

--
-- Ограничения внешнего ключа таблицы `cashboxes`
--
ALTER TABLE `cashboxes`
  ADD CONSTRAINT `cashboxes_ibfk_1` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`);

--
-- Ограничения внешнего ключа таблицы `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`acouny_id`) REFERENCES `accounts` (`id`),
  ADD CONSTRAINT `logs_ibfk_2` FOREIGN KEY (`cashbox_id`) REFERENCES `cashboxes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
