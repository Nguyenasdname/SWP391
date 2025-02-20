USE [master]
GO

CREATE DATABASE BookingResort;
GO

USE BookingResort;
GO

ALTER AUTHORIZATION ON DATABASE::BookingResort TO sa;
GO

CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    RoleName NVARCHAR(255)
);

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(255),
    UserEmail NVARCHAR(255) UNIQUE,
    UserPass NVARCHAR(100),
    UserPhone NVARCHAR(20),
    UserIMG NVARCHAR(255),
	UserAddress NVARCHAR(255),
    UserFirstName NVARCHAR(100),
    UserLastName NVARCHAR(100),
    UserStatus NVARCHAR(50) CHECK (UserStatus IN ('Active', 'Inactive', 'Banned')),
    RoleID INT,
    CreateDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID) ON DELETE CASCADE
);

CREATE TABLE Villas (
    VillaID INT IDENTITY(1,1) PRIMARY KEY,
    VillaName NVARCHAR(255),
    VillaDescription NVARCHAR(MAX),
    VillaPrice FLOAT CHECK (VillaPrice > 0),
    VillaLocation NVARCHAR(255),
    VillaStatus NVARCHAR(50) CHECK (VillaStatus IN ('Available', 'Booked', 'Under Maintenance')),
    VillaIMG NVARCHAR(255),
    CreateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE Promotions (
    PromotionID INT IDENTITY(1,1) PRIMARY KEY,
    PromotionCode NVARCHAR(10) UNIQUE,
    DiscountPercent FLOAT CHECK (DiscountPercent BETWEEN 0 AND 100),
    StartDate DATE,
    EndDate DATE,
    PromotionStatus NVARCHAR(50) CHECK (PromotionStatus IN ('Active', 'Expired'))
);

CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    VillaID INT,
    CheckIn DATE,
    CheckOut DATE,
    BookingStatus NVARCHAR(50) CHECK (BookingStatus IN ('Pending', 'Confirmed', 'Cancelled', 'Completed')),
    PromotionID INT,
    CreateDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (VillaID) REFERENCES Villas(VillaID) ON DELETE CASCADE,
    FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID) ON DELETE SET NULL
);

CREATE TABLE BookingCancel (
    CancelID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT,
    CancelReason NVARCHAR(255),
    CancelDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE CASCADE
);

CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    BookingID INT,
    PaymentAmount FLOAT CHECK (PaymentAmount >= 0),
    PaymentMethod NVARCHAR(50) CHECK (PaymentMethod IN ('Credit Card', 'PayPal', 'Bank Transfer', 'Cash')),
    PaymentStatus NVARCHAR(50) CHECK (PaymentStatus IN ('Pending', 'Completed', 'Failed')),
    CreateDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) 
);

CREATE TABLE Services (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    ServiceName NVARCHAR(100),
    ServiceDescription NVARCHAR(255),
    ServicePrice FLOAT CHECK (ServicePrice > 0),
    CreateDate DATETIME DEFAULT GETDATE()
);

CREATE TABLE BookingService (
    BookingID INT,
    ServiceID INT,
    Quantity INT CHECK (Quantity > 0),
    TotalPrice FLOAT CHECK (TotalPrice >= 0),
    PRIMARY KEY (BookingID, ServiceID),
    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ,
    FOREIGN KEY (ServiceID) REFERENCES Services(ServiceID) 
);

CREATE TABLE Feedback (
    FeedbackID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    VillaID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(MAX),
    CreateDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ,
    FOREIGN KEY (VillaID) REFERENCES Villas(VillaID) 
);	

CREATE TABLE Wishlist (
    UserID INT,
    VillaID INT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (VillaID) REFERENCES Villas(VillaID) ON DELETE CASCADE
);

CREATE TABLE Notifications (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    NotificationMessage NVARCHAR(MAX),
    NotificationStatus NVARCHAR(50) CHECK (NotificationStatus IN ('Unread', 'Read')),
    CreateDate DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) 
);

Select * from Users

Insert Roles(RoleName)
Values('Admin'),('Customer'),('Employer')

Insert Users(UserName, UserEmail, UserPass, UserPhone, UserIMG, RoleID) 
Values(N'nguyen',N'nguyenkuhaku@gmail.com','123','0903210704',null, '1')

Alter Table Users 
Add Constraint DF_UserStatus Default 'Active' for UserStatus


