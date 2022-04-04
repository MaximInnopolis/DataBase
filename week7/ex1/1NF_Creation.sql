CREATE TABLE Order_ (
  orderId integer NOT NULL,
  "date" date NOT NULL,
  customerId integer NOT NULL,
  customerName VARCHAR(255) NOT NULL,
  city VARCHAR(255) NOT NULL,
  itemId integer NOT NULL,
  itemName VARCHAR(255) NOT NULL,
  quant integer NOT NULL,
  price real NOT NULL,
  PRIMARY KEY("orderId", "itemId")
);