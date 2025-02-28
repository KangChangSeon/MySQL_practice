create
    definer = ssg@localhost procedure customer_level(IN customer_id_input int)
BEGIN
    DECLARE customer_level varchar(10);
    DECLARE amount_sum float;

    SET amount_sum = (SELECT SUM(amount)
                      FROM payment
                      WHERE customer_id = customer_id_input
                      GROUP BY customer_id);
    CASE
        WHEN amount_sum >= 150 THEN SET customer_level = 'VVIP';
        WHEN amount_sum >= 120 THEN SET customer_level = 'VIP';
        WHEN amount_sum >= 100 THEN SET customer_level = 'GOLD';
        WHEN amount_sum >= 80 THEN SET customer_level = 'SILVER';
        ELSE SET customer_level = 'BRONZE' ;
        END CASE;
    
    SELECT customer_id_input as customer_id, amount_sum, customer_level;
end;

