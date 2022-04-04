CREATE TABLE Order_ (
  id integer NOT NULL,
  "date" date NOT NULL,
  customerId integer NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Customer (
  id integer NOT NULL,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Item (
  id integer NOT NULL,
  name VARCHAR(255) NOT NULL,
  price integer NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE BucketItem (
  id integer NOT NULL,
  itemId integer NOT NULL,
  orderID integer NOT NULL,
  quant integer NOT NULL,
  PRIMARY KEY(id)
);
