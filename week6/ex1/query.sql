--Find the names of suppliers who supply some red part.
SELECT DISTINCT sname FROM Parts
 JOIN Catalog ON Parts.pid = Catalog.pid
 JOIN Suppliers ON Suppliers.sid = Catalog.sid
 WHERE Parts.color = 'Red';

--Find the sids of suppliers who supply some red or green part
SELECT DISTINCT Suppliers.sid FROM Parts
 JOIN Catalog ON Parts.pid = Catalog.pid
 JOIN Suppliers ON Suppliers.sid = Catalog.sid
 WHERE Parts.color = 'Red' or Parts.color = 'Green';
 
 --Find the sids of suppliers who supply some red part or are at 221 Packer Street.
SELECT DISTINCT Suppliers.sid FROM Parts
 JOIN Catalog ON Parts.pid = Catalog.pid
 JOIN Suppliers ON Suppliers.sid = Catalog.sid
 WHERE Parts.color = 'Red' or Suppliers.address LIKE '%221 Packer Street%';
 
 --Find the sids of suppliers who supply every red or green part.
SELECT Suppliers.sname FROM Catalog
 JOIN Parts ON Catalog.pid = Parts.pid
 JOIN Suppliers ON Suppliers.sid = Catalog.sid
 WHERE Parts.color = 'Red';
 
 --Find the sids of suppliers who supply every red part or supply every green part.
 SELECT * FROM Suppliers as cur
WHERE NOT EXISTS (
(SELECT Parts.pid FROM Parts where Parts.color = 'Red')
EXCEPT
(SELECT sp.pid
 FROM (SELECT Suppliers.sid, Catalog.pid FROM (Suppliers JOIN Catalog ON Suppliers.sid = Catalog.sid)) as sp
 WHERE sp.sid = cur.sid ));
 
 --Find pairs of sids such that the supplier with the first sid charges more for some part than the supplier with the second sid.
 SELECT R1.sid, R2.sid FROM (Catalog as R1 JOIN Catalog as R2 ON R1.pid = R2.pid) WHERE R1.cost > R2.cost;

--Find the pids of parts supplied by at least two different suppliers.
SELECT DISTINCT R1.pid FROM (Catalog as R1 JOIN Catalog as R2 ON R1.pid = R2.pid) WHERE R1.sid != R2.sid;

--Find the average cost of the red parts and green parts for each of the suppliers
SELECT c.sid, p.color, AVG(c.cost) avg_cost
FROM Catalog AS c INNER JOIN Parts p ON c.pid = p.pid
WHERE p.color IN ('Green', 'Red')
GROUP BY c.sid, p.color

--Find the sids of suppliers whose most expensive part costs $50 or more
SELECT c.sid, MAX(c.cost) cost_cost FROM Catalog AS c WHERE c.cost >= 50 GROUP BY c.sid