create
    definer = ssg@localhost procedure customer_if(IN customer_id_input int)
BEGIN
    DECLARE store_id_i INT;
    DECLARE s_id_one INT;
    DECLARE s_id_two INT;

    SET store_id_i = (SELECT store_id FROM customer WHERE customer_id = customer_id_input);

    IF store_id_i = 1 THEN SET s_id_one = 1;
    ELSE SET s_id_two = 2;
    END IF;

    SELECT store_id_i, s_id_one, s_id_two;
end;

