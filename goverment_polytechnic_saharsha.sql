-- Create Database
CREATE DATABASE IF NOT EXISTS `goverment_polytechnic_saharsha`;

-- Use the created database
USE `goverment_polytechnic_saharsha`;

-- Table for users (student, teacher, admin)
CREATE TABLE IF NOT EXISTS `users` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `role` ENUM('student', 'teacher', 'admin') NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Admin, Teacher, Student dummy data (for testing)
INSERT INTO `users` (`username`, `email`, `password`, `role`) VALUES
('admin', 'admin@polytechnic.com', MD5('admin123'), 'admin'),
('teacher1', 'teacher1@polytechnic.com', MD5('teacher123'), 'teacher'),
('student1', 'student1@polytechnic.com', MD5('student123'), 'student');

-- Create table for storing sessions (for login)
CREATE TABLE IF NOT EXISTS `sessions` (
    `id` INT(11) NOT NULL AUTO_INCREMENT,
    `user_id` INT(11) NOT NULL,
    `session_token` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
