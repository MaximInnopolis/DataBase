CREATE TABLE Suppliers
(
sid int NOT NULL PRIMARY KEY,
sname varchar(255),
address varchar(255)
)

CREATE TABLE Parts
(
pid int NOT NULL PRIMARY KEY,
pname varchar(255),
color varchar(255)
)

CREATE TABLE Catalog
(
sid int REFERENCES Suppliers(sid),
pid int REFERENCES Parts(pid),
cost real,
PRIMARY KEY (sid,pid)
)

insert into Suppliers (sid, sname, address)
values (1, 'Kira Yoshikage', 'Britain street, 1'),
       (2, 'G. I. Joe', 'Moscow street, 24'),
       (3, 'Mr. Mamix', 'Horror street, 91');
	   (4, 'Athena Zeusdaughter', 'Olympus, 7 th cloud');

insert into Parts (pid, pname, color)
values (1, 'Yellow1', 'Yellow'),
       (2, 'Black1', 'Black'),
       (3, 'Blue1', 'Blue'),
       (4, 'Blue2', 'Blue'),
       (5, 'Red1', 'Red');

insert into Catalog (sid, pid, cost)
values (1, 1, 11),
	(1, 2, 20),
	(1, 3, 42),
	(1, 4, 40),
	(2, 2, 52),
	(2, 4, 9),
	(2, 5, 45),
	(2, 4, 54);