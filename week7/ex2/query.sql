-- For each of the schools, the number of books that have been loaned to each publishers
SELECT s.name AS School,
    p.name AS Publisher,
    COUNT(*)
FROM Loan as l
    JOIN teacher AS t ON t.id = l.teacherId
    JOIN school AS s ON s.id = t.schoolId
    JOIN book AS b ON b.id = l.bookId
    JOIN publisher AS p ON p.id = b.publisherId
GROUP BY (s.id, p.id);

-- For each school, find the book that has been on loan the longest and the teacher in charge of it
SELECT s.name AS School,
    b.name AS Book,
    t.name AS Teacher
FROM Loan as l
    JOIN Teacher AS t ON t.id = l.teacherId
    JOIN School AS s ON s.id = t.schoolId
    JOIN Book AS b ON b.id = l.bookId
    JOIN Publisher AS p ON p.id = b.publisherId
    JOIN (
        SELECT s.id,
            MIN(l.loanDate)
        FROM Loan as l
            JOIN Teacher AS t ON t.id = l.teacherId
            JOIN School AS s ON s.id = t.schoolId
        GROUP BY s.id
    ) AS m ON m.id = s.id
WHERE l.loanDate = m.min;