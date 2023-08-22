DELIMITER //

CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
    DELETE FROM booking
    WHERE BookingID = booking_id;
    
	SELECT CONCAT('Booking ', booking_id, '  cancelled') AS Confirmation;
    
END//


DELIMITER ;


DROP PROCEDURE UpdateBooking;
CALL CancelBooking(9);