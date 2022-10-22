CREATE TABLE `Passenger` (
  `Id` int PRIMARY KEY,
  `Name` varchar(255),
  `Sex` varchar(255),
  `Age` double,
  `SibSp` int,
  `Parch` int,
  `Embarked_id` int,
  `Ticket_id` int
);

CREATE TABLE `Survival_Status` (
  `Id` int PRIMARY KEY,
  `Passenger_id` int,
  `Status` int COMMENT '0: didnt survive, 1:survived'
);

CREATE TABLE `Embarked` (
  `Id` int PRIMARY KEY,
  `Port` varchar(255)
);

CREATE TABLE `Pclass` (
  `Id` int PRIMARY KEY,
  `Class` varchar(255)
);

CREATE TABLE `Ticket` (
  `Id` int PRIMARY KEY,
  `Fare` double,
  `Cabin` varchar(255),
  `Pclass_id` int
);

CREATE TABLE `Fact_Survival` (
  `Id` int PRIMARY KEY,
  `Dim_Passenger_id` int,
  `Dim_Embarked_id` int,
  `Dim_Pclass_id` int,
  `Dim_Ticket_id` int,
  `Survived` int
);

CREATE TABLE `Dim_Passenger` (
  `Id` int PRIMARY KEY,
  `Name` varchar(255),
  `Sex` varchar(255),
  `Age` double,
  `SibSp` int,
  `Parch` int
);

CREATE TABLE `Dim_Embarked` (
  `Id` int PRIMARY KEY,
  `Port` varchar(255)
);

CREATE TABLE `Dim_Pclass` (
  `Id` int PRIMARY KEY,
  `Class` varchar(255)
);

CREATE TABLE `Dim_Ticket` (
  `Id` int PRIMARY KEY,
  `Fare` double,
  `Cabin` varchar(255)
);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`Id`) REFERENCES `Passenger` (`Ticket_id`);

ALTER TABLE `Passenger` ADD FOREIGN KEY (`Embarked_id`) REFERENCES `Embarked` (`Id`);

ALTER TABLE `Survival_Status` ADD FOREIGN KEY (`Passenger_id`) REFERENCES `Passenger` (`Id`);

ALTER TABLE `Ticket` ADD FOREIGN KEY (`Pclass_id`) REFERENCES `Pclass` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Passenger_id`) REFERENCES `Dim_Passenger` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Embarked_id`) REFERENCES `Dim_Embarked` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Pclass_id`) REFERENCES `Dim_Pclass` (`Id`);

ALTER TABLE `Fact_Survival` ADD FOREIGN KEY (`Dim_Ticket_id`) REFERENCES `Dim_Ticket` (`Id`);
