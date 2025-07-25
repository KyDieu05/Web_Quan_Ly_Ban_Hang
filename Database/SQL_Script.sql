USE [master]
GO
/****** Object:  Database [NhaHang]    Script Date: 04/07/2025 16:50:55 ******/
CREATE DATABASE [NhaHang]
GO
USE [NhaHang]
GO
ALTER DATABASE [NhaHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NhaHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NhaHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NhaHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NhaHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NhaHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NhaHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NhaHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NhaHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NhaHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NhaHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [NhaHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NhaHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NhaHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NhaHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NhaHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NhaHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NhaHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NhaHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NhaHang] SET  MULTI_USER 
GO
ALTER DATABASE [NhaHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NhaHang] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NhaHang] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NhaHang] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [NhaHang] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NhaHang] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NhaHang] SET QUERY_STORE = OFF
GO
USE [NhaHang]
GO
/****** Object:  Table [dbo].[Ban]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ban](
	[MaBan] [int] IDENTITY(1,1) NOT NULL,
	[TenBan] [nvarchar](50) NOT NULL,
	[SoGhe] [int] NOT NULL,
	[Vip] [int] NULL,
	[TinhTrang] [int] NULL,
	[MaTang_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHoaDon]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHoaDon](
	[MaHoaDon_id] [int] NOT NULL,
	[MaMonAn_id] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[ThanhTien] [float] NOT NULL,
	[NgayGoi] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon_id] ASC,
	[MaMonAn_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietPhieuNhap]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuNhap](
	[MaNguyenLieu_id] [int] NOT NULL,
	[MaPhieuNhap_id] [int] NOT NULL,
	[SoLuongNhap] [float] NULL,
	[GiaNhap] [float] NOT NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguyenLieu_id] ASC,
	[MaPhieuNhap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietSanPham]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietSanPham](
	[MaMonAn_id] [int] NOT NULL,
	[MaNguyenLieu_id] [int] NOT NULL,
	[SoLuongDung] [float] NOT NULL,
	[Tru] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonAn_id] ASC,
	[MaNguyenLieu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[SDTKhachHang] [varchar](10) NULL,
	[TongHoaDon] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NgayThanhToan] [datetime] NULL,
	[GhiChu] [nvarchar](200) NULL,
	[TongTien] [float] NOT NULL,
	[TrangThai] [int] NULL,
	[MaBan_id] [int] NULL,
	[Code] [varchar](6) NULL,
	[ThoiHan] [datetime] NULL,
 CONSTRAINT [PK__HoaDon__835ED13B19FCDE5C] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoanTra]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoanTra](
	[MaHoanTra] [int] IDENTITY(1,1) NOT NULL,
	[NgayHoanTra] [datetime] NULL,
	[TongTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoanTra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LichSuGoiMon]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LichSuGoiMon](
	[MaLichSu] [int] IDENTITY(1,1) NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[SoLuongTra] [int] NULL,
	[ThoiGianGoi] [datetime] NULL,
	[ThoiGianTra] [datetime] NULL,
	[MaHoaDon_id] [int] NULL,
	[MaMonAn_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLichSu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiMonAn]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiMonAn](
	[MaLMA] [int] IDENTITY(1,1) NOT NULL,
	[TenLMA] [nvarchar](100) NOT NULL,
	[TongSoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLMA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiNguyenLieu]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguyenLieu](
	[MaLNL] [int] IDENTITY(1,1) NOT NULL,
	[TenLNL] [nvarchar](100) NOT NULL,
	[TongSoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLNL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MonAn]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonAn](
	[MaMonAn] [int] IDENTITY(1,1) NOT NULL,
	[TenMonAn] [nvarchar](255) NOT NULL,
	[HinhAnh] [nvarchar](100) NULL,
	[DonGia] [float] NULL,
	[NgayCapNhat] [date] NULL,
	[ThongTin] [nvarchar](max) NULL,
	[MoTa] [nvarchar](max) NULL,
	[SoLuongDaBan] [int] NULL,
	[MaNMA_id] [int] NULL,
	[MaLMA_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMonAn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieu]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieu](
	[MaNguyenLieu] [int] IDENTITY(1,1) NOT NULL,
	[TenNguyenLieu] [nvarchar](200) NOT NULL,
	[SoLuongHienCon] [float] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[GiaNhapCuoi] [float] NOT NULL,
	[MaLNL_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNguyenLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieuTra]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieuTra](
	[MaHoanTra_id] [int] NOT NULL,
	[MaNguyenLieu_id] [int] NOT NULL,
	[SoLuongTra] [float] NULL,
	[DonGia] [float] NULL,
	[ThanhTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoanTra_id] ASC,
	[MaNguyenLieu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguyenLieuXuat]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguyenLieuXuat](
	[MaXuatKho_id] [int] NOT NULL,
	[MaNguyenLieu_id] [int] NOT NULL,
	[SoLuongXuat] [float] NULL,
	[DonGia] [float] NULL,
	[ThanhTien] [float] NULL,
 CONSTRAINT [PK__NguyenLi__AA75F991E3C77BBC] PRIMARY KEY CLUSTERED 
(
	[MaXuatKho_id] ASC,
	[MaNguyenLieu_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCC]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCC](
	[MaNCC] [int] IDENTITY(1,1) NOT NULL,
	[TenNCC] [nvarchar](100) NOT NULL,
	[DiaChi] [nvarchar](200) NULL,
	[SoDienThoai] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[TaiKhoanNV] [varchar](50) NOT NULL,
	[MatKhauNV] [varchar](50) NOT NULL,
	[TenNhanVien] [nvarchar](100) NOT NULL,
	[NgaySinh] [date] NULL,
	[SoDienThoai] [varchar](10) NULL,
	[MaQuyen_id] [int] NULL,
	[TrangThai] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaiKhoanNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhomMonAn]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomMonAn](
	[MaNMA] [int] IDENTITY(1,1) NOT NULL,
	[TenNMA] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNMA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuNhap]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuNhap](
	[MaPhieuNhap] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [date] NULL,
	[TongTien] [float] NULL,
	[TaiKhoanNV_id] [varchar](50) NULL,
	[MaNCC_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPhieuNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [nvarchar](50) NOT NULL,
	[GhiChu] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tang]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tang](
	[MaTang] [int] IDENTITY(1,1) NOT NULL,
	[TenTang] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XuatKho]    Script Date: 04/07/2025 16:50:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuatKho](
	[MaXuatKho] [int] IDENTITY(1,1) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[NgayXuat] [datetime] NULL,
	[TongTien] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaXuatKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ban] ON 

INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (1, N'1 Siu VIP ProB', 5, 1, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (2, N'2 VIP pro', 8, 1, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (4, N'10 CNPM', 4, 0, NULL, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (5, N'10 CNPM :<', 4, 1, NULL, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (6, N'6', 6, 0, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (7, N'7', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (8, N'8', 6, 0, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (9, N'9', 6, 0, 1, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (10, N'10', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (11, N'11', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (12, N'12', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (13, N'13', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (14, N'14', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (15, N'15', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (16, N'16', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (17, N'17', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (18, N'18', 6, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (19, N'1 VIP', 8, 1, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (20, N'2 VIP', 8, 1, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (21, N'3 VIP', 16, 1, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (22, N'4', 4, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (23, N'5', 4, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (24, N'6', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (25, N'7', 6, 0, 1, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (26, N'8', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (27, N'9', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (28, N'10', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (29, N'11', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (30, N'12', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (31, N'13', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (32, N'14', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (33, N'15', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (34, N'16', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (35, N'17', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (36, N'18', 6, 0, 0, 2)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (37, N'1 VIP', 8, 1, 1, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (38, N'2 VIP', 8, 1, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (39, N'3 VIP', 16, 1, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (40, N'4', 4, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (41, N'5', 4, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (42, N'6', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (43, N'7', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (44, N'8', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (45, N'9', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (46, N'10', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (47, N'11', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (48, N'12', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (49, N'13', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (50, N'14', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (51, N'15', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (52, N'16', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (53, N'17', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (54, N'18', 6, 0, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (55, N'1 VIP', 6, 1, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (57, N'1 provip', 8, 1, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (58, N'1 pprovip', 8, 1, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (59, N'1 pro', 7, 1, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (60, N'1 VIP', 8, 0, 0, 1)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (61, N'pro vip 10.2', 4, 1, 0, 3)
INSERT [dbo].[Ban] ([MaBan], [TenBan], [SoGhe], [Vip], [TinhTrang], [MaTang_id]) VALUES (64, N'10 CNPM :<<', 10, 1, 0, 3)
SET IDENTITY_INSERT [dbo].[Ban] OFF
GO
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (77, 2, 2, 80000, CAST(N'2025-06-14T15:32:52.093' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (77, 4, 1, 30000, CAST(N'2025-06-15T03:29:31.657' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (78, 1, 1, 10000, CAST(N'2025-06-13T17:37:24.643' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (78, 2, 1, 40000, CAST(N'2025-06-13T17:37:21.053' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (79, 2, 1, 40000, CAST(N'2025-06-08T09:10:40.427' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (79, 5, 1, 50000, CAST(N'2025-06-08T09:11:00.570' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (80, 2, 1, 40000, CAST(N'2025-06-08T09:46:23.453' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (81, 2, 1, 40000, CAST(N'2025-06-12T22:30:53.830' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 2, 1, 40000, CAST(N'2025-06-12T22:37:01.653' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 4, 2, 60000, CAST(N'2025-06-12T22:37:06.397' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 5, 1, 50000, CAST(N'2025-06-12T22:37:56.793' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 7, 2, 100000, CAST(N'2025-06-12T22:37:13.333' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 8, 1, 50000, CAST(N'2025-06-12T22:37:36.780' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 10, 1, 80000, CAST(N'2025-06-12T22:37:20.143' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 11, 1, 60000, CAST(N'2025-06-12T22:37:09.270' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 12, 2, 160000, CAST(N'2025-06-12T22:37:25.007' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 13, 1, 100000, CAST(N'2025-06-12T22:37:29.917' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 18, 1, 20000, CAST(N'2025-06-12T22:37:51.813' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 24, 1, 15000, CAST(N'2025-06-12T22:39:19.313' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 26, 1, 30000, CAST(N'2025-06-12T22:38:20.383' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 28, 1, 20000, CAST(N'2025-06-12T22:38:54.607' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 29, 1, 3000000, CAST(N'2025-06-12T22:38:32.383' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 30, 1, 6000000, CAST(N'2025-06-12T22:38:37.843' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 31, 2, 30000, CAST(N'2025-06-12T22:38:43.803' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (82, 32, 1, 80000, CAST(N'2025-06-12T22:38:27.760' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (84, 3, 1, 15000, CAST(N'2025-06-15T00:42:46.153' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (85, 5, 1, 50000, CAST(N'2025-06-15T09:12:26.920' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (85, 11, 1, 60000, CAST(N'2025-06-15T09:12:30.017' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (85, 13, 1, 100000, CAST(N'2025-06-15T09:12:37.990' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (86, 2, 1, 40000, CAST(N'2025-06-15T03:31:47.993' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (86, 4, 1, 30000, CAST(N'2025-06-15T03:31:45.620' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (87, 3, 2, 30000, CAST(N'2025-06-15T09:11:04.713' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (87, 4, 2, 60000, CAST(N'2025-06-15T09:11:11.410' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (87, 9, 1, 50000, CAST(N'2025-06-15T09:11:08.230' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (88, 2, 2, 80000, CAST(N'2025-06-15T09:21:52.670' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (88, 3, 0, 0, CAST(N'2025-06-15T09:21:55.417' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (89, 5, 1, 50000, CAST(N'2025-06-15T15:05:06.137' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (89, 7, 1, 50000, CAST(N'2025-06-15T15:05:09.527' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (90, 4, 1, 30000, CAST(N'2025-06-15T15:10:01.297' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (90, 8, 1, 50000, CAST(N'2025-06-15T15:10:05.283' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (90, 11, 1, 60000, CAST(N'2025-06-15T15:10:10.320' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (91, 2, 1, 40000, CAST(N'2025-06-15T16:28:17.233' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (91, 4, 2, 60000, CAST(N'2025-06-15T16:28:11.720' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (92, 7, 2, 100000, CAST(N'2025-06-15T16:30:09.143' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (92, 11, 1, 60000, CAST(N'2025-06-15T16:30:11.843' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (93, 4, 1, 30000, CAST(N'2025-06-15T18:33:56.440' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (93, 8, 1, 50000, CAST(N'2025-06-15T18:34:05.377' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (93, 10, 2, 160000, CAST(N'2025-06-15T18:34:00.157' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (93, 12, 1, 80000, CAST(N'2025-06-15T18:34:02.550' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (94, 4, 1, 30000, CAST(N'2025-06-15T18:47:23.120' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (94, 9, 1, 50000, CAST(N'2025-06-15T18:47:26.177' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (95, 2, 1, 40000, CAST(N'2025-06-15T19:06:39.120' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (96, 2, 1, 40000, CAST(N'2025-06-15T19:30:03.777' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (96, 3, 2, 30000, CAST(N'2025-06-15T19:30:07.323' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (96, 11, 1, 60000, CAST(N'2025-06-15T19:30:19.373' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (99, 10, 1, 80000, CAST(N'2025-06-16T01:02:41.120' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (99, 11, 1, 60000, CAST(N'2025-06-15T22:05:10.437' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (99, 13, 1, 100000, CAST(N'2025-06-15T22:05:06.893' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (100, 8, 1, 50000, CAST(N'2025-06-15T22:07:22.937' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (100, 11, 2, 120000, CAST(N'2025-06-16T01:01:57.970' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (101, 11, 3, 180000, CAST(N'2025-06-16T01:04:25.643' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (102, 9, 2, 100000, CAST(N'2025-06-16T02:02:15.143' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (103, 20, 1, 100000, CAST(N'2025-06-16T01:34:41.883' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (103, 21, 1, 150000, CAST(N'2025-06-16T01:34:31.563' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (104, 8, 1, 50000, CAST(N'2025-06-16T01:44:32.240' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (104, 10, 1, 80000, CAST(N'2025-06-16T01:44:28.603' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (105, 13, 1, 100000, CAST(N'2025-06-16T02:03:32.770' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (107, 2, 1, 45000, CAST(N'2025-07-04T16:31:22.433' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (107, 10, 1, 80000, CAST(N'2025-07-04T16:43:55.040' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (108, 2, 1, 45000, CAST(N'2025-06-18T05:00:18.817' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (108, 8, 1, 50000, CAST(N'2025-06-18T05:00:22.537' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (109, 1, 6, 18000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (109, 2, 1, 45000, CAST(N'2025-06-18T05:13:54.853' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (110, 1, 6, 18000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (110, 11, 3, 180000, CAST(N'2025-06-18T05:19:18.527' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (111, 1, 6, 18000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (111, 7, 2, 100000, CAST(N'2025-06-18T05:27:34.360' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (112, 1, 8, 24000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (113, 1, 6, 18000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (113, 8, 3, 150000, CAST(N'2025-06-18T10:57:55.077' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (114, 1, 6, 18000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (114, 3, 1, 15000, CAST(N'2025-07-04T16:44:11.613' AS DateTime))
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (115, 1, 6, 18000, NULL)
INSERT [dbo].[ChiTietHoaDon] ([MaHoaDon_id], [MaMonAn_id], [SoLuongMua], [ThanhTien], [NgayGoi]) VALUES (115, 11, 1, 60000, CAST(N'2025-07-04T16:45:43.653' AS DateTime))
GO
INSERT [dbo].[ChiTietPhieuNhap] ([MaNguyenLieu_id], [MaPhieuNhap_id], [SoLuongNhap], [GiaNhap], [ThanhTien]) VALUES (4, 13, 547, 12000, NULL)
GO
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (1, 20, 1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (2, 4, 1.4, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (2, 5, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (3, 8, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (3, 9, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (3, 10, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (4, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (4, 12, 0.01, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (5, 8, 0.003, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (5, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (5, 13, 0.003, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (7, 14, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (7, 15, 0.05, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (7, 16, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (8, 17, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (8, 18, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (8, 19, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 20, 2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 21, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 22, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (9, 23, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 25, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 26, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 27, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (10, 28, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 13, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 16, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 19, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 21, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 23, 0.05, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (11, 29, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 13, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 16, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 23, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (12, 30, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 5, 0.05, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 8, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 21, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 31, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 32, 0.03, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (13, 33, 0.03, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 27, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 29, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 34, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 35, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (14, 36, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 5, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 21, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 34, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 36, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 37, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 38, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (15, 39, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 11, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 13, 0.003, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 16, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (16, 40, 3, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 8, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 23, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 40, 3, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 41, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (17, 42, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 8, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 16, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 23, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (18, 43, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 5, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 19, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 23, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (19, 44, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (20, 14, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (20, 19, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (20, 45, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 10, 0.02, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 23, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 31, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 46, 0.5, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 47, 0.5, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (21, 48, 0.2, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (22, 49, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (23, 50, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (24, 51, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (25, 52, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (26, 53, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (28, 55, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (29, 56, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (30, 57, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (31, 58, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (32, 59, 1, 1)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (33, 19, 3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (34, 5, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (34, 16, 0.1, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (34, 18, 0.3, 0)
INSERT [dbo].[ChiTietSanPham] ([MaMonAn_id], [MaNguyenLieu_id], [SoLuongDung], [Tru]) VALUES (34, 24, 0.3, 0)
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (77, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-06T21:16:05.560' AS DateTime), CAST(N'2025-06-15T03:29:35.103' AS DateTime), NULL, 121000, 0, 37, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (78, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-06T21:16:25.260' AS DateTime), CAST(N'2025-06-13T17:37:30.277' AS DateTime), NULL, 55000, 0, 38, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (79, N'Cute Customer', N'0123456789', 2, CAST(N'2025-06-08T09:08:42.350' AS DateTime), CAST(N'2025-06-08T09:11:49.850' AS DateTime), NULL, 99000, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (80, N'Cute Customer', N'0123456789', 2, CAST(N'2025-06-08T09:46:01.717' AS DateTime), CAST(N'2025-06-13T17:34:21.417' AS DateTime), NULL, 55000, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (81, N'No Name', N'0261835389', 1, CAST(N'2025-06-12T22:29:59.513' AS DateTime), CAST(N'2025-06-14T15:31:56.500' AS DateTime), NULL, 80000, 0, 5, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (82, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-12T22:36:57.493' AS DateTime), CAST(N'2025-06-14T15:32:39.900' AS DateTime), NULL, 9955000, 0, 9, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (83, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-14T22:59:54.947' AS DateTime), CAST(N'2025-06-15T03:28:36.493' AS DateTime), NULL, 66000, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (84, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-15T00:42:33.213' AS DateTime), CAST(N'2025-06-15T03:29:01.600' AS DateTime), NULL, 104500, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (85, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-15T00:43:05.530' AS DateTime), CAST(N'2025-06-15T15:03:25.023' AS DateTime), NULL, 290000, 0, 4, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (86, N'Cute Customer', N'Don''t Save', 1, CAST(N'2025-06-15T03:31:41.233' AS DateTime), CAST(N'2025-06-15T03:32:04.380' AS DateTime), NULL, 103400, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (87, N'Cute  Customer', N'0876545207', 1, CAST(N'2025-06-15T09:10:54.633' AS DateTime), CAST(N'2025-06-15T09:12:16.993' AS DateTime), NULL, 177080, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (88, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-15T09:21:48.837' AS DateTime), CAST(N'2025-06-15T15:00:38.137' AS DateTime), NULL, 114400, 0, 2, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (89, N'Cute  Customer', N'0123456789', 2, CAST(N'2025-06-15T15:04:51.353' AS DateTime), CAST(N'2025-06-15T15:05:26.850' AS DateTime), NULL, 139700, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (90, N'Cute Customer', N'0123456789', 3, CAST(N'2025-06-15T15:09:58.107' AS DateTime), CAST(N'2025-06-15T15:10:52.313' AS DateTime), NULL, 180400, 0, 37, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (91, N'Cute Customer', N'123456789', 2, CAST(N'2025-06-15T16:28:07.607' AS DateTime), CAST(N'2025-06-15T19:27:13.087' AS DateTime), NULL, 136400, 0, 2, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (92, N'Trần Kỷ Diệu', N'0349639738', 2, CAST(N'2025-06-15T16:30:02.687' AS DateTime), CAST(N'2025-06-15T19:27:04.243' AS DateTime), NULL, 175000, 0, 4, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (93, N'Cute  Customer', N'0123456789', 2, CAST(N'2025-06-15T18:33:33.697' AS DateTime), CAST(N'2025-06-15T19:04:46.513' AS DateTime), NULL, 332000, 0, 5, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (94, N'Cute  Customer', N'0365797603', 1, CAST(N'2025-06-15T18:47:14.893' AS DateTime), CAST(N'2025-06-15T18:49:06.663' AS DateTime), NULL, 117700, 0, 19, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (95, N'Trần Kỷ Diệu', N'0376549187', 1, CAST(N'2025-06-15T19:06:35.307' AS DateTime), CAST(N'2025-06-15T19:26:53.873' AS DateTime), NULL, 58000, 0, 8, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (96, N'No Name', N'0367807362', 1, CAST(N'2025-06-15T19:29:56.120' AS DateTime), CAST(N'2025-06-15T19:54:44.903' AS DateTime), NULL, 159500, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (99, N'Handsome Customer', N'0374872864', 2, CAST(N'2025-06-15T22:05:00.393' AS DateTime), NULL, NULL, 12000, 2, 4, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (100, N'', N'0123456789', 3, CAST(N'2025-06-15T22:06:37.053' AS DateTime), CAST(N'2025-06-16T01:02:21.863' AS DateTime), NULL, 203500, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (101, N'Trần Kỷ Diệu', N'0123456789', 2, CAST(N'2025-06-16T01:04:18.217' AS DateTime), CAST(N'2025-07-04T16:31:12.160' AS DateTime), NULL, 198000, 0, 1, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (102, N'Bao Chau', N'0123456789', 3, CAST(N'2025-06-16T01:28:26.070' AS DateTime), CAST(N'2025-06-16T17:59:59.467' AS DateTime), NULL, 136400, 0, 2, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (103, N'Trần Kỷ Diệu', N'0123456789', 3, CAST(N'2025-06-16T01:34:20.327' AS DateTime), CAST(N'2025-06-16T02:06:12.690' AS DateTime), NULL, 301400, 0, 19, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (104, N'Bao Chau', N'0123456789', 2, CAST(N'2025-06-16T01:44:22.943' AS DateTime), NULL, NULL, 12000, 2, 5, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (105, N'Diệu đẹp trai', N'0123456789', 2, CAST(N'2025-06-16T02:03:26.197' AS DateTime), CAST(N'2025-06-18T04:59:16.837' AS DateTime), NULL, 118000, 0, 6, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (107, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-16T21:31:20.643' AS DateTime), NULL, NULL, 26400, 2, 2, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (108, N'Trần Kỷ Diệu', N'0973564328', 1, CAST(N'2025-06-18T05:00:14.550' AS DateTime), CAST(N'2025-06-18T05:00:39.037' AS DateTime), NULL, 130900, 0, 19, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (109, N'Trần Kỷ Diệu', N'0284582020', 3, CAST(N'2025-06-18T05:13:43.197' AS DateTime), CAST(N'2025-06-18T05:19:03.810' AS DateTime), NULL, 63000, 0, 8, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (110, N'Diệu đẹp trai', N'0123456789', 2, CAST(N'2025-06-18T05:19:10.123' AS DateTime), NULL, NULL, 18000, 2, 25, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (111, N'Trần Kỷ Diệu', N'0123456789', 2, CAST(N'2025-06-18T05:27:26.573' AS DateTime), NULL, NULL, 18000, 2, 6, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (112, N'Bảo Châu IDOL', N'0123456789', 1, CAST(N'2025-06-18T05:28:47.230' AS DateTime), NULL, NULL, 26400, 2, 37, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (113, N'Trần Kỷ Diệu', N'0123456789', 2, CAST(N'2025-06-18T10:57:45.293' AS DateTime), CAST(N'2025-07-04T16:30:57.887' AS DateTime), NULL, 168000, 0, 8, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (114, N'Trần Kỷ Diệu', N'0123456789', 2, CAST(N'2025-07-04T16:44:07.603' AS DateTime), NULL, NULL, 18000, 1, 9, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHoaDon], [TenKhachHang], [SDTKhachHang], [TongHoaDon], [NgayTao], [NgayThanhToan], [GhiChu], [TongTien], [TrangThai], [MaBan_id], [Code], [ThoiHan]) VALUES (115, N'No Name', N'0123456789', 2, CAST(N'2025-07-04T16:45:35.247' AS DateTime), NULL, NULL, 18000, 1, 8, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[HoanTra] ON 

INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (1, CAST(N'2025-06-06T10:17:09.113' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (2, CAST(N'2025-06-06T10:17:09.113' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (3, CAST(N'2025-06-06T21:16:29.080' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (4, CAST(N'2025-06-08T09:10:28.940' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (5, CAST(N'2025-06-08T09:46:18.300' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (6, CAST(N'2025-06-08T09:47:16.153' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (7, CAST(N'2025-06-12T22:31:09.273' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (8, CAST(N'2025-06-14T15:32:58.200' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (9, CAST(N'2025-06-15T09:11:15.660' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (10, CAST(N'2025-06-15T09:22:02.480' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (11, CAST(N'2025-06-16T01:55:38.403' AS DateTime), 0)
INSERT [dbo].[HoanTra] ([MaHoanTra], [NgayHoanTra], [TongTien]) VALUES (12, CAST(N'2025-06-18T05:18:56.293' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[HoanTra] OFF
GO
SET IDENTITY_INSERT [dbo].[LichSuGoiMon] ON 

INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (277, 8, 0, CAST(N'2025-06-06T21:16:05.700' AS DateTime), NULL, 77, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (278, 8, 0, CAST(N'2025-06-06T21:16:25.290' AS DateTime), NULL, 78, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (279, 0, 8, NULL, CAST(N'2025-06-06T21:16:29.073' AS DateTime), 78, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (280, 8, 0, CAST(N'2025-06-08T09:08:42.577' AS DateTime), NULL, 79, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (281, 0, 8, NULL, CAST(N'2025-06-08T09:10:28.930' AS DateTime), 79, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (282, 1, 0, CAST(N'2025-06-08T09:10:40.443' AS DateTime), NULL, 79, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (283, 1, 0, CAST(N'2025-06-08T09:11:00.587' AS DateTime), NULL, 79, 5)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (284, 8, 0, CAST(N'2025-06-08T09:46:01.967' AS DateTime), NULL, 80, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (285, 0, 2, NULL, CAST(N'2025-06-08T09:46:18.120' AS DateTime), 80, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (286, 1, 0, CAST(N'2025-06-08T09:46:23.470' AS DateTime), NULL, 80, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (287, 0, 6, NULL, CAST(N'2025-06-08T09:47:16.143' AS DateTime), 80, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (290, 1, 0, CAST(N'2025-06-08T09:47:41.620' AS DateTime), NULL, 80, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (291, 4, 0, CAST(N'2025-06-12T22:29:59.613' AS DateTime), NULL, 81, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (292, 1, 0, CAST(N'2025-06-12T22:30:53.840' AS DateTime), NULL, 81, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (293, 1, 0, CAST(N'2025-06-12T22:30:57.287' AS DateTime), NULL, 81, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (294, 0, 1, NULL, CAST(N'2025-06-12T22:31:09.270' AS DateTime), 81, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (295, 6, 0, CAST(N'2025-06-12T22:36:57.593' AS DateTime), NULL, 82, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (296, 1, 0, CAST(N'2025-06-12T22:37:01.673' AS DateTime), NULL, 82, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (297, 1, 0, CAST(N'2025-06-12T22:37:06.400' AS DateTime), NULL, 82, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (298, 1, 0, CAST(N'2025-06-12T22:37:09.287' AS DateTime), NULL, 82, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (299, 1, 0, CAST(N'2025-06-12T22:37:13.340' AS DateTime), NULL, 82, 7)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (300, 1, 0, CAST(N'2025-06-12T22:37:20.217' AS DateTime), NULL, 82, 10)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (301, 1, 0, CAST(N'2025-06-12T22:37:25.013' AS DateTime), NULL, 82, 12)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (302, 1, 0, CAST(N'2025-06-12T22:37:29.923' AS DateTime), NULL, 82, 13)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (303, 1, 0, CAST(N'2025-06-12T22:37:36.787' AS DateTime), NULL, 82, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (304, 1, 0, CAST(N'2025-06-12T22:37:40.657' AS DateTime), NULL, 82, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (305, 1, 0, CAST(N'2025-06-12T22:37:51.820' AS DateTime), NULL, 82, 18)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (306, 1, 0, CAST(N'2025-06-12T22:37:56.803' AS DateTime), NULL, 82, 5)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (307, 1, 0, CAST(N'2025-06-12T22:38:09.313' AS DateTime), NULL, 82, 7)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (308, 1, 0, CAST(N'2025-06-12T22:38:13.320' AS DateTime), NULL, 82, 12)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (309, 1, 0, CAST(N'2025-06-12T22:38:20.390' AS DateTime), NULL, 82, 26)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (310, 1, 0, CAST(N'2025-06-12T22:38:27.790' AS DateTime), NULL, 82, 32)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (311, 1, 0, CAST(N'2025-06-12T22:38:32.390' AS DateTime), NULL, 82, 29)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (312, 1, 0, CAST(N'2025-06-12T22:38:37.847' AS DateTime), NULL, 82, 30)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (313, 1, 0, CAST(N'2025-06-12T22:38:43.810' AS DateTime), NULL, 82, 31)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (314, 1, 0, CAST(N'2025-06-12T22:38:54.613' AS DateTime), NULL, 82, 28)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (315, 1, 0, CAST(N'2025-06-12T22:39:09.457' AS DateTime), NULL, 82, 31)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (316, 1, 0, CAST(N'2025-06-12T22:39:19.320' AS DateTime), NULL, 82, 24)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (317, 1, 0, CAST(N'2025-06-13T17:37:21.063' AS DateTime), NULL, 78, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (318, 1, 0, CAST(N'2025-06-13T17:37:24.657' AS DateTime), NULL, 78, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (319, 1, 0, CAST(N'2025-06-14T15:32:52.220' AS DateTime), NULL, 77, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (320, 1, 0, CAST(N'2025-06-14T15:32:55.770' AS DateTime), NULL, 77, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (321, 0, 1, NULL, CAST(N'2025-06-14T15:32:58.197' AS DateTime), 77, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (326, 6, 0, CAST(N'2025-06-14T22:59:55.073' AS DateTime), NULL, 83, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (327, 8, 0, CAST(N'2025-06-15T00:42:33.297' AS DateTime), NULL, 84, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (328, 1, 0, CAST(N'2025-06-15T00:42:46.160' AS DateTime), NULL, 84, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (329, 8, 0, CAST(N'2025-06-15T00:43:05.540' AS DateTime), NULL, 85, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (330, 1, 0, CAST(N'2025-06-15T03:29:27.787' AS DateTime), NULL, 77, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (331, 1, 0, CAST(N'2025-06-15T03:29:31.667' AS DateTime), NULL, 77, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (332, 8, 0, CAST(N'2025-06-15T03:31:41.260' AS DateTime), NULL, 86, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (333, 1, 0, CAST(N'2025-06-15T03:31:45.627' AS DateTime), NULL, 86, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (334, 1, 0, CAST(N'2025-06-15T03:31:48.027' AS DateTime), NULL, 86, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (335, 8, 0, CAST(N'2025-06-15T09:10:54.837' AS DateTime), NULL, 87, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (336, 1, 0, CAST(N'2025-06-15T09:11:04.737' AS DateTime), NULL, 87, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (337, 1, 0, CAST(N'2025-06-15T09:11:08.257' AS DateTime), NULL, 87, 9)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (338, 1, 0, CAST(N'2025-06-15T09:11:11.433' AS DateTime), NULL, 87, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (339, 0, 1, NULL, CAST(N'2025-06-15T09:11:15.633' AS DateTime), 87, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (340, 0, NULL, CAST(N'2025-06-15T09:11:19.180' AS DateTime), NULL, 87, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (341, 0, NULL, CAST(N'2025-06-15T09:11:25.050' AS DateTime), NULL, 87, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (342, 1, 0, CAST(N'2025-06-15T09:12:26.940' AS DateTime), NULL, 85, 5)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (343, 1, 0, CAST(N'2025-06-15T09:12:30.077' AS DateTime), NULL, 85, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (344, 1, 0, CAST(N'2025-06-15T09:12:38.007' AS DateTime), NULL, 85, 13)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (345, 8, 0, CAST(N'2025-06-15T09:21:48.880' AS DateTime), NULL, 88, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (346, 1, 0, CAST(N'2025-06-15T09:21:52.687' AS DateTime), NULL, 88, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (347, 1, 0, CAST(N'2025-06-15T09:21:55.423' AS DateTime), NULL, 88, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (348, 0, NULL, CAST(N'2025-06-15T09:21:58.433' AS DateTime), NULL, 88, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (349, 0, 1, NULL, CAST(N'2025-06-15T09:22:02.453' AS DateTime), 88, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (350, 8, 0, CAST(N'2025-06-15T15:04:51.467' AS DateTime), NULL, 89, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (351, 1, 0, CAST(N'2025-06-15T15:05:02.977' AS DateTime), NULL, 89, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (352, 1, 0, CAST(N'2025-06-15T15:05:06.143' AS DateTime), NULL, 89, 5)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (353, 1, 0, CAST(N'2025-06-15T15:05:09.530' AS DateTime), NULL, 89, 7)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (354, 8, 0, CAST(N'2025-06-15T15:09:58.123' AS DateTime), NULL, 90, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (355, 1, 0, CAST(N'2025-06-15T15:10:01.300' AS DateTime), NULL, 90, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (356, 1, 0, CAST(N'2025-06-15T15:10:05.290' AS DateTime), NULL, 90, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (357, 1, 0, CAST(N'2025-06-15T15:10:10.327' AS DateTime), NULL, 90, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (358, 8, 0, CAST(N'2025-06-15T16:28:07.730' AS DateTime), NULL, 91, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (359, 1, 0, CAST(N'2025-06-15T16:28:11.730' AS DateTime), NULL, 91, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (360, 1, 0, CAST(N'2025-06-15T16:28:14.687' AS DateTime), NULL, 91, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (361, 1, 0, CAST(N'2025-06-15T16:28:17.243' AS DateTime), NULL, 91, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (362, 4, 0, CAST(N'2025-06-15T16:30:02.727' AS DateTime), NULL, 92, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (363, 1, 0, CAST(N'2025-06-15T16:30:05.803' AS DateTime), NULL, 92, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (364, 1, 0, CAST(N'2025-06-15T16:30:09.157' AS DateTime), NULL, 92, 7)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (365, 1, 0, CAST(N'2025-06-15T16:30:11.847' AS DateTime), NULL, 92, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (366, 0, NULL, CAST(N'2025-06-15T16:31:22.777' AS DateTime), NULL, 92, 7)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (367, 4, 0, CAST(N'2025-06-15T18:33:33.813' AS DateTime), NULL, 93, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (368, 1, 0, CAST(N'2025-06-15T18:33:56.450' AS DateTime), NULL, 93, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (369, 1, 0, CAST(N'2025-06-15T18:34:00.163' AS DateTime), NULL, 93, 10)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (370, 1, 0, CAST(N'2025-06-15T18:34:02.557' AS DateTime), NULL, 93, 12)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (371, 1, 0, CAST(N'2025-06-15T18:34:05.390' AS DateTime), NULL, 93, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (372, 0, NULL, CAST(N'2025-06-15T18:34:09.990' AS DateTime), NULL, 93, 10)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (373, 8, 0, CAST(N'2025-06-15T18:47:15.190' AS DateTime), NULL, 94, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (374, -7, NULL, CAST(N'2025-06-15T18:47:20.077' AS DateTime), NULL, 94, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (375, 1, 0, CAST(N'2025-06-15T18:47:23.137' AS DateTime), NULL, 94, 4)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (376, 1, 0, CAST(N'2025-06-15T18:47:26.190' AS DateTime), NULL, 94, 9)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (377, 6, 0, CAST(N'2025-06-15T19:06:35.497' AS DateTime), NULL, 95, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (378, 1, 0, CAST(N'2025-06-15T19:06:39.153' AS DateTime), NULL, 95, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (379, 5, 0, CAST(N'2025-06-15T19:29:56.253' AS DateTime), NULL, 96, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (380, 1, 0, CAST(N'2025-06-15T19:30:03.797' AS DateTime), NULL, 96, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (381, 1, 0, CAST(N'2025-06-15T19:30:07.330' AS DateTime), NULL, 96, 3)
GO
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (382, 1, 0, CAST(N'2025-06-15T19:30:19.383' AS DateTime), NULL, 96, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (383, 0, NULL, CAST(N'2025-06-15T19:32:44.313' AS DateTime), NULL, 96, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (392, 4, 0, CAST(N'2025-06-15T22:05:00.563' AS DateTime), NULL, 99, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (393, 1, 0, CAST(N'2025-06-15T22:05:06.913' AS DateTime), NULL, 99, 13)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (394, 1, 0, CAST(N'2025-06-15T22:05:10.443' AS DateTime), NULL, 99, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (395, 5, 0, CAST(N'2025-06-15T22:06:37.080' AS DateTime), NULL, 100, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (396, 1, 0, CAST(N'2025-06-15T22:07:22.943' AS DateTime), NULL, 100, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (397, 1, 0, CAST(N'2025-06-16T01:01:58.287' AS DateTime), NULL, 100, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (398, 0, NULL, CAST(N'2025-06-16T01:02:02.257' AS DateTime), NULL, 100, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (399, 1, 0, CAST(N'2025-06-16T01:02:41.130' AS DateTime), NULL, 99, 10)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (400, 5, 0, CAST(N'2025-06-16T01:04:18.240' AS DateTime), NULL, 101, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (401, 1, 0, CAST(N'2025-06-16T01:04:25.650' AS DateTime), NULL, 101, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (402, 8, 0, CAST(N'2025-06-16T01:28:26.197' AS DateTime), NULL, 102, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (403, 1, 0, CAST(N'2025-06-16T01:28:33.293' AS DateTime), NULL, 102, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (404, 0, NULL, CAST(N'2025-06-16T01:28:37.543' AS DateTime), NULL, 102, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (405, 8, 0, CAST(N'2025-06-16T01:34:20.527' AS DateTime), NULL, 103, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (406, 1, 0, CAST(N'2025-06-16T01:34:31.580' AS DateTime), NULL, 103, 21)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (407, 1, 0, CAST(N'2025-06-16T01:34:41.890' AS DateTime), NULL, 103, 20)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (408, 4, 0, CAST(N'2025-06-16T01:44:23.083' AS DateTime), NULL, 104, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (409, 1, 0, CAST(N'2025-06-16T01:44:28.617' AS DateTime), NULL, 104, 10)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (410, 1, 0, CAST(N'2025-06-16T01:44:32.250' AS DateTime), NULL, 104, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (411, 0, 2, NULL, CAST(N'2025-06-16T01:55:38.367' AS DateTime), 102, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (412, 1, 0, CAST(N'2025-06-16T02:02:15.530' AS DateTime), NULL, 102, 9)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (413, 0, NULL, CAST(N'2025-06-16T02:02:19.560' AS DateTime), NULL, 102, 9)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (414, 6, 0, CAST(N'2025-06-16T02:03:26.220' AS DateTime), NULL, 105, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (415, 1, 0, CAST(N'2025-06-16T02:03:32.777' AS DateTime), NULL, 105, 13)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (416, 1, NULL, CAST(N'2025-06-16T02:04:19.700' AS DateTime), NULL, 101, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (421, 8, 0, CAST(N'2025-06-16T21:31:20.903' AS DateTime), NULL, 107, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (422, 8, 0, CAST(N'2025-06-18T05:00:14.597' AS DateTime), NULL, 108, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (423, 1, 0, CAST(N'2025-06-18T05:00:18.823' AS DateTime), NULL, 108, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (424, 1, 0, CAST(N'2025-06-18T05:00:22.540' AS DateTime), NULL, 108, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (425, 6, 0, CAST(N'2025-06-18T05:13:43.210' AS DateTime), NULL, 109, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (426, 1, 0, CAST(N'2025-06-18T05:13:54.860' AS DateTime), NULL, 109, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (427, 0, NULL, CAST(N'2025-06-18T05:17:55.440' AS DateTime), NULL, 109, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (428, 0, 1, NULL, CAST(N'2025-06-18T05:18:56.280' AS DateTime), 109, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (429, 6, 0, CAST(N'2025-06-18T05:19:10.140' AS DateTime), NULL, 110, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (430, 1, 0, CAST(N'2025-06-18T05:19:18.537' AS DateTime), NULL, 110, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (431, 1, NULL, CAST(N'2025-06-18T05:19:22.260' AS DateTime), NULL, 110, 11)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (432, 6, 0, CAST(N'2025-06-18T05:27:26.590' AS DateTime), NULL, 111, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (433, 1, 0, CAST(N'2025-06-18T05:27:34.367' AS DateTime), NULL, 111, 7)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (434, 0, NULL, CAST(N'2025-06-18T05:27:43.853' AS DateTime), NULL, 111, 7)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (435, 8, 0, CAST(N'2025-06-18T05:28:47.283' AS DateTime), NULL, 112, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (436, 6, 0, CAST(N'2025-06-18T10:57:45.547' AS DateTime), NULL, 113, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (437, 1, 0, CAST(N'2025-06-18T10:57:55.100' AS DateTime), NULL, 113, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (438, 1, NULL, CAST(N'2025-06-18T10:57:59.300' AS DateTime), NULL, 113, 8)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (439, 1, 0, CAST(N'2025-07-04T16:31:22.620' AS DateTime), NULL, 107, 2)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (440, 1, 0, CAST(N'2025-07-04T16:43:55.313' AS DateTime), NULL, 107, 10)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (441, 6, 0, CAST(N'2025-07-04T16:44:07.637' AS DateTime), NULL, 114, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (442, 1, 0, CAST(N'2025-07-04T16:44:11.620' AS DateTime), NULL, 114, 3)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (443, 6, 0, CAST(N'2025-07-04T16:45:35.263' AS DateTime), NULL, 115, 1)
INSERT [dbo].[LichSuGoiMon] ([MaLichSu], [SoLuongMua], [SoLuongTra], [ThoiGianGoi], [ThoiGianTra], [MaHoaDon_id], [MaMonAn_id]) VALUES (444, 1, 0, CAST(N'2025-07-04T16:45:43.660' AS DateTime), NULL, 115, 11)
SET IDENTITY_INSERT [dbo].[LichSuGoiMon] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiMonAn] ON 

INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (1, N'Khai Vị', 7)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (2, N'Món Gà', 2)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (3, N'Món Heo', 4)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (4, N'Shushi', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (6, N'Cơm', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (7, N'Món Lẩu', 2)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (8, N'Món Cháo', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (9, N'Trái Cây', 0)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (10, N'Thức Uống', 11)
INSERT [dbo].[LoaiMonAn] ([MaLMA], [TenLMA], [TongSoLuong]) VALUES (11, N'Khác', 5)
SET IDENTITY_INSERT [dbo].[LoaiMonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiNguyenLieu] ON 

INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (1, N'Hải Sản', 9)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (2, N'Rau Củ Quả', 18)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (3, N'Gia Vị', 10)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (4, N'Thức Uống', 11)
INSERT [dbo].[LoaiNguyenLieu] ([MaLNL], [TenLNL], [TongSoLuong]) VALUES (5, N'Khác', 7)
SET IDENTITY_INSERT [dbo].[LoaiNguyenLieu] OFF
GO
SET IDENTITY_INSERT [dbo].[MonAn] ON 

INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (1, N'Khăn Lạnh', N'KhanLanh.jpg', 3000, CAST(N'2025-06-15' AS Date), N'Khăn lau miệng việt tiệp', N'<p>Khăn lau cho mọi người</p>', 366, 5, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (2, N'Cá Lóc Đồng Kho Tộ (Ướp Sẵn)', N'AnhCaLoc.jpeg', 45000, CAST(N'2025-07-04' AS Date), N'Cá lóc đồng tươi kho tộ ngon ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">C&aacute; L&oacute;c Kho Tộ l&agrave; một m&oacute;n ngon v&ocirc; c&ugrave;ng đưa cơm v&agrave; rất quen thuộc với c&aacute;c bữa ăn gia đ&igrave;nh Việt. Từng miếng c&aacute; kho ướm m&agrave;u n&acirc;u v&agrave;ng, b&oacute;ng bẩy đẹp mắt, dai ngon h&ograve;a quyện c&ugrave;ng sốt kho sệt qu&aacute;nh, đậm vị mặn ngọt chua cay của ti&ecirc;u, ớt, d&ugrave;ng c&ugrave;ng cơm trắng n&oacute;ng hổi chắc chắn l&agrave; sự lựa chọn tuyệt vời cho bữa cơm gia đ&igrave;nh.</span></p>', 23, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (3, N'Rau Muống Xào Tỏi', N'raumuong.jpeg', 15000, CAST(N'2025-06-07' AS Date), N'Rồng xanh vượt đại dương, món ăn rất quen thuộc đối với người Việt Nam', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">M&oacute;n ăn Rau muống x&agrave;o tỏi chưa bao giờ lỗi thời bao cả! D&ugrave; bạn c&oacute; thử qua bao nhi&ecirc;u m&oacute;n ăn mới lạ th&igrave; chắc chắn rằng m&oacute;n rau muống x&agrave;o tỏi l&agrave; m&oacute;n ăn th&acirc;n thuộc kh&ocirc;ng thể n&agrave;o thiếu trong m&acirc;m cơm gia đ&igrave;nh Việt. M&oacute;n ăn dễ l&agrave;m, nguy&ecirc;n liệu lại đơn giản th&igrave; ngại g&igrave; kh&ocirc;ng order thử xem nh&eacute;. Cooky d&aacute;m chắc bạn sẽ l&agrave; đầu bếp của h&ocirc;m nay đấy.</span></p>', 10, 2, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (4, N'Ba Rọi Heo Chiên Da Giòn', N'HeoQuay.jpeg', 30000, CAST(N'2025-06-07' AS Date), N'Heo quay', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Da heo chi&ecirc;n v&agrave;ng gi&ograve;n rụm. Thịt heo b&ecirc;n trong mềm mại, mọng nước, thơm một c&aacute;ch ngọt ng&agrave;o, cắn một ph&aacute;t l&agrave; ghiền ngay chỉ c&oacute; thể l&agrave; m&oacute;n Ba Rọi Chi&ecirc;n Da Gi&ograve;n trứ danh. Rất nhiều chị em "ki&ecirc;ng nể" m&oacute;n ăn n&agrave;y v&igrave; sợ dầu văng, thịt b&ecirc;n ngo&agrave;i kh&eacute;t m&agrave; b&ecirc;n trong lại chưa ch&iacute;n hoặc thịt kh&ocirc;ng thấm gia vị,.</span></p>', 12, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (5, N'Ba Rọi Heo Kho Mắm Ruốc', N'HeoKhoRuoc.jpeg', 50000, CAST(N'2025-06-07' AS Date), N'Món kho thịt heo ngon ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Ba rọi kho mắm ruốc l&agrave; sự kết hợp ho&agrave;n hảo giữa thịt ba chỉ b&eacute;o thơm c&ugrave;ng vị mằn mặn của mắm ruốc, vị cay của ớt v&agrave; thơm thơm của sả chắc chắn sẽ l&agrave;m bạn hao kha kh&aacute; cơm đấy. H&atilde;y order ngay g&oacute;i nguy&ecirc;n liệu "Ba rọi heo kho mắm ruốc ướp sẵn" đậm vị đến từ Chef Cooky v&agrave; trổ t&agrave;i cho bữa cơm gia đ&igrave;nh th&ecirc;m đa dạng nh&eacute;!</span></p>', 5, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (7, N'Đùi Gà Chiên Mắm Tỏi', N'DuiGa.jpeg', 50000, CAST(N'2025-06-07' AS Date), N'Đùi gà ta chiên giòn', N'<div class="btn-desc-box" style="box-sizing: border-box; font-family: ''SF UI Text''; display: flex; -webkit-box-pack: center; justify-content: center; margin: 15px 0px; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</div>
<div class="content-x" style="box-sizing: border-box; font-family: ''SF UI Text''; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Bạn đ&atilde; từng rụng rời với m&oacute;n Cơm G&agrave; Mắm Tỏi ở một qu&aacute;n ăn n&agrave;o đ&oacute;? Bạn ước m&igrave;nh c&oacute; thể thực hiện lại m&oacute;n g&agrave; "thần th&aacute;nh" đ&oacute; tại nh&agrave;? Ngại ng&ugrave;ng g&igrave; m&agrave; kh&ocirc;ng thử sức liền tay với m&oacute;n Đ&ugrave;i G&oacute;c Tư G&agrave; Chi&ecirc;n Mắm Tỏi.</div>', 7, 2, 2)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (8, N'Gỏi Xoài Tôm Khô', N'GoiXoai.jpeg', 50000, CAST(N'2025-06-07' AS Date), N'Món gõi xoài chua ngọt rất ngon miệng', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Gỏi xo&agrave;i t&ocirc;m kh&ocirc; với vẻ ngo&agrave;i bắt mắt bởi m&agrave;u sắc c&ugrave;ng vị chua cay mặn ngọt h&agrave;i h&ograve;a, đậm đ&agrave; m&agrave; vừa miệng. T&ocirc;m kh&ocirc; ngọt ngọt, xo&agrave;i ớt chua chua cay cay h&ograve;a với vị đậm đ&agrave; của nước mắm, c&aacute;i gi&ograve;n tan của đậu phộng rang, th&ecirc;m v&agrave;i chiếc b&aacute;nh phồng t&ocirc;m th&igrave; v&ocirc; c&ugrave;ng ho&agrave;n hảo.</span></p>', 10, 2, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (9, N'Ếch Xào Sả Ớt', N'Ech.jpeg', 50000, CAST(N'2025-06-07' AS Date), N'Ếch ta sào sả ớt', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">M&oacute;n ăn quen thuộc cho kh&aacute;ch nhậu</span></p>', 9, 2, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (10, N'Tôm Sú Nướng Sốt/Muối Ớt/Mật Ong', N'TómuNuong.jpeg', 80000, CAST(N'2025-06-07' AS Date), N'Tôm sú nướng than', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">M&oacute;n t&ocirc;m s&uacute; nướng thơm lừng đảm bảo sẽ l&agrave; m&oacute;n h&uacute;t hồn bạn nhất trong bữa tiệc tự tay nấu của bạn v&agrave; gia đ&igrave;nh cho m&agrave; xem, với t&ocirc;m s&uacute; tươi ngon, phủ đẫm sốt tự chọn (sốt sa tế/sốt chao/sốt riềng mẻ/sốt mật ong...) t&ugrave;y v&agrave;o khẩu vị của bạn v&agrave; bạn b&egrave; gia đ&igrave;nh m&agrave; lựa chọn để nướng ra được m&oacute;n hợp vị khẩu nhất, ngon nhất.</span></p>', 8, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (11, N'Mực Xào Chua Ngọt', N'MucLaSao.jpeg', 60000, CAST(N'2025-06-07' AS Date), N'Món mực sào chua ngọt', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Mực x&agrave;o chua ngọt c&oacute; lẽ l&agrave; m&oacute;n ăn đổi vị quen thuộc trong bữa cơm nh&agrave; sau những ng&agrave;y thịt th&agrave; ph&aacute;t ng&aacute;n.Miếng mực tươi h&ograve;a quyện với ch&uacute;t ngọt ngọt chua chua tự nhi&ecirc;n từ thơm, c&agrave; chua, h&agrave;nh t&acirc;y c&ugrave;ng g&oacute;i sốt đậm đ&agrave; độc quyền của Cooky Chefs nhất định sẽ khiến cả nh&agrave; thả "like" kh&ocirc;ng ngừng tay!</span></p>', 20, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (12, N'Cá Kèo Kho Thịt Ba Rọi', N'CaKeo.jpeg', 80000, CAST(N'2025-06-07' AS Date), N'Cá kèo kho kèm với thịt heo', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Để gi&uacute;p cho bạn c&oacute; một thực đơn đa dạng hơn, Cooky m&aacute;ch ri&ecirc;ng cho bạn m&oacute;n ăn d&acirc;n d&atilde; nhưng hao cơm lắm đấy nh&eacute;. C&aacute; k&egrave;o kho tộ ch&iacute;nh l&agrave; một trong những m&oacute;n ăn rất đặc trưng của người Miền Nam n&oacute;i chung v&agrave; người miền T&acirc;y n&oacute;i ri&ecirc;ng.</span></p>', 3, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (13, N'Sườn Non Heo Xào Chua Ngọt', N'SuonHeoChuaNgot.jpeg', 100000, CAST(N'2025-06-07' AS Date), N'Sườn heo non sào kiểu tây chua chua ngọt ngọt', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Bạn m&ecirc; sườn, bạn kh&ocirc;ng thể n&agrave;o sống thiếu sườn, l&agrave;m sao bạn bỏ lỡ m&oacute;n Sườn Non X&agrave;o Chua Ngọt trong cuộc đời m&igrave;nh được? Sự h&ograve;a quyện tinh tế giữa vị chua chua, ngọt ngọt, ch&uacute;t b&ugrave;i b&ugrave;i, thơm thơm sẽ đưa bạn đến "đỉnh cao của vị gi&aacute;c" ngay trong bữa cơm đơn giản hằng ng&agrave;y.</span></p>', 4, 2, 3)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (14, N'Lẩu Thái Hải Sản', N'LauThai.jpeg', 120000, CAST(N'2025-06-07' AS Date), N'Lẩu thái thập cẩm ngon ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Lẩu Th&aacute;i hải sản chua cay l&agrave; m&oacute;n ngon cuối tuần, cho bữa tiệc gia đ&igrave;nh. Lẩu Th&aacute;i hải sản chua cay ngon đ&uacute;ng chuẩn sẽ c&oacute; nước d&ugrave;ng chua ngọt, cay nồng từ sả ớt, k&iacute;ch th&iacute;ch vị gi&aacute;c, gi&uacute;p ăn ngon miệng hơn. Đặc biệt, những ng&agrave;y trời lạnh ngồi qu&acirc;y quần b&ecirc;n nồi lẩu Th&aacute;i chua cay tỏa hương thơm nồng th&igrave; ấm l&ograve;ng hết biết</span></p>', 0, 5, 7)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (15, N'Lẩu Cá Thác Lác Khổ Qua', N'LauCaThacLac.jpeg', 100000, CAST(N'2025-06-07' AS Date), N'Lẩu cá thác lác ăn kèm khổ khoa + rau sống + cá thác lác ', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Đảm bảo nếu một lần được thử qua m&oacute;n Lẩu khổ qua c&aacute; th&aacute;c l&aacute;c bạn sẽ ấn tượng ngay bởi sự kết hợp độc đ&aacute;o giữa ch&uacute;t dai, ngọt tự nhi&ecirc;n của c&aacute; th&aacute;c l&aacute;c v&agrave; vị đắng nhẫn nhẫn của khổ qua tạo n&ecirc;n thứ nước d&ugrave;ng thanh đạm, nhẹ nh&agrave;ng nhưng vẫn kh&ocirc;ng k&eacute;m phần</span></p>', 0, 2, 7)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (16, N'Trứng Chiên Thịt Bằm', N'TrungChien.jpeg', 20000, CAST(N'2025-06-07' AS Date), N'Trứng chiên kèm thịt heo có vị béo, thơm ngon', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">V&agrave;o những ng&agrave;y lười nấu ăn th&igrave; chỉ với c&aacute;c nguy&ecirc;n liệu cực quen thuộc l&agrave; trứng, thịt bằm, h&agrave;nh l&aacute; v&agrave; ti&ecirc;u xay l&agrave; bạn đ&atilde; c&oacute; ngay m&oacute;n trứng chi&ecirc;n thịt bằm vừa dễ ăn m&agrave; lại đơn giản, tiết kiệm thời gian rồi.</span></p>', 0, 3, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (17, N'Trứng Ngâm Tương Hàn Quốc', N'TrungNamTuong.jpeg', 20000, CAST(N'2025-06-07' AS Date), N'Trứng ngâm xì dầu kiểu Nhật Bản', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Trứng ng&acirc;m nước tương H&agrave;n Quốc đ&atilde; kh&ocirc;ng c&ograve;n xa lạ nữa m&agrave; c&ograve;n lại nổi tiếng như cồn khi được h&agrave;ng loạt c&aacute;c hot mom, food blogger v&agrave; c&aacute;c nghệ sĩ nổi tiếng l&agrave;m thử. "Thời đến cản kh&ocirc;ng kịp" l&agrave; c&oacute; thật, m&oacute;n trứng ng&acirc;m n&agrave;y đ&atilde; v&agrave; đang trở th&agrave;nh hiện tượng được nhiều người t&igrave;m hiểu. Nếu bạn cũng c&oacute; &yacute; định l&agrave;m thử m&oacute;n ăn n&agrave;y, nhưng lại ngại phải đi chợ v&agrave; chưa nắm r&otilde; được c&ocirc;ng thức chế biến, m&igrave;nh sẽ gi&uacute;p bạn ngay đ&acirc;y.</span></p>', 0, 3, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (18, N'Cải Thìa Xào Tỏi Chay', N'CaiThiaSaoToi.jpeg', 20000, CAST(N'2025-06-07' AS Date), N'Cải thìa sào tỏi ít cay dành cho người ăn chay hoặc ăn kiêng', N'<div class="btn-desc-box" style="box-sizing: border-box; font-family: ''SF UI Text''; display: flex; -webkit-box-pack: center; justify-content: center; margin: 15px 0px; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">&nbsp;</div>
<div class="content-x" style="box-sizing: border-box; font-family: ''SF UI Text''; color: #000000; font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: pre-line; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Trong bữa cơm gia đ&igrave;nh kh&ocirc;ng thể kh&ocirc;ng c&oacute; m&oacute;n rau x&agrave;o, đ&acirc;y l&agrave; m&oacute;n ăn gi&uacute;p ch&uacute;ng ta cảm thấy ngon miệng hơn lại gi&agrave;u vitamin , l&agrave;m m&aacute;t cơ thể. Cải th&igrave;a x&agrave;o tỏi l&agrave; một trong c&aacute;c m&oacute;n rau ăn k&egrave;m rất ngon v&agrave; v&ocirc; c&ugrave;ng đưa cơm. Vị ngọt của rau cải th&igrave;a quyện với vị thơm của tỏi tạo n&ecirc;n một hương vị thơm ngon kh&oacute; cưỡng. Hơn nữa đ&acirc;y c&ograve;n l&agrave; 1 m&oacute;n ăn d&acirc;n d&atilde; dễ thực hiện d&ugrave; bạn chưa c&oacute; nhiều kinh nghiệm bếp n&uacute;c.</div>', 1, 1, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (19, N'Đậu Hũ Cay Sốt Nấm Chay', N'DauPhu.jpeg', 20000, CAST(N'2025-06-07' AS Date), N'Đậu phụ non ', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Đậu hũ chắc chắn l&agrave; m&oacute;n ăn quen thuộc với mỗi bữa cơm gia đ&igrave;nh. Tuy nhi&ecirc;n, đừng chỉ ăn ho&agrave;i một m&oacute;n đậu hũ chi&ecirc;n, đậu hũ kho. H&atilde;y để Cooky Market giới thiệu cho bạn m&oacute;n Đậu hũ cay sốt nấm hương, chỉ với một thay đổi nhỏ l&agrave; nấm hương v&agrave; sốt cay cũng đủ khiến m&oacute;n ăn th&ecirc;m phần hấp dẫn rồi.</span></p>', 0, 1, 1)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (20, N'Đùi Gà Góc Tư Nấu Nấm Đông Cô', N'GaCongDo.jpeg', 100000, CAST(N'2025-06-07' AS Date), N'Gà được hầm với nấm tạo ra mùi hương quyến rũ, khó quên', N'<p><span style="font-family: ''SF UI Text''; font-size: 15px; text-align: justify; white-space: pre-line;">Cuối tuần n&agrave;y cả nh&agrave; m&igrave;nh đổi vị với m&oacute;n Đ&ugrave;i g&agrave; g&oacute;c tư nấu nấm đ&ocirc;ng c&ocirc; mới lạ xem nh&eacute;! G&agrave; v&agrave; nấm đ&ocirc;ng c&ocirc; l&agrave; hai nguy&ecirc;n liệu quen thuộc, khi kết hợp với nhau lại tạo n&ecirc;n một cảm gi&aacute;c rất kh&oacute; qu&ecirc;n, một sự h&agrave;i h&ograve;a đến kinh ngạc. Thịt g&agrave; săn chắc, nấm đ&ocirc;ng c&ocirc; thơm m&ugrave;i vị đặc trưng, đắm m&igrave;nh trong sốt chứa pate b&eacute;o ngậy.</span></p>', 1, 4, 2)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (21, N'Combo Cơm Nhà Là Nhất', N'ComboComNhaLaNhat.jpeg', 150000, CAST(N'2025-06-07' AS Date), N'Món combo gồm nhiều món khác nhau có hương vị như mâm cơm gia đình', N'<p>Combo gồm 3 m&oacute;n gi&aacute; si&ecirc;u si&ecirc;u tiết kiệm</p>', 1, 2, 11)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (22, N'Rượu Soju Jinro Hương Mận', N'RuouSoJu.jpeg', 60000, CAST(N'2025-06-07' AS Date), N'Rượu Soju Jinro Hương Mận', N'<p>Rượu nhập khẩu H&agrave;n</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (23, N'Bia Tiger', N'BiaTiger.jpeg', 12000, CAST(N'2025-06-07' AS Date), N'Bia tigger được nhập đóng lon tại Việt Nam', N'<p>Loại bia số 1 b&aacute;n chạy Việt nam</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (24, N'Nước Ngọt Có Ga Sprite', N'NuocNgotSprite.jpeg', 15000, CAST(N'2025-06-07' AS Date), N'Nước ngọt có ga không màu, hương vị chanh', N'<p>Loại nước uống sản xuất tại việt nam</p>', 1, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (25, N'Nước Ngọt Có Ga CoCa CoLa', N'CoCa.jpeg', 15000, CAST(N'2025-06-07' AS Date), N'Nước ngọt nhập khẩu', N'<p>Nước ngọt c&oacute; doanh thu b&aacute;n lớn nhất Việt Nam 2021</p>', 0, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (26, N'Bia Heineken', N'BiaHeineken.jpeg', 30000, CAST(N'2025-06-07' AS Date), N'Nước uống có cồn nhập khẩu từ Pháp', N'<p>hương vị l&uacute;a mạch</p>', 1, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (28, N'Nước Tăng Lực Redbull', N'BoHuc.jpeg', 20000, CAST(N'2025-06-07' AS Date), N'Nước uống nhập khẩu Thái Lan', N'<p>Nhập khẩu th&aacute;i</p>', 6, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (29, N'Rượu vang Berri', N'VangBerry.jpg', 3000000, CAST(N'2025-06-07' AS Date), N'Rượu vang Berri Estates Cabernet Sauvignon 13% chai 750ml', N'<p>Hạn sử dụng sau 3 năm. Nồng độ cồn 13%</p>', 1, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (30, N'Rượu vang Ramirana', N'VangRamirana.jpg', 6000000, CAST(N'2025-06-07' AS Date), N'Rượu ngoại', N'<h1 class="nameproduct" style="margin: 0px 0px 10px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-weight: normal; font-stretch: normal; font-size: 22px; line-height: 1.3em; font-family: Helvetica, Arial, sans-serif; color: #4a4a4a; outline: none; -webkit-font-smoothing: antialiased; text-rendering: geometricprecision; overflow: hidden; background-color: #ffffff;">Rượu vang Ramirana Cabernet Sauvignon 12.5% chai 750ml</h1>', 2, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (31, N'Bia Huda', N'Huda.jpg', 15000, CAST(N'2025-06-07' AS Date), N'Bia huda Huế. Đậm tình miền trung', N'<p><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Sản phẩm được sản xuất theo quy tr&igrave;nh hiện đại v&agrave; kh&ocirc;ng chứa h&oacute;a chất độc hại mang đến chất lượng ho&agrave;n hảo cho người sử dụng. bia </span><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">c&oacute; m&agrave;u v&agrave;ng &oacute;ng, m&ugrave;i thơm đặc trưng, hương vị đậm đ&agrave;, hấp dẫn vị gi&aacute;c. Sản phẩm từ thương hiệu Huda </span><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">chất lượng với c&ocirc;ng nghệ&nbsp; bia </span><span style="color: #333333; font-family: Helvetica, Arial, sans-serif; font-size: 14px; background-color: #ffffff;">Đan Mạch</span></p>', 2, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (32, N'Rượu Vodka Men', N'Men.jpg', 80000, CAST(N'2025-06-07' AS Date), N'Rượu Vodka Men 39.5% chai 500ml', N'<p>D&agrave;nh cho người tr&ecirc;n 18 tuổi</p>', 1, 5, 10)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (33, N'Demo', N'Thể lực tốt.png', 77777, CAST(N'2025-07-04' AS Date), N'demo', NULL, 0, 1, 6)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (34, N'Cơm rang Dương Châu', N'Com.jpg', 29000, CAST(N'2025-06-13' AS Date), N'Cơm chiên dương châu với nguyên liệu cơm gạo khô, hải sản, rau thơm được chiên trên lửa lớn giòn thơm ngon', NULL, 0, 5, 6)
INSERT [dbo].[MonAn] ([MaMonAn], [TenMonAn], [HinhAnh], [DonGia], [NgayCapNhat], [ThongTin], [MoTa], [SoLuongDaBan], [MaNMA_id], [MaLMA_id]) VALUES (35, N'10 Điểm NMCNPM', N'rose.jpg', 99999, CAST(N'2025-06-18' AS Date), N'10 điểm nhập môn công nghệ phần mềm cho nhóm của CHD', NULL, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[MonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[NguyenLieu] ON 

INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (1, N'Khăn Lạnh', 524, N'Khăn lạnh dùng để lau miệng', 5000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (4, N'Cá Lóc', 1040, N'Cá lóc hải sản', 50000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (5, N'Hành Lá', 10, N'Gia vị hàng lá', 10000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (8, N'Tỏi', 10, N'Tỏi nguyên liệu Việt', 50000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (9, N'Rau Muống', 10, N'Rau muốn trồng tại ao ', 30000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (10, N'Mè', 10, N'Mè trắng', 100000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (11, N'Thịt Heo', 0, N'Heo ba rọi (heo tơ)', 200000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (12, N'Xà lách', 10, N'rau xà lách', 40000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (13, N'Tiêu', 10, N'Hạt tiêu nhập từ DakLak', 200000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (14, N'Gà', 5.5, N'Gà kiến việt nam', 200000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (15, N'Bột Chiên', 10, N'Bột Chiên các món ăn như đùi gà chiên, chả cá chiên...', 50000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (16, N'Dầu Ăn', 10, N'Dầu để chiên', 40000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (17, N'Xoài', 10, N'Xoài bào nhỏ theo sợi để làm gỏi hoặc làm trái cây tráng miệng', 80000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (18, N'Tôm Khô', 29, N'Tôm sấy khô sẵn', 100000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (19, N'Bột Gia Vị', 10, N'Bột dùng để làm gõi chua ngọt', 20000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (20, N'Sả ', 10, N'Sả để làm nguyên liệu chế biến', 300000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (21, N'Hành Tím', 10, N'Hành tím để làm nguyên liệu chế biến', 70000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (22, N'Ếch', 45.5, N'Ếch đồng việt nam', 200000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (23, N'Ớt Trái Đỏ', 10, N'Ớt trái đỏ, loại cay', 55000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (24, N'Ớt Trái Xanh', 10, N'Ớt trái xanh, loại ít cay hoặc không cay', 55000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (25, N'Muối Ớt Xanh', 10, N'Muối ớt nhập từ Mỹ đễ có mùi vị ngon nhất', 10000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (26, N'Sốt Nướng Sa Tế', 10, N'Gia vị để làm màu khi nướng BBQ', 8000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (27, N'Tôm Sú', 42, N'Tôm sú nuôi loại to', 300000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (28, N'Mật Ong', 10, N'Mật ong rừng nguyên chất để làm gia vị', 180000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (29, N'Mực Lá', 42, N'Mực lá tươi (con lớn)', 250000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (30, N'Cá Kèo', 28.5, N'Cá kèo to', 400000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (31, N'Sườn Heo', 7.5, N'Sườn heo non thịt ngon', 500000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (32, N'Đường', 10, N'Đường, gia vị món ăn', 30000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (33, N'Giấm', 10, N'Gia vị món ăn thêm chua, ngon miệng', 25000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (34, N'Rau Sống Các Loại', 10, N'Rau sống được mix đủ các loại như (Giá, sà lách, rau thơi, rau muốn chỉ...) để làm rau sống', 100000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (35, N'Cá Viên', 50, N'Cá viên làm cừ cá thác lác, basa, thịt heo', 20000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (36, N'Nước Cốt Lẩu Chua Cay', 10, N'Nước cố được chế biến sẵn, làm lẩu nhanh', 50000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (37, N'Cá Thác Lác Nguyên Chất', 50, N'Cá thác lám bằm làm chả nguyên chất, tự nhiên không chất bảo quản', 150000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (38, N'Khổ Qua', 10, N'Khổ qua đắng trồng và nhập khẩu từ Đà Lạt', 120000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (39, N'Tiêu Xanh', 10, N'Tiêu xanh daklak', 300000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (40, N'Trứng Gà Công Nghiệp', 100, N'trứng gà nuôi công nghiệp nhập khẩu', 1000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (41, N'Kim Chi', 10, N'Kim chi Hàn Quốc', 50000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (42, N'Tương (Xì Dầu)', 10, N'Nước chấm xì dầu (chay)', 25000, 3)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (43, N'Cải Thìa', 10, N'Cải thìa bẹ to Trung Quốc', 40000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (44, N'Đậu Hũ (Đậu Phụ Thối)', 123, N'Đậu nành lên men nguyên chất', 10000, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (45, N'Nấm Công Đô', 10, N'Nấm công đô Hàn Quốc', 25000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (46, N'Cá Nục', 49.5, N'Cá nục ướp đá đánh bắt', 200000, 1)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (47, N'Đậu Que', 10, N'Đậu que hay còn gọi là đậu Lave', 80000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (48, N'Cà Chua', 10, N'Cà chua đỏ đà lạt', 90000, 2)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (49, N'Rượu Soju Jinro Hương Mận', 10, N'Rượu nhập khẩu Hàn Quốc', 90000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (50, N'Bia Tiger', 590, N'Bia Tiger nâu lon', 16000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (51, N'Nước Ngọt Có Ga Sprite', 239, N'Nước ngọt có ga lon', 15000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (52, N'Nước Ngọt Có Ga CoCa CoLa', 240, N'Nước ngọt có ga lon coca cola', 15000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (53, N'Bia Heineken', 239, N'Nước uống có cồn', 30000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (54, N'Nước Tăng Lực Sting Hương Dâu', 240, N'Nước uống ga màu đỏ', 15000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (55, N'Nước Tăng Lực Redbull', 234, N'Nước uống không có ga mùi bạc hà, màu vàng', 25000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (56, N'Rượu vang Berri Estates', 4, N'Rượu vang Berri Estates Cabernet Sauvignon 13% chai 750ml', 4000000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (57, N'Rượu vang Ramirana ', 18, N'Rượu vang Ramirana Cabernet Sauvignon 12.5% chai 750ml', 10000000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (58, N'Bia Huda', 238, N'Bia Huda 330ml', 16000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (59, N'Rượu Vodka Men', 49, N'Rượu có cồn cao', 100000, 4)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (60, N'Điểm 10 Nhập Môn CNPM', 150, N'Ước được 10 điểm Nhập môn CNPM và Lập trình Python cho máy học', 9999999, 5)
INSERT [dbo].[NguyenLieu] ([MaNguyenLieu], [TenNguyenLieu], [SoLuongHienCon], [GhiChu], [GiaNhapCuoi], [MaLNL_id]) VALUES (61, N'Cà Phê Hạt Đen', 5462, N'Cà phê nguyên hạt đen dùng để pha cà phê', 70900, 4)
SET IDENTITY_INSERT [dbo].[NguyenLieu] OFF
GO
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (1, 1, 6, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (2, 1, 2, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (3, 1, 8, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (4, 1, 8, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (5, 1, 2, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (6, 1, 6, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (8, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuTra] ([MaHoanTra_id], [MaNguyenLieu_id], [SoLuongTra], [DonGia], [ThanhTien]) VALUES (11, 29, 1, NULL, NULL)
GO
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (118, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (119, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (120, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (121, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (122, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (124, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (125, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (126, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (127, 14, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (128, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (129, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (129, 30, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (130, 31, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (131, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (132, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (132, 12, 0.01, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (134, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (135, 14, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (135, 15, 0.05, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (135, 16, 0.3, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (136, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (136, 13, 0.2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (136, 16, 0.2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (136, 23, 0.2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (136, 30, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (137, 53, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (138, 59, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (139, 56, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (140, 57, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (141, 58, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (142, 55, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (143, 58, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (144, 51, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (145, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (146, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (147, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (148, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (149, 1, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (150, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (151, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (152, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (154, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (154, 5, 0.2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (155, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (156, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (157, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (159, 22, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (160, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (162, 11, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (163, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (164, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (165, 31, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (166, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (168, 4, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (169, 20, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (170, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (171, 14, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (172, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (173, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (174, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (175, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (176, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (176, 12, 0.01, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (177, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (178, 20, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (179, 14, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (180, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (181, 14, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (182, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (183, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (184, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (184, 30, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (185, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (186, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (188, 11, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (189, 22, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (190, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (191, 4, 0.4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (193, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (195, 20, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (196, 22, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (198, 22, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (199, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (200, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (201, 31, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (202, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (203, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (204, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (205, 29, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (206, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (207, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (208, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (209, 29, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (210, 31, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (210, 46, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (211, 14, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (212, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (213, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (214, 22, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (215, 22, 1, NULL, NULL)
GO
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (216, 31, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (217, 29, 2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (218, 55, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (219, 57, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (220, 55, 4, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (222, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (225, 29, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (226, 29, 2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (227, 14, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (228, 14, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (229, 18, 0.5, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (230, 18, 2, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (232, 27, 1, NULL, NULL)
INSERT [dbo].[NguyenLieuXuat] ([MaXuatKho_id], [MaNguyenLieu_id], [SoLuongXuat], [DonGia], [ThanhTien]) VALUES (234, 29, 0.5, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[NhaCC] ON 

INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (1, N'Cung Cấp Hải Sản Tươi Cần Thơ', N'Cần Thơ', N'0971024568')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (2, N'Cung Cấp Rau Sạch DaLatVegatable', N'Sài Gòn', N'0971024568')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (3, N'Cung Cấp Gia Vị Trường An', N'Sài Gòn', N'0971024568')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (4, N'Cung Cấp Gia Vị Thuận Phát', N'Sài Gòn', N'0654251543')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (5, N'Đại Lý Bia Sài Gòn', N'Sài Gòn', N'0254587854')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (6, N'Đại Lý Bia Và Nước Uống Chánh Thắng', N'Sài Gòn', N'0123654585')
INSERT [dbo].[NhaCC] ([MaNCC], [TenNCC], [DiaChi], [SoDienThoai]) VALUES (8, N'Vinmart Cần Thơ', N'Cần Thơ', N'0123456778')
SET IDENTITY_INSERT [dbo].[NhaCC] OFF
GO
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'Admin', N'abc123', N'NV Admin', CAST(N'2000-05-05' AS Date), N'0347234567', 3, 0)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'baochau', N'abc123', N'Nguyễn Khánh Bảo Châu', CAST(N'2005-05-20' AS Date), N'0365787625', 1, 0)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'dieutk2004', N'abc123', N'Trần Kỷ Diệu', CAST(N'2005-04-20' AS Date), N'0365787605', 1, 4)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'dieutk2005', N'abc123', N'Trần Kỷ Diệu', CAST(N'2005-03-20' AS Date), N'0365787605', 2, 0)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'duchuong', N'abc123', N'Đức Hướng Idol', CAST(N'2005-04-20' AS Date), N'0365787605', 1, 0)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'duchuong123', N'abc123', N'Đức Hướng Master Chef', CAST(N'2005-05-30' AS Date), N'0983528262', 4, 0)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'duchuong2005', N'abc123', N'Đức Hướng', CAST(N'2005-08-12' AS Date), N'0365787605', 2, 0)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'duchuongidol2005', N'abc123', N'Nguyễn Đức Hướng', CAST(N'2005-05-30' AS Date), N'0982547648', 1, 0)
INSERT [dbo].[NhanVien] ([TaiKhoanNV], [MatKhauNV], [TenNhanVien], [NgaySinh], [SoDienThoai], [MaQuyen_id], [TrangThai]) VALUES (N'trankydieu', N'abc123', N'Trần Kỷ Diệu Chef', CAST(N'2005-04-20' AS Date), N'0983568726', 4, 0)
GO
SET IDENTITY_INSERT [dbo].[NhomMonAn] ON 

INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (1, N'Món Chay')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (2, N'Món Việt')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (3, N'Món Nhật')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (4, N'Món Âu')
INSERT [dbo].[NhomMonAn] ([MaNMA], [TenNMA]) VALUES (5, N'Món Khác')
SET IDENTITY_INSERT [dbo].[NhomMonAn] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuNhap] ON 

INSERT [dbo].[PhieuNhap] ([MaPhieuNhap], [NgayNhap], [TongTien], [TaiKhoanNV_id], [MaNCC_id]) VALUES (13, CAST(N'2025-06-18' AS Date), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[PhieuNhap] OFF
GO
SET IDENTITY_INSERT [dbo].[Quyen] ON 

INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (1, N'Nhân Viên Phục Vụ', N'Nhân viên sử dụng phần mềm để order, thanh toán')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (2, N'Nhân Viên Kho', N'Nhân viên sử dụng phần mềm để quản lý kho')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (3, N'Quản Lý Nhà Hàng', N'Quản lý nhà hàng sử dụng phần mềm để quản lý nhân viên, menu, nhà hàng')
INSERT [dbo].[Quyen] ([MaQuyen], [TenQuyen], [GhiChu]) VALUES (4, N'Nhân Viên Bếp', N'Nhân viên không sử dụng phần mềm. Nhưng được dùng để quản lý thông tin làm việc')
SET IDENTITY_INSERT [dbo].[Quyen] OFF
GO
SET IDENTITY_INSERT [dbo].[Tang] ON 

INSERT [dbo].[Tang] ([MaTang], [TenTang]) VALUES (1, N'Tầng 1')
INSERT [dbo].[Tang] ([MaTang], [TenTang]) VALUES (2, N'Tầng 2')
INSERT [dbo].[Tang] ([MaTang], [TenTang]) VALUES (3, N'Tầng 3')
SET IDENTITY_INSERT [dbo].[Tang] OFF
GO
SET IDENTITY_INSERT [dbo].[XuatKho] ON 

INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (118, CAST(N'2025-06-08T09:10:40.490' AS DateTime), CAST(N'2025-06-08T09:10:40.477' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (119, CAST(N'2025-06-08T09:11:00.623' AS DateTime), CAST(N'2025-06-08T09:11:00.613' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (120, CAST(N'2025-06-08T09:46:23.503' AS DateTime), CAST(N'2025-06-08T09:46:23.493' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (121, CAST(N'2025-06-08T09:47:41.650' AS DateTime), CAST(N'2025-06-08T09:47:41.643' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (122, CAST(N'2025-06-12T22:30:53.860' AS DateTime), CAST(N'2025-06-12T22:30:53.853' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (123, CAST(N'2025-06-12T22:30:57.293' AS DateTime), CAST(N'2025-06-12T22:30:57.293' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (124, CAST(N'2025-06-12T22:37:01.697' AS DateTime), CAST(N'2025-06-12T22:37:01.693' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (125, CAST(N'2025-06-12T22:37:06.417' AS DateTime), CAST(N'2025-06-12T22:37:06.413' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (126, CAST(N'2025-06-12T22:37:09.303' AS DateTime), CAST(N'2025-06-12T22:37:09.300' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (127, CAST(N'2025-06-12T22:37:13.360' AS DateTime), CAST(N'2025-06-12T22:37:13.357' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (128, CAST(N'2025-06-12T22:37:20.260' AS DateTime), CAST(N'2025-06-12T22:37:20.257' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (129, CAST(N'2025-06-12T22:37:25.027' AS DateTime), CAST(N'2025-06-12T22:37:25.027' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (130, CAST(N'2025-06-12T22:37:29.937' AS DateTime), CAST(N'2025-06-12T22:37:29.933' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (131, CAST(N'2025-06-12T22:37:36.800' AS DateTime), CAST(N'2025-06-12T22:37:36.797' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (132, CAST(N'2025-06-12T22:37:40.677' AS DateTime), CAST(N'2025-06-12T22:37:40.670' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (133, CAST(N'2025-06-12T22:37:51.830' AS DateTime), CAST(N'2025-06-12T22:37:51.827' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (134, CAST(N'2025-06-12T22:37:56.863' AS DateTime), CAST(N'2025-06-12T22:37:56.843' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (135, CAST(N'2025-06-12T22:38:09.327' AS DateTime), CAST(N'2025-06-12T22:38:09.323' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (136, CAST(N'2025-06-12T22:38:13.347' AS DateTime), CAST(N'2025-06-12T22:38:13.343' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (137, CAST(N'2025-06-12T22:38:20.400' AS DateTime), CAST(N'2025-06-12T22:38:20.400' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (138, CAST(N'2025-06-12T22:38:27.830' AS DateTime), CAST(N'2025-06-12T22:38:27.827' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (139, CAST(N'2025-06-12T22:38:32.407' AS DateTime), CAST(N'2025-06-12T22:38:32.403' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (140, CAST(N'2025-06-12T22:38:37.860' AS DateTime), CAST(N'2025-06-12T22:38:37.857' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (141, CAST(N'2025-06-12T22:38:43.817' AS DateTime), CAST(N'2025-06-12T22:38:43.817' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (142, CAST(N'2025-06-12T22:38:54.623' AS DateTime), CAST(N'2025-06-12T22:38:54.623' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (143, CAST(N'2025-06-12T22:39:09.470' AS DateTime), CAST(N'2025-06-12T22:39:09.467' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (144, CAST(N'2025-06-12T22:39:19.340' AS DateTime), CAST(N'2025-06-12T22:39:19.340' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (145, CAST(N'2025-06-13T17:37:21.090' AS DateTime), CAST(N'2025-06-13T17:37:21.080' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (146, CAST(N'2025-06-13T17:37:24.673' AS DateTime), CAST(N'2025-06-13T17:37:24.670' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (147, CAST(N'2025-06-14T15:32:52.330' AS DateTime), CAST(N'2025-06-14T15:32:52.303' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (148, CAST(N'2025-06-14T15:32:55.807' AS DateTime), CAST(N'2025-06-14T15:32:55.803' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (149, CAST(N'2025-06-14T15:43:07.663' AS DateTime), CAST(N'2025-06-14T15:43:07.643' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (150, CAST(N'2025-06-14T15:43:07.920' AS DateTime), CAST(N'2025-06-14T15:43:07.913' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (151, CAST(N'2025-06-14T15:43:08.053' AS DateTime), CAST(N'2025-06-14T15:43:08.043' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (152, CAST(N'2025-06-14T15:43:11.523' AS DateTime), CAST(N'2025-06-14T15:43:11.517' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (153, CAST(N'2025-06-15T00:42:46.173' AS DateTime), CAST(N'2025-06-15T00:42:46.167' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (154, CAST(N'2025-06-15T03:29:28.100' AS DateTime), CAST(N'2025-06-15T03:29:28.087' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (155, CAST(N'2025-06-15T03:29:31.677' AS DateTime), CAST(N'2025-06-15T03:29:31.677' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (156, CAST(N'2025-06-15T03:31:45.640' AS DateTime), CAST(N'2025-06-15T03:31:45.637' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (157, CAST(N'2025-06-15T03:31:48.050' AS DateTime), CAST(N'2025-06-15T03:31:48.047' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (158, CAST(N'2025-06-15T09:11:04.790' AS DateTime), CAST(N'2025-06-15T09:11:04.763' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (159, CAST(N'2025-06-15T09:11:08.300' AS DateTime), CAST(N'2025-06-15T09:11:08.293' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (160, CAST(N'2025-06-15T09:11:11.473' AS DateTime), CAST(N'2025-06-15T09:11:11.467' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (161, CAST(N'2025-06-15T09:11:19.210' AS DateTime), CAST(N'2025-06-15T09:11:19.200' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (162, CAST(N'2025-06-15T09:11:25.090' AS DateTime), CAST(N'2025-06-15T09:11:25.087' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (163, CAST(N'2025-06-15T09:12:26.987' AS DateTime), CAST(N'2025-06-15T09:12:26.983' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (164, CAST(N'2025-06-15T09:12:30.113' AS DateTime), CAST(N'2025-06-15T09:12:30.103' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (165, CAST(N'2025-06-15T09:12:38.040' AS DateTime), CAST(N'2025-06-15T09:12:38.037' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (166, CAST(N'2025-06-15T09:21:52.730' AS DateTime), CAST(N'2025-06-15T09:21:52.723' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (167, CAST(N'2025-06-15T09:21:55.457' AS DateTime), CAST(N'2025-06-15T09:21:55.447' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (168, CAST(N'2025-06-15T09:21:58.510' AS DateTime), CAST(N'2025-06-15T09:21:58.463' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (169, CAST(N'2025-06-15T15:05:02.993' AS DateTime), CAST(N'2025-06-15T15:05:02.983' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (170, CAST(N'2025-06-15T15:05:06.163' AS DateTime), CAST(N'2025-06-15T15:05:06.160' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (171, CAST(N'2025-06-15T15:05:09.537' AS DateTime), CAST(N'2025-06-15T15:05:09.537' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (172, CAST(N'2025-06-15T15:10:01.310' AS DateTime), CAST(N'2025-06-15T15:10:01.310' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (173, CAST(N'2025-06-15T15:10:05.300' AS DateTime), CAST(N'2025-06-15T15:10:05.300' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (174, CAST(N'2025-06-15T15:10:10.347' AS DateTime), CAST(N'2025-06-15T15:10:10.343' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (175, CAST(N'2025-06-15T16:28:11.760' AS DateTime), CAST(N'2025-06-15T16:28:11.750' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (176, CAST(N'2025-06-15T16:28:14.723' AS DateTime), CAST(N'2025-06-15T16:28:14.723' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (177, CAST(N'2025-06-15T16:28:17.260' AS DateTime), CAST(N'2025-06-15T16:28:17.257' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (178, CAST(N'2025-06-15T16:30:05.817' AS DateTime), CAST(N'2025-06-15T16:30:05.813' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (179, CAST(N'2025-06-15T16:30:09.180' AS DateTime), CAST(N'2025-06-15T16:30:09.177' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (180, CAST(N'2025-06-15T16:30:11.880' AS DateTime), CAST(N'2025-06-15T16:30:11.877' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (181, CAST(N'2025-06-15T16:31:22.793' AS DateTime), CAST(N'2025-06-15T16:31:22.790' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (182, CAST(N'2025-06-15T18:33:56.470' AS DateTime), CAST(N'2025-06-15T18:33:56.463' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (183, CAST(N'2025-06-15T18:34:00.180' AS DateTime), CAST(N'2025-06-15T18:34:00.177' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (184, CAST(N'2025-06-15T18:34:02.570' AS DateTime), CAST(N'2025-06-15T18:34:02.567' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (185, CAST(N'2025-06-15T18:34:05.417' AS DateTime), CAST(N'2025-06-15T18:34:05.410' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (186, CAST(N'2025-06-15T18:34:10.010' AS DateTime), CAST(N'2025-06-15T18:34:10.010' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (187, CAST(N'2025-06-15T18:47:20.097' AS DateTime), CAST(N'2025-06-15T18:47:20.087' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (188, CAST(N'2025-06-15T18:47:23.163' AS DateTime), CAST(N'2025-06-15T18:47:23.160' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (189, CAST(N'2025-06-15T18:47:26.203' AS DateTime), CAST(N'2025-06-15T18:47:26.200' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (190, CAST(N'2025-06-15T19:06:39.923' AS DateTime), CAST(N'2025-06-15T19:06:39.193' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (191, CAST(N'2025-06-15T19:30:03.830' AS DateTime), CAST(N'2025-06-15T19:30:03.820' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (192, CAST(N'2025-06-15T19:30:07.343' AS DateTime), CAST(N'2025-06-15T19:30:07.340' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (193, CAST(N'2025-06-15T19:30:19.400' AS DateTime), CAST(N'2025-06-15T19:30:19.397' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (194, CAST(N'2025-06-15T19:32:44.993' AS DateTime), CAST(N'2025-06-15T19:32:44.977' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (195, CAST(N'2025-06-15T19:55:46.220' AS DateTime), CAST(N'2025-06-15T19:55:46.210' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (196, CAST(N'2025-06-15T19:55:49.207' AS DateTime), CAST(N'2025-06-15T19:55:49.207' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (197, CAST(N'2025-06-15T19:56:08.030' AS DateTime), CAST(N'2025-06-15T19:56:08.030' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (198, CAST(N'2025-06-15T19:56:11.220' AS DateTime), CAST(N'2025-06-15T19:56:11.217' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (199, CAST(N'2025-06-15T19:57:51.443' AS DateTime), CAST(N'2025-06-15T19:57:51.440' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (200, CAST(N'2025-06-15T21:26:05.453' AS DateTime), CAST(N'2025-06-15T21:26:05.447' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (201, CAST(N'2025-06-15T22:05:06.943' AS DateTime), CAST(N'2025-06-15T22:05:06.937' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (202, CAST(N'2025-06-15T22:05:10.460' AS DateTime), CAST(N'2025-06-15T22:05:10.457' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (203, CAST(N'2025-06-15T22:07:22.960' AS DateTime), CAST(N'2025-06-15T22:07:22.953' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (204, CAST(N'2025-06-16T01:01:58.353' AS DateTime), CAST(N'2025-06-16T01:01:58.343' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (205, CAST(N'2025-06-16T01:02:02.273' AS DateTime), CAST(N'2025-06-16T01:02:02.273' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (206, CAST(N'2025-06-16T01:02:41.327' AS DateTime), CAST(N'2025-06-16T01:02:41.253' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (207, CAST(N'2025-06-16T01:04:25.660' AS DateTime), CAST(N'2025-06-16T01:04:25.660' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (208, CAST(N'2025-06-16T01:28:33.343' AS DateTime), CAST(N'2025-06-16T01:28:33.317' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (209, CAST(N'2025-06-16T01:28:37.570' AS DateTime), CAST(N'2025-06-16T01:28:37.567' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (210, CAST(N'2025-06-16T01:34:31.617' AS DateTime), CAST(N'2025-06-16T01:34:31.603' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (211, CAST(N'2025-06-16T01:34:41.907' AS DateTime), CAST(N'2025-06-16T01:34:41.907' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (212, CAST(N'2025-06-16T01:44:28.640' AS DateTime), CAST(N'2025-06-16T01:44:28.637' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (213, CAST(N'2025-06-16T01:44:32.260' AS DateTime), CAST(N'2025-06-16T01:44:32.260' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (214, CAST(N'2025-06-16T02:02:15.687' AS DateTime), CAST(N'2025-06-16T02:02:15.680' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (215, CAST(N'2025-06-16T02:02:19.580' AS DateTime), CAST(N'2025-06-16T02:02:19.577' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (216, CAST(N'2025-06-16T02:03:32.790' AS DateTime), CAST(N'2025-06-16T02:03:32.790' AS DateTime), 0)
GO
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (217, CAST(N'2025-06-16T02:04:19.740' AS DateTime), CAST(N'2025-06-16T02:04:19.733' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (218, CAST(N'2025-06-16T02:05:35.983' AS DateTime), CAST(N'2025-06-16T02:05:35.980' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (219, CAST(N'2025-06-16T02:05:41.127' AS DateTime), CAST(N'2025-06-16T02:05:41.123' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (220, CAST(N'2025-06-16T02:05:46.447' AS DateTime), CAST(N'2025-06-16T02:05:46.440' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (221, CAST(N'2025-06-18T05:00:18.840' AS DateTime), CAST(N'2025-06-18T05:00:18.823' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (222, CAST(N'2025-06-18T05:00:22.550' AS DateTime), CAST(N'2025-06-18T05:00:22.550' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (223, CAST(N'2025-06-18T05:13:54.870' AS DateTime), CAST(N'2025-06-18T05:13:54.863' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (224, CAST(N'2025-06-18T05:17:55.450' AS DateTime), CAST(N'2025-06-18T05:17:55.450' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (225, CAST(N'2025-06-18T05:19:18.557' AS DateTime), CAST(N'2025-06-18T05:19:18.550' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (226, CAST(N'2025-06-18T05:19:22.280' AS DateTime), CAST(N'2025-06-18T05:19:22.277' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (227, CAST(N'2025-06-18T05:27:34.387' AS DateTime), CAST(N'2025-06-18T05:27:34.383' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (228, CAST(N'2025-06-18T05:27:43.873' AS DateTime), CAST(N'2025-06-18T05:27:43.870' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (229, CAST(N'2025-06-18T10:57:55.140' AS DateTime), CAST(N'2025-06-18T10:57:55.127' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (230, CAST(N'2025-06-18T10:57:59.330' AS DateTime), CAST(N'2025-06-18T10:57:59.323' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (231, CAST(N'2025-07-04T16:31:22.657' AS DateTime), CAST(N'2025-07-04T16:31:22.650' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (232, CAST(N'2025-07-04T16:43:55.397' AS DateTime), CAST(N'2025-07-04T16:43:55.387' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (233, CAST(N'2025-07-04T16:44:11.630' AS DateTime), CAST(N'2025-07-04T16:44:11.627' AS DateTime), 0)
INSERT [dbo].[XuatKho] ([MaXuatKho], [NgayNhap], [NgayXuat], [TongTien]) VALUES (234, CAST(N'2025-07-04T16:45:43.673' AS DateTime), CAST(N'2025-07-04T16:45:43.673' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[XuatKho] OFF
GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((4)) FOR [SoGhe]
GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((0)) FOR [Vip]
GO
ALTER TABLE [dbo].[Ban] ADD  DEFAULT ((0)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[ChiTietHoaDon] ADD  DEFAULT (getdate()) FOR [NgayGoi]
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap] ADD  DEFAULT ((0)) FOR [SoLuongNhap]
GO
ALTER TABLE [dbo].[ChiTietSanPham] ADD  DEFAULT ((0)) FOR [SoLuongDung]
GO
ALTER TABLE [dbo].[ChiTietSanPham] ADD  DEFAULT ((0)) FOR [Tru]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__TenKhach__5441852A]  DEFAULT (N'Khach Hang A') FOR [TenKhachHang]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__NgayTao__5535A963]  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[HoaDon] ADD  CONSTRAINT [DF__HoaDon__TrangTha__5629CD9C]  DEFAULT ((0)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[HoanTra] ADD  DEFAULT (getdate()) FOR [NgayHoanTra]
GO
ALTER TABLE [dbo].[HoanTra] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[LichSuGoiMon] ADD  DEFAULT (getdate()) FOR [ThoiGianGoi]
GO
ALTER TABLE [dbo].[LichSuGoiMon] ADD  DEFAULT (getdate()) FOR [ThoiGianTra]
GO
ALTER TABLE [dbo].[LoaiMonAn] ADD  DEFAULT ((0)) FOR [TongSoLuong]
GO
ALTER TABLE [dbo].[LoaiNguyenLieu] ADD  DEFAULT ((0)) FOR [TongSoLuong]
GO
ALTER TABLE [dbo].[MonAn] ADD  DEFAULT ((0)) FOR [DonGia]
GO
ALTER TABLE [dbo].[MonAn] ADD  DEFAULT (getdate()) FOR [NgayCapNhat]
GO
ALTER TABLE [dbo].[MonAn] ADD  DEFAULT ((0)) FOR [SoLuongDaBan]
GO
ALTER TABLE [dbo].[NguyenLieu] ADD  DEFAULT ((0)) FOR [SoLuongHienCon]
GO
ALTER TABLE [dbo].[NguyenLieu] ADD  DEFAULT ((0)) FOR [GiaNhapCuoi]
GO
ALTER TABLE [dbo].[NguyenLieuXuat] ADD  CONSTRAINT [DF__NguyenLie__SoLuo__68487DD7]  DEFAULT ((0)) FOR [SoLuongXuat]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[PhieuNhap] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[XuatKho] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[XuatKho] ADD  DEFAULT ((0)) FOR [TongTien]
GO
ALTER TABLE [dbo].[Ban]  WITH CHECK ADD FOREIGN KEY([MaTang_id])
REFERENCES [dbo].[Tang] ([MaTang])
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietHo__MaHoa__5AEE82B9] FOREIGN KEY([MaHoaDon_id])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[ChiTietHoaDon] CHECK CONSTRAINT [FK__ChiTietHo__MaHoa__5AEE82B9]
GO
ALTER TABLE [dbo].[ChiTietHoaDon]  WITH CHECK ADD FOREIGN KEY([MaMonAn_id])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[ChiTietPhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaPhieuNhap_id])
REFERENCES [dbo].[PhieuNhap] ([MaPhieuNhap])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaMonAn_id])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[ChiTietSanPham]  WITH CHECK ADD FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK__HoaDon__MaBan_id__571DF1D5] FOREIGN KEY([MaBan_id])
REFERENCES [dbo].[Ban] ([MaBan])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK__HoaDon__MaBan_id__571DF1D5]
GO
ALTER TABLE [dbo].[LichSuGoiMon]  WITH CHECK ADD  CONSTRAINT [FK__LichSuGoi__MaMon__60A75C0F] FOREIGN KEY([MaHoaDon_id])
REFERENCES [dbo].[HoaDon] ([MaHoaDon])
GO
ALTER TABLE [dbo].[LichSuGoiMon] CHECK CONSTRAINT [FK__LichSuGoi__MaMon__60A75C0F]
GO
ALTER TABLE [dbo].[LichSuGoiMon]  WITH CHECK ADD FOREIGN KEY([MaMonAn_id])
REFERENCES [dbo].[MonAn] ([MaMonAn])
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD FOREIGN KEY([MaLMA_id])
REFERENCES [dbo].[LoaiMonAn] ([MaLMA])
GO
ALTER TABLE [dbo].[MonAn]  WITH CHECK ADD FOREIGN KEY([MaNMA_id])
REFERENCES [dbo].[NhomMonAn] ([MaNMA])
GO
ALTER TABLE [dbo].[NguyenLieu]  WITH CHECK ADD FOREIGN KEY([MaLNL_id])
REFERENCES [dbo].[LoaiNguyenLieu] ([MaLNL])
GO
ALTER TABLE [dbo].[NguyenLieuTra]  WITH CHECK ADD FOREIGN KEY([MaHoanTra_id])
REFERENCES [dbo].[HoanTra] ([MaHoanTra])
GO
ALTER TABLE [dbo].[NguyenLieuTra]  WITH CHECK ADD FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[NguyenLieuXuat]  WITH CHECK ADD  CONSTRAINT [FK__NguyenLie__MaNgu__6A30C649] FOREIGN KEY([MaNguyenLieu_id])
REFERENCES [dbo].[NguyenLieu] ([MaNguyenLieu])
GO
ALTER TABLE [dbo].[NguyenLieuXuat] CHECK CONSTRAINT [FK__NguyenLie__MaNgu__6A30C649]
GO
ALTER TABLE [dbo].[NguyenLieuXuat]  WITH CHECK ADD  CONSTRAINT [FK__NguyenLie__MaXua__693CA210] FOREIGN KEY([MaXuatKho_id])
REFERENCES [dbo].[XuatKho] ([MaXuatKho])
GO
ALTER TABLE [dbo].[NguyenLieuXuat] CHECK CONSTRAINT [FK__NguyenLie__MaXua__693CA210]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD FOREIGN KEY([MaQuyen_id])
REFERENCES [dbo].[Quyen] ([MaQuyen])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([MaNCC_id])
REFERENCES [dbo].[NhaCC] ([MaNCC])
GO
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD FOREIGN KEY([TaiKhoanNV_id])
REFERENCES [dbo].[NhanVien] ([TaiKhoanNV])
GO
USE [master]
GO
ALTER DATABASE [NhaHang] SET  READ_WRITE 
GO
