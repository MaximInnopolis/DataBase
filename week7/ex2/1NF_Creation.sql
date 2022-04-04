CREATE TABLE loan_books (
  school VARCHAR(255) NOT NULL,
  teacher VARCHAR(255) NOT NULL,
  course VARCHAR(255) NOT NULL,
  room VARCHAR(255) NOT NULL,
  grade smallint NOT NULL,
  book VARCHAR(255) NOT NULL,
  publisher VARCHAR(255) NOT NULL,
  loanDate date NOT NULL,
  PRIMARY KEY(school, teacher, book)
);