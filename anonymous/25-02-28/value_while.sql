create
    definer = ssg@localhost procedure value_while(IN param1 int, IN param2 int)
BEGIN
    DECLARE i INT;
    DECLARE result INT;

    SET i = 1;
    SET result = 0;

    WHILE (i <= param1) DO SET result = result + param2; SET i = i + 1;
        END WHILE;
    
    SELECT result;
end;

