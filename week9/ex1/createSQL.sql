ALTER TABLE IF EXISTS address ADD COLUMN IF NOT EXISTS longitude INT DEFAULT 0;
ALTER TABLE IF EXISTS address ADD COLUMN IF NOT EXISTS latitude INT DEFAULT 0;

CREATE OR REPLACE FUNCTION get_addres_by_id(a_pattern CHAR(32), city_id_from INT, city_id_to INT)
RETURNS TABLE ("address" VARCHAR(128)) 
AS $$
BEGIN
    RETURN QUERY
    SELECT a.address FROM "address" AS a
    WHERE a.city_id between city_id_from AND city_id_to
        AND a.address LIKE a_pattern;
END; $$
LANGUAGE 'plpgsql';

SELECT *
FROM get_addres_by_id ('%11%', 400, 600);
