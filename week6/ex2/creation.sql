CREATE TABLE Author(
    author_id NUMERIC PRIMARY KEY,
    first_name varchar(255),
    last_name varchar(255)
);

CREATE TABLE Book(
    book_id varchar(255) PRIMARY KEY,
    book_title varchar(255),
    month_ varchar(255),
    year_ int,
    editor int
);

CREATE TABLE IF NOT EXISTS Pub(
    pub_id int PRIMARY KEY,
    title varchar(255),
    book_id varchar(255) REFERENCES Book(book_id)
);

CREATE TABLE Author_pub(
    author_id int NOT NULL REFERENCES Author(author_id),
    pub_id int NOT NULL REFERENCES Pub(pub_id),
    author_position int,
    PRIMARY KEY(author_id, pub_id)
);

INSERT INTO Book(book_id, book_title, month_, year_, editor)
VALUES
    (1, 'How i met your mothe', 'August', 1956, 9),
    (2, 'Harry Potter', 'November', 1934, 3),
    (3, 'What is love', 'July', 1986, 7),
    (4, 'Intro to psychology', 'April', 1946, 2),

INSERT INTO Author(author_id, first_name, last_name)
VALUES
    (1, 'Paul', 'Ron'),
    (2, 'Carl', 'Marx'),
    (3, 'Fridrich', 'Eltsin'),
    (4, 'Kirill', 'Poletkin'),

INSERT INTO Pub(pub_id, title, book_id)
VALUES
    (1, 'Bottle', 1),
    (2, 'Fold', 2),
    (3, 'Flip flop', 3),
    (4, 'Queue', 4),

INSERT INTO Author_pub(author_id, pub_id, author_position)
VALUES
    (1, 3, 1),
    (2, 1, 2),
    (3, 2, 2),
    (4, 2, 1),