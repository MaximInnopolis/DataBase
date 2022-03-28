CREATE TABLE Group
(
groupId int NOT NULL PRIMARY KEY
);

CREATE TABLE Company
(
companyId int NOT NULL PRIMARY KEY,
groupId int,
parentCompany varchar(255),
FOREIGN KEY parentCompany varchar(255) REFERENCES Company(companyId),
FOREIGN KEY groupId int REFERENCES Group(groupId),
);

CREATE TABLE Plant
(
plantId int NOT NULL PRIMARY KEY,
companyId int,
FOREIGN KEY companyId int REFERENCES Company(companyId),
);

CREATE TABLE Items
(
itemId int NOT NULL PRIMARY KEY,
plantId int,
FOREIGN KEY plantId int REFERENCES Plant(plantId),
);