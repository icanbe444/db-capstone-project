-- SELECT * FROM LittleLemonDM.Order_delivery_status;


-- CREATE PROCEDURE GetMaxQuantity() SELECT MAX(Quantity) AS 'Maximum Quantity in Order' FROM Orders ;  

-- CALL GetMaxQuantity();

SELECT C.CustomerID, C.FullName, O.OrderID, O.TotalCost, M.DeliveryDat, M.DeliveryStatus 
FROM Customer AS C INNER JOIN Orders AS O ON O.OrderID = C.OrderID 
INNER JOIN Order_delivery_Status AS M ON O.Order_delivery_statusID = M.Order_delivery_statusID
WHERE O.TotalCost > 50 ORDER BY TotalCost DESC;