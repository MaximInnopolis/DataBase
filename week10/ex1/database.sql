DROP TABLE IF EXISTS account CASCADE;

CREATE TABLE IF NOT EXISTS account (
  accountID INT NOT NULL PRIMARY KEY,
  "name" TEXT,
  credit INT,
  currency TEXT
);

INSERT INTO
    account (accountID, "name", credit, currency)
VALUES
    (1, 'Thomas Brady', 1000, 'Rub'),
    (2, 'Adam Huff', 1000, 'Rub'),
    (3, 'Theresa Pratt', 1000, 'Rub');