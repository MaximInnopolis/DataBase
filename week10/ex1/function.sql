CREATE OR REPLACE FUNCTION get_credit_all() RETURNS TABLE ("accountID" INT,  "name" TEXT, "credit" INT, "currency" TEXT) AS $$
BEGIN 
    RETURN QUERY
    SELECT *
    FROM account;
END;
$$ LANGUAGE plpgsql;


SELECT *
FROM get_credit_all();

CREATE OR REPLACE FUNCTION send_money(from_id INT, to_id INT, amout INT) AS $$
BEGIN 
    IF from_id = to_id THEN
        RAISE EXCEPTION 'Incorrect account ID!';    
    IF amout < 0 THEN
        RAISE EXCEPTION 'Incorrect amout value!';
    IF amout > (SELECT credit FROM get_credit_all())
    THEN
        RAISE EXCEPTION 'Not enough money!';
    

END;
$$ LANGUAGE plpgsql;


SELECT *
FROM get_credit_all();