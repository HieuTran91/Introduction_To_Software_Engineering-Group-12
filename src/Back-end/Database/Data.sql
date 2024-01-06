USE VIVUAPP;


-- INSERT INTO account (accountID, password, email, phoneNumber, fullName, address, gender, birthday, citizenIdentityCard, isCarOwner)
-- VALUES
-- ('00101', 'trantrunghieu2003', 'tthieu23@gmail.com', '0367938528', 'Tran Trung Hieu', '25/4 Lạc Long Quân, Q.10, TP HCM', 'nam', '2003-04-05', '066303657365',1),
-- ('00104', 'thaongocle0510', 'ln.thao@gmail.com', '0482947567', 'Le Ngoc Thao', '215 Lý Thường Kiệt, TP Biên Hòa', 'nữ', '2003-10-05', '088010852485',1),
-- ('00106', 'trivo782', 'trivo.cao@gmail.com', '0684759365', 'Vo Cao Tri', '127 Hùng Vương Q.10, TP HCM', 'nam', '2003-10-13', '088282834683',1),
-- ('00107', 'catthanh15102003', 'hlcthanh1510@gmail.com', '0694739539', 'Hoang Le Cat Thanh', '22/11 Lý Thường Kiệt, TP Mỹ Tho', 'nữ', '2003-10-14', '099303954695',1),
-- ('00110', 'doanthiyennhi1210', 'dtynhi1210@gmail.com', '0667294653', 'Doan Thi Yen Nhi', '576 Đoàn Văn Bơ Q.5, TP HCM', 'nữ', '2003-10-12', '066010667666',1),


-- Account hashed password
INSERT INTO AccountCar(accountID, passwordAccount, email, phoneNumber, fullName, address, birthday, isCarOwner)
VALUES
('00001', '9e902a110774f94a848122f1003b6f7656c8cf0109bdac6c0bf1913f30f0c758', 'tthieu23@gmail.com', '0367938528', 'Tran Trung Hieu', '25/4 Lạc Long Quân, Q.10, TP HCM', '2003-04-05',0),
('00002', '7b37e7cbf6e9c4acf8bf72e1fcc992b85efd3ac42e7f680122d8ab1aa3ddd276', 'ln.thao@gmail.com', '0482947567', 'Le Ngoc Thao', '215 Lý Thường Kiệt, TP Biên Hòa', '2003-10-05', 1),
('00003', 'b994d6663bf98880389ad679f7f87882e5e614e3cda0c2a0b7430202b0eed95c', 'trivo.cao@gmail.com', '0684759365', 'Vo Cao Tri', '127 Hùng Vương Q.10, TP HCM', '2003-10-13', 0),
('00004', '7dd5f45b207806358574e10962131c7a772d29db1d034e2e4d1a4fc2cc625359', 'hlcthanh1510@gmail.com', '0694739539', 'Hoang Le Cat Thanh', '22/11 Lý Thường Kiệt, TP Mỹ Tho', '2003-10-14', 0),
('00005', '7b3d226609dd4cb6a1bd594d8bc57ed5cb479f9599f63bfcbffa0b5dd3b82e75', 'dtynhi1210@gmail.com', '0667294653', 'Doan Thi Yen Nhi', '576 Đoàn Văn Bơ Q.5, TP HCM', '2003-10-12', 1);

INSERT INTO carowner (carOwnerID)
VALUES
('00002'),
('00005');

INSERT INTO car (CarID, carCompany, model, seats, transmission, fuelType, yearRelease, price, carStatus, carownerID)
VALUES
('00001', 'BAIC', 'BAIC BEIJING X7 2022', 5, 'automatic transmission', 'Petrol', 2022, 1370000, 1, '00005'),
('00002', 'BMW', 'BMW 320i 2018', 5, 'automatic transmission', 'Petrol', 2018, 1495000, 1, '00005'),
('00003', 'BMW', 'BMW 430i GRAN COUPE', 5, 'automatic transmission', 'Petrol', 2021, 2680000, 1, '00005'),
('00004', 'VINFAST', 'VINFAST LUV SA 2.0', 7, 'automatic transmission', 'Petrol', 2021, 1346000, 0, '00005'),
('00005', 'VINFAST', 'VINFAST VF E34', 5, 'automatic transmission', 'Electric', 2022, 711000, 1, '00005'),
('00006', 'MERCEDES', 'MERCEDES C200', 5, 'automatic transmission', 'Petrol', 2021, 2010000, 1, '00002'),
('00007', 'MERCEDES', 'MERCEDES C200 EXCLUSIVE', 5, 'automatic transmission', 'Petrol', 2021, 2246000, 1, '00002'),
('00008', 'VINFAST', 'VINFAST FADIL', 5, 'automatic transmission', 'Petrol', 2021, 746000, 1, '00002'),
('00009', 'MERCEDES', 'MERCEDES C300', 4, 'automatic transmission', 'Petrol', 2018, 2021000, 1, '00002'),
('00010', 'MERCEDES', 'MERCEDES C300 AMG', 5, 'automatic transmission', 'Petrol', 2018, 2469000, 1, '00005'),
('00011', 'MAZDA', 'MAZDA CX30', 5, 'automatic transmission', 'Petrol', 2023, 1459000, 1, '00002'),
('00012', 'MAZDA', 'MAZDA CX5 DELUXE', 5, 'automatic transmission', 'Petrol', 2021, 1370000, 1, '00002'),
('00013', 'VINFAST', 'VINFAST VF8 ECO', 5, 'automatic transmission', 'Electric', 2022, 1459000, 1, '00002'),
('00014', 'FORD', 'FORD RANGER WILDTRAK 4x4', 5, 'automatic transmission', 'Diesel', 2020, 1233000, 1, '00005'),
('00015', 'FORD', 'FORD RANGER XLS 4x2', 5, 'automatic transmission', 'Diesel', 2021, 1196000, 1, '00005');

INSERT INTO Discount (discountID, discountCode, discountPercent, expirationDate, discountDescription)
VALUES
('00001', 'DISCOUNT01', 10.5, '2023-01-31', '10.5% off on selected items'),
('00002', 'SALE2023', 15.0, '2023-02-28', '15% off for the February sale'),
('00003', 'NEWUSER25', 25.5, '2023-03-15', '25.5% off for new users'),
('00004', 'SPRINGSALE', 20.0, '2023-04-30', 'Spring sale - 20% off on all items');

INSERT INTO RentalLocation (rentalLocationID, address, startHour, endHour)
VALUES
('0001', '123 Đường Lê Lai, Quận 1, TP.HCM', '08:30:00', '17:00:00'),
('0002', '456 Đường Nguyễn Văn A, Quận 2, TP.HCM', '09:00:00', '18:00:00'),
('0003', '789 Đường Trần Hưng Đạo, Quận 3, TP.HCM', '08:00:00', '16:30:00'),
('0004', '101 Đường Phan Xích Long, Quận 4, TP.HCM', '10:30:00', '19:00:00');

INSERT INTO Rental (rentalID, carID, customerID, pickupTime, returnTime,rentalPrice, rentalStatus)
VALUES
('00001', '00001', '00001', '2024-01-05 08:30:00', '2024-01-05 17:00:00', 428125, 1),
('00002', '00002', '00001', '2024-01-05 08:30:00', '2024-01-05 17:00:00', 467187,1),
('00003', '00003', '00001', '2024-01-05 08:30:00', '2024-01-05 17:00:00', 837500, 1),
('00004', '00004', '00001', '2024-01-05 09:00:00', '2024-01-05 18:00:00', 420625, 0)