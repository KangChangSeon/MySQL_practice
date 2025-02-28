create
    definer = ssg@localhost procedure dynamic_query2(IN t_name varchar(50), IN c_name varchar(50), IN customer_id int)
BEGIN
    SET @t_name = t_name;
    SET @c_name = c_name;
    SET @customer_id = customer_id;
    SET @sql = concat('SELECT ', @c_name, 'FROM ', @t_name, ' WHERE customer_id = ',@customer_id);
    
    SELECT @sql;
    PREPARE dynamic_query FROM @sql;
    EXECUTE dynamic_query;
    -- 메모리 해제
    DEALLOCATE PREPARE dynamic_query;
end;

