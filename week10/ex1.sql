CREATE or REPLACE FUNCTION retrievecustomers(ID_from INT, ID_to INT)  
RETURNS TABLE(
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    address_id SMALLINT
)
AS $$
BEGIN  
    IF ID_from < 0 OR ID_to > 600 OR ID_from > ID_to THEN
        RAISE EXCEPTION 'Incorrect ID borders!';
    END IF;
    RETURN QUERY 
    SELECT c.first_name, c.last_name, c.address_id FROM customer AS c
    WHERE c.customer_id BETWEEN ID_from AND ID_to
    ORDER BY address_id;
END; $$  
LANGUAGE plpgsql; 

SELECT *
FROM retrievecustomers(10,40);