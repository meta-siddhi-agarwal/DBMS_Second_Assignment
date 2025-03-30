CREATE DATABASE StoreFont;

USE StoreFont;

-- User Table
CREATE TABLE User(
Email VARCHAR(20) UNIQUE KEY NOT NULL, 
Password VARCHAR(20) UNIQUE KEY NOT NULL, 
UserType VARCHAR(10) CHECK (UserType IN("Shopper","Administrator") )
);

DESC User;

-- Shopper Table
CREATE TABLE Shopper(
ShopperId INT PRIMARY KEY, 
Name VARCHAR(20), 
MobileNumber VARCHAR(20) UNIQUE KEY, 
Dob Date, 
GENDER VARCHAR(10));

DESC Shopper;

-- Admin Table
CREATE TABLE Admin(AdminId INT PRIMARY KEY, Name VARCHAR(20) NOT NULL);

DESC Admin;

-- Address Table
CREATE TABLE Address(
ShopperId INT ,
AddressLine VARCHAR(20) UNIQUE KEY, 
City VARCHAR(10) NOT NULL,
State VARCHAR(20) NOT NULL,
Country VARCHAR(20) NOT NULL,
PinCode VARCHAR(10) NOT NULL,
FOREIGN KEY (ShopperId) REFERENCES Shopper(ShopperId)
);

DESC Address;

-- Products Table
CREATE TABLE Products(
ProductId INT PRIMARY KEY, 
Title VARCHAR(20) NOT NULL, 
Quantity INT NOT NULL, 
PRICE DECIMAL NOT NULL, 
Description VARCHAR(50), 
Product_Status VARCHAR(20)
CHECK(Product_Status IN("Active","Inactive")) DEFAULT "Active",
AddedAt DATE
);

DESC Products;

-- drop table products
DROP TABLE Products;

-- Products Table
CREATE TABLE Products(
ProductId INT PRIMARY KEY, 
Title VARCHAR(20) NOT NULL, 
Quantity INT NOT NULL, 
PRICE DECIMAL NOT NULL, 
Description VARCHAR(50), 
Product_Status VARCHAR(20)
CHECK(Product_Status IN("Active","Inactive")) DEFAULT "Active",
AddedAt DATE
);

DESC Products;

-- Image table
CREATE TABLE Image(
ProductId INT, 
ImageUrl VARCHAR(20), 
FOREIGN KEY(ProductId) REFERENCES Products(ProductId)
);

DESC Image;

-- Category Table
CREATE TABLE Category(
Cat_Id INT PRIMARY KEY, 
Cat_Title VARCHAR(20) UNIQUE KEY NOT NULL, 
Parent_Cat_Id INT,
FOREIGN KEY(Parent_Cat_Id) REFERENCES Category(Cat_Id));


DESC Category;

-- Product Category Junction Table
CREATE TABLE Product_Category(
ProductId INT, Cat_Id INT, 
FOREIGN KEY(ProductId) REFERENCES Products(ProductId),
FOREIGN KEY(Cat_Id) REFERENCES Category(Cat_Id));

DESC Product_Category;

-- Orders Table
CREATE TABLE Orders(
ShopperId INT ,
OrderDate DATE NOT NULL,
OrderTotal DECIMAL NOT NULL,
OrderId INT PRIMARY KEY,
FOREIGN KEY(ShopperId) REFERENCES Shopper(ShopperId));

DESC Orders;

-- OrderItem Table
CREATE TABLE OrderItem(
OrderId INT, 
OrderStatus VARCHAR(20) CHECK(OrderStatus IN("Shipped","Cancelled","Returned")), 
OrderItemId INT PRIMARY KEY,
Quantity INT NOT NULL, 
ProductId INT,
FOREIGN KEY(OrderId) REFERENCES Orders(OrderId), 
FOREIGN KEY(ProductId) REFERENCES Products(ProductId));

DESC OrderItem;

SHOW Tables;

ALTER TABLE User MODIFY Email VARCHAR(100);
