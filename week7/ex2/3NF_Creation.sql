CREATE TABLE Publisher (
    id integer NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Book (
    id integer NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    publisherId integer NOT NULL REFERENCES Publisher(id)
);

CREATE TABLE School (
    id integer NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Room (
    id integer NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Teacher (
    id integer NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    schoolId integer NOT NULL REFERENCES School(id),
    roomId integer NOT NULL REFERENCES Room(id),
    grade smallint NOT NULL
);

CREATE TABLE Course (
    id integer NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE Loan (
    id integer NOT NULL PRIMARY KEY,
    teacherId integer NOT NULL REFERENCES Teacher(id),
    courseId integer NOT NULL REFERENCES Course(id),
    bookId integer NOT NULL REFERENCES Book(id),
    loanDate date NOT NULL
);