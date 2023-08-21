DELIMITER //

CREATE PROCEDURE CancelOrder(IN OrderID INT)
BEGIN
    DECLARE orderExists INT;
    
    -- Check if the order exists
    SELECT COUNT(*) INTO orderExists
    FROM Orders
    WHERE OrderID = OrderID;
    
    IF orderExists > 0 THEN
        -- Delete the order
        DELETE FROM Orders
        WHERE OrderID = OrderID;
        
        SELECT CONCAT('Order ', OrderID, ' is canceled.') AS Result;
    ELSE
        SELECT 'Order not found.' AS Result;
    END IF;
END //

DELIMITER ;


-- DROP PROCEDURE CancelOrder;

-- SET SQL_SAFE_UPDATES = 0; This is used to remove the deletion restriction in mysql and should be used with cution

CALL CancelOrder(2); -- Replace 2 with the actual order ID


