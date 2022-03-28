CREATE TABLE Order
(
orderId int NOT NULL PRIMARY KEY,
date char(50),
house int,
street char(50),
district char(50),
city char(50),
);

CREATE TABLE Customer
(
clientId int NOT NULL PRIMARY KEY,
balance int,
creditLimit int,
discount int,
house int,
street char(50),
district char(50),
city char(50),
FOREIGN KEY (orderId) REFERENCES Order(orderId)
);

CREATE TABLE Item
(
itemId int NOT NULL PRIMARY KEY,
description char(100)
);

CREATE TABLE Manufacturer
(
manufacturerId int NOT NULL PRIMARY KEY,
phonenumber char(50)
);

CREATE TABLE ItemListOrder
(
ItemListOrderId int NOT NULL PRIMARY KEY,
itemId int,
orderId int,
quantity int,
FOREIGN KEY (itemId) REFERENCES  Item(itemId),
FOREIGN KEY (orderId) REFERENCES Order(orderId)
);

CREATE TABLE ItemListManufacturer
(
ItemListManufacturerId int NOT NULL PRIMARY KEY,
itemId int,
manufacturerId int,
quantity int,
FOREIGN KEY (itemId) REFERENCES Item(itemId),
FOREIGN KEY (manufacturerId) REFERENCES Manufacturer(manufacturerId)
);