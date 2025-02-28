create
    definer = ssg@localhost procedure sakilaCustomerCount()
BEGIN
    -- 변수 선언
    DECLARE customer_cnt INT;
    DECLARE add_number INT;

    SET customer_cnt = 0;
    SET add_number = 10;

    SET customer_cnt = (SELECT COUNT(*) FROM customer);

    SELECT customer_cnt;
end;

