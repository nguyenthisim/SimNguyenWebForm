USE [master]
GO
/****** Object:  Database [DB_TikiNow]    Script Date: 12/19/2018 11:41:25 AM ******/
CREATE DATABASE [DB_TikiNow]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_TikiNow', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_TikiNow.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DB_TikiNow_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DB_TikiNow_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DB_TikiNow] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_TikiNow].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_TikiNow] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_TikiNow] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_TikiNow] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_TikiNow] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_TikiNow] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_TikiNow] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_TikiNow] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_TikiNow] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_TikiNow] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_TikiNow] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_TikiNow] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_TikiNow] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_TikiNow] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_TikiNow] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_TikiNow] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_TikiNow] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_TikiNow] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_TikiNow] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_TikiNow] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_TikiNow] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_TikiNow] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_TikiNow] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_TikiNow] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DB_TikiNow] SET  MULTI_USER 
GO
ALTER DATABASE [DB_TikiNow] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_TikiNow] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_TikiNow] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_TikiNow] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DB_TikiNow] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DB_TikiNow]
GO
/****** Object:  Table [dbo].[Hang]    Script Date: 12/19/2018 11:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[HangID] [nvarchar](500) NOT NULL,
	[HangName] [nvarchar](100) NULL,
	[SKU] [nvarchar](500) NULL,
	[HangImage] [nvarchar](500) NULL,
	[MoTa] [nvarchar](500) NULL,
	[Note] [nvarchar](500) NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](18, 0) NOT NULL,
	[LoaiHangID] [nchar](10) NULL,
	[ThuongHieuID] [nchar](10) NULL,
	[NhaCungCapID] [nchar](10) NULL,
	[CreatedDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[HangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/19/2018 11:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[KhachHangID] [int] IDENTITY(1,1) NOT NULL,
	[KhachHangName] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
	[SoDienThoai] [nchar](100) NULL,
	[DiaChi] [nvarchar](500) NULL,
	[MatKhau] [nvarchar](500) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[KhachHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiHang]    Script Date: 12/19/2018 11:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiHang](
	[LoaiHangID] [nchar](10) NOT NULL,
	[LoaiHangName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_LoaiHang] PRIMARY KEY CLUSTERED 
(
	[LoaiHangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/19/2018 11:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[NhaCungCapID] [nchar](10) NOT NULL,
	[NhaCungCapName] [nvarchar](100) NOT NULL,
	[NhaCungCapDiaChi] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[NhaCungCapID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QTAdmin]    Script Date: 12/19/2018 11:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QTAdmin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_QTAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 12/19/2018 11:41:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[ThuongHieuID] [nchar](10) NOT NULL,
	[ThuongHieuName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[ThuongHieuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H1        ', N'Gôm Viết Bấm AH23 - Hồng
', N'9308424943585
', N'~/images/products/DCHS1.jpg', N'Gôm Viết Bấm AH23 - Hồng thiết kế như một cây bút bấm rất tiện dụng cho người dùng, màu sắc và hoạ tiết sử dụng trang trí cực kì dễ thương.
Gôm êm và sạch vết bút chì nhanh chống, để lại rất ít vụn gôm.
Sản phẩm màu sắc bắt mắt và nổi bật.', N'Thiết kế thông minh

Màu sắc tao nhã

Rất êm khi dùng', 555, CAST(17000 AS Decimal(18, 0)), N'LH2       ', N'TH1       ', N'NCC1      ', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H10       ', N'Túi Đựng Bút Nobita’s Treasure Island
', N'7708179082918', N'~/images/products/DCHS10.jpg', N'Túi Đựng Bút Nobita’s Treasure Island được làm từ chất liệu nhựa cao cấp, mềm mại, dễ dàng vệ sinh. Kích thước nhỏ gọn với hình dáng chữ nhật cùng trang trí họa tiết các nhân vật hoạt hình Doraemon đáng yêu.', N'Thiết kế khóa kéo chắc chắn, trơn tru giúp bạn đóng / mở dễ dàng, thuận tiện khi sử dụng.', 1000, CAST(45000 AS Decimal(18, 0)), N'LH2       ', N'TH2       ', N'NCC2      ', CAST(N'2017-12-11' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H11', N'Bút Chì Gỗ 2B,3B,4B,5B,6B,HB 9800', N'Skkok4710KK', N'~/images/products/BV1.jpg', N'Bút Chì G? 2B,3B,4B,5B,6B,HB 9800', N'Bút Chì G? 2B,3B,4B,5B,6B,HB 9800 (Bút - Vi?t VPP)', 1000, CAST(24000 AS Decimal(18, 0)), N'LH3       ', N'TH2       ', N'NCC1      ', CAST(N'2018-02-14' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H12', N'Vỉ 5 bút dạ quang Thiên Long HL03 TL (5 màu)', N'090909091010123456', N'~/images/products/BV2.jpg', N'Bút dạ quang 5 màu', N'Bút dạ quang TL', 1000, CAST(25500 AS Decimal(18, 0)), N'LH3       ', N'TH2       ', N'NCC1      ', CAST(N'2018-12-15' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H13', N'Bút bi Xiaomi', N'101010103321', N'~/images/products/BV3.jpg', N'Bút Bi Xiaomi Mi Rollerball Pen BZL4011TY - Hàng Chính Hãng - Trắng', N'Bút Bi Xiaomi Mi Rollerball Pen BZL4011TY - Hàng Chính Hãng - Trắng', 1500, CAST(41000 AS Decimal(18, 0)), N'LH3       ', N'TH1       ', N'NCC2      ', CAST(N'2018-12-15' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H14', N'Vỉ 2 bút lông bảng Thiên Long', N'1100000110001', N'~/images/products/BV4.jpg', N'Vỉ 2 bút lông bảng Thiên Long WB03', N'Vỉ 2 bút lông bảng Thiên Long WB03', 1000, CAST(28800 AS Decimal(18, 0)), N'LH3       ', N'TH1       ', N'NCC2      ', CAST(N'2018-12-15' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H15', N'Vỉ 5 bút bi Thiên Long', N'120123234322', N'~/images/products/BV5.jpg', N'Vỉ 5 bút bi Thiên Long TL079-Xanh', N'Vỉ 5 bút bi Thiên Long TL079-Xanh', 2000, CAST(12000 AS Decimal(18, 0)), N'LH3       ', N'TH2       ', N'NCC1      ', CAST(N'2018-12-15' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H16', N'Hộp 20 bút bi Thiên Long Candee', N'13000137832t4', N'~/images/products/BV6.jpg', N'Hộp 20 bút bi TL-0918TL Candee-Xanh', N'Hộp 20 bút bi TL-0918TL Candee-Xanh', 2500, CAST(46000 AS Decimal(18, 0)), N'LH3       ', N'TH2       ', N'NCC1      ', CAST(N'2018-12-15' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H17', N'Bút chì kim bấm Pental', N'14008363567', N'~/images/products/BV7.jpg', N'Bút chì kim bấm Pental oi98989-0.5mm', N'Bút chì kim bấm Pental oi98989-0.5mm', 1400, CAST(29500 AS Decimal(18, 0)), N'LH3       ', N'TH1       ', N'NCC1      ', CAST(N'2018-12-15' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H18', N'Bút sáp dầu Thiên Long', N'14538939389', N'~/images/products/BV8.jpg', N'Bút sáp dầu TL (12 màu)', N'Bút sáp dầu TL (12 màu)', 1000, CAST(12500 AS Decimal(18, 0)), N'LH3       ', N'TH2       ', N'NCC2      ', CAST(N'2018-12-14' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H19', N'Bút dạ quang sáp vặn Bungo', N'1209375667456', N'~/images/products/BV9.jpg', N'Bút dạ quang sáp vặn Bungo', N'Bút dạ quang sáp vặn Bungo', 1500, CAST(10000 AS Decimal(18, 0)), N'LH3       ', N'TH1       ', N'NCC1      ', CAST(N'2018-12-10' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H2        ', N'Máy Tính Học Sinh Casio FX 570VN PLUS
', N'7704066118060', N'~/images/products/DCHS2.jpg', N'Máy Tính Học Sinh Casio FX 570VN PLUS (Máy tính)', N'Máy Tính Học Sinh Casio FX 570VN PLUS (Máy tính)', 1300, CAST(498000 AS Decimal(18, 0)), N'LH2       ', N'TH1       ', N'NCC1      ', CAST(N'2017-12-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H20', N'Vỉ 8 cây bút kim cương', N'110089378675', N'~/images/products/BV10.jpg', N'Vỉ 8 cây bút kim cương CS 956-8 màu', N'Vỉ 8 cây bút kim cương', 1000, CAST(25000 AS Decimal(18, 0)), N'LH3       ', N'TH2       ', N'NCC2      ', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H21', N'Giấy double A A4', N'1092878667', N'~/images/products/DCVP1.jpg', N'Giấy double A A4-NBH76', N'Giấy double A A4', 5000, CAST(75000 AS Decimal(18, 0)), N'LH1       ', N'TH1       ', N'NCC2      ', CAST(N'2018-11-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H22', N'Kệ rổ', N'2109897678', N'~/images/products/DCVP2.jpg', N'Kệ rổ', N'Kệ rổ', 1000, CAST(15000 AS Decimal(18, 0)), N'LH1       ', N'TH2       ', N'NCC1      ', CAST(N'2018-11-03' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H23', N'Xấp 10 bìa lá A4 trắng', N'2208867576456', N'~/images/products/DCVP3.jpg', N'Xấp 10 bìa lá A4 trắng', N'Xấp 10 bìa lá A4 trắng', 1000, CAST(16000 AS Decimal(18, 0)), N'LH1       ', N'TH1       ', N'NCC2      ', CAST(N'2018-11-02' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H24', N'Dụng cụ cầm phấn có từ tính', N'21998978678', N'~/images/products/DCVP4.jpg', N'Dụng cụ cầm phấn có từ tính Mungyo', N'Dụng cụ cầm phấn có từ tính Mungyo', 1200, CAST(19000 AS Decimal(18, 0)), N'LH1       ', N'TH2       ', N'NCC1      ', CAST(N'2018-11-04' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H25', N'Giấy note màu lớn', N'21998978679', N'~/images/products/DCVP5.jpg', N'Giấy note màu lớn', N'Giấy note màu lớn', 1000, CAST(20000 AS Decimal(18, 0)), N'LH1       ', N'TH2       ', N'NCC1      ', CAST(N'2018-11-04' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H26', N'Bấm không dùng kim', N'219998986790', N'~/images/products/DCVP6.jpg', N'Bấm không dùng kim Plus', N'Bấm không dùng kim Plus', 1300, CAST(82000 AS Decimal(18, 0)), N'LH1       ', N'TH1       ', N'NCC2      ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H27', N'Giấy Exel A4', N'219998986791', N'~/images/products/DCVP7.jpg', N'Giấy Exel A4', N'Giấy Exel A4', 1000, CAST(67000 AS Decimal(18, 0)), N'LH1       ', N'TH2       ', N'NCC2      ', CAST(N'2018-11-11' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H28', N'Bảng tên', N'219998986792', N'~/images/products/DCVP8.jpg', N'Bảng tên', N'Bảng tên', 1000, CAST(5000 AS Decimal(18, 0)), N'LH1       ', N'TH1       ', N'NCC1      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H29', N'Băng keo 2 mặt', N'219998986793', N'~/images/products/DCVP9.jpg', N'Băng keo 2 mặt', N'Băng keo 2 mặt', 2000, CAST(9000 AS Decimal(18, 0)), N'LH1       ', N'TH1       ', N'NCC1      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H3        ', N'Gọt Bút Chì Stabilo Exam Grade PS4518
', N'3501886034815', N'~/images/products/DCHS3.jpg', N'Gọt Bút Chì Stabilo Exam Grade PS4518

Gọt chì mini kích thước nhỏ dễ dàng mang theo và sử dụng.

Gọt chì được chia làm hai phần. Phần nắp của gọt chì màu đỏ bao lấy thân để giữ vụn chì khi gọt không vương vãi.

Gọt chì được thiết kế vừa vặn với ngón cái và ngón trỏ giúp bạn dễ dàng mở nắp đổ vụn vỏ bút chì ra ngoài.', N'Gọt Bút Chì Stabilo Exam Grade PS4518

', 1000, CAST(700000 AS Decimal(18, 0)), N'LH2       ', N'TH1       ', N'NCC1      ', CAST(N'2018-01-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H30', N'Bìa 60 lá trong', N'219998986794', N'~/images/products/DCVP10.jpg', N'Bìa 60 lá trong', N'Bìa 60 lá trong', 2700, CAST(27000 AS Decimal(18, 0)), N'LH1       ', N'TH2       ', N'NCC2      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H31', N'Sổ tay mini ANGIAART - The dream story', N'229998986794', N'~/images/products/STCL1.jpg', N'Sổ tay mini ANGIART - The dream story', N'Sổ tay mini ANGIART - The dream story', 2000, CAST(7000 AS Decimal(18, 0)), N'LH4       ', N'TH1       ', N'NCC2      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H32', N'Sổ tay mini ANGIAART - Sugar', N'229998986795', N'~/images/products/STCL2.jpg', N'Sổ tay mini ANGIAART - Sugar', N'Sổ tay mini ANGIAART - Sugar', 2000, CAST(9000 AS Decimal(18, 0)), N'LH4       ', N'TH1       ', N'NCC2      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H33', N'Sổ tay mini ANGIAART - Curiously Girl', N'229998986796', N'~/images/products/STCL3.jpg', N'Sổ tay mini ANGIAART - Curiously Girl', N'Sổ tay mini ANGIAART - Curiously Girl', 2000, CAST(7000 AS Decimal(18, 0)), N'LH4       ', N'TH2       ', N'NCC1      ', CAST(N'2018-11-20' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H34', N'Sổ tay từ vựng VPP - An Phát', N'229998986797', N'~/images/products/STCL4.jpg', N'Sổ tay từ vựng VPP - An Phát', N'Sổ tay từ vựng VPP - An Phát', 1500, CAST(16000 AS Decimal(18, 0)), N'LH4       ', N'TH2       ', N'NCC1      ', CAST(N'2018-11-20' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H35', N'Sổ tay mini ANGIAART - The Magic School', N'229998986798', N'~/images/products/STCL5.jpg', N'Sổ tay mini ANGIAART - The Magic School', N'Sổ tay mini ANGIAART - The Magic School', 2000, CAST(7000 AS Decimal(18, 0)), N'LH4       ', N'TH2       ', N'NCC2      ', CAST(N'2018-10-20' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H36', N'Sổ tay mini ANGIAART - Discovery', N'229998986799', N'~/images/products/STCL6.jpg', N'Sổ tay mini ANGIAART - Discovery', N'Sổ tay mini ANGIAART - Discovery', 2000, CAST(7000 AS Decimal(18, 0)), N'LH4       ', N'TH2       ', N'NCC1      ', CAST(N'2018-11-20' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H37', N'Sổ tay nhật ký đọc sách', N'229998986719', N'~/images/products/STCL7.jpg', N'Sổ tay nhật ký đọc sách', N'Sổ tay nhật ký đọc sách', 2900, CAST(29000 AS Decimal(18, 0)), N'LH4       ', N'TH1       ', N'NCC2      ', CAST(N'2018-10-20' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H38', N'Sổ tay mini ANGIAART - Your name Concert', N'22999898674', N'~/images/products/STCL8.jpg', N'Sổ tay mini ANGIAART - Your name Concert', N'Sổ tay mini ANGIAART - Your name Concert', 2000, CAST(9000 AS Decimal(18, 0)), N'LH4       ', N'TH1       ', N'NCC2      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H39', N'Sổ tay mini ANGIAART - Panton', N'22999898675', N'~/images/products/STCL9.jpg', N'Sổ tay mini ANGIAART - Panton', N'Sổ tay mini ANGIAART - Panton', 2000, CAST(9000 AS Decimal(18, 0)), N'LH4       ', N'TH2       ', N'NCC2      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H4        ', N'Bộ 24 Màu Cao Cấp Marco Raffine 7100-24CB (Hộp Giấy)
', N'7708179082911', N'~/images/products/DCHs4.jpg', N'rất dễ chuốt nhưng không gãy.

- Màu gốc vẫn được giữ nguyên khi tô đè lên màu khác, rất lí tưởng để trộn màu và vẽ nhiều lớp. Ngoài ra, có thể phối trộn để tạo bóng, tạo màu mới, highlight.

- Tuân thủ tiêu chuẩn an toàn Châu Âu', NULL, 500, CAST(230000 AS Decimal(18, 0)), N'LH2       ', N'TH1       ', N'NCC1      ', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H40', N'Sổ tay mini ANGIAART - Yamausagi', N'22999898676', N'~/images/products/STCL10.jpg', N'Sổ tay mini ANGIAART - Yamausagi', N'Sổ tay mini ANGIAART - Yamausagi', 2000, CAST(9000 AS Decimal(18, 0)), N'LH4       ', N'TH2       ', N'NCC2      ', CAST(N'2018-11-12' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H41', N'Tập học sinh Tiki lan tỏa niềm vui 96 trang', N'23999898671', N'~/images/products/TVHS1.jpg', N'Tập học sinh Tiki lan tỏa niềm vui 96 trang', N'Tập học sinh Tiki lan tỏa niềm vui 96 trang', 1000, CAST(35000 AS Decimal(18, 0)), N'LH5       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-10' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H42', N'Lốc 5 cuốn học tiếng Nhật Campus', N'23999898672', N'~/images/products/TVHS2.jpg', N'Lốc 5 cuốn học tiếng Nhật Campus', N'Lốc 5 cuốn học tiếng Nhật Campus', 1000, CAST(56000 AS Decimal(18, 0)), N'LH5       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-10' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H43', N'Tập học sinh Tiki lan tỏa niềm vui Đà Nẵng', N'23999898673', N'~/images/products/TVHS3.jpg', N'Tập học sinh Tiki lan tỏa niềm vui Đà Nẵng', N'Tập học sinh Tiki lan tỏa niềm vui Đà Nẵng', 1000, CAST(58000 AS Decimal(18, 0)), N'LH5       ', N'TH2       ', N'NCC2      ', CAST(N'2018-09-11' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H44', N'Lốc 5 cuốn tập 4 ô ly Campus', N'23999898674', N'~/images/products/TVHS4.jpg', N'Lốc 5 cuốn tập 4 ô ly Campus', N'Lốc 5 cuốn tập 4 ô ly Campus', 1500, CAST(55000 AS Decimal(18, 0)), N'LH5       ', N'TH2       ', N'NCC2      ', CAST(N'2018-09-11' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H45', N'Lốc 5 cuốn tập kẻ ngang Campus', N'23999898675', N'~/images/products/TVHS5.jpg', N'Lốc 5 cuốn tập kẻ ngang Campus', N'Lốc 5 cuốn tập kẻ ngang Campus', 1500, CAST(100000 AS Decimal(18, 0)), N'LH5       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-21' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H46', N'Lốc 10 cuốn tập kẻ đứng 4 ô ly luyện chữ đẹp', N'23999898676', N'~/images/products/TVHS6.jpg', N'Lốc 10 cuốn tập kẻ đứng 4 ô ly luyện chữ đẹp', N'Lốc 10 cuốn tập kẻ đứng 4 ô ly luyện chữ đẹp', 1500, CAST(78000 AS Decimal(18, 0)), N'LH5       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-21' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H47', N'Lốc 10 cuốn vở kẻ ngang Campus', N'23999898677', N'~/images/products/TVHS7.jpg', N'Lốc 10 cuốn vở kẻ ngang Campus', N'Lốc 10 cuốn vở kẻ ngang Campus', 2000, CAST(80000 AS Decimal(18, 0)), N'LH5       ', N'TH2       ', N'NCC2      ', CAST(N'2018-09-30' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H48', N'Lốc 10 cuốn vở kẻ ngang Wisdom', N'23999898678', N'~/images/products/TVHS8.jpg', N'Lốc 10 cuốn vở kẻ ngang Wisdom', N'Lốc 10 cuốn vở kẻ ngang Wisdom', 2000, CAST(50000 AS Decimal(18, 0)), N'LH5       ', N'TH2       ', N'NCC2      ', CAST(N'2018-09-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H49', N'Lốc 5 cuốn vở kẻ ngang Campus B5 Landscape', N'23999898679', N'~/images/products/TVHS9.jpg', N'Lốc 5 cuốn vở kẻ ngang Campus B5 Landscape', N'Lốc 5 cuốn vở kẻ ngang Campus B5 Landscape', 2000, CAST(100000 AS Decimal(18, 0)), N'LH5       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H5        ', N'Gôm Tẩy Artline EER - 8
', N'7708179082912', N'~/images/products/DCHS5.jpg', N'Dễ dàng tẩy sạch vết bẩn mà không làm rách giấy.

- Không làm dơ bề mặt gôm tẩy khi dùng.

- Kích thước sử dụng phù hợp cho học sinh và văn phòng.', NULL, 1000, CAST(34000 AS Decimal(18, 0)), N'LH2       ', N'TH1       ', N'NCC1      ', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H50', N'Lốc 5 cuốn vở chép nhạc 48 trang KLONG', N'239998986710', N'~/images/products/TVHS10.jpg', N'Lốc 5 cuốn vở chép nhạc 48 trang KLONG', N'Lốc 5 cuốn vở chép nhạc 48 trang KLONG', 2000, CAST(36000 AS Decimal(18, 0)), N'LH5       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H51', N'Flash Card dạy trẻ về thế giới xung quanh', N'249998986710', N'~/images/products/FlashCards1.jpg', N'Flash Card dạy trẻ về thế giới xung quanh', N'Flash Card dạy trẻ về thế giới xung quanh', 1000, CAST(112000 AS Decimal(18, 0)), N'LH6       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H52', N'Flash Card dạy trẻ về thế giới xung quanh 1', N'249998986711', N'~/images/products/FlashCards2.jpg', N'Flash Card dạy trẻ về thế giới xung quanh 1', N'Flash Card dạy trẻ về thế giới xung quanh 1', 1000, CAST(215000 AS Decimal(18, 0)), N'LH6       ', N'TH1       ', N'NCC1      ', CAST(N'2018-10-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H53', N'Flash Card kích thích thị giác cho trẻ sơ sinh', N'249998986712', N'~/images/products/FlashCards3.jpg', N'Flash Card kích thích thị giác cho trẻ sơ sinh', N'Flash Card kích thích thị giác cho trẻ sơ sinh', 1000, CAST(239000 AS Decimal(18, 0)), N'LH6       ', N'TH2       ', N'NCC2      ', CAST(N'2018-10-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H54', N'Flash Card tiếng Việt - Từ đơn', N'249998986713', N'~/images/products/FlashCards4.jpg', N'Flash Card tiếng Việt - Từ đơn', N'Flash Card tiếng Việt - Từ đơn', 1500, CAST(136000 AS Decimal(18, 0)), N'LH6       ', N'TH1       ', N'NCC1      ', CAST(N'2018-09-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H55', N'Flash Card kích thích thị giác cho trẻ sơ sinh 2', N'249998986714', N'~/images/products/FlashCards5.jpg', N'Flash Card kích thích thị giác cho trẻ sơ sinh 2', N'Flash Card kích thích thị giác cho trẻ sơ sinh 2', 1500, CAST(239000 AS Decimal(18, 0)), N'LH6       ', N'TH2       ', N'NCC2      ', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H56', N'Flash Card tiếng Việt - Từ ghép', N'249998986715', N'~/images/products/FlashCards6.jpg', N'Flash Card tiếng Việt - Từ ghép', N'Flash Card tiếng Việt - Từ ghép', 1500, CAST(136000 AS Decimal(18, 0)), N'LH6       ', N'TH1       ', N'NCC1      ', CAST(N'2018-10-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H57', N'Flash Card dạy trẻ về thế giới xung quanh 2', N'249998986716', N'~/images/products/FlashCards7.jpg', N'Flash Card dạy trẻ về thế giới xung quanh 2', N'Flash Card dạy trẻ về thế giới xung quanh 2', 1500, CAST(256000 AS Decimal(18, 0)), N'LH6       ', N'TH1       ', N'NCC1      ', CAST(N'2018-11-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H58', N'Flash Card tiếng Việt - Cụm từ và câu', N'249998986717', N'~/images/products/FlashCards8.jpg', N'Flash Card tiếng Việt - Cụm từ và câu', N'Flash Card tiếng Việt - Cụm từ và câu', 1000, CAST(136000 AS Decimal(18, 0)), N'LH6       ', N'TH1       ', N'NCC1      ', CAST(N'2018-11-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H59', N'Hộp Flash Card tiếng Nhật theo chủ đề', N'249998986718', N'~/images/products/FlashCards9.jpg', N'Hộp Flash Card tiếng Nhật theo chủ đề', N'Hộp Flash Card tiếng Nhật theo chủ đề', 1000, CAST(225000 AS Decimal(18, 0)), N'LH6       ', N'TH2       ', N'NCC2      ', CAST(N'2018-11-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H6        ', N'Bộ Dụng Cụ Học Sinh Hello Bear
', N'7708179082913', N'~/images/products/DCHS6.jpg', N'Bộ Dụng Cụ Học Sinh Hello Bear gồm hộp bút, viết chì, kéo, thước và chuốt chì là dụng cụ thiết yếu cho các em học sinh. Đây là những món dụng cụ cần thiết cho các em học sinh trong quá trình học tập.
Bộ dụng cụ học sinh có chất liệu tốt, an toàn, không gây độc hại bởi tất cả đều làm từ chất liệu an toàn cho sức khỏe và thân thiện với môi trường.
Ba mẹ có thể lựa chọn bộ dụng cụ để làm quà tặng cho các bé khi bắt đầu bước vào năm học mới, giúp cho các bé sẽ thấy thích thú hơn trong học tập.', NULL, 1000, CAST(25000 AS Decimal(18, 0)), N'LH2       ', N'TH1       ', N'NCC1      ', CAST(N'2018-02-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H60', N'Flash Card dạy trẻ về thế giới xung quanh 3', N'249998986719', N'~/images/products/FlashCards10.jpg', N'Flash Card dạy trẻ về thế giới xung quanh 3', N'Flash Card dạy trẻ về thế giới xung quanh 3', 1000, CAST(216000 AS Decimal(18, 0)), N'LH6       ', N'TH1       ', N'NCC1      ', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H61', N'Bộ 36 màu cao cấp Marco Raffine', N'259998986710', N'~/images/products/BCM_BL_BS1.jpg', N'Bộ 36 màu cao cấp Marco Raffine', N'Bộ 36 màu cao cấp Marco Raffine', 1000, CAST(139000 AS Decimal(18, 0)), N'LH7       ', N'TH2       ', N'NCC2      ', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H62', N'Bộ chì màu tô 24 màu nước cao cấp', N'259998986711', N'~/images/products/BCM_BL_BS2.jpg', N'Bộ chì màu tô 24 màu nước cao cấp', N'Bộ chì màu tô 24 màu nước cao cấp', 1000, CAST(150000 AS Decimal(18, 0)), N'LH7       ', N'TH1       ', N'NCC1      ', CAST(N'2018-12-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H63', N'Bút sáp dầu thiên long', N'259998986712', N'~/images/products/BCM_BL_BS3.jpg', N'Bút sáp dầu thiên long', N'Bút sáp dầu thiên long', 1000, CAST(12500 AS Decimal(18, 0)), N'LH7       ', N'TH1       ', N'NCC1      ', CAST(N'2018-03-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H64', N'Bộ chì màu tô 24 màu nước cao cấp HT121', N'259998986713', N'~/images/products/BCM_BL_BS4.jpg', N'Bộ chì màu tô 24 màu nước cao cấp HT121', N'Bộ chì màu tô 24 màu nước cao cấp HT121', 1000, CAST(92000 AS Decimal(18, 0)), N'LH7       ', N'TH2       ', N'NCC2      ', CAST(N'2018-03-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H65', N'Bút chì 12 màu G-star', N'259998986714', N'~/images/products/BCM_BL_BS5.jpg', N'Bút chì 12 màu G-star', N'Bút chì 12 màu G-star', 1500, CAST(10000 AS Decimal(18, 0)), N'LH7       ', N'TH2       ', N'NCC2      ', CAST(N'2018-03-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H66', N'Hộp bút sáp màu smartkids', N'259998986715', N'~/images/products/BCM_BL_BS6.jpg', N'Hộp bút sáp màu smartkids', N'Hộp bút sáp màu smartkids', 1500, CAST(11000 AS Decimal(18, 0)), N'LH7       ', N'TH1       ', N'NCC1      ', CAST(N'2018-04-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H67', N'Bút chì tô 12 màu La Pure', N'259998986716', N'~/images/products/BCM_BL_BS7.jpg', N'Bút chì tô 12 màu La Pure', N'Bút chì tô 12 màu La Pure', 1500, CAST(26000 AS Decimal(18, 0)), N'LH7       ', N'TH1       ', N'NCC1      ', CAST(N'2018-04-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H68', N'Hộp 10 bút lông bảng Thiên Long', N'259998986717', N'~/images/products/BCM_BL_BS8.jpg', N'Hộp 10 bút lông bảng Thiên Long', N'Hộp 10 bút lông bảng Thiên Long', 1500, CAST(54000 AS Decimal(18, 0)), N'LH7       ', N'TH2       ', N'NCC2      ', CAST(N'2018-05-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H69', N'Hộp bút sáp 10 màu thiên long', N'259998986718', N'~/images/products/BCM_BL_BS9.jpg', N'Hộp bút sáp 10 màu thiên long', N'Hộp bút sáp 10 màu thiên long', 1500, CAST(15000 AS Decimal(18, 0)), N'LH7       ', N'TH2       ', N'NCC2      ', CAST(N'2018-05-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H7        ', N'Bao Tập Học Sinh Thịnh Phát - Hình Con Nai (10 Cái)
', N'7708179082915', N'~/images/products/DCHS7.jpg', N'Bao Tập Học Sinh Thịnh Phát - Hình Con Nai (10 Cái) được làm bằng chất liệu nhựa trong, nhựa dẻo, bền, bảo vệ tốt bìa tập bên trong, giúp tập vở của các em học sinh luôn bóng đẹp như mới.
Bìa bao được sản xuất theo công nghệ hiện đại, không có nhựa tái chế, không độc hại.
Đường keo bám dính tốt với bìa, có thể lặp lại nhiều lần khi dán vào và tháo ra, keo vẫn bám dính tốt. Bìa được in hình đẹp mắt, sinh động.
Phù hợp bao nhiều loại tập học sinh kích thước từ 15.5 x 20.5 cm và 15.8 x 20.5 cm.', N'Chất liệu nhựa trong, dẻo, bền

Không độc hại với người sử dụng

Đường keo bám dính tốt', 1000, CAST(35000 AS Decimal(18, 0)), N'LH2       ', N'TH2       ', N'NCC2      ', CAST(N'2018-02-02' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H70', N'Bút lông bi Thiên Long', N'259998986719', N'~/images/products/BCM_BL_BS10.jpg', N'Bút lông bi Thiên Long', N'Bút lông bi Thiên Long', 2000, CAST(16000 AS Decimal(18, 0)), N'LH7       ', N'TH2       ', N'NCC2      ', CAST(N'2018-05-01' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H8        ', N'Tẩy Stabilo Exam Grade ER196E
', N'7708179082916', N'~/images/products/DCHS8.jpg', N' Gôm tẩy PVC thời trang màu đen không chất Plastic, tẩy chì hiệu quả, rất được ưa chuộng, đóng gói độc lập, chống bụi

- Kích thước lớn, thích hợp cho sinh viên và giới văn phòng

- Màu đen.

- Kích thước: 3.5 cm', NULL, 600, CAST(45000 AS Decimal(18, 0)), N'LH2       ', N'TH2       ', N'NCC2      ', CAST(N'2018-02-28' AS Date))
INSERT [dbo].[Hang] ([HangID], [HangName], [SKU], [HangImage], [MoTa], [Note], [SoLuong], [DonGia], [LoaiHangID], [ThuongHieuID], [NhaCungCapID], [CreatedDate]) VALUES (N'H9        ', N'Hộp Viết Artline HV
', N'7708179082919', N'~/images/products/DCHS9.jpg', N'Hộp Viết Artline HV được làm từ chất liệu tổng hợp với khả năng chống thấm nước tốt. Đường may tỉ mỉ, khóa kéo bền chắc, cho giá trị sử dụng lâu dài. Sản phẩm có kiểu dáng đơn giản, đẹp mắt, là vật dụng cá nhân hữu ích cho học sinh, sinh viên và giới văn phòng công sở.', N'Kiểu dáng đơn giản, đẹp mắt.

Đường may tỉ mỉ, khóa kéo bền chắc.

Ngăn chứa vừa vặn, là vật dụng cá nhân hữu ích cho học sinh, sinh viên và giới văn phòng công sở.', 1000, CAST(50000 AS Decimal(18, 0)), N'LH2       ', N'TH2       ', N'NCC2      ', CAST(N'2018-02-15' AS Date))
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([KhachHangID], [KhachHangName], [Email], [SoDienThoai], [DiaChi], [MatKhau]) VALUES (1, N'sim', N'nguyenth7lc@gmail.com', N'4444                                                                                                ', N'Lao Cai', N'12345')
INSERT [dbo].[KhachHang] ([KhachHangID], [KhachHangName], [Email], [SoDienThoai], [DiaChi], [MatKhau]) VALUES (2, NULL, N'a', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([KhachHangID], [KhachHangName], [Email], [SoDienThoai], [DiaChi], [MatKhau]) VALUES (3, N'namjoon', N'namjoon@gmail.com', N'2323356                                                                                             ', N'Souel', N'12345')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
INSERT [dbo].[LoaiHang] ([LoaiHangID], [LoaiHangName]) VALUES (N'LH1       ', N'Dụng Cụ Văn Phòng')
INSERT [dbo].[LoaiHang] ([LoaiHangID], [LoaiHangName]) VALUES (N'LH2       ', N'Dụng Cụ Học Sinh')
INSERT [dbo].[LoaiHang] ([LoaiHangID], [LoaiHangName]) VALUES (N'LH3       ', N'Bút - Viết các loại')
INSERT [dbo].[LoaiHang] ([LoaiHangID], [LoaiHangName]) VALUES (N'LH4       ', N'Sổ tay các loại')
INSERT [dbo].[LoaiHang] ([LoaiHangID], [LoaiHangName]) VALUES (N'LH5       ', N'Tập Vở Học Sinh')
INSERT [dbo].[LoaiHang] ([LoaiHangID], [LoaiHangName]) VALUES (N'LH6       ', N'Flashcards')
INSERT [dbo].[LoaiHang] ([LoaiHangID], [LoaiHangName]) VALUES (N'LH7       ', N'Bút Chì Màu - Bút Lông Màu - Bút Sáp Màu')
INSERT [dbo].[NhaCungCap] ([NhaCungCapID], [NhaCungCapName], [NhaCungCapDiaChi]) VALUES (N'NCC1      ', N'Sweet Berry House ', N'Hà Nội')
INSERT [dbo].[NhaCungCap] ([NhaCungCapID], [NhaCungCapName], [NhaCungCapDiaChi]) VALUES (N'NCC2      ', N'Phuc Thinh TTC', N'Đà Nẵng')
SET IDENTITY_INSERT [dbo].[QTAdmin] ON 

INSERT [dbo].[QTAdmin] ([AdminID], [AdminName], [Password], [Email]) VALUES (1, N'simnguyen', N'12345', N'simnguyen@gmail.com')
SET IDENTITY_INSERT [dbo].[QTAdmin] OFF
INSERT [dbo].[ThuongHieu] ([ThuongHieuID], [ThuongHieuName]) VALUES (N'TH1       ', N'Deli')
INSERT [dbo].[ThuongHieu] ([ThuongHieuID], [ThuongHieuName]) VALUES (N'TH2       ', N'Omeni')
ALTER TABLE [dbo].[Hang]  WITH CHECK ADD  CONSTRAINT [FK_Hang_LoaiHang] FOREIGN KEY([LoaiHangID])
REFERENCES [dbo].[LoaiHang] ([LoaiHangID])
GO
ALTER TABLE [dbo].[Hang] CHECK CONSTRAINT [FK_Hang_LoaiHang]
GO
ALTER TABLE [dbo].[Hang]  WITH CHECK ADD  CONSTRAINT [FK_Hang_NhaCungCap] FOREIGN KEY([NhaCungCapID])
REFERENCES [dbo].[NhaCungCap] ([NhaCungCapID])
GO
ALTER TABLE [dbo].[Hang] CHECK CONSTRAINT [FK_Hang_NhaCungCap]
GO
ALTER TABLE [dbo].[Hang]  WITH CHECK ADD  CONSTRAINT [FK_Hang_ThuongHieu] FOREIGN KEY([ThuongHieuID])
REFERENCES [dbo].[ThuongHieu] ([ThuongHieuID])
GO
ALTER TABLE [dbo].[Hang] CHECK CONSTRAINT [FK_Hang_ThuongHieu]
GO
USE [master]
GO
ALTER DATABASE [DB_TikiNow] SET  READ_WRITE 
GO
