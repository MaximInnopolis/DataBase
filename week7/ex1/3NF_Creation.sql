CREATE TABLE Order_ (
  id integer NOT NULL,
  "date" date NOT NULL,
  customerId integer NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE Customer (
  id integer NOT NULL,
  name VARCHAR(255) NOT NULL,
  cityId integer NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE City (
  id integer NOT NULL,
  coords VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
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
  orderId integer NOT NULL,
  quant integer NOT NULL,
  PRIMARY KEY(id)
);
