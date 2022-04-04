CREATE TABLE Order_ (
  id integer NOT NULL PRIMARY KEY,
  "date" date NOT NULL,
  customerId integer NOT NULL,
);

CREATE TABLE Customer (
  id integer NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
);

CREATE TABLE Item (
  id integer NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  price integer NOT NULL,
);

CREATE TABLE BucketItem (
  id integer NOT NULL PRIMARY KEY,
  itemId integer NOT NULL,
  orderID integer NOT NULL,
  quant integer NOT NULL,
);
