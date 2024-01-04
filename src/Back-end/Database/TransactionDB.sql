Use VIVUAPP;

-- tạo tài khoản mới
DELIMITER //
CREATE PROCEDURE CreateAccount(
    IN p_phoneNumber CHAR(10),
    IN p_password VARCHAR(64),
    IN p_fullName NVARCHAR(30),
    IN p_address NVARCHAR(40),
    IN p_email VARCHAR(30),
    IN p_birthday DATE,
    IN p_isCarOwner BOOLEAN
)
proc: BEGIN
	IF EXISTS(
		  SELECT 1
		  FROM AccountCar
		  WHERE p_phoneNumber = phoneNumber
	  ) then
		-- Phone number already exists, rollback transaction
        signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The phone number is exist';		
        ROLLBACK;
		leave proc;
      else
		-- @p_accountID CHAR(5) DEFAULT NULL;
		SET @p_accountID = (SELECT RIGHT(CONCAT('00000', CAST(IFNULL(MAX(accountID), 0) + 1 AS CHAR(5))), 5) FROM AccountCar);
		INSERT INTO AccountCar (accountID, phoneNumber, passwordAccount, fullName, address, email, birthday, isCarOwner) 
        VALUES (@p_accountID , p_phoneNumber, p_password,	p_fullName, p_address, p_email, p_birthday, p_isCarOwner);
        select accountID, isCarOwner from AccountCar where @p_accountID = accountID;
     END if;
END //
DELIMITER ;

-- kiểm tra tài khoản của người dùng
DELIMITER //
CREATE PROCEDURE Login(
	IN p_phoneNumber CHAR(10),
	IN p_password VARCHAR(64)    
)
proc: BEGIN
	IF not EXISTS(SELECT 1 FROM AccountCar WHERE p_phoneNumber = phoneNumber
	  ) then
		ROLLBACK;
        signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The phone number is not exist';
		leave proc;
	END IF;
	 IF not EXISTS(SELECT 1 FROM AccountCar WHERE p_phoneNumber = phoneNumber and passwordAccount = p_password
	  ) then
		ROLLBACK;
        signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The password is wrong';
		leave proc;
	end if;
	select accountID, isCarOwner from AccountCar where p_phoneNumber = phoneNumber and passwordAccount = p_password;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE InsertRental(
	IN p_cusID char(5),
	IN p_carID CHAR(5),
	IN p_pickupTime DATETIME,
	IN p_returnTime DATETIME,
	IN p_rentalPrice FLOAT,
	IN p_rentalLocationID CHAR(5),
	IN p_paymentID CHAR(5)
)
proc: BEGIN
	IF not EXISTS(SELECT 1 FROM AccountCar WHERE p_cusID = accountID) then
		ROLLBACK;
		Signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The phone number is not exists';
		leave proc;
	end if;
    IF exists (SELECT 1 FROM rental WHERE customerID = p_cusID and rentalStatus = 1)  then
    ROLLBACK;
		Signal SQLSTATE '23000' SET MESSAGE_TEXT = 'Customer is having a reservation';
		leave proc;
	end if;
    IF EXISTS(SELECT 1 FROM CarOwner WHERE p_cusID = carOwnerID) then
        signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The user can not rent car';
        ROLLBACK;
		leave proc;
	end if;
	if not EXISTS(SELECT 1 FROM Car WHERE carID = p_carID) then
        signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The car is not exist';
        ROLLBACK;
		leave proc;
	end if;
	if not EXISTS(SELECT 1 FROM Payment WHERE p_paymentID = paymentID) then
        signal SQLSTATE '23000' SET MESSAGE_TEXT = "The user doesn't not payment";
        ROLLBACK;
		leave proc;
	end if;
    if ((SELECT carStatus FROM Car WHERE p_carID = carID) = 0) then
		signal SQLSTATE '23000' SET MESSAGE_TEXT = "The car can not rent";
        ROLLBACK;
		leave proc;
	end if;
    
    SET @p_rentalID = (SELECT RIGHT(CONCAT('00000', CAST(IFNULL(MAX(rentalID), 0) + 1 AS CHAR(5))), 5) FROM Rental);
    INSERT INTO Rental (rentalID, carID, customerID, pickupTime, returnTime, rentalPrice, rentalStatus, rentalLocationID, paymentID)
    VALUES (@p_rentalID, p_carID, p_cusID, p_pickupTime, p_returnTime, p_rentalPrice, 1, p_rentalLocationID, p_paymentID);
    
    Update Car
    set carStatus = 0
    where carID = p_carID;
    
    select rentalID from Rental where rentalID = @p_rentalID;
END //
DELIMITER ;

-- AddPayment( kiểm tra thông tin khách hàng.. nhớ kiểm tra mấy cái liên quan)
DELIMITER //
CREATE PROCEDURE AddPayment(
    IN car_id_param CHAR(5),
    IN paymentMethod nvarchar(15),
    IN paymentDate datetime,
    IN discount_code_param VARCHAR(15)
)
proc: BEGIN
    DECLARE total_cost_value FLOAT;
    DECLARE discount_percent_value FLOAT;
    DECLARE discount_cost_value FLOAT;
    DECLARE payment_amount_value FLOAT;
	DECLARE pickup_time_param DATETIME;
    DECLARE return_time_param DATETIME;
    DECLARE PAYMENT_ID CHAR(5);
    SELECT price INTO total_cost_value FROM Car WHERE carID = car_id_param;
	SELECT returnTime INTO return_time_param FROM Rental;
    SELECT pickupTime INTO pickup_time_param FROM Rental;
    
    
    SET total_cost_value = TIMESTAMPDIFF(HOUR, pickup_time_param, return_time_param) * total_cost_value / 24;
    
	-- SET PAYMENT_ID = (SELECT RIGHT(CONCAT('00000', CAST(IFNULL(MAX(paymentID), 0) + 1 AS CHAR(5))), 5) FROM payment);
    SET @PAYMENT_ID = (SELECT RIGHT(CONCAT('00000', CAST(IFNULL(MAX(paymentID), 0) + 1 AS CHAR(5))), 5) FROM Payment);
    -- Thêm bản ghi vào bảng Payment
    INSERT INTO Payment (paymentID, paymentAmount, paymentMethod, paymentDate, totalCost, paymentStatus)
    VALUES (
        @PAYMENT_ID, 
        payment_amount_value, 
        paymentMethod,  -- Thay 'your_payment_method' bằng phương thức thanh toán thực tế
        paymentDate,  -- Ngày thanh toán
        total_cost_value,
        0);
	
    select paymentID from Payment where paymentID = @PAYMENT_ID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE editCar(
	IN p_carID char(5),
	IN p_carCompany VARCHAR(15),
	IN p_model NVARCHAR(30),
	IN p_seats INT,
	IN p_transmission NVARCHAR(30),
	IN p_fuelType NVARCHAR(15),
	IN p_yearRelease YEAR,
	IN p_price FLOAT
)
proc: BEGIN
	IF not EXISTS(SELECT 1 FROM Car WHERE p_carID = carID) then
        signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The car is not exist';
        ROLLBACK;
		leave proc;
	end if;
	
	Update Car 
    Set carCompany = p_carCompany, model = p_model, seats = p_seats, transmission = p_transmission, fuelType = p_fuelType, yearRelease = p_yearRelease, price = p_price
	where p_carID = carID;
    
    select carID from Car where p_carID = carID;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetCurrentTrip(
    IN customer_id CHAR(5)
)
proc: BEGIN
	SELECT * FROM Rental WHERE customerID = customer_id and rentalStatus = 1;
END //
DELIMITER;

DELIMITER //
CREATE PROCEDURE GetCurrentRentalCarList(
    IN owner_id CHAR(5)
)
proc: BEGIN
	SELECT r.* FROM Rental r join Car c on c.carID = r.carID
    where c.carOwnerID = owner_id and rentalStatus = 1;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetCarInfo(IN car_id_param CHAR(5))
proc: BEGIN
    SELECT * FROM Car WHERE carID = car_id_param;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetTripHistory(IN customer_id_param CHAR(5))
proc: BEGIN
    SELECT * FROM Rental
    WHERE customerID = customer_id_param and rentalStatus = 0;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE GetRentalHistory(IN car_owner_ID CHAR(5))
proc: BEGIN
    SELECT r.* FROM Rental r join Car c on c.carID = r.carID
    where c.carOwnerID = car_owner_ID and rentalStatus = 0;
END //
DELIMITER ;

-- deleteCar() phải kiểm tra xe có đang được thuê không, kiểm tra xe tồn tại không,...
-- DELIMITER //
-- CREATE PROCEDURE deleteCar(IN carID_param CHAR(5))
-- proc: BEGIN
--   DECLARE is_car_found INT;
--   DECLARE is_car_rented INT;

--   -- Kiểm tra xem xe có tồn tại hay không
--   SELECT COUNT(*) INTO is_car_found FROM Car WHERE carID = carID_param;

--   IF is_car_found = 0 THEN
--     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Car not found';
--     ROLLBACK;
--     leave proc;
--   END IF;

--   -- Kiểm tra xem xe có đang được thuê hay không
--   SELECT COUNT(*) INTO is_car_rented FROM Car WHERE carID = carID_param AND carStatus = 1;

--   IF is_car_rented > 0 THEN
--     SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'Car currently rented. Cannot delete.';
--     ROLLBACK;
--     leave proc;
--   END IF;

--   DELETE FROM Car WHERE carID = carID_param;
--   select 'Successful' as 'Note';
-- END //
-- DELIMITER;

-- DELIMITER //
-- CREATE PROCEDURE EditRentalStatus(
--     IN rental_id_param CHAR(5)
-- )
-- proc: BEGIN
-- 	if not exists(select 1 from Rental where rental_id_param = rentalID) then
-- 		SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'Rental car is not exists';
-- 		ROLLBACK;
-- 		leave proc;
-- 	END IF;
--     
--     set @carID = (select carID from Rental where rental_id_param = rentalID);
--     
-- 	if ((select rentalStatus from Rental where rental_id_param = rentalID) = 1) then
-- 		update Rental
--         set rentalStatus = 0
--         where rental_id_param = rentalID;
--         -- SELECT 'SUCCESSFUL' AS message;
--         update Car
--         set carStatus = 1
--         where carID = @carID;
--     else
-- 		update Rental
--         set rentalStatus = 1
--         where rental_id_param = rentalID;
--         
--         update Car
--         set carStatus = 0
--         where carID = @carID;
--     END IF;
-- END //
-- DELIMITER ;

-- GetRental() tìm kiếm thuê xe theo ng đã thuê (cho khách thuer) và theo xe (cho chủ xe)

-- DELIMITER //
-- CREATE PROCEDURE GetRentalByCar(IN car_id_param CHAR(5))
-- proc: BEGIN
--     SELECT * FROM Rental
--     WHERE carID = car_id_param;
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE addNewCar(
-- 	IN p_carCompany VARCHAR(15),
-- 	IN p_model NVARCHAR(30),
-- 	IN p_seats INT,
-- 	IN p_transmission NVARCHAR(30),
-- 	IN p_fuelType NVARCHAR(15),
-- 	IN p_yearRelease YEAR,
-- 	IN p_price FLOAT,
-- 	IN p_phoneNumber CHAR(10)
-- )
-- proc: BEGIN
-- 	IF not EXISTS(SELECT 1 FROM AccountCar WHERE phoneNumber = p_phoneNumber and isCarOwner = 1) then
--         signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The owner car is not exist';
--         ROLLBACK;
-- 		leave proc;
-- 	end if;
--     Set @p_carOwnerID = (SELECT accountID from AccountCar where phoneNumber = p_phoneNumber and isCarOwner = 1);
-- 	SET @p_carID = (SELECT RIGHT(CONCAT('00000', CAST(IFNULL(MAX(carID), 0) + 1 AS CHAR(5))), 5) FROM Car);
-- 	INSERT INTO Car (carID, carCompany, model, seats, transmission, fuelType, yearRelease, price, carStatus, carOwnerID)
-- 	VALUES (@p_carID, p_carCompany, p_model, p_seats, p_transmission, p_fuelType, p_yearRelease, p_price, 1, @p_carOwnerID);
-- END//
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE EditRental(
-- 	IN p_rentalID char(5)
-- )
-- proc: BEGIN
-- 	IF not EXISTS(SELECT 1 FROM Rental WHERE p_rentalID = rentalID) then
-- 		ROLLBACK;
-- 		Signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The car rental is not exists';
-- 		leave proc;
-- 	end if;

--     -- INSERT INTO Rental (rentalID, carID, customerID, pickupTime, returnTime, rentalPrice, rentalStatus, rentalLocationID, paymentID)
-- --     VALUES (p_rentalID, p_carID, @p_customerID, p_pickupTime, p_returnTime, p_rentalPrice, 1, p_rentalLocationID, p_paymentID);
-- 	
--     Update Rental
--     set rentalStatus = 0
--     where rentalID = p_rentalID;

-- 	SET @p_carID = (select carID from Rental where rentalID = p_rentalID);
--   
--     Update Car
--     set carStatus = 0
--     where carID = @p_carID;
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE updateCarInfo(
--   IN p_carID CHAR(5),
--   IN carCompany VARCHAR(15),
--   IN model NVARCHAR(30),
--   IN seats INT,
--   IN transmission NVARCHAR(30),
--   IN fuelType NVARCHAR(15),
--   IN yearRelease YEAR,
--   IN price FLOAT,
--   IN carStatus BOOLEAN
-- )
-- proc: BEGIN
-- 	IF not EXISTS(
-- 		  SELECT 1
-- 		  FROM Car
-- 		  WHERE carID = p_carID
-- 	  ) THEN
-- 		-- Phone number already exists, rollback transaction
-- 		ROLLBACK;
-- 		-- Display system notice
-- 		SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'Xe không tồn tại';
-- 		RETURN 0;
-- 	  END IF;
--   UPDATE Car
--   SET carCompany = carCompany,
--       model = model,
--       seats = seats,
--       transmission = transmission,
--       fuelType = fuelType,
--       yearRelease = yearRelease,
--       price = price,
--       carStatus = carStatus
--   WHERE carID = carID;

-- END//
-- DELIMITER ;

-- thêm thuê xe -- cập nhập xe
-- hủy thuê xe - cập nhật xe

-- GetCar(): lấy thông tin chi tiết của xe

-- Search Car() tìm thông tin Car theo mã định danh của chủ xe

-- DELIMITER //
-- CREATE PROCEDURE SearchCarByOwner(IN owner_id_param CHAR(5))
-- proc: BEGIN
--     SELECT Car.*, AccountCar.fullName as OwnerName
--     FROM Car JOIN AccountCar ON Car.carOwnerID = AccountCar.accountID
--     WHERE AccountCar.accountID = owner_id_param;
-- END //
-- DELIMITER ;

-- Edit rental() kiểm tra có thuê xe chưa và update cái trạng thái thuê xe

-- KIỂM TRA LẠI CÁI NÀY NHA EM
-- DELIMITER //
-- CREATE PROCEDURE EditRentalStatus(
--     IN rental_id_param CHAR(5)
-- )
-- proc: BEGIN
-- --     DECLARE existing_rental_count INT;
-- --     
-- --     SELECT COUNT(*) INTO existing_rental_count
-- --     FROM Rental
-- --     WHERE rentalID = rental_id_param;

-- --     IF existing_rental_count > 0 THEN
-- --         UPDATE Rental
-- --         SET
-- --             rentalStatus = rental_status_param
-- --         WHERE rentalID = rental_id_param;
-- 	if not exists(select 1 from Rental where rental_id_param = rentalID) then
-- 		SIGNAL SQLSTATE '23000' SET MESSAGE_TEXT = 'Rental car is not exists';
-- 		ROLLBACK;
-- 		leave proc;
-- 	END IF;
--     
--     set @carID = (select carID from Rental where rental_id_param = rentalID);
--     
-- 	if ((select rentalStatus from Rental where rental_id_param = rentalID) = 1) then
-- 		update Rental
--         set rentalStatus = 0
--         where rental_id_param = rentalID;
--         -- SELECT 'SUCCESSFUL' AS message;
--         update Car
--         set carStatus = 1
--         where carID = @carID;
--     else
-- 		update Rental
--         set rentalStatus = 1
--         where rental_id_param = rentalID;
--         
--         update Car
--         set carStatus = 0
--         where carID = @carID;
--     END IF;
-- END //
-- DELIMITER ;

-- GetRental() tìm kiếm thuê xe theo ng đã thuê (cho khách thuer) và theo xe (cho chủ xe)
-- DELIMITER //
-- CREATE PROCEDURE GetRentalByCustomer(IN customer_id_param CHAR(5))
-- proc: BEGIN
--     SELECT * FROM Rental
--     WHERE customerID = customer_id_param;
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE GetRentalByCar(IN car_id_param CHAR(5))
-- proc: BEGIN
--     SELECT * FROM Rental
--     WHERE carID = car_id_param;
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE GetRentalByOwner(IN car_owner_ID CHAR(5))
-- proc: BEGIN
--     SELECT o.fullName, o.phoneNumber, c.*
--     from AccountCar o join Car c on o.accountID =  c.carOwnerID
--     where car_owner_ID = c.carOwnerID;
-- END //
-- DELIMITER ;


-- EditPayment(kiểm tra thông tin liên quan) chỉnh trạng thái thanh goán và ngày thanh toán
-- DELIMITER //
-- CREATE PROCEDURE EditPayment(
--     IN payment_id_param CHAR(5),
--     IN new_payment_status_param BIT,
--     IN new_payment_date_param DATETIME
-- )
-- proc: BEGIN
--     DECLARE payment_exists INT;
--     SELECT COUNT(*) INTO payment_exists FROM Payment WHERE paymentID = payment_id_param;

--     IF payment_exists > 0 THEN
--         UPDATE Payment
--         SET paymentStatus = new_payment_status_param, paymentDate = new_payment_date_param
--         WHERE paymentID = payment_id_param;
--     ELSE
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Payment does not exist';
--     END IF;
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE EditPasswordAccount(
--     IN p_phoneNumber CHAR(10),
--     IN p_password VARCHAR(64)
-- )
-- proc: BEGIN
-- 	IF not EXISTS(SELECT 1 FROM AccountCar WHERE p_phoneNumber = phoneNumber
-- 	  ) then
-- 		-- Phone number already exists, rollback transaction
-- 		ROLLBACK;
-- 		Signal SQLSTATE '23000' SET MESSAGE_TEXT = 'Số điện thoại đã tồn tại';
-- 		leave proc;
-- 	 
--       else
-- 			Update AccountCar
--             set passwordAccount = p_password
--             where phoneNumber = p_phoneNumber;
--             select 'Successful' as 'Note';
--      END if;
-- END //
-- DELIMITER ;

-- GetPayment() lấy của khách thuê xe đã thanh toán thuê hoặc lấy các thanh toán của các xe của chủ xe

-- DELIMITER //
-- CREATE PROCEDURE GetPayment(IN customer_id_param CHAR(5))
-- proc: BEGIN
--     DECLARE customer_count INT;
--     
--     SELECT COUNT(*) INTO customer_count FROM AccountCar WHERE accountID = customer_id_param;
--     
--     IF customer_count > 0 THEN
--         SELECT * FROM Payment
--         WHERE paymentID IN (SELECT paymentID FROM Rental WHERE customerID = customer_id_param AND paymentID IS NOT NULL)
--         AND paymentStatus = 1;
--     ELSE
--         SELECT 'Customer not found' AS Error;
--     END IF;
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE GetPaymentCarOwner(IN owner_car_id_param CHAR(5))
-- proc: BEGIN
--     DECLARE customer_count INT;
--     
--     SELECT COUNT(*) INTO customer_count FROM carowner WHERE carOwnerID = owner_car_id_param;
--     
--     IF customer_count > 0 THEN
--         SELECT * FROM Payment
--         WHERE paymentID IN (SELECT paymentID FROM Rental WHERE carID = (select carID from Car where carOwnerID = owner_car_id_param) AND paymentID IS NOT NULL)
--         AND paymentStatus = 1;
--     ELSE
--         SELECT 'Car owner not found' AS Error;
--     END IF;
-- END //
-- DELIMITER ;

-- chỉnh sửa thông tin cá nhân 
-- DELIMITER //
-- CREATE PROCEDURE EditAccount(
--     IN p_phoneNumber CHAR(10),
--     IN p_fullName NVARCHAR(30),
--     IN p_gender NVARCHAR(3),
--     IN p_address NVARCHAR(40),
--     IN p_email VARCHAR(30),
--     IN p_birthday DATE,
--     IN p_citizenIdentityCard VARCHAR(12)
-- )
-- proc: BEGIN
-- 	IF not EXISTS(SELECT 1 FROM AccountCar WHERE p_phoneNumber = phoneNumber
-- 	  ) then
-- 		-- Phone number already exists, rollback transaction
--         signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The phone number is exist';
-- 		ROLLBACK;
--         leave proc;
--       else
-- 		Update AccountCar
--         Set fullName = p_fullName, gender = p_gender, address = p_address, email = p_email, birthday = p_birthday, citizenIdentityCard = p_citizenIdentityCard
--         where p_phoneNumber = phoneNumber;
--         select 'Successful' as 'Note';
--      END if;
-- END //
-- DELIMITER ;

-- lấy thông tin khách hàng thông qua số điện thoại
-- DELIMITER //
-- CREATE PROCEDURE GetAccount(
--     IN p_phoneNumber CHAR(10)
-- )
-- proc: BEGIN
-- 	IF not EXISTS(SELECT 1 FROM AccountCar WHERE p_phoneNumber = phoneNumber
-- 	  ) then
-- 		-- Phone number already exists, rollback transaction
-- 		signal SQLSTATE '23000' SET MESSAGE_TEXT = 'The phone number is not exist';
--         ROLLBACK;
--         leave proc;
--       else
--         select phoneNumber, fullName, gender, address, email, birthday, citizenIdentityCard
--         from AccountCar
--         where p_phoneNumber = phoneNumber;
--      END if;
-- END //
-- DELIMITER ;

-- Thêm sửa lấy feedback của khách hàng hàng
-- DELIMITER //
-- CREATE PROCEDURE AddEvaluation(
--     IN rating_param INT,
--     IN content_param NVARCHAR(200),
--     IN car_id_param CHAR(5),
--     IN account_id_param CHAR(5),
--     IN rental_id_param CHAR(5)
-- )
-- proc: BEGIN
--     IF NOT EXISTS (SELECT * FROM AccountCar WHERE accountID = account_id_param) THEN
--         -- SELECT 'Customer not found' AS Error;
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Customer not found';
--     END IF;

--     IF NOT EXISTS (SELECT * FROM Car WHERE carID = car_id_param) THEN
--         -- SELECT 'Car not found' AS Error;
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Car not found';
--     END IF;

--     IF NOT EXISTS (SELECT * FROM rental WHERE rentalID = rental_id_param) THEN
--         -- SELECT 'Car not found' AS Error;
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Rental not found';
--     END IF;
--     
--     -- Thêm bản ghi vào bảng Evaluation
--     SET @evaluationID = (SELECT RIGHT(CONCAT('00000', CAST(IFNULL(MAX(evaluationID), 0) + 1 AS CHAR(5))), 5) FROM evaluation);
--     INSERT INTO Evaluation (evaluationID, rating, content, carID, accountID, rentalId)
--     VALUES (
--         @evaluationID,
--         rating_param,
--         content_param,
--         car_id_param,
--         account_id_param,
--         rental_id_param
--     );
-- END //
-- DELIMITER ;

-- DELIMITER //
-- CREATE PROCEDURE UpdateEvaluation(
--     IN evaluation_id_param CHAR(5),
--     IN new_rating_param INT,
--     IN new_content_param NVARCHAR(200)
-- )
-- proc: BEGIN
--     IF NOT EXISTS (SELECT * FROM Evaluation WHERE evaluationID = evaluation_id_param) THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Evaluation not found';
--     END IF;

--     UPDATE Evaluation
--     SET rating = new_rating_param,
--         content = new_content_param
--     WHERE evaluationID = evaluation_id_param;
-- END //
-- DELIMITER ;