-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 26 Nov 2025 pada 08.27
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `booking_lapangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `bookings`
--

CREATE TABLE `bookings` (
  `id` varchar(50) NOT NULL,
  `field_id` varchar(50) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `booking_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `total_price` double NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `bookings`
--

INSERT INTO `bookings` (`id`, `field_id`, `user_name`, `booking_date`, `start_time`, `end_time`, `total_price`, `payment_method`, `created_at`) VALUES
('59561177-07d0-49c8-a909-58a84e72a69a', 'f1', 'khoir pepol', '2025-11-28', '08:00:00', '00:00:00', 150000, 'OVO', '2025-11-26 07:10:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fields`
--

CREATE TABLE `fields` (
  `id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sport_type` varchar(50) NOT NULL,
  `location` varchar(255) NOT NULL,
  `facilities` text DEFAULT NULL,
  `price_per_hour` double NOT NULL,
  `image_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `fields`
--

INSERT INTO `fields` (`id`, `name`, `sport_type`, `location`, `facilities`, `price_per_hour`, `image_path`) VALUES
('f1', 'Lapangan Futsal A', 'Futsal', 'Jl. Merdeka No. 1', 'Rumput Sintetis, AC', 150000, 'assets/futsal.jpg'),
('f2', 'Lapangan Futsal B', 'Futsal', 'Jl. Merdeka No. 1', 'Lantai Vinyl, Kipas Angin', 120000, 'assets/futsal.jpg'),
('f3', 'Lapangan Basket A', 'Basket', 'Gor Cempaka', 'Lantai Kayu, Tribun', 200000, 'assets/basket.png'),
('f4', 'Lapangan Basket B', 'Basket', 'Gor Cempaka', 'Outdoor, Lampu Malam', 100000, 'assets/basket.png'),
('f5', 'Lapangan Badminton A', 'Badminton', 'Sport Center', 'Karpet Standar BWF', 80000, 'assets/badminton.jpg'),
('f6', 'Lapangan Badminton B', 'Badminton', 'Sport Center', 'Lantai Semen', 50000, 'assets/badminton.jpg'),
('f7', 'Lapangan Tenis A', 'Tenis', 'Club House', 'Clay Court', 250000, 'assets/tenis.jpg'),
('f8', 'Lapangan Voli A', 'Voli', 'Pantai Indah', 'Pasir Pantai', 100000, 'assets/voli.jpg');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `field_id` (`field_id`);

--
-- Indeks untuk tabel `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
