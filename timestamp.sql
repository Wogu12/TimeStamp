-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Cze 2023, 21:37
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `timestamp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `monthly_hours`
--

CREATE TABLE `monthly_hours` (
  `id` int(16) NOT NULL,
  `month_name` varchar(255) NOT NULL,
  `hour_amount` int(16) NOT NULL,
  `year` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id` int(16) NOT NULL,
  `login` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `logged` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_data`
--

CREATE TABLE `user_data` (
  `id` int(16) NOT NULL,
  `imie` varchar(255) NOT NULL,
  `nazwisko` varchar(255) NOT NULL,
  `telefon` int(25) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `data_urodzenia` date NOT NULL,
  `ile_urlop` int(16) NOT NULL,
  `wziety_urlop` int(16) NOT NULL,
  `fk_user` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `worked_hours`
--

CREATE TABLE `worked_hours` (
  `id` int(16) NOT NULL,
  `start_job` datetime(6) NOT NULL,
  `end_job` datetime(6) NOT NULL,
  `summary` int(255) NOT NULL,
  `fk_user` int(16) NOT NULL,
  `fk_monthly` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `monthly_hours`
--
ALTER TABLE `monthly_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`);

--
-- Indeksy dla tabeli `worked_hours`
--
ALTER TABLE `worked_hours`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user` (`fk_user`),
  ADD KEY `fk_monthly` (`fk_monthly`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `monthly_hours`
--
ALTER TABLE `monthly_hours`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `user_data`
--
ALTER TABLE `user_data`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `worked_hours`
--
ALTER TABLE `worked_hours`
  MODIFY `id` int(16) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `user_data`
--
ALTER TABLE `user_data`
  ADD CONSTRAINT `user_data_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`);

--
-- Ograniczenia dla tabeli `worked_hours`
--
ALTER TABLE `worked_hours`
  ADD CONSTRAINT `worked_hours_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `worked_hours_ibfk_2` FOREIGN KEY (`fk_monthly`) REFERENCES `worked_hours` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
