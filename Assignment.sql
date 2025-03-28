CREATE DATABASE StoreFont;

USE StoreFont;

CREATE TABLE User(UserId INT PRIMARY KEY, Name VARCHAR(30) NOT NULL,
Email VARCHAR(40) UNIQUE KEY, Phone VARCHAR(50), Password VARCHAR(20) 
UNIQUE KEY NOT NULL, Address VARCHAR(50));

DESC User;

DROP TABLE USER;

CREATE TABLE User(UserId INT PRIMARY KEY, Name VARCHAR(30) NOT NULL,
Email VARCHAR(40) UNIQUE KEY, Phone VARCHAR(50), Password VARCHAR(20) 
UNIQUE KEY NOT NULL);

DROP TABLE User;

CREATE TABLE User(UserId INT PRIMARY KEY, Name VARCHAR(30) NOT NULL,
Email VARCHAR(40) UNIQUE KEY NOT NULL, Password VARCHAR(20) UNIQUE KEY NOT NULL);

CREATE TABLE Phone(PhoneId INT PRIMARY KEY, UserId INT ,PhoneNumber VARCHAR(20));

CREATE TABLE Address(AddressId INT PRIMARY KEY, UserId INT ,Address VARCHAR(20));

DROP TABLE Address;

CREATE TABLE Address(AddressId INT  ,Address VARCHAR(20), FOREIGN KEY (AddressId) REFERENCES User (UserId));

DROP TABLE Phone;

CREATE TABLE Phone(PhoneId INT PRIMARY KEY ,PhoneNumber VARCHAR(20), FOREIGN KEY(PhoneId) REFERENCES User(UserId));

CREATE TABLE Orders (OrderId INT PRIMARY KEY,OrderStatus VARCHAR(10) CHECK ( OrderStatus IN("Shipped","Cancelled","Returned")),
OrderDate DATE, OrderPrice DECIMAL);

SHOW TABLES;


