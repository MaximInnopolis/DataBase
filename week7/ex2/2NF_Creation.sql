CREATE TABLE Book (
  id integer NOT NULL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL
);

CREATE TABLE Teacher (
  "id" integer NOT NULL PRIMARY KEY,
  "name" VARCHAR(255) NOT NULL,
  "room" VARCHAR(255) NOT NULL,
  "grade" smallint NOT NULL
);

CREATE TABLE Loan (
  id integer NOT NULL PRIMARY KEY,
  school VARCHAR(255) NOT NULL,
  teacherId integer NOT NULL REFERENCES Teacher.id,
  course VARCHAR(255) NOT NULL,
  bookId integer NOT NULL REFERENCES Book.id,
  loanDate date NOT NULL
);

