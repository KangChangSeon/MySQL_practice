create
    definer = ssg@localhost procedure value_while_leave(IN param1 int, IN param2 int)
BEGIN
    DECLARE i INT;
    DECLARE result INT;

    SET i = 1;
    SET result = 0;

    mywhile:
    WHILE (i <= param1)
        DO
            SET result = result + param2;
            SET i = i + 1;

            IF(result > 100) THEN LEAVE mywhile;
            END IF;
    END WHILE;

    SELECT result;
end;

