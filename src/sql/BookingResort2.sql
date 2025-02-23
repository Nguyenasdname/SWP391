INSERT INTO Users (UserName, UserEmail, UserPass, UserPhone, UserIMG, UserAddress, UserFirstName, UserLastName, UserStatus, RoleID) 
VALUES 
(N'lethanh', N'thanh@gmail.com', '123', '0912345678', NULL, N'Đà Nẵng', N'Lê', N'Thanh', 'Active', 2),
(N'nhanvien', N'nhanvien@gmail.com', '123', '0987654321', NULL, N'Hà Nội', N'Nguyễn', N'Nhân Viên', 'Active', 3);

ALTER TABLE Villas
ADD VillaCapacity INT CHECK (VillaCapacity > 0) DEFAULT 2;

Alter table Services
add ServiceIMG NVarchar(255);

INSERT INTO Villas (VillaName, VillaDescription, VillaPrice, VillaLocation, VillaStatus, VillaIMG, VillaCapacity)  
VALUES  
('Sunset Paradise', 'A luxurious villa with ocean views and a private pool.', 250.00, 'Da Nang', 'Available', 'sunset_paradise.jpg', 3),  
('Tropical Haven', 'A peaceful villa surrounded by lush greenery and a private beach.', 300.00, 'Da Nang', 'Available', 'tropical_haven.jpg', 4),  
('Mountain Escape', 'A cozy mountain retreat with a fireplace and scenic views.', 180.00, 'Da Nang', 'Available', 'mountain_escape.jpg', 4),  
('Royal Palm Villa', 'An exclusive villa with modern interiors and a tropical garden.', 270.00, 'Da Nang', 'Available', 'royal_palm.jpg', 2),  
('Golden Sands Villa', 'A beachfront villa with a spacious patio and direct access to the sea.', 320.00, 'Da Nang', 'Available', 'golden_sands.jpg', 5),  
('Azure Sky Retreat', 'A contemporary villa with a rooftop terrace and infinity pool.', 290.00, 'Da Nang', 'Available', 'azure_sky.jpg', 2),  
('Serene Bay Villa', 'A stylish villa with panoramic views of a tranquil bay.', 260.00, 'Da Nang', 'Available', 'serene_bay.jpg', 1),  
('Hidden Oasis', 'A private villa hidden in the jungle with a waterfall pool.', 310.00, 'Da Nang', 'Available', 'hidden_oasis.jpg', 4),  
('Lavender Bliss', 'A charming villa surrounded by lavender fields, perfect for relaxation.', 200.00, 'Da Nang', 'Available', 'lavender_bliss.jpg', 5),  
('Starry Night Lodge', 'A remote villa perfect for stargazing and peaceful nights.', 220.00, 'Da Nang', 'Available', 'starry_night.jpg', 5);  

update Villas 
set VillaIMG = 'https://nqs.1cdn.vn/2024/05/24/i.ex-cdn.com-chatluongvacuocsong.vn-files-content-2024-05-24-_villa-1-1506.jpg'
Where VillaID = 1

update Services 
set ServiceIMG = 'https://ladyhillsaparesort.com/wp-content/uploads/2023/11/spa-tai-lady-hill-resort-sapa.jpg'
where ServiceID = 1 

INSERT INTO Services (ServiceName, ServiceDescription, ServicePrice, ServiceIMG)
VALUES 
    ('Spa & Massage', 'Relax with our premium spa and massage services.', 50, 'spa.jpg'),
    ('Airport Pickup', 'Comfortable airport transfer to our resort.', 30, 'pickup.jpg'),
    ('Daily Breakfast', 'Enjoy a delicious breakfast every morning.', 15, 'breakfast.jpg'),
    ('Private Tour', 'Exclusive sightseeing tours with a personal guide.', 100, 'tour.jpg'),
    ('Romantic Dinner', 'Candlelight dinner setup with a special menu.', 80, 'dinner.jpg');

INSERT INTO Promotions (PromotionCode, DiscountPercent, StartDate, EndDate, PromotionStatus)
VALUES
    ('SUMMER10', 10, '2025-06-01', '2025-08-31', 'Active'),
    ('FALL15', 15, '2025-09-01', '2025-11-30', 'Active'),
    ('WELCOME20', 20, '2025-01-01', '2025-12-31', 'Active'),
    ('VIP30', 30, '2025-01-01', '2025-12-31', 'Active'),
    ('LASTMIN50', 50, '2025-12-15', '2025-12-31', 'Active');


Select * from Villas
Select * from Users
Select * from Services
Select * from Promotions
Select * from Booking
Select * from BookingService


ALTER TABLE Booking DROP CONSTRAINT FK__Booking__Promoti__4D94879B;
ALTER TABLE Booking DROP COLUMN PromotionID;
--kiểm tra lại chỗ này 


Alter table Booking
Add BookingTotal int

ALTER TABLE Payments ADD PromotionID INT
ALTER TABLE Payments 
ADD CONSTRAINT FK_Payments_Promotion 
FOREIGN KEY (PromotionID) REFERENCES Promotions(PromotionID)

Alter Table Booking Add NumberOfGuest INT;
update Booking set NumberOfGuest = 1 where BookingID = 1

ALTER TABLE Booking 
ALTER COLUMN CheckIn DATETIME;

ALTER TABLE Booking 
ALTER COLUMN CheckOut DATETIME;