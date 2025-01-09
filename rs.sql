-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 09, 2025 at 07:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rs`
--
CREATE DATABASE IF NOT EXISTS `rs` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `rs`;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `specialty` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `name`, `gender`, `phone`, `specialty`, `address`) VALUES
(1, 'Fandy', 'Male', '112325123', 'THT', 'asdsadasdas'),
(2, 'ASDASDAS', 'Female', '314142141', 'SAKIT HATI', 'ASLDHASGAOEQD'),
(3, 'Dr. Jane Smith', 'Female', '08123456780', 'Neurology', '456 Brain Ave.'),
(4, 'Dr. Alice Brown', 'Female', '08123456781', 'Pediatrics', '789 Child Blvd.'),
(5, 'Dr. Bob Johnson', 'Male', '08123456782', 'Orthopedics', '101 Bone Rd.'),
(6, 'Dr. Carol White', 'Female', '08123456783', 'Dermatology', '202 Skin Ln.'),
(7, 'Dr. Dave Lee', 'Male', '08123456784', 'Ophthalmology', '303 Eye St.'),
(8, 'Dr. Emma Green', 'Female', '08123456785', 'Gynecology', '404 Women Pkwy.'),
(9, 'Dr. Frank Black', 'Male', '08123456786', 'Psychiatry', '505 Mind Dr.'),
(10, 'Dr. Grace Harris', 'Female', '08123456787', 'Dentistry', '606 Tooth Blvd.'),
(11, 'Dr. Henry Clark', 'Male', '08123456788', 'Radiology', '707 Scan Rd.'),
(12, 'Dr. Irene Martin', 'Female', '08123456789', 'Oncology', '808 Cancer St.'),
(13, 'Dr. Jack Lewis', 'Male', '08123456780', 'Gastroenterology', '909 Digest Ave.'),
(14, 'Dr. Karen King', 'Female', '08123456781', 'Pulmonology', '1010 Lung Blvd.'),
(15, 'Dr. Liam Scott', 'Male', '08123456782', 'Anesthesiology', '1111 Sleep Ln.'),
(16, 'Dr. Mia Turner', 'Female', '08123456783', 'Urology', '1212 Kidney St.'),
(17, 'Dr. Noah Young', 'Male', '08123456784', 'Endocrinology', '1313 Hormone Ave.'),
(18, 'Dr. Olivia Adams', 'Female', '08123456785', 'Rheumatology', '1414 Joint Blvd.'),
(19, 'Dr. Paul Nelson', 'Male', '08123456786', 'Pathology', '1515 Lab Rd.'),
(20, 'Dr. Quinn Baker', 'Female', '08123456787', 'Hematology', '1616 Blood St.'),
(21, 'Dr. Ryan Hill', 'Male', '08123456788', 'Nephrology', '1717 Kidney Blvd.'),
(22, 'Dr. Sarah Wright', 'Female', '08123456789', 'Allergy & Immunology', '1818 Immune St.'),
(23, 'Dr. Tom Baker', 'Male', '08123456780', 'Infectious Disease', '1919 Virus Rd.'),
(24, 'Dr. Una Ford', 'Female', '08123456781', 'Family Medicine', '2020 Family Blvd.'),
(25, 'Dr. Vince Evans', 'Male', '08123456782', 'Emergency Medicine', '2121 ER St.');

-- --------------------------------------------------------

--
-- Table structure for table `medicalrecord`
--

CREATE TABLE IF NOT EXISTS `medicalrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `disease` varchar(100) NOT NULL,
  `service_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `doctor_id` (`doctor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalrecord`
--

INSERT INTO `medicalrecord` (`id`, `patient_id`, `doctor_id`, `disease`, `service_type`) VALUES
(4, 1, 1, 'ASU TENAN', 'KRETEK MANJA'),
(5, 1, 1, 'asdsad', 'asdad'),
(6, 1, 1, 'sdad', 'asdad'),
(7, 11, 24, 'COLD', 'OPERATION');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE IF NOT EXISTS `medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `dosage` varchar(50) NOT NULL,
  `expiration_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicine`
--

INSERT INTO `medicine` (`id`, `name`, `dosage`, `expiration_date`) VALUES
(1, 'aadsa', 'esdad', '2024-12-03'),
(2, 'SAKIT HATI', 'SELAMANYA SETIAP HARI 100X', '5000-03-13'),
(3, 'Paracetamol', '500 mg', '2025-12-31'),
(4, 'Ibuprofen', '400 mg', '2024-06-30'),
(5, 'Amoxicillin', '250 mg', '2023-11-15'),
(6, 'Cetirizine', '10 mg', '2025-01-20'),
(7, 'Metformin', '500 mg', '2024-05-10'),
(8, 'Amlodipine', '5 mg', '2025-03-15'),
(9, 'Lisinopril', '10 mg', '2024-08-25'),
(10, 'Simvastatin', '20 mg', '2025-07-01'),
(11, 'Omeprazole', '20 mg', '2024-12-10'),
(12, 'Levothyroxine', '50 mcg', '2025-09-30'),
(13, 'Gabapentin', '300 mg', '2024-04-20'),
(14, 'Sertraline', '50 mg', '2025-05-05'),
(15, 'Furosemide', '40 mg', '2024-10-15'),
(16, 'Hydrochlorothiazide', '25 mg', '2025-02-28'),
(17, 'Atorvastatin', '10 mg', '2024-11-11'),
(18, 'Clopidogrel', '75 mg', '2025-06-30'),
(19, 'Warfarin', '5 mg', '2024-09-20'),
(20, 'Albuterol', '90 mcg', '2025-04-01'),
(21, 'Prednisone', '10 mg', '2024-07-15'),
(22, 'Dexamethasone', '4 mg', '2025-01-01'),
(23, 'Ciprofloxacin', '500 mg', '2024-03-10'),
(24, 'Azithromycin', '250 mg', '2025-08-20'),
(25, 'Metoprolol', '50 mg', '2024-12-31'),
(26, 'Tamsulosin', '0.4 mg', '2025-10-10'),
(27, 'Ranitidine', '150 mg', '2024-05-15'),
(28, 'Montelukast', '10 mg', '2025-11-30'),
(29, 'Bupropion', '150 mg', '2024-06-20'),
(30, 'Fluoxetine', '20 mg', '2025-03-25'),
(31, 'Citalopram', '20 mg', '2024-09-05'),
(32, 'Venlafaxine', '75 mg', '2025-07-15'),
(33, 'Duloxetine', '30 mg', '2024-12-01');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE IF NOT EXISTS `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `birth_date` date NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`id`, `name`, `gender`, `birth_date`, `address`, `phone`) VALUES
(1, 'John Doe', 'Male', '1990-01-01', '123 Street', '1234567890'),
(2, 'FANDY', 'Male', '2005-02-09', 'CIKARANG', '912-03180371203'),
(3, 'Alice Blue', 'Female', '1990-01-01', '123 Blue St.', '08123456789'),
(4, 'Bob Green', 'Male', '1985-05-05', '456 Green Ave.', '08123456780'),
(5, 'Cathy Yellow', 'Female', '1978-09-10', '789 Yellow Blvd.', '08123456781'),
(6, 'David Red', 'Male', '1992-11-20', '101 Red Rd.', '08123456782'),
(7, 'Eva Purple', 'Female', '1988-03-15', '202 Purple Ln.', '08123456783'),
(8, 'Frank Brown', 'Male', '1975-07-30', '303 Brown St.', '08123456784'),
(9, 'Grace White', 'Female', '1982-12-25', '404 White Pkwy.', '08123456785'),
(10, 'Hank Black', 'Male', '1995-02-14', '505 Black Dr.', '08123456786'),
(11, 'Ivy Orange', 'Female', '1998-06-18', '606 Orange Blvd.', '08123456787'),
(12, 'Jack Pink', 'Male', '1977-04-22', '707 Pink Rd.', '08123456788'),
(13, 'Karen Grey', 'Female', '1969-08-29', '808 Grey St.', '08123456789'),
(14, 'Liam Cyan', 'Male', '1984-10-31', '909 Cyan Ave.', '08123456780'),
(15, 'Mia Magenta', 'Female', '1993-03-12', '1010 Magenta Blvd.', '08123456781'),
(16, 'Noah Lime', 'Male', '1981-07-04', '1111 Lime Ln.', '08123456782'),
(17, 'Olivia Teal', 'Female', '1994-09-19', '1212 Teal St.', '08123456783'),
(18, 'Paul Navy', 'Male', '1983-05-27', '1313 Navy Rd.', '08123456784'),
(19, 'Quinn Olive', 'Female', '1976-02-06', '1414 Olive Ave.', '08123456785'),
(20, 'Ryan Violet', 'Male', '1991-08-13', '1515 Violet Blvd.', '08123456786'),
(21, 'Sara Amber', 'Female', '1989-11-17', '1616 Amber St.', '08123456787'),
(22, 'Tom Gold', 'Male', '1986-04-24', '1717 Gold Rd.', '08123456788'),
(23, 'Una Silver', 'Female', '1997-02-28', '1818 Silver Ln.', '08123456789'),
(24, 'Vince Bronze', 'Male', '1979-06-15', '1919 Bronze St.', '08123456780'),
(25, 'Wendy Copper', 'Female', '1996-10-20', '2020 Copper Ave.', '08123456781'),
(26, 'Xander Jade', 'Male', '1990-01-01', '2121 Jade Blvd.', '08123456782'),
(27, 'Yara Ruby', 'Female', '1995-03-05', '2222 Ruby St.', '08123456783'),
(28, 'Zane Pearl', 'Male', '1987-07-09', '2323 Pearl Ln.', '08123456784'),
(29, 'Amy Garnet', 'Female', '1978-11-11', '2424 Garnet Rd.', '08123456785'),
(30, 'Ben Quartz', 'Male', '1982-03-22', '2525 Quartz Blvd.', '08123456786'),
(31, 'Chloe Jade', 'Female', '1980-12-01', '2626 Jade St.', '08123456787'),
(32, 'Dan Opal', 'Male', '1992-07-14', '2727 Opal Ave.', '08123456788'),
(33, 'Ella Topaz', 'Female', '1999-04-08', '2828 Topaz Ln.', '08123456789'),
(34, 'Fred Amethyst', 'Male', '1994-08-19', '2929 Amethyst Blvd.', '08123456780'),
(35, 'Gina Turquoise', 'Female', '1985-12-31', '3030 Turquoise Rd.', '08123456781'),
(36, 'Harry Sapphire', 'Male', '1973-01-23', '3131 Sapphire St.', '08123456782'),
(37, 'Irene Coral', 'Female', '1981-11-14', '3232 Coral Ave.', '08123456783'),
(38, 'Jake Emerald', 'Male', '1989-05-06', '3333 Emerald Blvd.', '08123456784'),
(39, 'Kara Onyx', 'Female', '1977-09-15', '3434 Onyx Rd.', '08123456785'),
(40, 'Luke Diamond', 'Male', '1983-02-27', '3535 Diamond Ln.', '08123456786'),
(41, 'Mia Ruby', 'Female', '1992-06-04', '3636 Ruby Blvd.', '08123456787');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `room_type` varchar(100) NOT NULL,
  `room_number` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `room_type`, `room_number`) VALUES
(7, 'Emergency', 'ER001'),
(8, 'Emergency', 'ER002'),
(9, 'Emergency', 'ER003'),
(10, 'Emergency', 'ER004'),
(11, 'Emergency', 'ER005'),
(12, 'ICU', 'ICU001'),
(13, 'ICU', 'ICU002'),
(14, 'ICU', 'ICU003'),
(15, 'ICU', 'ICU004'),
(16, 'ICU', 'ICU005'),
(17, 'Operating Room', 'OR001'),
(18, 'Operating Room', 'OR002'),
(19, 'Operating Room', 'OR003'),
(20, 'Operating Room', 'OR004'),
(21, 'Operating Room', 'OR005'),
(22, 'Recovery Room', 'RR001'),
(23, 'Recovery Room', 'RR002'),
(24, 'Recovery Room', 'RR003'),
(25, 'Recovery Room', 'RR004'),
(26, 'Recovery Room', 'RR005'),
(27, 'General Ward', 'GW001'),
(28, 'General Ward', 'GW002'),
(29, 'General Ward', 'GW003'),
(30, 'General Ward', 'GW004'),
(31, 'General Ward', 'GW005'),
(32, 'Pediatric Ward', 'PW001'),
(33, 'Pediatric Ward', 'PW002'),
(34, 'Pediatric Ward', 'PW003'),
(35, 'Pediatric Ward', 'PW004'),
(36, 'Pediatric Ward', 'PW005'),
(37, 'Maternity Ward', 'MW001'),
(38, 'Maternity Ward', 'MW002'),
(39, 'Maternity Ward', 'MW003'),
(40, 'Maternity Ward', 'MW004'),
(41, 'Maternity Ward', 'MW005'),
(42, 'Isolation Room', 'IR001'),
(43, 'Isolation Room', 'IR002'),
(44, 'Isolation Room', 'IR003'),
(45, 'Isolation Room', 'IR004'),
(46, 'Isolation Room', 'IR005'),
(47, 'Observation Room', 'OBS001'),
(48, 'Observation Room', 'OBS002'),
(49, 'Observation Room', 'OBS003'),
(50, 'Observation Room', 'OBS004'),
(51, 'Observation Room', 'OBS005'),
(52, 'Consultation Room', 'CR001'),
(53, 'Consultation Room', 'CR002'),
(54, 'Consultation Room', 'CR003'),
(55, 'Consultation Room', 'CR004'),
(56, 'Consultation Room', 'CR005');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date NOT NULL,
  `amount` float NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `medical_record_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `medicine_quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `patient_id` (`patient_id`),
  KEY `medical_record_id` (`medical_record_id`),
  KEY `medicine_id` (`medicine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `transaction_date`, `amount`, `payment_method`, `status`, `patient_id`, `medical_record_id`, `medicine_id`, `medicine_quantity`) VALUES
(21, '2025-01-01', 1000000, 'CASH', 'lunas', 1, 5, 3, 3),
(22, '2025-01-02', 2000000, 'CASH', 'LUNAS', 1, 6, 8, 3),
(23, '2025-01-04', 4000000, 'CASH', 'LUNAS', 11, 7, 4, 5),
(24, '2025-01-05', 355553000, 'CASH', 'GAS', 11, 7, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` enum('admin','user') NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'admin', 'leomarhadi13@gmail.com', 'admin1', 'admin'),
(2, 'leo', 'leomarhadi19@gmail.com', 'admin', 'user'),
(3, 'agung', 'asdad@3mail.com', 'fandy', 'user'),
(4, 'BRANDON ASU', 'brandonasu@gmail.com', 'admin1', 'user');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicalrecord`
--
ALTER TABLE `medicalrecord`
  ADD CONSTRAINT `medicalrecord_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `medicalrecord_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`medical_record_id`) REFERENCES `medicalrecord` (`id`),
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`medicine_id`) REFERENCES `medicine` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
