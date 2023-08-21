CREATE PROCEDURE GetMaxQuantity() SELECT MAX(Quantity) AS 'Maximum Quantity in Order' FROM Orders;


CALL GetMaxQuantity();