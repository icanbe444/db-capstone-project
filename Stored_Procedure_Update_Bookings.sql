DELIMITER //

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN new_booking_date DATE)
BEGIN
    UPDATE Booking
    SET BookingDate = new_booking_date
    WHERE BookingID = booking_id;
    
    
    SELECT CONCAT('Booking with ID ', booking_id, ' updated successfully.') AS Result;
END//


DELIMITER ;

DROP PROCEDURE UpdateBooking;
CALL UpdateBooking(8, '1900-12-17');

