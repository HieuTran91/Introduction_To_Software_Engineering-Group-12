DROP DATABASE VIVUAPP;

CREATE DATABASE VIVUAPP;

USE VIVUAPP;

CREATE TABLE Car
(
	carID char(5),
    carCompany varchar(15),
    model nvarchar(30),
    seats int,
    transmission nvarchar(30),
    fuelType nvarchar(15),
    yearRelease int,
    price float,
    carStatus boolean,
    carOwnerID char(5),
    -- carStatus: 1 - xe có thể thuê, 0 - xe không thể thuê
    CONSTRAINT SEATS_NUMBER CHECK (seats in (4, 5, 7, 9, 16, 24)),
    
	PRIMARY KEY(carID)
);
 
 CREATE TABLE Rental
 (
	rentalID char(5),
    carID char(5) NOT NULL,
    customerID char(5) NOT NULL,
    pickupTime datetime,
    returnTime datetime,
    rentalPrice float,
    rentalStatus boolean,
    rentalLocationID char(5),
    paymentID char(5),
    -- rentalStatus: 0 - đang thuê, 1 - đã trả xe
    primary key(rentalID)
 );
 
 CREATE	TABLE Payment
 (
	paymentID char(5),
    paymentAmount int,
    paymentMethod nvarchar(15),
    paymentDate datetime,
    totalCost float,
    discountCost float,
    paymentStatus bit,
    discountID char(5),
    
    primary key(paymentID)
 );
 
 create table AccountCar
 (
	accountID char(5),
    phoneNumber char(10) NOT NULL UNIQUE,
    passwordAccount varchar(64) NOT NULL,
    fullName nvarchar(30),
    address nvarchar(40),
    email varchar(30),
    birthday date,
    isCarOwner boolean,
    
    primary key(accountID)
);

create table Evaluation
(
	evaluationID char(5),
    rating int,
	content nvarchar(200),
    carID char(5),
    accountID char(5),
    rentalId char(5),
    
    primary key(evaluationID)
);

create table CarOwner 
(
	carOwnerID char(5),
    
    primary key(carOwnerID)
);

create table RentalLocation
(
	rentalLocationID char(5),
    address nvarchar(40),
    startHour time,
	endHour time,
    
    primary key(rentalLocationID)
);

create table Discount
(
	discountID char(5),
    discountCode varchar(15)  NOT NULL,
    discountPercent float  NOT NULL,
    expirationDate date  NOT NULL,
    discountDescription nvarchar(50),
	
    primary key(discountID)
);

alter table car
add foreign key(carOwnerID) references carowner(carOwnerID);
 
alter table Rental
add foreign key(customerID) references AccountCar(accountID),
add foreign key(rentalLocationID) references RentalLocation(rentalLocationID),
add foreign key(paymentID) references Payment(paymentID),
add foreign key(carID) references Car(carID);

alter table payment
add foreign key(discountID) references discount(discountID);

alter table evaluation
add foreign key(accountID) references AccountCar(accountID),
add foreign key(rentalId) references Rental(rentalId),
add foreign key(carID) references Car(carID);

alter table carowner
add foreign key(carOwnerID) references AccountCar(accountID);