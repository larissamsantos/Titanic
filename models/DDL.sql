CREATE DATABASE titanic;
USE titanic;

CREATE TABLE `Passenger` (
  `Id` int PRIMARY KEY,
  `Name` varchar(255),
  `Sex_id` int,
  `Age` double,
  `SibSp` int,
  `Parch` int,
  `Embarked_id` int,
  `Ticket_id` int,
  `Cabin_id` int
);

CREATE TABLE `Sex` (
	`Id` int PRIMARY KEY,
	`Sex` varchar(255)
);

CREATE TABLE `Survival_Status` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Passenger_id` int,
  `Status` int COMMENT '0: didnt survive, 1:survived'
);

CREATE TABLE `Embarked` (
  `Id` int PRIMARY KEY,
  `Port` varchar(1),
  `Description` varchar(255)
);

CREATE TABLE `Pclass` (
  `Id` int PRIMARY KEY,
  `Class` int,
  `Description` varchar(255)
);

CREATE TABLE `Ticket` (
  `Id` int PRIMARY KEY,
  `Ticket` varchar(255),
  `Fare` double,
  `Pclass_id` int
);

CREATE TABLE `Cabin` (
  `Id` int PRIMARY KEY,
  `Cabin` varchar(255)
);

CREATE TABLE `Fact_Survival` (
  `Id` int PRIMARY KEY AUTO_INCREMENT,
  `Dim_Passenger_id` int,
  `Dim_Embarked_id` int,
  `Dim_Pclass_id` int,
  `Dim_Ticket_id` int,
  `Dim_Cabin_id` int,
  `Dim_Sex_id` int,
  `Survived` int
);

CREATE TABLE `Dim_Passenger` (
  `Id` int PRIMARY KEY,
  `Name` varchar(255),
  `Age` double,
  `SibSp` int,
  `Parch` int
);

CREATE TABLE `Dim_Embarked` (
  `Id` int PRIMARY KEY,
  `Port` varchar(255),
  `Description` varchar(255)
);

CREATE TABLE `Dim_Pclass` (
  `Id` int PRIMARY KEY,
  `Class` varchar(255),
  `Description` varchar(255)
);

CREATE TABLE `Dim_Ticket` (
  `Id` int PRIMARY KEY,
  `Ticket` varchar(255),
  `Fare` double
);

CREATE TABLE `Dim_Cabin` (
  `Id` int PRIMARY KEY,
  `Cabin` varchar(255)
);

CREATE TABLE `Dim_Sex` (
  `Id` int PRIMARY KEY,
  `Sex` varchar(255)
);


ALTER TABLE `Passenger`  ADD FOREIGN KEY (`Ticket_id`)  REFERENCES `Ticket`(`Id`);

ALTER TABLE `Passenger`  ADD FOREIGN KEY (`Cabin_id`)  REFERENCES `Cabin`(`Id`);

ALTER TABLE `Passenger` ADD FOREIGN KEY (`Embarked_id`) REFERENCES `Embarked` (`Id`);

ALTER TABLE `Passenger` ADD FOREIGN KEY (`Sex_id`) REFERENCES `Sex` (`Id`);

ALTER TABLE `Survival_Status` ADD FOREIGN KEY (`Passenger_id`) REFERENCES `Passenger` (`Id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`Pclass_id`) REFERENCES `Pclass` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Passenger_id`) REFERENCES `Dim_Passenger` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Embarked_id`) REFERENCES `Dim_Embarked` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Pclass_id`) REFERENCES `Dim_Pclass` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Ticket_id`) REFERENCES `Dim_Ticket` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Cabin_id`) REFERENCES `Dim_Cabin` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Sex_id`) REFERENCES `Dim_Sex` (`Id`);