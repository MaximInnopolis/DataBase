--1)Authors who have written a book
SELECT * FROM Author, Book WHERE author_id = editor;

--2)Authors who have not written a book
SELECT first_name, last_name FROM(SELECT author_id FROM Author EXCEPT SELECT editor FROM Book) AS ID 
    LEFT JOIN Author a on ID.author_id = a.author_id;

--3)Author_id of authors who have not written a book
SELECT author_id FROM Author EXCEPT SELECT editor FROM Book;