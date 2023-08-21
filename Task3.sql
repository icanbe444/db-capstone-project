SELECT * FROM LittleLemonDM.MenuItems;

-- Task 3
-- For the third and final task, Little Lemon need you to find all menu items for which more than 2 
-- orders have been placed. You can carry out this task by creating a subquery that lists the menu names 
-- from the menus table for any order quantity with more than 2.

#Created a subquery where the outer query feed on
SELECT Name FROM MenuItems WHERE ItemID = ANY (
    SELECT MenuItems.Name, Orders.Quantity FROM MenuItems INNER JOIN Orders ON MenuItems.OrderID = Orders.OrderID
    WHERE quantity > 2
);