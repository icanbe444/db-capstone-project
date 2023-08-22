DELIMITER //

CREATE PROCEDURE CheckBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE tableStatus VARCHAR(10);
    
    -- Check if the table is already booked
    SELECT status INTO tableStatus
    FROM Booking
    WHERE table_number = tableNumber AND booking_date = bookingDate;
    
    IF tableStatus IS NULL THEN
        SELECT CONCAT('Table ', TableNumber, ' is available on ', BookingDate) AS Result;
    ELSE
        SELECT CONCAT('Table ', TableNumber, ' is already booked on ', BookingDate) AS Result;
    END IF;
END //

DELIMITER ;
-- DROP PROCEDURE CheckBooking;
CALL CheckBooking('2022-11-12', 3);