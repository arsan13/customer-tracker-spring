DROP DATABASE  IF EXISTS `spring_security_bcrypt`;

CREATE DATABASE  IF NOT EXISTS `spring_security_bcrypt`;
USE `spring_security_bcrypt`;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` char(68) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--
-- NOTE: The passwords are encrypted using BCrypt
--
-- Default passwords here are: test123
--

INSERT INTO `users` 
VALUES 
('arthur','{bcrypt}$2a$10$g9RV4WFNYeiAcIWgOCNIT.MM/m2ZRsVkZtb5MjlFMi5PH0x9s8z36',1),
('polly','{bcrypt}$2a$10$g9RV4WFNYeiAcIWgOCNIT.MM/m2ZRsVkZtb5MjlFMi5PH0x9s8z36',1),
('thomas','{bcrypt}$2a$10$g9RV4WFNYeiAcIWgOCNIT.MM/m2ZRsVkZtb5MjlFMi5PH0x9s8z36',1);


--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authorities`
--

INSERT INTO `authorities` 
VALUES 
('arthur','ROLE_EMPLOYEE'),
('polly','ROLE_EMPLOYEE'),
('polly','ROLE_MANAGER'),
('thomas','ROLE_EMPLOYEE'),
('thomas','ROLE_ADMIN');


