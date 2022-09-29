-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2022 at 09:55 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fijrdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `adminID` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`adminID`, `username`, `password`, `email`) VALUES
(1, 'zairi', '12345', 'mohamadzairi658@gmail.com'),
(2, 'zaki', '123456', 'zaki@gmail.com'),
(3, 'Amalia', '11223344', 'amalia@gmail.com'),
(4, 'lynx', '12345', 'lynx@gmail.com'),
(5, 'ali', '12345', 'ali@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `funder`
--

CREATE TABLE `funder` (
  `Funder_ID` int(11) NOT NULL,
  `Funder_Name` varchar(50) DEFAULT NULL,
  `Funder_Email` varchar(50) DEFAULT NULL,
  `Funder_Phone` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT current_timestamp(),
  `Total` varchar(50) DEFAULT NULL,
  `Tahfiz_ID` int(11) DEFAULT NULL,
  `Shelter_ID` int(11) DEFAULT NULL,
  `Ngo_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `funder`
--

INSERT INTO `funder` (`Funder_ID`, `Funder_Name`, `Funder_Email`, `Funder_Phone`, `Date`, `Total`, `Tahfiz_ID`, `Shelter_ID`, `Ngo_ID`) VALUES
(1, 'MOHD ZAIRI ABD GHANI', 'mrjebat658@gmail.com', '0149942572', '2022-06-11', '2000', 2, NULL, NULL),
(2, 'ahmad fitri bin ahmad', 'mohamadzairi17@yahoo.com', '0149942572', '2022-06-11', '100', 3, NULL, NULL),
(3, 'MOHD ZAIRI ABD GHANI', 'mrjebat658@gmail.com', '0149942572', '2022-06-11', '100', NULL, NULL, 2),
(4, 'ahmad fitri bin ahmad', 'mrjebat658@gmail.com', '0149942572', '2022-06-11', '50', NULL, 2, NULL),
(5, 'ahmad fitri bin ahmad', 'mrjebat658@gmail.com', '0149942572', '2022-06-16', '20', 9, NULL, NULL),
(6, 'ahmad yakut bin ali', 'mohamadzairi17@yahoo.com', '0149942572', '2022-06-16', '30', 9, NULL, NULL),
(7, 'MOHD ZAIRI ABD GHANI', 'mrjebat658@gmail.com', '0149942572', '2022-06-16', '100', NULL, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ngo`
--

CREATE TABLE `ngo` (
  `Ngo_ID` int(11) NOT NULL,
  `Ngo_Name` varchar(50) DEFAULT NULL,
  `Ngo_Address` varchar(50) DEFAULT NULL,
  `Ngo_Email` varchar(50) DEFAULT NULL,
  `Ngo_Phone` varchar(50) DEFAULT NULL,
  `Recipient_Name` varchar(50) DEFAULT NULL,
  `Bank_Name` varchar(50) DEFAULT NULL,
  `AccNo` varchar(50) DEFAULT NULL,
  `TotalPayment` int(50) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ngo`
--

INSERT INTO `ngo` (`Ngo_ID`, `Ngo_Name`, `Ngo_Address`, `Ngo_Email`, `Ngo_Phone`, `Recipient_Name`, `Bank_Name`, `AccNo`, `TotalPayment`, `AdminID`) VALUES
(1, 'MyKasih Foundation', 'Level 3, DIALOG TOWER, No. 15, Jalan PJU 7/5, Muti', 'info@mykasih.com', '037720 1800', 'MyKasih Foundation', 'Ambank Berhad', '2172012006459', 100, NULL),
(2, 'EcoKnights', '\"No 41, Lorong Burhanuddin Helmi 11 Taman Tun Dr I', 'info@EcoKnights.org.my', '03 7731 8361', 'EcoKnights', 'Public Bank Berhad', '3810028332', 100, NULL),
(3, 'MyFundAction', 'SH-G-26, Pangsapuri Perkhidmatan Knox Wawasan, Jal', 'info@myfundaction.org', '03 8928 9061', 'MyFundAction', 'Maybank', '550510970367', 200, NULL),
(4, 'Yayasan Amal Malaysia', 'Lot 4459, Jalan Hj Muhammad Amin, Sungai Merab Lua', 'amalmalaysia.hq@gmail.com', '0389280660', 'Yayasan Amal Malaysia', 'Bank Islam', '13053010003149', 100, NULL),
(5, 'MediCom', '12A, Jalan Opera H U2/H, Taman TTDI Jaya, 40150 Sh', 'medicomalaysia@gmail.com', '01115711581', 'MediCom', 'Maybank', '562478167234', 20, NULL),
(6, 'Akaun Amanah Bencana', 'ARAS 5, BLOK SELATAN NO.5 PERSIARAN PERDANA, PRESI', 'nasuha@mof.gov.my', '0388823769', 'Akaun Amanah Bencana', 'Maybank Islamic', '566010650930', 100, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `shelter`
--

CREATE TABLE `shelter` (
  `Shelter_ID` int(11) NOT NULL,
  `Shelter_Name` varchar(50) DEFAULT NULL,
  `Shelter_Address` varchar(50) DEFAULT NULL,
  `Shelter_Email` varchar(50) DEFAULT NULL,
  `Shelter_Phone` varchar(50) DEFAULT NULL,
  `Recipient_Name` varchar(50) DEFAULT NULL,
  `Bank_Name` varchar(50) DEFAULT NULL,
  `AccNo` varchar(50) DEFAULT NULL,
  `TotalPayment` int(50) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shelter`
--

INSERT INTO `shelter` (`Shelter_ID`, `Shelter_Name`, `Shelter_Address`, `Shelter_Email`, `Shelter_Phone`, `Recipient_Name`, `Bank_Name`, `AccNo`, `TotalPayment`, `AdminID`) VALUES
(1, 'Rumah Perlindungan Nur Hati', 'No 2 jalan rasmi 11 taman rasmi jaya Ampang Jaya 6', 'zbrois@yahoo.com', '01132313138', 'Rumah Perlindungan Nur Hati', 'Maybank', '562674227790', 100, NULL),
(2, 'Rumah Perlindungan Al Nasuha', 'No sd 6 lot 63039 Jalan Amzil Taman Melewar 68100 ', 'Tiada', '0179354323', 'Rumah Perlindungan Al Nasuha', 'Maybank', '564829000530', 50, NULL),
(3, 'Rumah Perlindungan Fitrah Qaseh', '12C, Jalan Sabar, Taman Dato Onn, Larkin 80350 Joh', 'rumahfitrahqaseh@gmail.com', '01117502102', 'Rumah Perlindungan Fitrah Qaseh', 'Cimb bank', '8009889244', 20, NULL),
(4, 'Kompleks Anak Yatim Fatimah Al-Zaharah ', 'Alamat: Lot 1120, Jalan Tebing Tinggi, 75450 Bukit', 'admin.maim.gov.my', '062837416', 'Kompleks Anak Yatim Fatimah Al-Zaharah ', 'Bank Islam', '4015010045371', 100, NULL),
(5, 'Teratak Che Dah', 'Lot 305, Blok E, Jalan Utama 1, Kampung Melayu Ser', 'info@teratakchedah.com', '01114274654', 'Teratak Che Dah', 'Cimb bank', '8604491917', 300, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tahfiz`
--

CREATE TABLE `tahfiz` (
  `Tahfiz_ID` int(11) NOT NULL,
  `Tahfiz_Name` varchar(50) DEFAULT NULL,
  `Tahfiz_Address` varchar(50) DEFAULT NULL,
  `Tahfiz_Email` varchar(50) DEFAULT NULL,
  `Tahfiz_Phone` varchar(50) DEFAULT NULL,
  `Recipient_Name` varchar(50) DEFAULT NULL,
  `Bank_Name` varchar(50) DEFAULT NULL,
  `AccNo` varchar(50) DEFAULT NULL,
  `TotalPayment` int(50) DEFAULT NULL,
  `AdminID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tahfiz`
--

INSERT INTO `tahfiz` (`Tahfiz_ID`, `Tahfiz_Name`, `Tahfiz_Address`, `Tahfiz_Email`, `Tahfiz_Phone`, `Recipient_Name`, `Bank_Name`, `AccNo`, `TotalPayment`, `AdminID`) VALUES
(1, 'Tahfiz Al Mahdi', 'Lot 20-2, Jalan GP 2A, 68100 Batu Caves, Selangor,', 'tahfizkebajikan.alislah@gmail.com', '0162600098', 'Tahfiz Al Mahdi', 'Bank Islam', '12195010021236', 100, NULL),
(2, 'Tahfiz Al-Quran Al-Ansar', '49, Jalan Permas 4, Bandar Baru Permas Jaya, 81750', 'sekolahtahfizalquranalansarpj@gmail.com', '0127144252', 'Tabung Pembinaan Sekolah Tahfiz Al-Quran Al-Ansar', 'Affin Bank ', '105730007676', 200, NULL),
(3, 'Akademi Tahfiz As-Siddiq', 'Telok Panglima Garang, Selangor', 'alislah.group@gmail.com', '014-3921515', 'Baitul Islah Centre', 'Cimb bank', '8604515948', 100, NULL),
(4, 'Akademi Tahfiz Hayatul Muslim', 'Lot 2269, Jalan Kg. Tengah 1, Lenggeng, Negeri Sem', 'tahfizkebajikan@gmail.com', '0162600098', 'Akademi Tahfiz Hayatul Muslim', 'Cimb bank', '8604560748', 50, NULL),
(5, 'Tahfiz Tarbiah Wal Ulum Darul Hidayah', 'lot 2193 jalan seroja kampung gubah nyalas 77100 a', 'hadramiyah85@gmail.com', '017-295 3270', 'Tahfiz Tarbiah Wal Ulum Darul Hidayah', ' Maybank', '554110515463', 20, NULL),
(6, 'Sekolah Rendah Islam Tahfiz Al-Ilmi Keningau﻿', 'Seri Tahfiz Al-Ilmi, Keningau, Sabah', 'seritahfizalilmi@gmail.com', '012-866 5086', 'Sekolah Rendah Islam Tahfiz Al-Ilmi Keningau﻿', 'Maybank', '560090106250', 60, NULL),
(7, 'Madrasah Hassaniah Islamiah', 'NO 62, Jalan Kiambang,  Felda Tenggaroh 5 86810 Me', 'Tiada', '0177292086', 'Madrasah Hassaniah Islamiah', 'Maybank', '551098516339', 300, NULL),
(8, 'Tahfiz Mandarin', '4A, jalan Besar, 42940 Pulau Ketam,Selangor', 'atm.pulauketam@gmail.com', '0196467811', 'Tahfiz Mandarin', 'Maybank', '562478163674', 200, NULL),
(9, 'Madrasah Nur Al Amin', 'Lot 4801 Kg Baru Tanah Pinggir Meriang Nyalas 7710', 'madrasahnuralamin@gmail.com', '0176488397', 'Madrasah Nur Al Amin', 'Maybank', '554110517679', 100, NULL),
(10, 'Madrasah Tahfiz Darul Quran As-Syarif', 'Kg Desa Temu Jodoh, Chaah, Segamat) Batu 10, Jalan', 'snormah.hasan@gmail.com', '01135597696', 'Madrasah Tahfiz Darul Quran As-Syarif', 'Bank Rakyat', '1101697332', 100, NULL),
(11, 'Maahad Tahfiz Al Fateh', '\" lot 922, sungai bertam, jalan belakang pusat per', 'tahfizalfateh15@gmail.com', '01163205252', 'Maahad Tahfiz Al Fateh', 'Cimb bank', '8604134381', 100, NULL),
(12, 'Maahad Tahfiz Darul Hadis Besut', '4324, Belakang Masjid Al-Muqarrabin Gong Kepas, Ka', 'darulhadisbesut@gmail.com', '01123139991', 'Maahad Tahfiz Darul Hadis Besut', 'Maybank Islamic', '563046337114', 100, NULL),
(13, 'Maahad Tahfiz Nur Syafaat', 'Wisma Al - Firdaus, Lot 1131, Batu 45 86200 Johor ', 'darulameer@yahoo.com', '01116183416', 'Maahad Tahfiz Nur Syafaat', 'Public Bank Berhad', '3817112110', 200, NULL),
(14, 'Maahad Tahfiz Al Quran An Najihah', 'Lot 13507, Jalan Salak, Kg. Jijan, 71800 Nilai, Ne', 'tahfizmatan@gmail.com', ' 0133331120', 'Maahad Tahfiz Al Quran An Najihah', 'Maybank', '555108301296', 150, NULL),
(26, 'tahfiz onezahim izuddin', 'NO 36 KAMPUNG TRIANG', 'mrjebat658@gmail.com', '0149942572', 'tahfiz onezahim izuddin', 'Bank Islam', '10192345678', 0, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `funder`
--
ALTER TABLE `funder`
  ADD PRIMARY KEY (`Funder_ID`),
  ADD KEY `Tahfiz_ID` (`Tahfiz_ID`),
  ADD KEY `Shelter_ID` (`Shelter_ID`),
  ADD KEY `Ngo_ID` (`Ngo_ID`);

--
-- Indexes for table `ngo`
--
ALTER TABLE `ngo`
  ADD PRIMARY KEY (`Ngo_ID`),
  ADD UNIQUE KEY `AdminID` (`AdminID`);

--
-- Indexes for table `shelter`
--
ALTER TABLE `shelter`
  ADD PRIMARY KEY (`Shelter_ID`),
  ADD UNIQUE KEY `AdminID` (`AdminID`);

--
-- Indexes for table `tahfiz`
--
ALTER TABLE `tahfiz`
  ADD PRIMARY KEY (`Tahfiz_ID`),
  ADD UNIQUE KEY `AdminID` (`AdminID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `adminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `funder`
--
ALTER TABLE `funder`
  MODIFY `Funder_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ngo`
--
ALTER TABLE `ngo`
  MODIFY `Ngo_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shelter`
--
ALTER TABLE `shelter`
  MODIFY `Shelter_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tahfiz`
--
ALTER TABLE `tahfiz`
  MODIFY `Tahfiz_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `funder`
--
ALTER TABLE `funder`
  ADD CONSTRAINT `funder_ibfk_1` FOREIGN KEY (`Tahfiz_ID`) REFERENCES `tahfiz` (`Tahfiz_ID`),
  ADD CONSTRAINT `funder_ibfk_2` FOREIGN KEY (`Shelter_ID`) REFERENCES `shelter` (`Shelter_ID`),
  ADD CONSTRAINT `funder_ibfk_3` FOREIGN KEY (`Ngo_ID`) REFERENCES `ngo` (`Ngo_ID`);

--
-- Constraints for table `ngo`
--
ALTER TABLE `ngo`
  ADD CONSTRAINT `ngo_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `accounts` (`adminID`);

--
-- Constraints for table `shelter`
--
ALTER TABLE `shelter`
  ADD CONSTRAINT `shelter_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `accounts` (`adminID`);

--
-- Constraints for table `tahfiz`
--
ALTER TABLE `tahfiz`
  ADD CONSTRAINT `tahfiz_ibfk_1` FOREIGN KEY (`AdminID`) REFERENCES `accounts` (`adminID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
