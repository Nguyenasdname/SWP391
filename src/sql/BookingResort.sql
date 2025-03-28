USE [master]
GO
/****** Object:  Database [BookingResort]    Script Date: 03/03/25 10:07:50 PM ******/
CREATE DATABASE [BookingResort]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookingResort', FILENAME = N'D:\Tai lieu hoc tap\CN3\DBI202\MySQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookingResort.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookingResort_log', FILENAME = N'D:\Tai lieu hoc tap\CN3\DBI202\MySQL\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookingResort_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookingResort] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookingResort].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookingResort] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookingResort] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookingResort] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookingResort] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookingResort] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookingResort] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookingResort] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookingResort] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookingResort] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookingResort] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookingResort] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookingResort] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookingResort] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookingResort] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookingResort] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookingResort] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookingResort] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookingResort] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookingResort] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookingResort] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookingResort] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookingResort] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookingResort] SET RECOVERY FULL 
GO
ALTER DATABASE [BookingResort] SET  MULTI_USER 
GO
ALTER DATABASE [BookingResort] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookingResort] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookingResort] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookingResort] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookingResort] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookingResort] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookingResort', N'ON'
GO
ALTER DATABASE [BookingResort] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookingResort] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookingResort]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[VillaID] [int] NULL,
	[CheckIn] [datetime] NULL,
	[CheckOut] [datetime] NULL,
	[BookingStatus] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[BookingTotal] [int] NULL,
	[NumberOfGuest] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingCancel]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingCancel](
	[CancelID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[CancelReason] [nvarchar](255) NULL,
	[CancelDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CancelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingService]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingService](
	[BookingID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[Quantity] [int] NULL,
	[TotalPrice] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[VillaID] [int] NULL,
	[Rating] [int] NULL,
	[Comment] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[NotificationMessage] [nvarchar](max) NULL,
	[NotificationStatus] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[BookingID] [int] NULL,
	[PaymentAmount] [float] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[PromotionID] [int] NULL,
	[PaymentDescription] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotions]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotions](
	[PromotionID] [int] IDENTITY(1,1) NOT NULL,
	[PromotionCode] [nvarchar](10) NULL,
	[DiscountPercent] [float] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[PromotionStatus] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PromotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PromotionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NULL,
	[ServiceDescription] [nvarchar](255) NULL,
	[ServicePrice] [float] NULL,
	[CreateDate] [datetime] NULL,
	[ServiceIMG] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[UserEmail] [nvarchar](255) NULL,
	[UserPass] [nvarchar](100) NULL,
	[UserPhone] [nvarchar](20) NULL,
	[UserIMG] [nvarchar](255) NULL,
	[UserStatus] [nvarchar](50) NULL,
	[RoleID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UserAddress] [nvarchar](255) NULL,
	[UserFirstName] [nvarchar](100) NULL,
	[UserLastName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[UserEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Villas]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Villas](
	[VillaID] [int] IDENTITY(1,1) NOT NULL,
	[VillaName] [nvarchar](255) NULL,
	[VillaDescription] [nvarchar](max) NULL,
	[VillaPrice] [float] NULL,
	[VillaLocation] [nvarchar](255) NULL,
	[VillaStatus] [nvarchar](50) NULL,
	[VillaIMG] [nvarchar](255) NULL,
	[CreateDate] [datetime] NULL,
	[VillaCapacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VillaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wishlist]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wishlist](
	[UserID] [int] NULL,
	[VillaID] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[BookingCancel] ADD  DEFAULT (getdate()) FOR [CancelDate]
GO
ALTER TABLE [dbo].[Feedback] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Services] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_UserStatus]  DEFAULT ('Active') FOR [UserStatus]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Villas] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Villas] ADD  DEFAULT ((2)) FOR [VillaCapacity]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([VillaID])
REFERENCES [dbo].[Villas] ([VillaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingCancel]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingService]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingService]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[BookingService]  WITH CHECK ADD  CONSTRAINT [FK_BookingService_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingService] CHECK CONSTRAINT [FK_BookingService_Booking]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([VillaID])
REFERENCES [dbo].[Villas] ([VillaID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Promotion] FOREIGN KEY([PromotionID])
REFERENCES [dbo].[Promotions] ([PromotionID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Promotion]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wishlist]  WITH CHECK ADD FOREIGN KEY([VillaID])
REFERENCES [dbo].[Villas] ([VillaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [CK_BookingStatus] CHECK  (([BookingStatus]='Check-Out' OR [BookingStatus]='Check-In' OR [BookingStatus]='Cancelled' OR [BookingStatus]='Completed' OR [BookingStatus]='Confirmed' OR [BookingStatus]='Pending'))
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [CK_BookingStatus]
GO
ALTER TABLE [dbo].[BookingService]  WITH CHECK ADD CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[BookingService]  WITH CHECK ADD CHECK  (([TotalPrice]>=(0)))
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD CHECK  (([NotificationStatus]='Read' OR [NotificationStatus]='Unread'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([PaymentAmount]>=(0)))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([PaymentMethod]='Cash' OR [PaymentMethod]='Bank Transfer' OR [PaymentMethod]='PayPal' OR [PaymentMethod]='Credit Card'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([PaymentStatus]='Failed' OR [PaymentStatus]='Completed' OR [PaymentStatus]='Pending'))
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD CHECK  (([DiscountPercent]>=(0) AND [DiscountPercent]<=(100)))
GO
ALTER TABLE [dbo].[Promotions]  WITH CHECK ADD CHECK  (([PromotionStatus]='Expired' OR [PromotionStatus]='Active'))
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD CHECK  (([ServicePrice]>(0)))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD CHECK  (([UserStatus]='Banned' OR [UserStatus]='Inactive' OR [UserStatus]='Active'))
GO
ALTER TABLE [dbo].[Villas]  WITH CHECK ADD CHECK  (([VillaCapacity]>(0)))
GO
ALTER TABLE [dbo].[Villas]  WITH CHECK ADD CHECK  (([VillaPrice]>(0)))
GO
ALTER TABLE [dbo].[Villas]  WITH CHECK ADD CHECK  (([VillaStatus]='Under Maintenance' OR [VillaStatus]='Booked' OR [VillaStatus]='Available'))
GO
/****** Object:  StoredProcedure [dbo].[AutoDeletePendingBookings]    Script Date: 03/03/25 10:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Tạo Procedure để xóa Booking "Pending" quá 7 phút
CREATE PROCEDURE [dbo].[AutoDeletePendingBookings]
AS
BEGIN
    DELETE FROM Booking 
    WHERE BookingStatus = 'Pending' 
    AND DATEDIFF(MINUTE, CreateDate, GETDATE()) > 7;
END;
GO
USE [master]
GO
ALTER DATABASE [BookingResort] SET  READ_WRITE 
GO
