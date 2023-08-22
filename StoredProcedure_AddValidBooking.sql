DELIMITER //

CREATE PROCEDURE AddValidBooking(IN bookingDate DATE, IN tableNumber INT)
BEGIN
    DECLARE tableStatus VARCHAR(10);
    
    START TRANSACTION;
    
    -- Check if the table is already booked
    SELECT status INTO tableStatus
    FROM Booking
    WHERE table_number = TableNumber AND booking_date = BookingDate;
    
    IF tableStatus IS NULL THEN
        -- Table is available, insert the booking
        INSERT INTO Booking (table_number, booking_date)
        VALUES (tableNumber, bookingDate);
        
        COMMIT;
        
        SELECT CONCAT('Booking confirmed for Table ', tableNumber, ' on ', bookingDate) AS Result;
    ELSE
        -- Table is already booked, rollback the transaction
        ROLLBACK;
        
        SELECT CONCAT('Booking declined. Table ', tableNumber, ' is already booked on ', bookingDate) AS Result;
    END IF;
END //

DELIMITER ;


CALL AddValidBooking('2022-12-17', 6);