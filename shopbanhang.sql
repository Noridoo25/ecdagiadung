USE [master]
GO
/****** Object:  Database [ShopBanHang]    Script Date: 27/05/2023 9:29:55 CH ******/
CREATE DATABASE [ShopBanHang]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopBanHang.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ShopBanHang_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ShopBanHang] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopBanHang] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShopBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopBanHang] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShopBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [ShopBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopBanHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopBanHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopBanHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShopBanHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShopBanHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopBanHang', N'ON'
GO
ALTER DATABASE [ShopBanHang] SET QUERY_STORE = OFF
GO
USE [ShopBanHang]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[billId] [int] IDENTITY(1,1) NOT NULL,
	[cartId] [int] NULL,
	[userFName] [nvarchar](30) NULL,
	[userLName] [nvarchar](30) NULL,
	[addr] [nvarchar](300) NULL,
	[phone] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[cartTotal] [int] NULL,
	[shipping] [int] NULL,
	[subTotal] [int] NULL,
 CONSTRAINT [PK__Bill__6D903F032AA72DFE] PRIMARY KEY CLUSTERED 
(
	[billId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[commentId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[productId] [int] NULL,
	[content] [nvarchar](500) NULL,
	[time] [nvarchar](100) NULL,
	[rating] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[commentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employeeId] [int] IDENTITY(1,1) NOT NULL,
	[employName] [nvarchar](30) NULL,
	[roles] [nvarchar](30) NULL,
	[depiction] [nvarchar](30) NULL,
	[employeeImage] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[status] [int] NULL,
	[cartId] [int] NULL,
	[totalPrice] [int] NULL,
	[date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](300) NULL,
	[depiction] [nvarchar](1000) NULL,
	[detail] [nvarchar](1000) NULL,
	[productPrice] [int] NULL,
	[categoryId] [int] NULL,
	[exclusion] [int] NULL,
	[sellerId] [int] NULL,
 CONSTRAINT [PK__Product__2D10D16A9BB5B029] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[productId] [int] NULL,
	[productImage] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductInCart]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductInCart](
	[cartId] [int] NULL,
	[productId] [int] NULL,
	[amount] [int] NULL,
	[total] [int] NULL,
	[status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[slideId] [int] IDENTITY(1,1) NOT NULL,
	[slideName] [nvarchar](30) NULL,
	[slideDescription] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[slideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SliderImage]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SliderImage](
	[slideId] [int] NOT NULL,
	[slideImage] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[slideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[storeId] [int] IDENTITY(1,1) NOT NULL,
	[storeName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[provin] [nvarchar](50) NULL,
	[ward] [nvarchar](50) NULL,
	[avartarStore] [nvarchar](200) NULL,
	[bannerStore] [nvarchar](200) NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[storeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAccount]    Script Date: 27/05/2023 9:29:56 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccount](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[pass] [nvarchar](30) NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[addr] [nvarchar](50) NULL,
	[phone] [nvarchar](20) NULL,
	[roleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (1, 1, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 420000, 20000, 400000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (2, 2, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 2115000, 20000, 2095000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (3, 3, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1122000, 20000, 1102000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (4, 4, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 566000, 20000, 546000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (5, 5, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 603000, 20000, 583000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (6, 6, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 521000, 20000, 501000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (7, 7, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1122000, 20000, 1102000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (8, 8, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 681000, 20000, 661000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (9, 9, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1054000, 20000, 1034000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (10, 10, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 1576000, 20000, 1556000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (11, 11, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 374000, 20000, 354000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (12, 12, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 682000, 20000, 662000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (13, 13, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 930000, 20000, 910000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (14, 14, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 766000, 20000, 746000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (15, 15, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 561000, 20000, 541000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (16, 16, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 508000, 20000, 488000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (17, 17, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 775000, 20000, 755000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (18, 18, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 1627000, 20000, 1607000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (19, 19, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 905000, 20000, 885000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (20, 20, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 905000, 20000, 885000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (21, 21, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 782000, 20000, 762000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (22, 22, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 696000, 20000, 676000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (23, 23, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 486600, 20000, 466600)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (24, 24, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 908000, 20000, 888000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (25, 25, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 482000, 20000, 462000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (26, 26, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 602000, 20000, 582000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (27, 27, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 1157000, 20000, 1137000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (28, 28, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 917000, 20000, 897000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (29, 29, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 1022000, 20000, 1002000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (30, 30, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 1022000, 20000, 1002000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (31, 31, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 1023000, 20000, 1003000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (32, 32, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 1022000, 20000, 1002000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (33, 33, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 1023000, 20000, 1003000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (34, 34, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 746000, 20000, 726000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (35, 35, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 831000, 20000, 811000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (36, 36, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 803000, 20000, 783000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (37, 37, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 803000, 20000, 783000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (38, 38, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 1163000, 20000, 1143000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (39, 39, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 533000, 20000, 513000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (40, 40, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 802000, 20000, 782000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (41, 41, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 1049000, 20000, 1029000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (42, 42, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 1049000, 20000, 1029000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (43, 43, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 714000, 20000, 694000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (44, 44, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 714000, 20000, 694000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (45, 45, N'My Name', N'Is Srose', N' - Quy Nhơn', N'0456789123', N'Srose@gmail.com', 832000, 20000, 812000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (46, 46, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 1359000, 20000, 1339000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (47, 47, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 766000, 20000, 746000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (48, 48, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 810000, 20000, 790000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (49, 49, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 953000, 20000, 933000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (50, 50, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 991000, 20000, 971000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (51, 51, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 681000, 20000, 661000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (52, 52, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 863000, 20000, 843000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (53, 53, N'My Name', N'Is SSunflower', N' - Bạc Liêu', N'0742513986', N'Ssunflower@gmail.com', 1133000, 20000, 1113000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (54, 54, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 1270000, 20000, 1250000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (55, 55, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 1422000, 20000, 1402000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (56, 56, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 2440000, 20000, 2420000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (57, 57, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 1400000, 20000, 1380000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (58, 58, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 1936000, 20000, 1916000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (59, 59, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 1934000, 20000, 1914000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (60, 60, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 1632000, 20000, 1612000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (61, 61, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 2088000, 20000, 2068000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (62, 62, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 2306000, 20000, 2286000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (63, 63, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 2252000, 20000, 2232000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (64, 64, N'My Name', N'Is Slavender', N' - Bình Định', N'0412358796', N'Slavender@gmail.com', 1101000, 20000, 1081000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (65, 65, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 2652000, 20000, 2632000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (66, 66, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 1640000, 20000, 1620000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (67, 67, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 1344000, 20000, 1324000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (68, 68, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 1840000, 20000, 1820000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (69, 69, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 1344000, 20000, 1324000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (70, 70, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 1824000, 20000, 1804000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (71, 71, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 1427000, 20000, 1407000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (72, 72, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 2552000, 20000, 2532000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (73, 73, N'My Name ', N'Is SLily', N' - An Giang', N'0478102301', N'Slily@gmail.com', 2024000, 20000, 2004000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (74, 74, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 4362000, 20000, 4342000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (75, 75, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 4157000, 20000, 4137000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (76, 76, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 2056000, 20000, 2036000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (77, 77, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1784000, 20000, 1764000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (78, 78, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 2896000, 20000, 2876000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (79, 79, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1792800, 20000, 1772800)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (80, 80, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 2305000, 20000, 2285000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (81, 81, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 2477200, 20000, 2457200)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (82, 82, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1970000, 20000, 1950000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (83, 83, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1630000, 20000, 1610000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (84, 84, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2294000, 20000, 2274000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (85, 85, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 1814000, 20000, 1794000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (86, 86, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2474000, 20000, 2454000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (87, 87, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2914000, 20000, 2894000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (88, 88, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2474000, 20000, 2454000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (89, 89, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2245000, 20000, 2225000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (90, 90, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 1472000, 20000, 1452000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (91, 91, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2026000, 20000, 2006000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (92, 92, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 3341000, 20000, 3321000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (93, 93, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2155000, 20000, 2135000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (94, 94, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2916000, 20000, 2896000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (95, 95, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 3048000, 20000, 3028000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (96, 96, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 1717000, 20000, 1697000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (97, 97, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 1046000, 20000, 1026000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (98, 98, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 2366000, 20000, 2346000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (99, 99, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 3107000, 20000, 3087000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (100, 100, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 3107000, 20000, 3087000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (101, 101, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 2102000, 20000, 2082000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (102, 102, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 1553000, 20000, 1533000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (103, 103, N'My Name ', N'Is LyHuong', N' - Đồng Tháp', N'0125478963', N'lyhuong@gmail.com', 3976000, 20000, 3956000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (104, 104, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 4037000, 20000, 4017000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (105, 105, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 1924000, 20000, 1904000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (106, 106, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 2252000, 20000, 2232000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (107, 107, N'My Name', N'Is TienThanh', N' - Bình Thuận', N'0456123784', N'20110567@student.hcmute.edu.vn', 2590000, 20000, 2570000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (108, 108, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 1520000, 20000, 1500000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (109, 109, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 4143000, 20000, 4123000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (110, 110, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 3893000, 20000, 3873000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (111, 111, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2064000, 20000, 2044000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (112, 112, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2806000, 20000, 2786000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (113, 113, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2281000, 20000, 2261000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (114, 114, N'Le Thi', N'Nguyen', N' - Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', N'lelinh@gmail.com', 2670200, 20000, 2650200)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (115, 115, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 2863000, 20000, 2843000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (116, 116, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 3578000, 20000, 3558000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (117, 117, N'MyFirstName', N'MyLastName', N' - Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', N'testshop@gmail.com', 1758000, 20000, 1738000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (118, 118, N'My Name', N'Is Sdaisy', N' - Long An', N'0487902102', N'Sdaisy@gmail.com', 996000, 20000, 976000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (119, 119, N'My Name', N'Is Sdaisy', N' - Long An', N'0487902102', N'Sdaisy@gmail.com', 2502000, 20000, 2482000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (120, 120, N'My Name', N'Is Sdaisy', N' - Long An', N'0487902102', N'Sdaisy@gmail.com', 2175000, 20000, 2155000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (121, 121, N'Ngô', N'Phú', N'hẻm 5/6 Lê Văn Chí Linh Trung Thủ Đức - ', N'0889607402', N'thanhphu2506@gmail.com', 478000, 20000, 458000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (122, 122, N'Ngô', N'Phú', N'hẻm 5/6 Lê Văn Chí Linh Trung Thủ Đức - ', N'0889607402', N'thanhphu2506@gmail.com', 520000, 20000, 500000)
GO
INSERT [dbo].[Bill] ([billId], [cartId], [userFName], [userLName], [addr], [phone], [email], [cartTotal], [shipping], [subTotal]) VALUES (123, 123, N'Ngô', N'Phú', N' - hẻm 5/6 Lê Văn Chí Linh Trung Thủ Đức', N'0889607402', N'thanhphu2506@gmail.com', 432000, 20000, 412000)
GO
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (1, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (2, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (3, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (4, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (5, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (6, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (7, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (8, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (9, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (10, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (11, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (12, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (13, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (14, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (15, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (16, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (17, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (18, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (19, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (20, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (21, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (22, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (23, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (24, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (25, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (26, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (27, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (28, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (29, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (30, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (31, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (32, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (33, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (34, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (35, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (36, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (37, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (38, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (39, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (40, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (41, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (42, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (43, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (44, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (45, 4)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (46, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (47, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (48, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (49, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (50, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (51, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (52, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (53, 5)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (54, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (55, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (56, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (57, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (58, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (59, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (60, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (61, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (62, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (63, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (64, 6)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (65, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (66, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (67, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (68, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (69, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (70, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (71, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (72, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (73, 7)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (74, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (75, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (76, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (77, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (78, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (79, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (80, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (81, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (82, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (83, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (84, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (85, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (86, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (87, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (88, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (89, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (90, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (91, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (92, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (93, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (94, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (95, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (96, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (97, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (98, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (99, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (100, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (101, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (102, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (103, 2)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (104, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (105, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (106, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (107, 3)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (108, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (109, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (110, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (111, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (112, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (113, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (114, 10)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (115, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (116, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (117, 9)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (118, 8)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (119, 8)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (120, 8)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (121, 11)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (122, 11)
GO
INSERT [dbo].[Cart] ([cartId], [userId]) VALUES (123, 11)
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
GO
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (1, N'Cookware Sets')
GO
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (2, N'Dutch Ovens')
GO
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (3, N'Griddles & Grill Pans')
GO
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (4, N'Frying Pans & Skillets')
GO
INSERT [dbo].[Category] ([categoryId], [categoryName]) VALUES (5, N'Saucepans & Sauciers')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (1, 9, 137, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (2, 9, 137, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (3, 8, 136, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (4, 8, 136, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (5, 7, 135, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (6, 7, 135, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (7, 6, 134, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (8, 6, 134, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (9, 5, 133, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (10, 5, 133, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (11, 4, 132, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (12, 4, 132, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (13, 3, 131, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (14, 3, 131, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (15, 2, 130, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (16, 2, 130, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (17, 2, 129, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (18, 2, 129, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (19, 3, 128, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (20, 3, 128, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (21, 4, 127, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (22, 4, 127, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (23, 5, 126, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (24, 5, 126, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (25, 6, 125, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (26, 6, 125, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (27, 7, 124, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (28, 7, 124, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (29, 8, 123, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (30, 8, 123, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (31, 9, 122, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (32, 9, 122, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (33, 9, 121, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (34, 9, 121, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (35, 8, 120, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (36, 8, 120, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (37, 7, 119, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (38, 7, 119, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (39, 6, 118, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (41, 6, 118, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (42, 5, 117, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (43, 5, 117, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (44, 4, 116, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (45, 4, 116, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (46, 3, 115, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (47, 3, 115, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (48, 2, 114, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (49, 2, 114, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (50, 2, 113, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (51, 2, 113, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (52, 3, 112, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (53, 3, 112, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (54, 4, 111, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (55, 4, 111, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (56, 5, 110, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (57, 5, 110, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (58, 6, 109, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (59, 6, 109, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (60, 7, 108, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (61, 8, 108, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (62, 9, 107, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (63, 2, 107, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (64, 3, 106, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (65, 4, 106, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (66, 5, 105, N'Good!!!Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (67, 6, 105, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (68, 7, 104, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (69, 8, 104, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (70, 9, 103, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (71, 2, 103, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (72, 3, 102, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (73, 4, 102, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (74, 5, 101, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (75, 6, 101, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (76, 7, 100, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (77, 8, 100, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (78, 9, 99, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (79, 2, 99, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (80, 3, 98, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (81, 4, 98, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (82, 5, 97, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (83, 6, 97, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (84, 7, 96, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (85, 8, 96, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (86, 9, 95, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (87, 2, 95, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (88, 3, 94, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (89, 4, 94, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (90, 5, 93, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (91, 6, 93, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (92, 7, 92, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (93, 8, 92, N'Good!!!Good!!!Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (94, 9, 91, N'Good!!!Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (95, 2, 91, N'Good!!!Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (96, 3, 90, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (97, 4, 90, N'Good!!!Good!!!Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (98, 5, 89, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (99, 6, 89, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (100, 7, 88, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (101, 8, 88, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (102, 9, 87, N'Good!!!Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (103, 2, 87, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (104, 3, 86, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (105, 5, 86, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (106, 6, 85, N'Good!!!Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (107, 4, 85, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (108, 8, 84, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (109, 9, 84, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (110, 7, 83, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (111, 2, 83, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (112, 3, 82, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (113, 5, 82, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (114, 6, 81, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (115, 5, 81, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (116, 9, 80, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (117, 8, 80, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (118, 2, 79, N'Good!!!', N'Tue 13.12.2022 at 11:40:34', 4)
GO
INSERT [dbo].[Comment] ([commentId], [userId], [productId], [content], [time], [rating]) VALUES (119, 5, 79, N'Good!!', N'Tue 13.12.2022 at 11:40:34', 5)
GO
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (1, 1, 1, 400000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (2, 1, 2, 2095000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (3, 1, 3, 1102000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (4, 1, 4, 546000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (5, 1, 5, 583000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (6, 0, 6, 501000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (7, 0, 7, 1102000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (8, 0, 8, 661000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (9, 0, 9, 1034000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (10, 1, 10, 1556000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (11, 1, 11, 354000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (12, 1, 12, 662000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (13, 1, 13, 910000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (14, 1, 14, 746000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (15, 1, 15, 541000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (16, 2, 16, 488000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (17, 0, 17, 755000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (18, 1, 18, 1607000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (19, 1, 19, 885000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (20, 1, 20, 885000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (21, 1, 21, 762000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (22, 0, 22, 676000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (23, 0, 23, 466600, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (24, 0, 24, 888000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (25, 0, 25, 462000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (26, 0, 26, 582000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (27, 1, 27, 1137000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (28, 1, 28, 897000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (29, 1, 29, 1002000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (30, 1, 30, 1002000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (31, 1, 31, 1003000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (32, 0, 32, 1002000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (33, 0, 33, 1003000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (34, 0, 34, 726000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (35, 0, 35, 811000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (36, 0, 36, 783000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (37, 0, 37, 783000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (38, 1, 38, 1143000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (39, 1, 39, 513000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (40, 1, 40, 782000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (41, 1, 41, 1029000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (42, 1, 42, 1029000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (43, 1, 43, 694000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (44, 1, 44, 694000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (45, 1, 45, 812000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (46, 1, 46, 1339000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (47, 1, 47, 746000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (48, 1, 48, 790000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (49, 1, 49, 933000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (50, 1, 50, 971000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (51, 1, 51, 661000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (52, 1, 52, 843000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (53, 1, 53, 1113000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (54, 0, 54, 1250000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (55, 0, 55, 1402000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (56, 0, 56, 2420000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (57, 0, 57, 1380000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (58, 0, 58, 1916000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (59, 0, 59, 1914000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (60, 0, 60, 1612000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (61, 0, 61, 2068000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (62, 0, 62, 2286000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (63, 0, 63, 2232000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (64, 0, 64, 1081000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (65, 0, 65, 2632000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (66, 0, 66, 1620000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (67, 0, 67, 1324000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (68, 0, 68, 1820000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (69, 0, 69, 1324000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (70, 0, 70, 1804000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (71, 0, 71, 1407000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (72, 0, 72, 2532000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (73, 0, 73, 2004000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (74, 0, 74, 4342000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (75, 0, 75, 4137000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (76, 0, 76, 2036000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (77, 0, 77, 1764000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (78, 0, 78, 2876000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (79, 0, 79, 1772800, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (80, 0, 80, 2285000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (81, 0, 81, 2457200, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (82, 0, 82, 1950000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (83, 0, 83, 1610000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (84, 0, 84, 2274000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (85, 0, 85, 1794000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (86, 0, 86, 2454000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (87, 0, 87, 2894000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (88, 0, 88, 2454000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (89, 0, 89, 2225000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (90, 0, 90, 1452000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (91, 0, 91, 2006000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (92, 0, 92, 3321000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (93, 0, 93, 2135000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (94, 0, 94, 2896000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (95, 0, 95, 3028000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (96, 0, 96, 1697000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (97, 0, 97, 1026000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (98, 0, 98, 2346000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (99, 0, 99, 3087000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (100, 0, 100, 3087000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (101, 0, 101, 2082000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (102, 0, 102, 1533000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (103, 0, 103, 3956000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (104, 0, 104, 4017000, CAST(N'2022-12-13' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (105, 0, 105, 1904000, CAST(N'2022-12-14' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (106, 0, 106, 2232000, CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (107, 0, 107, 2570000, CAST(N'2022-12-15' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (108, 0, 108, 1500000, CAST(N'2022-12-11' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (109, 0, 109, 4123000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (110, 0, 110, 3873000, CAST(N'2022-12-11' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (111, 0, 111, 2044000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (112, 0, 112, 2786000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (113, 0, 113, 2261000, CAST(N'2022-12-11' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (114, 0, 114, 2650200, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (115, 0, 115, 2843000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (116, 0, 116, 3558000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (117, 0, 117, 1738000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (118, 0, 118, 976000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (119, 0, 119, 2482000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (120, 0, 120, 2155000, CAST(N'2022-12-16' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (121, 0, 121, 458000, CAST(N'2023-03-07' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (122, 0, 122, 500000, CAST(N'2023-03-07' AS Date))
GO
INSERT [dbo].[Orders] ([orderId], [status], [cartId], [totalPrice], [date]) VALUES (123, 0, 123, 412000, CAST(N'2023-04-18' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (1, N'Crate & Barrel EvenCook ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 150000, 1, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (2, N'Nonstick Cookware Set ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 250000, 1, 1, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (3, N'All-Clad HA1 Hard-Anodized ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 350000, 1, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (4, N'Le Creuset Pro 10-Piece', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29', 450000, 1, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (5, N'All-Clad d5 Brushed', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 550000, 1, 1, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (6, N'All-Clad Essentials', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 545000, 1, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (7, N'All-Clad d3 Curated ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 123000, 1, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (8, N'GreenPan Performance ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 432000, 1, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (9, N'Cuisinart 11-Piece ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 456000, 1, 1, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (10, N'Caraway Home 7-Piece ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 741000, 1, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (11, N'All-Clad HA1 Curated ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 125000, 1, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (12, N'All-Clad d3 Stainless ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 741000, 1, 1, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (13, N'Crate & Barrel EvenCook Ceramic ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 152000, 1, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (14, N'Lagostina Martellata Hammered ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 423000, 1, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (15, N'All-Clad HA1 Hard-Anodized ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 550000, 1, 1, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (16, N'GreenPan Reserve Blush', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 164000, 1, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (17, N'Caraway Home Sage', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 742000, 1, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (18, N'Crate & Barrel EvenCook ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 256000, 1, 1, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (19, N'RFN by Ruffoni Copper ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 984000, 1, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (20, N'GreenPan Levels 11-Piece ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 125000, 1, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (21, N'Le Creuset Signature 7.25-Qt', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 745000, 2, 1, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (22, N'Le Creuset Signature 5-Qt', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 2, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (23, N'Staub 5-Qt', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 154000, 2, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (24, N'ZWILLING  J.A. Henckels ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 231000, 2, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (25, N'Staub Dark Blue 4-Piece ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 123000, 2, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (26, N'Staub 6-Qt. Metallic ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 2, 1, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (27, N'Le Creuset Classic 5-Qt.', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 321000, 2, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (28, N'Milo by Kana Cast ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 145000, 2, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (29, N'ZWILLING Motion 5-Qt', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 314000, 2, 1, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (30, N'Le Creuset Signature ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 320000, 2, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (31, N'Staub 3.75-Qt Metallic ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 145000, 2, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (32, N'Le Creuset', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 125000, 2, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (33, N'Staub 4-Quart Round ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 230000, 2, 1, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (34, N'Staub White Truffle ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 210000, 2, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (35, N'Staub 3.5-Qt Matte ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 124000, 2, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (36, N'PinkPan Gth', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 124000, 2, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (37, N'Reversible Ceramic Double Griddle', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 3, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (38, N'HA1 Hard-Anodized Non-Stick', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 423000, 3, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (39, N'Chef Collection Seasoned', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 123000, 3, 1, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (40, N'Hard-Anodized Non-Stick', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 125000, 3, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (41, N'Metallic Blue Pure Grill', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 126000, 3, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (42, N'Black Cast Iron Double Burner', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 215000, 3, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (43, N'Blue Enameled Cast Iron', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 321000, 3, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (44, N'Black Double-Handled', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 452000, 3, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (45, N'Ooni Cast Iron Skillet Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 165000, 3, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (46, N'Steel BBQ Perforated Grill Tray', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 235000, 3, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (47, N'Round Double Handle Pure Gr', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 263000, 3, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (48, N'Graphite Grey Round Pure Grill', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 450000, 3, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (49, N'Dark Blue Round Pure Grill', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 3, 1, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (50, N'Ooni Cast Iron Grizzler Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 230000, 3, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (51, N'Grenadine Red Round Pure Grill', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 158000, 3, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (52, N'Ooni Cast Iron Dual-Sided', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 125000, 3, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (53, N'Square Cast Iron Grill Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 3, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (54, N'HA1 Hard-Anodized Non-Stick', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 234000, 3, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (55, N'Ooni Cast Iron Sizzler Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 230000, 3, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (56, N'Red Portable Outdoor Gas Grill', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 150000, 3, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (57, N'Square Grill Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 410000, 3, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (58, N'Square Grill Pan Cherry', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 210000, 3, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (59, N'Signature Square 9.5', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 560000, 3, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (60, N'Round Stainless Steel', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 120000, 3, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (61, N'Grill Topper', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 140000, 3, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (62, N'Stainless Steel Saucepan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 123000, 5, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (63, N'Stainless Steel Saucepan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 125000, 5, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (64, N'EvenCook Cor 3.5', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 145000, 5, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (65, N'Glass Straining Lid', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 170000, 5, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (66, N'Everyday Pan with Lid', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 180000, 5, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (67, N'Stainless Steel 4-qt', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 210000, 5, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (68, N'Curated 2.5-Quart', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 321000, 5, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (69, N'Brushed Stainless Steel', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 126000, 5, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (70, N'Cast Iron Saucepan with Lid', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 325000, 5, 1, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (71, N'Curated 1.5-Quart ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 369000, 5, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (72, N'Ceramic Saucepan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 415000, 5, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (73, N'Brushed Stainless Steel', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 219000, 5, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (74, N'Essentials Non-Stick 4-Piece Set', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 423000, 5, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (75, N'Essentials Non-Stick 3-Piece Set', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 489000, 5, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (76, N'Curated 4-Quart Sauteuse', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 5, 1, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (77, N'Henckels Clad Xtreme', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 569000, 5, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (78, N'Toughened Non-Stick', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 129000, 5, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (79, N'Set of 2', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 235000, 5, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (80, N'Calphalon', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 487000, 5, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (81, N'Stick Saucier Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 356000, 5, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (82, N'Cast Iron Sauce Pot', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 254000, 5, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (83, N'Midnight Blue 3-Qt', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 128000, 5, 1, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (84, N'Tomato Cocotte Grenadine', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 321000, 5, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (85, N'RFN by Ruffoni', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 15600, 5, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (86, N'Caraway Home Grey ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 124000, 5, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (87, N'Padova Light Blue', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 451000, 5, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (88, N'Viking Stainless Steel', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 237000, 1, 1, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (89, N'CTX 10-Piece Cookware Set', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 269000, 1, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (90, N'Signature 10-Piece', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 1, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (91, N'Venice Pro Stainless Steel ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 216000, 1, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (92, N'11-Piece Ceramic', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 219000, 1, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (93, N'7-Piece Navy Blue', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 257000, 1, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (94, N' Home 7-Piece', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 263000, 1, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (95, N'Copper Core 10-Piece ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 142000, 1, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (96, N'Non-Stick Cookware Set', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 251000, 1, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (97, N'Set of Two', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 278000, 1, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (98, N'Stainless 14-Piece ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 230000, 1, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (99, N'Dark Blue Coq Au Vin', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 254000, 2, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (100, N'Quart Sage Braiser', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 145000, 2, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (101, N'Matte Black Perfect Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 423000, 2, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (102, N'Quart Sage Braiser', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 156000, 2, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (103, N'Carribean Blue Enameled ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 169000, 2, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (104, N'Grey Enameled Cast Iron', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 412000, 2, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (105, N'Cerise Red Enameled Cast Iron', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 264000, 2, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (106, N'Quart Sage Braiser', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 278000, 2, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (107, N'Graphite Grey 4-Piece', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 298000, 2, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (108, N'4-Piece Stackable', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 165000, 2, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (109, N'Pan with Lid', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 145000, 2, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (110, N'Cast Iron Cookware Mini', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 265000, 2, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (111, N'White Cocotte with Glass', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 142000, 2, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (112, N'Fry Pan with Lid', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 238000, 4, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (113, N'Barrel EvenCook Ceramic', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 245000, 4, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (114, N'Non-Stick Fry Pan Set', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 268000, 4, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (115, N'Fry Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 145000, 4, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (116, N'Grey Ceramic Nonstick ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 165000, 4, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (117, N'Stainless Steel Fry Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 178000, 4, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (118, N'Ceramic Non-Stick', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 198000, 4, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (119, N'Hard-Anodized Non-Stick ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 125000, 4, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (120, N'Curated Hard-Anodized ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 168000, 4, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (121, N'Stainless Steel ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 235000, 4, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (122, N'Matte Black Traditional Skillet', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 268000, 4, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (123, N'Henckels Clad Xtreme ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 279000, 4, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (124, N'Chambray Blue Enameled ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 285000, 4, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (125, N'Fry Pan with Lid', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 264000, 4, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (126, N'Barrel EvenCook Core', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 354000, 4, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (127, N'Blue Enameled Cast ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 365000, 4, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (128, N'Performance Pro Midnight ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 354000, 4, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (129, N'Curated Non-Stick ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 124000, 4, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (130, N'EvenCook Ceramic', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 425000, 4, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (131, N'Stainless Steel Fry Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 521000, 4, NULL, 2)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (132, N'Crate Barrel EvenCook ', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 267000, 4, NULL, 3)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (133, N'Ceramic Non-Stick Fry Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 289000, 4, NULL, 4)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (134, N'Anodized Frying Pans', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 236000, 4, NULL, 5)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (135, N'Matte Black Daily Pan', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 458000, 4, NULL, 6)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (136, N'Traditional Skillet', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 265000, 4, NULL, 7)
GO
INSERT [dbo].[Product] ([productId], [productName], [depiction], [detail], [productPrice], [categoryId], [exclusion], [sellerId]) VALUES (137, N'Ceramic Fry Pans', N'You''ll be smitten with this beautifully designed cookware set that''s as amazing to look at as it is to use. Featuring a minimalist design with glam gold-finished handles and glossy, bright blue exteriors, these pans are a joy to cook with. Coated with a non-stick ceramic finish, Caraway''s cookware is free of Teflon, PTFE, PFOA and heavy metals.', N'Caraway Home Sapphire 7-Piece Ceramic Non-Stick Cookware Set with Gold Hardware. 29"Wx18"Dx15"H Stainless steel with aluminum core Non-stick ceramic coating is free of heavy metals, PTFE, PFOA and other PFAs Stainless steel handles 4 magnetic pan racks for storage, 2 cork trivets with ribbon, 1 fabric lid holder.', 423000, 4, NULL, 7)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (1, N'3.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (1, N'2.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (1, N'4.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (2, N'5.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (2, N'6.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (2, N'7.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (3, N'10.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (3, N'12.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (4, N'13.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (6, N'21.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (7, N'25.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (7, N'26.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (7, N'28.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (52, N'63.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (37, N'1.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (37, N'2.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (37, N'3.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (2, N'8.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (5, N'19.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (37, N'4.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (38, N'5.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (38, N'6.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (38, N'7.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (38, N'8.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (39, N'9.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (39, N'10.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (39, N'11.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (39, N'12.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (40, N'13.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (40, N'14.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (40, N'15.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (40, N'16.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (41, N'17.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (41, N'18.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (41, N'19.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (41, N'20.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (42, N'21.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (42, N'22.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (42, N'23.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (42, N'24.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (43, N'25.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (43, N'26.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (43, N'27.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (43, N'28.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (44, N'29.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (44, N'30.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (44, N'31.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (44, N'32.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (45, N'33.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (45, N'34.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (45, N'35.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (45, N'36.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (46, N'37.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (46, N'38.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (46, N'39.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (46, N'40.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (47, N'41.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (47, N'42.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (47, N'43.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (47, N'44.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (48, N'45.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (48, N'46.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (48, N'47.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (48, N'48.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (49, N'49.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (49, N'50.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (49, N'51.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (49, N'52.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (50, N'53.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (50, N'54.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (50, N'56.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (50, N'57.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (51, N'58.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (51, N'59.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (51, N'60.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (51, N'61.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (52, N'62.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (52, N'64.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (52, N'65.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (53, N'66.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (53, N'67.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (53, N'68.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (53, N'69.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (54, N'70.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (54, N'71.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (54, N'72.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (54, N'73.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (55, N'74.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (55, N'75.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (55, N'76.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (55, N'77.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (56, N'78.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (56, N'79.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (56, N'80.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (56, N'81.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (57, N'82.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (57, N'83.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (57, N'84.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (57, N'85.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (58, N'86.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (58, N'87.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (58, N'88.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (58, N'89.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (59, N'90.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (59, N'91.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (59, N'92.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (59, N'93.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (60, N'94.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (60, N'95.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (60, N'96.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (61, N'97.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (61, N'98.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (61, N'99.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (61, N'100.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (62, N'1.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (62, N'2.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (62, N'3.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (62, N'4.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (63, N'5.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (63, N'6.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (63, N'7.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (63, N'8.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (64, N'9.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (64, N'10.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (64, N'11.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (64, N'12.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (65, N'13.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (65, N'14.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (65, N'15.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (65, N'16.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (66, N'17.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (66, N'18.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (66, N'19.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (66, N'20.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (67, N'21.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (67, N'22.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (67, N'23.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (67, N'24.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (68, N'25.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (68, N'26.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (68, N'27.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (68, N'28.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (69, N'29.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (69, N'30.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (69, N'31.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (69, N'32.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (70, N'33.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (70, N'34.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (70, N'35.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (70, N'36.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (71, N'37.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (71, N'38.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (71, N'39.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (71, N'40.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (72, N'41.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (72, N'42.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (72, N'43.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (72, N'44.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (73, N'45.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (73, N'46.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (73, N'47.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (73, N'48.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (74, N'49.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (74, N'50.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (74, N'51.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (74, N'52.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (75, N'53.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (75, N'54.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (75, N'55.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (75, N'56.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (76, N'57.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (76, N'58.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (76, N'59.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (76, N'60.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (77, N'61.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (77, N'62.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (77, N'63.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (77, N'64.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (78, N'65.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (78, N'66.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (78, N'67.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (78, N'68.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (79, N'69.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (79, N'70.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (79, N'71.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (79, N'72.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (80, N'73.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (80, N'74.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (80, N'75.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (80, N'76.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (81, N'77.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (81, N'78.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (81, N'79.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (81, N'80.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (82, N'81.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (82, N'82.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (82, N'83.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (82, N'84.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (83, N'85.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (83, N'86.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (83, N'87.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (83, N'88.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (84, N'89.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (84, N'90.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (84, N'91.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (84, N'92.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (85, N'93.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (85, N'94.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (85, N'95.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (85, N'96.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (86, N'97.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (86, N'98.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (86, N'99.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (86, N'100.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (88, N'80.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (88, N'81.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (88, N'82.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (88, N'83.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (89, N'84.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (89, N'85.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (89, N'86.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (89, N'87.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (90, N'88.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (90, N'89.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (90, N'90.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (90, N'91.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (91, N'92.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (91, N'93.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (91, N'94.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (91, N'95.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (92, N'96.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (92, N'97.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (92, N'98.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (92, N'99.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (93, N'100.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (93, N'101.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (93, N'102.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (93, N'103.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (94, N'104.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (94, N'105.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (94, N'106.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (94, N'107.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (95, N'108.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (95, N'109.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (95, N'110.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (95, N'111.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (96, N'112.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (96, N'113.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (96, N'114.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (96, N'115.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (97, N'116.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (97, N'117.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (97, N'118.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (97, N'119.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (98, N'120.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (98, N'121.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (98, N'122.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (98, N'123.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (99, N'65.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (99, N'66.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (99, N'67.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (99, N'68.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (100, N'69.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (100, N'70.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (100, N'71.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (100, N'72.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (3, N'9.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (3, N'11.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (5, N'18.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (5, N'20.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (5, N'17.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (6, N'22.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (6, N'23.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (6, N'24.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (7, N'27.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (8, N'29.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (8, N'30.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (8, N'31.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (9, N'32.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (9, N'33.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (9, N'34.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (9, N'35.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (10, N'36.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (10, N'37.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (10, N'38.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (10, N'39.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (11, N'41.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (11, N'42.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (11, N'43.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (11, N'44.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (12, N'45.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (12, N'46.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (12, N'47.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (12, N'48.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (13, N'49.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (13, N'50.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (13, N'51.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (13, N'52.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (14, N'53.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (14, N'54.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (14, N'55.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (14, N'56.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (15, N'57.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (15, N'58.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (15, N'59.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (15, N'60.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (16, N'61.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (16, N'62.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (16, N'63.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (16, N'64.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (17, N'65.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (17, N'66.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (17, N'67.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (17, N'68.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (18, N'69.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (18, N'70.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (18, N'71.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (18, N'72.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (19, N'73.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (19, N'74.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (19, N'75.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (19, N'76.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (20, N'77.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (20, N'78.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (20, N'79.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (21, N'1.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (21, N'2.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (21, N'3.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (21, N'4.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (22, N'5.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (22, N'6.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (22, N'7.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (22, N'8.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (23, N'9.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (23, N'10.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (23, N'11.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (23, N'12.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (24, N'13.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (24, N'14.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (24, N'15.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (24, N'16.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (25, N'17.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (25, N'18.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (25, N'19.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (25, N'20.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (26, N'21.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (26, N'22.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (26, N'23.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (26, N'24.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (27, N'25.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (27, N'26.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (27, N'27.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (27, N'28.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (28, N'29.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (28, N'30.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (28, N'31.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (28, N'32.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (29, N'33.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (29, N'34.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (29, N'35.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (29, N'36.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (30, N'37.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (30, N'38.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (30, N'39.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (30, N'40.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (31, N'41.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (31, N'42.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (31, N'43.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (31, N'44.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (32, N'45.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (32, N'46.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (32, N'47.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (32, N'48.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (33, N'49.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (33, N'50.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (33, N'51.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (33, N'52.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (34, N'53.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (34, N'54.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (34, N'56.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (34, N'57.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (35, N'58.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (35, N'59.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (35, N'60.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (35, N'61.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (36, N'62.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (36, N'63.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (36, N'64.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (101, N'73.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (101, N'74.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (101, N'75.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (101, N'76.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (102, N'77.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (102, N'78.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (102, N'79.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (102, N'80.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (103, N'81.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (103, N'82.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (103, N'83.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (103, N'84.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (104, N'85.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (104, N'86.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (104, N'87.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (104, N'88.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (105, N'89.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (105, N'90.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (105, N'91.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (105, N'92.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (106, N'93.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (106, N'94.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (106, N'95.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (106, N'96.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (107, N'97.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (107, N'98.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (107, N'99.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (107, N'100.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (108, N'101.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (108, N'102.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (108, N'103.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (108, N'104.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (109, N'105.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (109, N'106.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (109, N'107.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (109, N'108.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (110, N'109.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (110, N'110.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (110, N'111.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (110, N'112.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (111, N'113.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (111, N'114.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (111, N'115.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (111, N'116.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (112, N'1.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (112, N'2.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (112, N'3.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (112, N'4.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (113, N'5.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (113, N'6.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (113, N'7.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (113, N'8.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (114, N'9.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (114, N'10.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (114, N'11.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (114, N'12.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (115, N'13.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (115, N'14.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (115, N'15.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (115, N'16.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (116, N'17.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (116, N'18.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (116, N'19.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (116, N'20.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (117, N'21.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (117, N'22.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (117, N'23.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (117, N'24.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (118, N'25.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (118, N'26.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (118, N'27.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (118, N'28.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (119, N'29.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (119, N'30.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (119, N'31.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (119, N'32.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (120, N'33.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (120, N'34.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (120, N'35.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (120, N'36.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (121, N'37.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (121, N'38.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (121, N'39.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (121, N'40.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (122, N'41.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (122, N'42.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (122, N'43.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (122, N'44.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (123, N'45.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (123, N'46.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (123, N'47.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (123, N'48.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (124, N'49.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (124, N'50.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (124, N'51.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (124, N'52.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (125, N'53.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (125, N'54.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (125, N'55.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (125, N'56.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (126, N'57.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (126, N'58.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (126, N'59.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (126, N'60.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (127, N'61.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (127, N'62.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (127, N'63.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (127, N'64.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (128, N'65.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (128, N'66.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (128, N'67.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (128, N'68.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (129, N'69.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (129, N'70.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (129, N'71.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (129, N'72.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (130, N'73.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (130, N'74.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (130, N'75.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (130, N'76.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (131, N'77.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (131, N'78.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (131, N'79.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (131, N'80.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (132, N'81.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (132, N'82.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (132, N'83.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (132, N'84.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (133, N'85.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (133, N'86.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (133, N'87.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (133, N'88.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (134, N'89.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (134, N'90.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (134, N'91.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (134, N'92.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (135, N'93.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (135, N'94.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (135, N'95.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (135, N'96.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (136, N'97.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (136, N'98.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (136, N'99.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (136, N'100.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (137, N'101.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (137, N'102.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (137, N'103.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (137, N'104.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (87, N'101.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (87, N'102.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (87, N'103.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (87, N'104.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (4, N'14.jpg')
GO
INSERT [dbo].[ProductImage] ([productId], [productImage]) VALUES (4, N'15.jpg')
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (1, 1, 1, 150000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (1, 2, 1, 250000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (2, 3, 1, 350000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (2, 4, 1, 450000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (2, 5, 1, 550000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (3, 22, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (3, 37, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (4, 38, 1, 423000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (5, 58, 1, 210000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (5, 63, 1, 125000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (6, 64, 1, 145000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (7, 88, 1, 237000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (7, 100, 1, 145000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (8, 112, 1, 238000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (9, 114, 1, 268000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (10, 6, 1, 545000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (10, 8, 1, 432000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (11, 25, 1, 123000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (12, 41, 1, 126000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (12, 43, 1, 321000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (13, 65, 1, 170000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (14, 67, 1, 210000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (14, 86, 1, 124000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (14, 90, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (15, 102, 1, 156000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (15, 103, 1, 169000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (16, 115, 1, 145000, 2)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (16, 116, 1, 165000, 2)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (17, 116, 1, 165000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (18, 10, 1, 741000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (18, 12, 1, 741000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (19, 27, 1, 321000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (21, 28, 1, 145000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (21, 44, 1, 452000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (22, 68, 1, 321000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (23, 70, 1, 325000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (24, 93, 1, 257000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (27, 14, 1, 423000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (27, 16, 1, 164000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (28, 47, 1, 263000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (29, 49, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (30, 61, 1, 140000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (31, 72, 1, 415000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (32, 48, 1, 450000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (32, 61, 1, 140000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (33, 71, 1, 369000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (33, 73, 1, 219000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (34, 94, 1, 263000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (35, 106, 1, 278000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (35, 121, 1, 235000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (36, 122, 1, 268000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (36, 134, 1, 236000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (37, 122, 1, 268000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (37, 123, 1, 279000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (38, 17, 1, 742000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (38, 18, 1, 256000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (39, 32, 1, 125000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (40, 52, 1, 125000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (40, 54, 1, 234000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (41, 75, 1, 489000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (42, 76, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (42, 83, 1, 128000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (43, 108, 1, 165000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (44, 124, 1, 285000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (45, 135, 1, 458000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (46, 20, 1, 125000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (47, 34, 1, 210000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (48, 57, 1, 410000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (49, 77, 1, 569000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (49, 79, 1, 235000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (50, 80, 1, 487000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (50, 98, 1, 230000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (51, 110, 1, 265000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (52, 128, 1, 354000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (53, 130, 1, 425000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (54, 2, 1, 250000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (54, 3, 2, 700000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (55, 38, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (56, 4, 2, 900000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (57, 22, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (58, 37, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (58, 38, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (59, 87, 2, 902000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (59, 88, 2, 474000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (60, 100, 2, 290000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (61, 114, 2, 536000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (63, 5, 2, 1100000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (63, 23, 2, 308000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (64, 62, 2, 246000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (64, 63, 1, 125000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (65, 6, 2, 1090000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (66, 24, 2, 462000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (67, 42, 2, 430000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (67, 43, 2, 642000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (68, 66, 2, 360000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (69, 41, 2, 252000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (70, 67, 2, 420000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (70, 102, 2, 312000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (71, 102, 3, 468000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (71, 103, 3, 507000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (72, 116, 3, 495000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (73, 7, 2, 246000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (73, 24, 2, 462000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (74, 10, 2, 1482000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (74, 26, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (75, 27, 3, 963000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (75, 26, 3, 1236000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (76, 13, 2, 304000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (76, 12, 2, 1482000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (77, 28, 2, 290000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (77, 45, 2, 330000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (78, 46, 2, 470000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (78, 44, 2, 904000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (78, 28, 2, 290000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (79, 69, 2, 252000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (79, 104, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (80, 92, 2, 438000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (80, 93, 3, 771000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (80, 104, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (81, 92, 2, 438000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (81, 104, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (81, 70, 2, 650000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (82, 118, 3, 594000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (82, 133, 2, 578000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (83, 120, 3, 504000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (83, 105, 2, 528000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (84, 14, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (84, 15, 2, 1100000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (86, 61, 2, 280000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (87, 30, 2, 640000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (87, 47, 2, 526000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (88, 49, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (89, 71, 2, 738000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (89, 73, 3, 657000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (90, 94, 2, 526000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (90, 95, 2, 284000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (91, 71, 2, 738000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (92, 71, 2, 738000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (93, 106, 3, 834000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (93, 121, 3, 705000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (94, 123, 4, 1116000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (95, 18, 2, 512000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (96, 32, 3, 375000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (96, 51, 4, 632000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (97, 51, 2, 316000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (98, 54, 3, 702000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (98, 74, 3, 1269000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (99, 83, 3, 384000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (100, 75, 3, 1467000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (101, 97, 3, 834000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (102, 124, 2, 570000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (103, 126, 6, 2124000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (103, 135, 4, 1832000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (104, 33, 3, 690000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (105, 53, 3, 1236000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (106, 79, 3, 705000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (107, 128, 3, 1062000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (107, 129, 2, 248000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (108, 1, 2, 300000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (108, 2, 2, 500000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (109, 5, 2, 1100000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (109, 21, 2, 1490000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (109, 40, 2, 250000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (109, 62, 1, 123000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (110, 89, 2, 538000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (110, 100, 3, 435000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (110, 131, 2, 1042000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (111, 6, 2, 1090000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (111, 24, 2, 462000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (112, 10, 2, 1482000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (112, 27, 2, 642000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (113, 28, 1, 145000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (113, 68, 2, 642000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (114, 70, 2, 650000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (114, 92, 1, 219000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (114, 93, 2, 514000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (115, 14, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (115, 47, 2, 526000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (115, 121, 1, 235000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (116, 97, 2, 556000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (116, 124, 2, 570000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (117, 82, 2, 508000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (117, 80, 1, 487000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (117, 98, 1, 230000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (118, 116, 2, 330000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (119, 126, 2, 708000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (119, 125, 2, 528000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (120, 136, 2, 530000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (120, 130, 1, 425000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (120, 128, 1, 354000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (2, 21, 1, 745000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (4, 39, 1, 123000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (5, 62, 1, 123000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (7, 89, 1, 269000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (10, 9, 1, 456000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (12, 42, 1, 215000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (13, 59, 1, 560000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (13, 66, 1, 180000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (15, 91, 1, 216000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (16, 117, 1, 178000, 2)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (17, 132, 1, 267000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (20, 13, 1, 152000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (20, 26, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (23, 85, 1, 15600, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (24, 92, 1, 219000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (24, 104, 1, 412000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (25, 105, 1, 264000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (26, 119, 1, 125000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (26, 120, 1, 168000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (28, 29, 1, 314000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (29, 61, 1, 140000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (30, 48, 1, 450000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (31, 73, 1, 219000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (32, 49, 1, 412000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (35, 107, 1, 298000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (36, 123, 1, 279000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (39, 50, 1, 230000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (43, 96, 1, 251000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (44, 109, 1, 145000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (47, 35, 1, 124000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (48, 55, 1, 230000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (50, 82, 1, 254000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (51, 99, 1, 254000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (51, 111, 1, 142000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (52, 129, 1, 124000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (53, 137, 1, 423000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (55, 23, 2, 308000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (56, 5, 2, 1100000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (56, 58, 2, 420000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (57, 36, 2, 248000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (58, 39, 2, 246000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (60, 101, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (62, 101, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (62, 89, 2, 538000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (63, 22, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (65, 7, 2, 246000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (66, 25, 2, 246000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (68, 59, 2, 1120000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (71, 91, 2, 432000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (72, 115, 3, 435000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (72, 117, 3, 534000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (74, 11, 2, 250000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (78, 45, 2, 330000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (79, 85, 3, 46800, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (83, 133, 2, 578000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (84, 16, 2, 328000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (85, 30, 2, 640000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (87, 29, 2, 628000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (88, 48, 3, 1350000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (92, 48, 2, 900000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (92, 72, 3, 1245000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (98, 52, 3, 375000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (99, 76, 3, 1236000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (101, 96, 3, 753000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (101, 108, 3, 495000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (102, 125, 2, 528000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (104, 19, 3, 2952000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (105, 34, 2, 420000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (108, 3, 2, 700000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (109, 4, 1, 450000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (110, 112, 2, 476000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (113, 44, 2, 904000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (3, 23, 1, 154000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (3, 36, 1, 124000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (5, 40, 1, 125000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (6, 81, 1, 356000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (7, 87, 1, 451000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (9, 131, 1, 521000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (10, 7, 1, 123000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (11, 24, 1, 231000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (17, 115, 1, 145000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (17, 117, 1, 178000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (19, 26, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (20, 27, 1, 321000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (21, 45, 1, 165000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (22, 46, 1, 235000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (22, 60, 1, 120000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (23, 69, 1, 126000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (27, 15, 1, 550000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (29, 48, 1, 450000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (30, 49, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (31, 71, 1, 369000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (33, 72, 1, 415000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (34, 95, 1, 142000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (38, 31, 1, 145000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (41, 83, 1, 128000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (44, 125, 1, 264000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (46, 19, 1, 984000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (46, 33, 1, 230000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (49, 78, 1, 129000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (52, 127, 1, 365000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (53, 136, 1, 265000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (54, 1, 2, 300000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (55, 36, 2, 248000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (57, 23, 2, 308000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (59, 89, 2, 538000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (61, 113, 2, 490000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (62, 87, 2, 902000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (64, 58, 2, 420000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (64, 64, 2, 290000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (66, 9, 2, 912000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (67, 41, 2, 252000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (69, 43, 2, 642000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (70, 86, 2, 248000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (70, 90, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (73, 8, 3, 1296000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (74, 13, 2, 304000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (75, 13, 3, 456000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (75, 12, 2, 1482000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (77, 44, 2, 904000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (77, 60, 2, 240000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (78, 68, 2, 642000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (78, 60, 2, 240000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (79, 70, 2, 650000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (80, 69, 2, 252000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (81, 85, 2, 31200, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (82, 119, 2, 250000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (85, 29, 2, 628000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (86, 49, 2, 824000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (89, 72, 2, 830000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (90, 84, 2, 642000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (91, 73, 2, 438000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (93, 107, 2, 596000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (94, 122, 4, 1072000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (94, 134, 3, 708000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (95, 17, 3, 2226000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (95, 31, 2, 290000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (96, 50, 3, 690000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (97, 32, 2, 250000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (97, 50, 2, 460000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (99, 75, 3, 1467000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (100, 76, 3, 1236000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (100, 83, 3, 384000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (102, 109, 3, 435000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (106, 55, 3, 690000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (106, 78, 3, 387000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (107, 136, 2, 530000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (109, 58, 2, 420000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (114, 85, 2, 31200, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (115, 107, 2, 596000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (117, 35, 2, 248000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (119, 108, 2, 330000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (8, 101, 1, 423000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (9, 113, 1, 245000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (18, 11, 1, 125000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (19, 13, 1, 152000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (25, 118, 1, 198000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (26, 133, 1, 289000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (28, 30, 1, 320000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (34, 84, 1, 321000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (37, 134, 1, 236000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (39, 51, 1, 158000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (40, 74, 1, 423000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (41, 76, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (42, 75, 1, 489000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (43, 97, 1, 278000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (45, 126, 1, 354000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (47, 53, 1, 412000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (48, 56, 1, 150000, 1)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (60, 112, 2, 476000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (61, 131, 2, 1042000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (65, 8, 3, 1296000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (68, 65, 2, 340000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (69, 42, 2, 430000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (72, 132, 4, 1068000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (74, 12, 2, 1482000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (76, 11, 2, 250000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (81, 93, 2, 514000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (82, 105, 2, 528000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (85, 47, 2, 526000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (86, 48, 3, 1350000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (87, 15, 2, 1100000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (88, 61, 2, 280000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (91, 72, 2, 830000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (92, 73, 2, 438000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (104, 20, 3, 375000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (105, 35, 2, 248000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (106, 56, 3, 450000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (107, 127, 2, 730000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (111, 25, 2, 246000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (117, 110, 1, 265000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (109, 64, 2, 290000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (110, 114, 2, 536000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (111, 7, 2, 246000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (112, 26, 1, 412000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (113, 45, 2, 330000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (113, 60, 2, 240000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (114, 104, 3, 1236000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (115, 30, 2, 640000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (116, 17, 2, 1484000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (116, 51, 1, 158000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (116, 108, 2, 330000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (118, 117, 2, 356000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (119, 135, 2, 916000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (120, 137, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (110, 101, 2, 846000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (112, 11, 2, 250000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (116, 50, 2, 460000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (118, 115, 2, 290000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (121, 135, 1, 458000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (122, 2, 2, 500000, 0)
GO
INSERT [dbo].[ProductInCart] ([cartId], [productId], [amount], [total], [status]) VALUES (123, 22, 1, 412000, 0)
GO
SET IDENTITY_INSERT [dbo].[Store] ON 
GO
INSERT [dbo].[Store] ([storeId], [storeName], [email], [phone], [city], [provin], [ward], [avartarStore], [bannerStore], [userId]) VALUES (1, N'HoHuong Shop', N'hohuong@gmail.com', N'0451369874', N'Tỉnh Đồng Tháp', N'Huyện Cao Lãnh', N'Xã Tân Nghĩa', N'2.jpg', N'12.jpg', 2)
GO
INSERT [dbo].[Store] ([storeId], [storeName], [email], [phone], [city], [provin], [ward], [avartarStore], [bannerStore], [userId]) VALUES (2, N'IDOL SHOP', N'idol@gmail.com', N'0456128749', N'Tỉnh Bắc Giang', N'Huyện Lạng Giang', N'Xã Yên Mỹ', N'4.jpg', N'3.jpg', 3)
GO
INSERT [dbo].[Store] ([storeId], [storeName], [email], [phone], [city], [provin], [ward], [avartarStore], [bannerStore], [userId]) VALUES (3, N'ROSE SHOP', N'rose@gmail.com', N'0451239784', N'Tỉnh Tuyên Quang', N'Huyện Chiêm Hóa', N'Xã Kiên Đài', N'5.jpg', N'6.jpg', 4)
GO
INSERT [dbo].[Store] ([storeId], [storeName], [email], [phone], [city], [provin], [ward], [avartarStore], [bannerStore], [userId]) VALUES (4, N'SUNFLOWER SHOP', N'sunflower@gmail.com', N'0458742361', N'Tỉnh Ninh Thuận', N'Huyện Thuận Nam', N'Xã Phước Ninh', N'8.jpg', N'16.jpg', 5)
GO
INSERT [dbo].[Store] ([storeId], [storeName], [email], [phone], [city], [provin], [ward], [avartarStore], [bannerStore], [userId]) VALUES (5, N'LAVENDER SHOP', N'lavender@gmail.com', N'0125478963', N'Tỉnh Lâm Đồng', N'Huyện Bảo Lâm', N'Xã Lộc An', N'7.jpg', N'9.jpg', 6)
GO
INSERT [dbo].[Store] ([storeId], [storeName], [email], [phone], [city], [provin], [ward], [avartarStore], [bannerStore], [userId]) VALUES (6, N'LYLYSHOP', N'lyly@gmail.com', N'0125478962', N'Tỉnh Bình Thuận', N'Huyện Hàm Thuận Bắc', N'Xã Hồng Sơn', N'14.jpg', N'12.jpg', 7)
GO
SET IDENTITY_INSERT [dbo].[Store] OFF
GO
SET IDENTITY_INSERT [dbo].[UserAccount] ON 
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (1, N'admin', N'admin@gmail.com', N'12345', N'My Name', N'Is Admin', N'Đồng Tháp', N'0789415239', 1)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (2, N'lyhuong', N'lyhuong@gmail.com', N'12345', N'My Name ', N'Is LyHuong', N'Đồng Tháp', N'0125478963', 2)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (3, N'tienthanh', N'20110567@student.hcmute.edu.vn', N'12345', N'My Name', N'Is TienThanh', N'Bình Thuận', N'0456123784', 2)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (4, N'SRose', N'Srose@gmail.com', N'12345', N'My Name', N'Is Srose', N'Quy Nhơn', N'0456789123', 2)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (5, N'SSunflower', N'Ssunflower@gmail.com', N'12345', N'My Name', N'Is SSunflower', N'Bạc Liêu', N'0742513986', 2)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (6, N'SLavender', N'Slavender@gmail.com', N'12345', N'My Name', N'Is Slavender', N'Bình Định', N'0412358796', 2)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (7, N'SLily', N'Slily@gmail.com', N'12345', N'My Name ', N'Is SLily', N'An Giang', N'0478102301', 2)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (8, N'SDaisy', N'Sdaisy@gmail.com', N'12345', N'My Name', N'Is Sdaisy', N'Long An', N'0487902102', 3)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (9, N'Nguyen A', N'testshop@gmail.com', N'12345', N'MyFirstName', N'MyLastName', N'Khu phố 6, Linh Trung, Thủ Đức, TPHCM', N'0456987125', 3)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (10, N'Le Linh', N'lelinh@gmail.com', N'12345', N'Le Thi', N'Nguyen', N'Ấp 2 Xã Tân Nghĩa Cao Lãnh Đồng Tháp', N'0456712954', 3)
GO
INSERT [dbo].[UserAccount] ([userId], [userName], [email], [pass], [firstName], [lastName], [addr], [phone], [roleId]) VALUES (11, N'noridoo', N'thanhphu2506@gmail.com', N'noridoo25', N'Ngô', N'Phú', N'hẻm 5/6 Lê Văn Chí Linh Trung Thủ Đức', N'0889607402', 3)
GO
SET IDENTITY_INSERT [dbo].[UserAccount] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK__Bill__cartId__3A81B327] FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK__Bill__cartId__3A81B327]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserAccount] ([userId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK__Comment__product__276EDEB3] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK__Comment__product__276EDEB3]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserAccount] ([userId])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK__Product__categor__3C69FB99] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK__Product__categor__3C69FB99]
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK__ProductIm__produ__2B3F6F97] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK__ProductIm__produ__2B3F6F97]
GO
ALTER TABLE [dbo].[ProductInCart]  WITH CHECK ADD FOREIGN KEY([cartId])
REFERENCES [dbo].[Cart] ([cartId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ProductInCart]  WITH CHECK ADD  CONSTRAINT [FK__ProductIn__produ__3F466844] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[ProductInCart] CHECK CONSTRAINT [FK__ProductIn__produ__3F466844]
GO
ALTER TABLE [dbo].[SliderImage]  WITH CHECK ADD FOREIGN KEY([slideId])
REFERENCES [dbo].[Slider] ([slideId])
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[UserAccount] ([userId])
ON UPDATE CASCADE
ON DELETE SET NULL
GO
USE [master]
GO
ALTER DATABASE [ShopBanHang] SET  READ_WRITE 
GO
