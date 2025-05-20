-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2025 at 09:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `AdminID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`AdminID`, `Name`, `Email`, `Password`, `Phone`, `Role`) VALUES
(1, 'lasantha', 'lasantha@gmail.com', '123456789', '119', 'admin'),
(2, 'sandaru', 'sandaru@gmail.com', '123456789', '044444444444', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `moduleid` varchar(20) NOT NULL,
  `status` enum('Present','Absent','Late') NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attendance_id`, `id`, `moduleid`, `status`, `date`) VALUES
(1, 1, '1', 'Present', '2025-05-18 12:17:19'),
(7, 1, '1', 'Absent', '2025-05-18 22:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `CourseID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` text DEFAULT NULL,
  `Credits` int(11) DEFAULT NULL,
  `Duration` int(11) DEFAULT NULL,
  `DepartmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`CourseID`, `Name`, `Description`, `Credits`, `Duration`, `DepartmentID`) VALUES
(1, 'BSc (Hons) in Computer Science', 'Comprehensive degree program in Computer Science', 120, 4, 1),
(2, 'BSc (Hons) in Computer Science top up', 'Top-up program for Computer Science degree', 60, 1, 1),
(3, 'Bachelor of Information Technology', 'Degree program focusing on Information Technology', 120, 4, 1),
(4, 'BSc in Data Science', 'Degree program focusing on Data Science and Analytics', 120, 4, 6),
(5, 'BSc (Hons) in Software Engineering', 'Degree program focusing on Software Engineering', 120, 4, 7),
(6, 'Postgraduate Diploma in Project Management', 'Postgraduate program in Project Management', 60, 1, 2),
(7, 'Master of Business Studies (MBS)', 'Master program in Business Studies', 90, 2, 2),
(8, 'Postgraduate Diploma In Human Resource Management', 'Postgraduate program in HR Management', 60, 1, 2),
(9, 'Bachelor of Marketing', 'Degree program focusing on Marketing', 120, 4, 8),
(10, 'Bachelor of Finance', 'Degree program focusing on Finance', 120, 4, 9),
(11, 'Bachelor of Science of Engineering Honours in Mechatronic Engineering', 'Degree program in Mechatronic Engineering', 160, 4, 3),
(12, 'Bachelor of Science of Engineering', 'General Engineering degree program', 150, 4, 3),
(13, 'BSc in Civil Engineering', 'Degree program focusing on Civil Engineering', 150, 4, 10),
(14, 'BSc in Electrical Engineering', 'Degree program focusing on Electrical Engineering', 150, 4, 11),
(15, 'BSc in General Science', 'Degree program covering various science disciplines', 120, 4, 4),
(16, 'BSc (Hons) in Biomedical Science', 'Degree program focusing on Biomedical Sciences', 120, 4, 12),
(17, 'BSc (Honours) in Pharmaceutical Science', 'Degree program focusing on Pharmaceutical Sciences', 120, 4, 12),
(18, 'BSc (Hons) Nutrition and Health', 'Degree program focusing on Nutrition and Health', 120, 4, 12),
(19, 'Bachelor of Interior Design', 'Degree program focusing on Interior Design', 120, 4, 5),
(20, 'BSc (Hons) Architecture', 'Degree program focusing on Architecture', 150, 5, 5),
(21, 'BA in English Language & Literature', 'Degree program focusing on English Language and Literature', 120, 4, 13),
(22, 'BA in Linguistics', 'Degree program focusing on Linguistics', 120, 4, 13);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `DepartmentID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `HeadOfDepartment` varchar(100) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `FacultyID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`DepartmentID`, `Name`, `HeadOfDepartment`, `Description`, `FacultyID`) VALUES
(1, 'Computing & Information Systems', 'Dr. Rasika Ranaweera', 'Department focusing on Computer Science and Information Technology', 2),
(2, 'Business Management', 'Dr. Chandana Silva', 'Department focusing on Business Administration and Management', 1),
(3, 'Engineering', 'Dr. Priyantha Perera', 'Department focusing on various Engineering disciplines', 3),
(4, 'Science & Technology', 'Dr. Samanthi Wickramasinghe', 'Department focusing on various Science disciplines', 4),
(5, 'Design & Architecture', 'Dr. Kamal Gunaratne', 'Department focusing on Design principles and Architecture', 5),
(6, 'Data Science', 'Dr. Lakshman Jayasinghe', 'Department focusing on Data Science and Analytics', 2),
(7, 'Software Engineering', 'Dr. Nimal Fernando', 'Department focusing on Software Engineering and Development', 2),
(8, 'Marketing', 'Dr. Kamala Perera', 'Department focusing on Marketing strategies and practices', 1),
(9, 'Finance', 'Dr. Sunil Rajapakse', 'Department focusing on Financial management and accounting', 1),
(10, 'Civil Engineering', 'Dr. Anura Kumara', 'Department focusing on Civil Engineering', 3),
(11, 'Electrical Engineering', 'Dr. Nishantha Nanayakkara', 'Department focusing on Electrical Engineering', 3),
(12, 'Biotechnology', 'Dr. Kumari Fonseka', 'Department focusing on Biotechnology', 4),
(13, 'Languages', 'Dr. Wasantha Kotuwewatta', 'Department focusing on Languages', 5);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `FacultyID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `JoiningDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`FacultyID`, `Name`, `Email`, `Phone`, `Address`, `JoiningDate`) VALUES
(1, 'Faculty of Business', 'business@nsbm.edu.lk', '+94112345101', 'NSBM Green University, Pitipana, Homagama', '2020-01-01'),
(2, 'Faculty of Computing', 'computing@nsbm.edu.lk', '+94112345102', 'NSBM Green University, Pitipana, Homagama', '2020-01-01'),
(3, 'Faculty of Engineering', 'engineering@nsbm.edu.lk', '+94112345103', 'NSBM Green University, Pitipana, Homagama', '2020-01-01'),
(4, 'Faculty of Science', 'science@nsbm.edu.lk', '+94112345104', 'NSBM Green University, Pitipana, Homagama', '2020-01-01'),
(5, 'Faculty of Humanities & Social Sciences', 'humanities@nsbm.edu.lk', '+94112345105', 'NSBM Green University, Pitipana, Homagama', '2020-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `record` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `CourseID` int(11) NOT NULL,
  `total_fee` decimal(10,2) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `due_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`record`, `id`, `CourseID`, `total_fee`, `paid_amount`, `due_amount`) VALUES
(1, 1, 1, 55555.00, 10000.00, 45555.00),
(4, 3, 12, 10000.00, 10.00, 9990.00);

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `gradeid` int(11) NOT NULL,
  `studentid` int(11) NOT NULL,
  `moduleid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`gradeid`, `studentid`, `moduleid`, `grade`) VALUES
(7, 1, '1', 'A'),
(11, 3, '1', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `moduleid` varchar(20) NOT NULL,
  `name` varchar(45) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `module`
--

INSERT INTO `module` (`moduleid`, `name`, `id`) VALUES
('1', 'Computer Science', 1),
('CS101', 'Introduction to Computer Science', 4);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `enrollmentDate` date NOT NULL,
  `FacultyID` int(11) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  `CourseID` int(11) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `RegistrationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `dob`, `gender`, `nic`, `email`, `phone`, `address`, `enrollmentDate`, `FacultyID`, `departmentID`, `CourseID`, `password`, `RegistrationDate`) VALUES
(1, 'Sandaru Induwara Matharage', '2002-12-02', 'Male', '1990', 'induwara@gmail.com', '0762744632', 'aaaaaaaaaaaaaaaaaaax   sssssssssssssssss ssssssssss', '2025-05-17', 2, 6, 4, '123456789', '2025-05-17 18:47:31'),
(3, 'chamath', '2000-12-02', 'Male', '03530356', 'chamath@gmail.com', '0111115487487', 'hjjjjhja', '2025-05-18', 3, 3, 12, '123456789', '2025-05-18 09:40:51'),
(4, 'dushan maduranga', '2002-12-02', 'Male', '12121212121', 'dushan@gmail.com', '0455555784', 'ratnapura', '2025-05-18', 2, 1, 1, '123456789', '2025-05-18 15:55:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`AdminID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `id` (`id`),
  ADD KEY `moduleid` (`moduleid`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`CourseID`),
  ADD KEY `DepartmentID` (`DepartmentID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentID`),
  ADD KEY `FacultyID` (`FacultyID`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`FacultyID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`record`),
  ADD KEY `id` (`id`),
  ADD KEY `CourseID` (`CourseID`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`gradeid`),
  ADD KEY `studentid` (`studentid`),
  ADD KEY `moduleid` (`moduleid`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`moduleid`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nic` (`nic`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `FacultyID` (`FacultyID`),
  ADD KEY `departmentID` (`departmentID`),
  ADD KEY `CourseID` (`CourseID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `AdminID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `CourseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `DepartmentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `FacultyID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `record` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `gradeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`DepartmentID`) REFERENCES `department` (`DepartmentID`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`);

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `fees_ibfk_2` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);

--
-- Constraints for table `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`),
  ADD CONSTRAINT `grade_ibfk_2` FOREIGN KEY (`moduleid`) REFERENCES `module` (`moduleid`);

--
-- Constraints for table `module`
--
ALTER TABLE `module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`id`) REFERENCES `student` (`id`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`FacultyID`) REFERENCES `faculty` (`FacultyID`),
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`departmentID`) REFERENCES `department` (`DepartmentID`),
  ADD CONSTRAINT `student_ibfk_3` FOREIGN KEY (`CourseID`) REFERENCES `courses` (`CourseID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
