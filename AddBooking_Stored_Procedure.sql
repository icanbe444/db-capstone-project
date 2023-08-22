DELIMITER //

CREATE PROCEDURE AddBooking(
    IN bookingID INT,
    IN customerID INT,
    IN bookingDate DATE,
    IN tableNumber INT
)
BEGIN
    INSERT INTO TableBookings (BookingID, CustomerID, BookingDate, TableNumber)
    VALUES (bookingID, customerID, bookingDate, tableNumber);
    
    SELECT CONCAT('Booking with ID ', bookingID, ' added successfully.') AS Result;
END //

DELIMITER ;


#this helps to create the table "TableBookings" before calling the AddBooking procedure
CREATE TABLE TableBookings (
BookingID INT AUTO_INCREMENT,
TableNumber INT,
CustomerID INT,
BookingDate DATE,
PRIMARY KEY (BookingID)
);

#This is used to call the "AddBooking" Stored Procedure
CALL AddBooking(123, 456, '2023-08-21', 5);

