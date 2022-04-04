-- Total number of items per order and the total amount to pay for the order.
SELECT A.orderId, SUM(A.quant) AS items_count, SUM(A.quant * I.price) AS sum FROM BucketItem AS A 
JOIN Item AS I ON I.id = A.itemId
GROUP BY A.orderId;

-- Customer whose purchase in terms of money has been greater than the others
SELECT B.*, SUM(A.quant * I.price) FROM Customer AS c
JOIN Order_ AS O ON B.id = O.customerId
JOIN BucketItem AS A ON B.id = A.orderId
JOIN Item AS I ON I.id = A.itemId
GROUP BY B.id ORDER BY SUM(A.quant * I.price) DESC LIMIT 1;
