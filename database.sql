USE [master]
GO
/****** Object:  Database [QuanLyShopQuanAo]    Script Date: 16/12/2018 10:48:21 ******/
CREATE DATABASE [QuanLyShopQuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyShopQuanAo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyShopQuanAo.mdf' , SIZE = 7168KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyShopQuanAo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyShopQuanAo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyShopQuanAo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyShopQuanAo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyShopQuanAo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyShopQuanAo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyShopQuanAo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyShopQuanAo]
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_CheckTaiKhoan]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_CheckTaiKhoan]
(
	@tenTaiKhoan nvarchar(150),
	@matKhau nvarchar(150)
)
as
begin
	select *
	 from tblTaiKhoan
	 where TaiKhoan = @tenTaiKhoan and MatKhau = @matKhau
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachChiTietHoaDonNhap]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachChiTietHoaDonNhap]
as
begin
	select cthd.MaHD, sp.MaSP, sp.Name, tk.MaTK, tk.Ten, ncc.MaNCC, ncc.TenNCC, NgayNhap, cthd.SoLuong, cthd.DonGia 
	from tblChiTietHoaDonNhap cthd
	inner join tblHoaDonNhap hdn on hdn.MaHD = cthd.MaHD
	inner join tblChiTietSP sp on sp.MaSP = cthd.MaSP
	inner join tblTaiKhoan tk on tk.MaTK = hdn.MaTK
	inner join tblNhaCungCap ncc on ncc.MaNCC = hdn.MaNCC
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachKhachHang]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachKhachHang]
as
begin
	select * from tblKhachHang
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachMauSacTheoMa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachMauSacTheoMa]
(
	@MaSP nvarchar(50)
)
as
begin
	select ms.IDMauSac, ms.TenMauSac, spms.Images from tblMauSac ms
	inner join tblSanPhamMauSac spms on spms.IDMauSac = ms.IDMauSac
	where spms.IDSanPham = @MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachMenu]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachMenu]
as
begin
	select * from tblMenu
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachNhomDoTuoi]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachNhomDoTuoi]
as
begin
	select * from tblDoTuoi
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachNhomDoTuoiTheoMa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachNhomDoTuoiTheoMa]
(
	@MaSP nvarchar(50)
)
as
begin
	select * from tblDoTuoi dt
	inner join tblSanPhamDoTuoi spdt on spdt.IDNhomTuoi = dt.IDNhomTuoi
	where spdt.MaSP = @MaSP
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachNhomSanPham]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachNhomSanPham]
as
begin
	select * from tblNhomSP
	order by Name asc
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachNhomSanPhamTheoMenu]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachNhomSanPhamTheoMenu]
(
	@MainMenuID nvarchar(50)
)
as
begin
	select * from tblNhomSP
	where MainMenuID = @MainMenuID
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachSanPham]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachSanPham]
as
begin
	select * from tblChiTietSP
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamBanChay]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamBanChay]
as
begin
	select * from tblChiTietSP
	where MaSP in (select top 4 MaSP as sl  from tblChiTietHoaDonBan cthdb
					inner join tblHoaDonBan hdb on hdb.MaHD = cthdb.MaHD
					Group by MaSP
					order by count(MaSP) desc)
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamBanChay1]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamBanChay1]
as
begin
	select * from tblChiTietSP
	where MaSP in (select top 4 MaSP as sl  from tblChiTietHoaDonBan cthdb
					inner join tblHoaDonBan hdb on hdb.MaHD = cthdb.MaHD
					Group by MaSP
					order by count(MaSP) desc)
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamTheoKeyWordSearch]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamTheoKeyWordSearch]
(
	@keyWord nvarchar(max)
)
as
begin
	select * from tblChiTietSP
	where LOWER(dbo.fChuyenCoDauThanhKhongDau(Name)) like N'%' + @keyWord + '%'
		or GiaMoi like N'%' + @keyWord + '%'
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_layDanhSachSanPhamTheoMenu]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_layDanhSachSanPhamTheoMenu]
(
	@IDMenu nvarchar(50)
)
as
begin
	select *  from tblChiTietSP sp
	inner join tblNhomSP nsp on nsp.MaNhomSP = sp.IDNhomSP
	where MainMenuID = @IDMenu
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_layDanhSachSanPhamTheoNhom]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_layDanhSachSanPhamTheoNhom]
(
	@soLuong int,
	@loaiNhom nvarchar(50)
)
as
begin
	select top (@soLuong)* from tblChiTietSP sp
	inner join tblNhomSP nsp on nsp.MaNhomSP = sp.IDNhomSP
	where nsp.Name like N'%'+@loaiNhom+'%'
	order by sp.MaSP desc
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_layDanhSachSanPhamTheoNhomSP]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_layDanhSachSanPhamTheoNhomSP]
(
	@IDNhomSP nvarchar(50)
)
as
begin
	select *  from tblChiTietSP
	where IDNhomSP = @IDNhomSP
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamTrongGioHang]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayDanhSachSanPhamTrongGioHang]
(
	@maTaiKhoan nvarchar(50)
)
as
begin
	select * from tblGioHang
	where MaTK = @maTaiKhoan
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayImageSPTheoMaSPvaMaMS]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayImageSPTheoMaSPvaMaMS]
(
	@MaSP nvarchar(50),
	@MaMS nvarchar(50)
)
as
begin
	select ms.IDMauSac, ms.TenMauSac, spms.Images from tblMauSac ms
	inner join tblSanPhamMauSac spms on spms.IDMauSac = ms.IDMauSac
	where spms.IDSanPham = @MaSP and ms.IDMauSac = @MaMS
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayMaxGia]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayMaxGia]
as
begin
	select top 1 * from tblChiTietSP
	order by GiaMoi desc
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LaySoLuongGioHangTheoMa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LaySoLuongGioHangTheoMa]
(
	@maSanPham nvarchar(50)
)
as
begin
	select SUM(SoLuong) as sl from tblGioHang
	where MaSP = @maSanPham
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayThongTinDoTuoiTheoMa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayThongTinDoTuoiTheoMa]
(
	@MaNDT nvarchar(50)
)
as
begin
	select * from tblDoTuoi
	where IDNhomTuoi = @MaNDT
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayThongTinMenuTheoMa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayThongTinMenuTheoMa]
(
	@maMenu nvarchar(50)
)
as
begin
	select * from tblMenu
	where ID = @maMenu
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayThongTinNhomSanPhamTheoMa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayThongTinNhomSanPhamTheoMa]
(
	@IDNhomSP nvarchar(50)
)
as
begin
	select * from tblNhomSP
	where MaNhomSP = @IDNhomSP
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LayThongTinSanPhamTheoMaSanPham]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LayThongTinSanPhamTheoMaSanPham]
(
	@maSanPham nvarchar(50)
)
as
begin
	select * from tblChiTietSP
	where MaSP = @maSanPham
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LocSanPhamTheoGia]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LocSanPhamTheoGia]
(
	@maMenu nvarchar(50),
	@maDoTuoi nvarchar(50),
	@minGia int,
	@maxGia int
)
as
begin
	select * from tblChiTietSP
	where MaSP in (
				select sp.MaSP from tblChiTietSP sp
				inner join tblNhomSP nsp on nsp.MaNhomSP = sp.IDNhomSP
				inner join tblSanPhamDoTuoi spdt on spdt.MaSP = sp.MaSP
				where nsp.MainMenuID = @maMenu and GiaMoi >= @minGia and GiaMoi <= @maxGia and (spdt.IDNhomTuoi in (select * from [dbo].[SplitStringToTable](@maDoTuoi,' ')))
				Group by sp.MaSP
				)
	Order by MaSP asc
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_LocSanPhamTheoGiaVaNhom]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_LocSanPhamTheoGiaVaNhom]
(
	@maNhom nvarchar(50),
	@maDoTuoi nvarchar(50),
	@minGia int,
	@maxGia int
)
as
begin
	select * from tblChiTietSP
	where MaSP in (
				select sp.MaSP from tblChiTietSP sp
				inner join tblSanPhamDoTuoi spdt on spdt.MaSP = sp.MaSP
				where IDNhomSP = @maNhom and GiaMoi >= @minGia and GiaMoi <= @maxGia and (spdt.IDNhomTuoi in (select * from [dbo].[SplitStringToTable](@maDoTuoi,' ')))
				Group by sp.MaSP)
	Order by MaSP asc
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_ThemNhomSanPham]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_ThemNhomSanPham]
(
	@maNhomSanPham nvarchar(50), 
	@tenNhomSanPham nvarchar(150), 
	@chiTietNhomSanPham nvarchar(max), 
	@order int,
	@fileName1 nvarchar(max)
)
as
begin
	insert into tblNhomSP(MaNhomSP, Name, Content, NameImage, OrderTT) 
	values(@maNhomSanPham, @tenNhomSanPham, @chiTietNhomSanPham, @fileName1, @order)
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_ThemSanPham]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_ThemSanPham]
(
	@maSanPham nvarchar(50), 
	@tenSanPham nvarchar(150), 
	@chiTietSanPham nvarchar(max), 
	@giaBan int, 
	@order int, 
	@nhomSanPham nvarchar(50),
	@fileName1 nvarchar(max)
)
as
begin
	insert into tblChiTietSP(MaSP, Name, ChiTiet, Gia, GiaMoi, NameImage, OrderTT, IDNhomSP) 
	values(@maSanPham, @tenSanPham, @chiTietSanPham, @giaBan, @giaBan, @fileName1, @order, @nhomSanPham)
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_ThemSanPhamVaoGioHang]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_ThemSanPhamVaoGioHang]
(
	@maGioHang nvarchar(50),
	@mataiKhoan nvarchar(50),
	@MaSP nvarchar(50), 
	@MaMau nvarchar(50), 
	@MaDoTuoi nvarchar(50), 
	@SoLuong int
)
as
begin
	insert into tblGioHang(MaGioHang, MaTK, MaSP, MaMau, MaDoTuoi, SoLuong)
	values(@maGioHang, @mataiKhoan, @MaSP, @MaMau, @MaDoTuoi, @SoLuong)
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_ThemTaiKhoan]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_ThemTaiKhoan]
(
	@maTaiKhoan nvarchar(50),
	@tenTaiKhoan nvarchar(150), 
	@matKhau nvarchar(150),
	@rule int,
	@email nvarchar(150)
)
as
begin
	insert into tblTaiKhoan(MaTK, TaiKhoan, MatKhau, Rules,Ten, Email)
	values(@maTaiKhoan, @tenTaiKhoan, @matKhau, @rule, @tenTaiKhoan, @email)
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_UpDateThongTinGioHang]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_UpDateThongTinGioHang]
(
	@mataiKhoan nvarchar(50),
	@MaSP nvarchar(50), 
	@MaMau nvarchar(50), 
	@MaDoTuoi nvarchar(50), 
	@SoLuong int
)
as
begin
	update tblGioHang set SoLuong = @SoLuong
	where MaTK = @mataiKhoan and MaSP = @MaSP and MaMau = @MaMau and MaDoTuoi = @MaDoTuoi
end

GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_XoaNhomSanPham]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_XoaNhomSanPham]
(
	@maNhomSanPham nvarchar(50)
)
as
begin
	delete from tblNhomSP
	where MaNhomSP = @maNhomSanPham
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_XoaSanPham]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_XoaSanPham]
(
	@maSanPham nvarchar(50)
)
as
begin
	delete from tblChiTietSP
	where MaSP = @maSanPham
end
GO
/****** Object:  StoredProcedure [dbo].[QuanLyShopQuanAo_XoaSanPhamTrongGioHangTheoMa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[QuanLyShopQuanAo_XoaSanPhamTrongGioHangTheoMa]
(
	@maGioHang nvarchar(50)
)
as
begin
	delete from tblGioHang
	where MaGioHang = @maGioHang
end
GO
/****** Object:  UserDefinedFunction [dbo].[fChuyenCoDauThanhKhongDau]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fChuyenCoDauThanhKhongDau](@inputVar NVARCHAR(MAX) )
RETURNS NVARCHAR(MAX)
AS
BEGIN    
    IF (@inputVar IS NULL OR @inputVar = '')  RETURN ''
   
    DECLARE @RT NVARCHAR(MAX)
    DECLARE @SIGN_CHARS NCHAR(256)
    DECLARE @UNSIGN_CHARS NCHAR (256)
 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' + NCHAR(272) + NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'
 
    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
   
    SET @COUNTER = 1
    WHILE (@COUNTER <= LEN(@inputVar))
    BEGIN  
        SET @COUNTER1 = 1
        WHILE (@COUNTER1 <= LEN(@SIGN_CHARS) + 1)
        BEGIN
            IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@inputVar,@COUNTER ,1))
            BEGIN          
                IF @COUNTER = 1
                    SET @inputVar = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)-1)      
                ELSE
                    SET @inputVar = SUBSTRING(@inputVar, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)- @COUNTER)
                BREAK
            END
            SET @COUNTER1 = @COUNTER1 +1
        END
        SET @COUNTER = @COUNTER +1
    END
    -- SET @inputVar = replace(@inputVar,' ','-')
    RETURN @inputVar
END
GO
/****** Object:  UserDefinedFunction [dbo].[SplitStringToTable]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create FUNCTION [dbo].[SplitStringToTable]
(
    @string NVARCHAR(MAX),
    @delimiter CHAR(1)
)
RETURNS @output TABLE(
    data NVARCHAR(MAX)
)
BEGIN
    DECLARE @start INT, @end INT
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string)

    WHILE @start < LEN(@string) + 1 BEGIN
        IF @end = 0 
            SET @end = LEN(@string) + 1

        INSERT INTO @output (data) 
        VALUES(SUBSTRING(@string, @start, @end - @start))
        SET @start = @end + 1
        SET @end = CHARINDEX(@delimiter, @string, @start)
    END
    RETURN
END
GO
/****** Object:  Table [dbo].[tblChiTietHoaDonBan]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietHoaDonBan](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaSP] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_tblChiTietHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChiTietHoaDonNhap]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietHoaDonNhap](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaSP] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_tblChiTietHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChiTietSP]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChiTietSP](
	[MaSP] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[ChiTiet] [nvarchar](max) NULL,
	[Gia] [int] NULL,
	[GiaMoi] [int] NULL,
	[NameImage] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
	[OrderTT] [int] NULL,
	[Status] [int] NULL,
	[IDNhomSP] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblChiTietSP] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDoTuoi]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDoTuoi](
	[IDNhomTuoi] [nvarchar](50) NOT NULL,
	[Tuoi] [nvarchar](50) NULL,
	[ChieuCao] [nvarchar](50) NULL,
	[TrongLuong] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSIZE] PRIMARY KEY CLUSTERED 
(
	[IDNhomTuoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblGioHang]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGioHang](
	[MaGioHang] [nvarchar](50) NOT NULL,
	[MaTK] [nvarchar](50) NOT NULL,
	[MaSP] [nvarchar](50) NOT NULL,
	[MaMau] [nvarchar](50) NOT NULL,
	[MaDoTuoi] [nvarchar](50) NOT NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_tblGioHang] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC,
	[MaTK] ASC,
	[MaSP] ASC,
	[MaMau] ASC,
	[MaDoTuoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHoaDonBan]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDonBan](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaTK] [nvarchar](50) NULL,
	[MaKH] [nvarchar](50) NULL,
	[NgayBan] [date] NULL,
	[TrangThai] [int] NULL,
 CONSTRAINT [PK_tblHoaDonBan] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHoaDonNhap]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHoaDonNhap](
	[MaHD] [nvarchar](50) NOT NULL,
	[MaTK] [nvarchar](50) NULL,
	[MaNCC] [nvarchar](50) NULL,
	[NgayNhap] [datetime] NULL,
 CONSTRAINT [PK_tblHoaDonNhap] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHuyen]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHuyen](
	[ID] [int] NOT NULL,
	[TenHuyen] [nvarchar](150) NULL,
	[IDTinh] [int] NULL,
 CONSTRAINT [PK_tblHuyen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblKhachHang]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblKhachHang](
	[MaKH] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [nvarchar](20) NULL,
	[Email] [nvarchar](300) NULL,
 CONSTRAINT [PK_tblKhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMauSac]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMauSac](
	[IDMauSac] [nvarchar](50) NOT NULL,
	[TenMauSac] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblMauSac] PRIMARY KEY CLUSTERED 
(
	[IDMauSac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMenu]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Link] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhaCungCap]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenNCC] [nvarchar](150) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SDT] [nvarchar](20) NULL,
	[Email] [nvarchar](300) NULL,
 CONSTRAINT [PK_tblNhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNhomSP]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNhomSP](
	[MaNhomSP] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Content] [nvarchar](max) NULL,
	[NameImage] [nvarchar](max) NULL,
	[OrderTT] [int] NULL,
	[Status] [int] NULL,
	[Link] [nvarchar](500) NULL,
	[MainMenuID] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblNhomSP] PRIMARY KEY CLUSTERED 
(
	[MaNhomSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuangCao]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuangCao](
	[ID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Url] [nvarchar](500) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[Link] [nvarchar](500) NULL,
	[Target] [int] NULL,
	[Postion] [int] NULL,
	[Order] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tblQuangCao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSanPhamDoTuoi]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSanPhamDoTuoi](
	[MaSP] [nvarchar](50) NOT NULL,
	[IDNhomTuoi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SanPhamDoTuoi] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[IDNhomTuoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSanPhamMauSac]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSanPhamMauSac](
	[IDSanPham] [nvarchar](50) NOT NULL,
	[IDMauSac] [nvarchar](50) NOT NULL,
	[Images] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblSanPhamMauSac] PRIMARY KEY CLUSTERED 
(
	[IDSanPham] ASC,
	[IDMauSac] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[MaTK] [nvarchar](50) NOT NULL,
	[TaiKhoan] [nvarchar](150) NULL,
	[MatKhau] [nvarchar](150) NULL,
	[Rules] [int] NULL,
	[Ten] [nvarchar](150) NULL,
	[SDT] [nvarchar](20) NULL,
	[NgaySinh] [datetime] NULL,
	[DiaChi] [nvarchar](max) NULL,
	[Email] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblTaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblTinh]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTinh](
	[ID] [int] NOT NULL,
	[TenTinh] [nvarchar](150) NULL,
 CONSTRAINT [PK_tblTinh] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblXa]    Script Date: 16/12/2018 10:48:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblXa](
	[ID] [int] NOT NULL,
	[TenXa] [nvarchar](150) NULL,
	[IDHuyen] [int] NULL,
 CONSTRAINT [PK_tblXa] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblChiTietHoaDonBan] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00001', N'SP00001', 2, 200)
INSERT [dbo].[tblChiTietHoaDonBan] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00001', N'SP00002', 3, 300)
INSERT [dbo].[tblChiTietHoaDonBan] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00001', N'SP00003', 4, 200)
INSERT [dbo].[tblChiTietHoaDonBan] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00002', N'SP00001', 4, 600)
INSERT [dbo].[tblChiTietHoaDonBan] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00002', N'SP00002', 6, 600)
INSERT [dbo].[tblChiTietHoaDonBan] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00002', N'SP00003', 5, 500)
INSERT [dbo].[tblChiTietHoaDonBan] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00004', N'SP00005', 2, 400)
INSERT [dbo].[tblChiTietHoaDonNhap] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00001', N'SP00001', 200, 2000)
INSERT [dbo].[tblChiTietHoaDonNhap] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00001', N'SP00002', 150, 2500)
INSERT [dbo].[tblChiTietHoaDonNhap] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00001', N'SP00003', 250, 3000)
INSERT [dbo].[tblChiTietHoaDonNhap] ([MaHD], [MaSP], [SoLuong], [DonGia]) VALUES (N'HD00002', N'SP00001', 100, 2000)
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00001', N'Áo sơ mi bé trai 2-3 tuổi sọc caro tay dài cá tính', N'Áo sơ mi bé trai 2-3 tuổi, với màu kẻ sọc đang là màu hot trend và không bao giờ lỗi mốt trong làng thời trang trẻ em năm nay.', 122, 100, N'ao-so-mi-soc-caro-tay-dai-cho-be-trai_(2).jpg', 5, NULL, NULL, N'NH00001')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00002', N'Áo sơ mi cho bé trai sọc caro tay dài 7-8 tuổi', N'Áo sơ mi dài tay cho bé trai - Kiểu áo nam tính, lịch lãm với chất liệu vải kate mềm mát cho bé vẻ ngoài thật phong cách.', 132, 165, N'ao-so-mi-soc-caro-tay-dai-cho-be-trai-size-dai_(1).jpg', 30, NULL, NULL, N'NH00001')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00003', N'Áo sơ mi bé trai tay dài in hình cây dừa 7-8 tuổi', N'Áo sơ mi bé trai tay dài từ 10kg đến 30kg - Kiểu áo tay dài cùng họa tiết kẻ sọc vô cùng lịch lãm cho bé phối đồ đi học, đi chơi hay đi tiệc đều đẹp.', 128, 110, N'ao-so-mi-tay-dai-in-hinh-cay-dua-cho-be-trai_(1).jpg', 30, NULL, NULL, N'NH00001')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00004', N'Đầm Bé Gái 5-6 Tuổi Dáng Baby Doll Xinh Xắn', N'Đầm Bé Gái 5 Đến 6 Tuổi - Thiết Kế Dáng Baby Doll Xinh Xắn Cho Bé Yêu Tung Tăng Xuống Phố Cùng Ba Mẹ Vào Những Dịp Cuối Tuần.', 132, 130, N'dam-be-gai-3-8-tuoi-dang-baby-doll-xinh-xan_(3).jpg', 15, 1, NULL, N'NH00012')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00005', N'Áo sơ mi tay dài cho bé trai sọc caro thời trang', N'Áo sơ mi bé trai thời trang dành cho bé từ 5-6 tuổi, được thiết kế phong cách vô cùng nam tính, họa tiết kẻ sọc caro cực kỳ thu hút.', 152, 142, N'ao-so-mi-tay-dai-cho-be-trai-soc-caro-thoi-trang_(1).jpg', 23, NULL, NULL, N'NH00001')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00006', N'Quần Áo Bé Gái Dài Tay Hình Heo Xinh Xắn (4-5 Tuổi)', N'Quần Áo Bé Gái Dài Tay Hình Heo Xinh Xắn (4-5 Tuổi) - Chất liệu vải tôn/lanh rất mềm mát, thoáng cho bé mặc chơi mặc ngủ thoải mái nhé mẹ.', 108, 90, N'bo-tay-dai-hinh-heo-peppa-big-de-thuong_(1).jpg', 15, 1, NULL, N'NH00015')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00007', N'Chân váy trơn cho bé gái đơn giản nhưng vô cùng nữ tính', N'Chân váy trơn cho bé gái đơn giản nhưng vô cùng nữ tính - Chất liệu vải thun cotton 4 chiều vô cùng thoáng mát mà không bị nóng, dễ dàng kết hợp với các chiếc áo xinh khác mẹ nhé.', 72, 62, N'chan-vay-tron-cho-be-gai_(1).jpg', 15, 1, NULL, N'NH00012')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00008', N'Bodysuit Sơ Sinh Bé Gái Đùi Sát Nách Thoáng Mát (3-12kg)', N'Bodysuit Sơ Sinh Bé Gái Đùi Sát Nách Thoáng Mát (3-12kg) - Với chất liệu cotton thấm mồ hôi, thoáng mát để thiên thần nhỏ luôn cảm thấy dễ chịu khi mặc.Bộ bodysuit bé gái sát nách được thiết kế đơn giản, giúp bé yêu của bạn dễ dàng vận động và vui chơi trong nhà.', 69, 69, N'bodysuit-so-sinh-be-gai-dui-sat-nach-thoang-mat-3-12-kg_(2).jpg', 30, 1, NULL, N'NH00023')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00010', N'Áo Dài Bé Gái Kèm Váy Mấn Họa Tiết Múa Lân Ngày Tết (4-5 Tuổi)', N'Chọn áo dài cho bé gái đẹp ngất ngây diện Tết 2019.', 235, 235, N'ao-dai-be-gai-kem-vay-man-hoa-tiet-mua-lan-ngay-tet_(2).jpg', 30, 1, NULL, N'NH00013')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00012', N'Áo Thun Cho Bé Gái Tay Ráp Lăng Đính Kim Sa (8-17 Kg)', N'Mua áo thun cho bé gái tay raplan phối màu cực đẹp, giá cực tốt tại Babi.vn.', 89, 89, N'ao-thun-cho-be-gai-tay-rap-lang-dinh-kim-sa-8-17-kg.jpg', 30, 1, NULL, N'NH00013')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00014', N'Hộp dây cột tóc nhiều loại cho Mẹ', N'Hộp dây cột tóc nhiều loại cho Mẹ -  Thun cột tóc này vừa có thể sử dụng cho mẹ vừa có thể sử dụng cho con gái yêu được luôn ạ', 48, 48, N'hop-day-cot-toc-nhieu-loai-cho-me_(1).jpg', 30, 1, NULL, N'NH00020')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00015', N'Áo Thun Cho Bé Gái Cổ Lọ Đan Dây Đính Kim Sa (1-7 Tuổi)', N'Áo Thun Cho Bé Gái Cổ Lọ Đan Dây Đính Kim Sa (1-7 Tuổi) - Kiểu áo thời trang, sành điệu cho bé phối đồ đi tiệc hay đi chơi phố cùng gia đình.Bé yêu hiện đại và sành điệu hơn với kiểu áo thun cho bé gái dáng cổ lọ đan dây đính kim sa cực đẹp nha mẹ.', 92, 92, N'ao-thun-cho-be-gai-co-lo-dan-day-dinh-kim-sa-1-7-tuoi_(4).jpg', 30, 1, NULL, N'NH00013')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00016', N'Đồ Bộ Cho Bé Trai Ngắn Tay In Khủng Long Ngộ Nghĩnh (5-6 Tuổi)', N'Kiểu đồ bộ bé trai có hình thú dễ thương mà bé nào cũng yêu thích.
Các bé trai luôn bị thu hút bởi các bộ quần áo có họa tiết hình thú ngộ nghĩnh, hình xe hoặc hình siêu nhân. Đặc biệt, shop về kiểu đồ bộ ngắn tay in hình khủng long khá ngộ nghĩnh và đáng yêu. Với chất liệu vải thun cotton vừa mềm vừa mát chắc chắn sẽ làm hài lòng các bà mẹ khó tính nhất. Kết hợp cùng đường may chắc chắn, bền đẹp đến từng đường kim mũi chỉ cho bé trang phục sử dụng lâu bền. Thiết kế áo bé trai tay ngắn, quần ngắn rất năng động và khỏe khoắn. Quần lưng thun co giãn thoải mái và có túi cho bé đựng vật dụng nhỏ của mình. Nổi bật hơn là hai bên hông áo và quần đều được đính vây khủng long vô cùng sinh động và đáng yêu. Hiện shop về đủ size cho các bé trai từ 1 đến 8 tuổi nhé mẹ.', 132, 132, N'do-bo-cho-be-trai-ngan-tay-in-khung-long-ngo-nghinh-1-8-tuoi_(4).jpg', 30, 1, NULL, N'NH00006')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00017', N'Áo Ghile Sát Nách Cho Bé Cổ Tim Mặc Ấm (3-4 Tuổi)', N'Với chiếc áo ghile sát nách cho bé này, mẹ có thể sử dụng mặc ấm cho cả bé trai và bé gái luôn nhé.
Bé có thể mặc áo ghile này cùng với áo sơ mi dài tay, hoặc áo thun bên trong cực ấm áp và thời trang. Sử dụng đi chơi hay đi tiệc đều lịch sự cuốn hút khi thời tiết chuyển lạnh hơn. Chất liệu vải thun lem mềm mại, ấm áp, họa tiết dây thừng lạ mắt và độc đáo. Có 2 màu cơ bản đỏ và xanh rất dễ phối đồ cho bé trai bé gái mẹ nhé. Đủ size cho bé 2 đến 8 tuổi ạ.', 158, 158, N'ao-ghile-sat-nach-co-tim-cho-be_(3).jpg', 10, 1, NULL, N'NH00003')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00018', N'Quần Kaki Cho Bé Trai Màu Wash Nhẹ Sành Điệu (13-15 Kg)', N'Kiểu quần trẻ em mặc phong cách với quần kaki dài cho bé trai - Mẫu mới đẹp, giá cực tốt.
Chiếc quần kaki màu cho bé trai sẽ là lựa chọn hoàn hảo cho các nhóc mặc kết hợp với áo sơ mi kẻ sọc hoặc áo sơ mi kẻ đứng mẹ nhé. Phom quần lên cực chuẩn và tôn dáng cho các bé. Có nhiều màu sắc cho bé kết hợp với nhiều trang phục nổi bật và sành điệu. Chất vải kaki thun cao cấp, co giãn nhẹ giúp bé vô cùng thoải mái khi mặc. Đặc biệt, chiếc quần dài cho bé trai này được wash rách nhẹ nổi bật và khá bụi tạo nên phong cách cá tính cho bé yêu khi diện. Nếu bé nhà mình chưa có chiếc quần kaki nào trong tủ đồ của mình thì mẹ giúp bé bổ sung ngay kiểu quần kaki thời trang này ngay nhé. Đủ size cho bé từ 1 đến 6 tuổi nhen mẹ!', 132, 132, N'quan-kaki-mau-wash-nhe-cho-be-trai_(4).jpg', 10, 1, NULL, N'NH00004')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00019', N'Áo sơ mi bé trai màu trắng mùa tựu trường (cho bé 17 - 19kg)', N'Áo sơ mi cho bé trai màu trắng tinh khôi cùng bé tựu trường. 
Thoáng cái lại đến mùa tựu trường rồi các mẹ ơi, các mẹ đã chuẩn bị đồ cho bé mặc khai giảng năm học mới chưa ạ? Babi vừa về lô hàng áo sơ mi trắng cho bé trai mặc để đi khai giảng, đi học. Áo sơ mi được may bằng vải kate màu trắng trơn, có túi nhỏ phía trước, phối áo với quần tây bỏ thùng để bé đi đến trường rất dễ thương các mẹ ạ. Ngoài ra mẹ cũng thể phối với chiếc quần jeans hay kaki để bị tiệc, bé trông rất phong cách và lịch thiệp đấy ạ.', 98, 98, N'ao-somi-trang-cho-be-tuu-truong_(2).jpg', 10, 1, NULL, N'NH00001')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00020', N'Vớ (Tất) Hài Tập Đi Cho Bé (1 tuổi - 2 tuổi)', N'Bé nhà mình có vớ tất tập đi chưa mẹ ơi? Babi vừa về kiểu vớ tập đi chống trượt cực kỳ đáng yêu rồi đây ạ. 
Hàng thun len mềm mại, mang ấm chân cho bé nha mẹ. Với thiết kế đế chống trượt an toàn cho các bé mới tập đi, họa tiết nhiều hình ngộ nghĩnh đáng yêu hết nấc. Các mẹ nhà mình có bé từ 1 tuổi đến 2 tuổi thì ghé xem ngay nhé.', 30, 30, N'vo-tat-hai-tap-di-cho-be-1-tuoi-2-tuoi_(7).jpg', 10, 1, NULL, N'NH00025')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00021', N'Gối đỡ thiên thần bảo vệ đầu cho bé tập ngồi', N'ĐIỂM NỔI BẬT

- Được thiết kế gồm 2 phần là gối đỡ đầu và đôi cánh thiên thần ngộ nghĩnh đáng yêu

- Dây đeo co giãn giúp bé thoải mái khi đeo cũng như trong lúc vận động.

- Được thiết kế dành riêng cho bé trong giai đoạn tập ngồi, tập bò và tập đi', 50, 50, N'goi-bao-ve-dau-cho-be-tap-ngoi_(3).jpg', 10, 1, NULL, N'NH00047')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00022', N'Set bao tay bao chân sơ sinh hình mèo', N'Set bao tay bao chân sơ sinh hình mèo dành cho bé từ 0-6 tháng. Chất liệu vải thun mềm, êm ái với làn da của các bé nhỏ, họa tiết dễ thương.
Bao tay bao chân cho bé sơ sinh vải thun mềm 0 đến 6 tháng. 
Với các bé sơ sinh, mẹ luôn phải chuẩn bị vài đôi bao tay và bao chân để thay đổi và giữ ấm khi ngủ. Ghé Babi.vn để xem và mua cho bé nhà mình nha các mẹ ơi.', 22, 22, N'set-bao-tay-bao-chan-so-sinh-hinh-meo.jpg', 20, 1, NULL, N'NH00021')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00023', N'Khăn Tam Giác Cho Bé Đa Năng Nhiều Họa Tiết Đáng Yêu', N'Khăn Tam Giác Cho Bé Đa Năng Nhiều Họa Tiết Đáng Yêu - Món phụ kiện mùa đông giúp giữ ấm cổ bé yêu trong những ngày thời tiết trở lạnh hiệu quả
Khăn Tam Giác Cho Bé Đa Năng Nhiều Họa Tiết Đáng Yêu - Phụ kiện mùa đông không thể thiếu cho bé yêu.', 15, 15, N'khan-tam-giac-cho-be-da-nang-nhieu-hoa-tiet-dang-yeu_(1).jpg', 20, 1, NULL, N'NH00021')
INSERT [dbo].[tblChiTietSP] ([MaSP], [Name], [ChiTiet], [Gia], [GiaMoi], [NameImage], [SoLuong], [OrderTT], [Status], [IDNhomSP]) VALUES (N'SP00024', N'Áo cho bé sơ sinh tay dài in hình dễ thương (5-11kg)', N'Áo sơ sinh cho bé (3 tháng - 1 tuổi) được may hoàn toàn bằng chất liệu thun cotton mềm mịn, thoáng mát, thấm hút mồ hôi tốt và thân thiện tuyệt đối với làn da của bé.
Áo cho bé sơ sinh tay dài dày dặn - Giữ ấm tuyệt đối cho bé yêu mùa Thu - Đông.
Việc giữ ấm cho bé rất quan trọng trong những ngày mùa Thu - Đông giá lạnh. Hãy để áo trẻ em sơ sinh tay dài giúp mẹ thực hiện điều đó nhé! Bên cạnh đó, áo sơ sinh cho bé còn có nhiều hoạ tiết hình in vô cùng dễ thương và ngộ nghĩnh. Chỉ với 44.000đ, tại sao không!', 44, 44, N'ao-so-sinh-tay-dai-cai-nut-giua-in-hinh-de-thuong-cho-be_(4).jpg', 20, 1, NULL, N'NH00048')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT01', N'Sơ sinh', NULL, NULL, NULL)
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT02', N'12-18 tháng', N'74-79 cm', N'9-11 kg', N'XXS')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT03', N'1-2 tuổi', N'79-86 cm', N'11-13 kg', N'XXS')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT04', N'2-3 tuổi', N'86-96 cm', N'13-15 kg', N'XXS')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT05', N'3-4 tuổi', N'96-106 cm', N'15-17 kg', N'XS')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT06', N'4-5 tuổi', N'106-114 cm', N'17-19 kg', N'S')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT07', N'5-6 tuổi', N'114-122 cm', N'19-22 kg', N'S')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT08', N'6-7 tuổi', N'122-130 cm', N'22-25 kg', N'M')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT09', N'7-8 tuổi', N'130-137 cm', N'25-30 kg', N'M')
INSERT [dbo].[tblDoTuoi] ([IDNhomTuoi], [Tuoi], [ChieuCao], [TrongLuong], [Size]) VALUES (N'DT10', N'8-9 tuổi', N'137-145 cm', N'30-33 kg', N'L')
INSERT [dbo].[tblGioHang] ([MaGioHang], [MaTK], [MaSP], [MaMau], [MaDoTuoi], [SoLuong]) VALUES (N'GH00002', N'TK00003', N'SP00003', N'Default', N'DT08', 2)
INSERT [dbo].[tblGioHang] ([MaGioHang], [MaTK], [MaSP], [MaMau], [MaDoTuoi], [SoLuong]) VALUES (N'GH00003', N'TK00003', N'SP00005', N'Default', N'DT06', 1)
INSERT [dbo].[tblGioHang] ([MaGioHang], [MaTK], [MaSP], [MaMau], [MaDoTuoi], [SoLuong]) VALUES (N'GH00004', N'TK00003', N'SP00001', N'MS001', N'DT04', 4)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00001', NULL, N'KH00001', CAST(0x393E0B00 AS Date), 1)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00002', NULL, N'KH00002', CAST(0xB63D0B00 AS Date), 2)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00003', NULL, N'KH00003', CAST(0xD63D0B00 AS Date), 1)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00004', NULL, N'KH00004', CAST(0xD63D0B00 AS Date), 2)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00005', NULL, N'KH00005', CAST(0xD63D0B00 AS Date), 1)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00006', NULL, N'KH00006', CAST(0xD63D0B00 AS Date), 1)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00007', NULL, N'KH00007', CAST(0xD63D0B00 AS Date), 2)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00008', NULL, N'KH00008', CAST(0xD63D0B00 AS Date), 2)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00009', NULL, N'KH00009', CAST(0xD63D0B00 AS Date), 1)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00010', N'TK00003', NULL, CAST(0xD63D0B00 AS Date), 1)
INSERT [dbo].[tblHoaDonBan] ([MaHD], [MaTK], [MaKH], [NgayBan], [TrangThai]) VALUES (N'HD00011', N'TK00003', NULL, CAST(0xD63D0B00 AS Date), 1)
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00001', N'TK00001', N'NCC00001', CAST(0x0000A97700000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00002', N'TK00001', N'NCC00001', CAST(0x0000A97700000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00003', N'TK00001', N'NCC00001', CAST(0x0000A97700000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00004', N'TK00001', N'NCC00001', CAST(0x0000A97700000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00005', N'TK00001', N'NCC00001', CAST(0x0000A97800000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00006', N'TK00001', N'NCC00001', CAST(0x0000A97900000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00007', N'TK00001', N'NCC00001', CAST(0x0000A97A00000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00008', N'TK00001', N'NCC00001', CAST(0x0000A97B00000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00009', N'TK00001', N'NCC00002', CAST(0x0000A97C00000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00010', N'TK00001', N'NCC00002', CAST(0x0000A97D00000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00011', N'TK00001', N'NCC00002', CAST(0x0000A97E00000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00012', N'TK00001', N'NCC00002', CAST(0x0000A97F00000000 AS DateTime))
INSERT [dbo].[tblHoaDonNhap] ([MaHD], [MaTK], [MaNCC], [NgayNhap]) VALUES (N'HD00013', N'TK00001', N'NCC00002', CAST(0x0000A98000000000 AS DateTime))
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (1, N'Thành phố Long Xuyên', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (2, N'Thị xã Châu Đốc', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (3, N'Huyện An Phú', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (4, N'Huyện Tân Châu', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (5, N'Huyện Phú Tân', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (6, N'Huyện Tịnh Biên', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (7, N'Huyện Tri Tôn', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (8, N'Huyện Châu Phú', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (9, N'Huyện Chợ Mới', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (10, N'Huyện Châu Thành', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (11, N'Huyện Thoại Sơn', 1)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (12, N'Thành phố Vũng Tàu', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (13, N'Thị xã Bà Rịa', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (14, N'Huyện Xuyên Mộc', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (15, N'Huyện Long Điền', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (16, N'Huyện Côn Đảo', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (17, N'Huyện Tân Thành', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (18, N'Huyện Châu Đức', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (19, N'Huyện Đất Đỏ', 2)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (20, N'Thị xã Bạc Liêu', 3)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (21, N'Huyện Vĩnh Lợi', 3)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (22, N'Huyện Hồng Dân', 3)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (23, N'Huyện Giá Rai', 3)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (24, N'Huyện Phước Long', 3)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (25, N'Huyện Đông Hải', 3)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (26, N'Huyện Hoà Bình', 3)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (27, N'Thị xã Bắc Kạn', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (28, N'Huyện Chợ Đồn', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (29, N'Huyện Bạch Thông', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (30, N'Huyện Na Rì', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (31, N'Huyện Ngân Sơn', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (32, N'Huyện Ba Bể', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (33, N'Huyện Chợ Mới', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (34, N'Huyện Pác Nặm', 4)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (35, N'Thành phố Bắc Giang', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (36, N'Huyện Yên Thế', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (37, N'Huyện Lục Ngạn', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (38, N'Huyện Sơn Động', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (39, N'Huyện Lục Nam', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (40, N'Huyện Tân Yên', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (41, N'Huyện Hiệp Hoà', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (42, N'Huyện Lạng Giang', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (43, N'Huyện Việt Yên', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (44, N'Huyện Yên Dũng', 5)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (45, N'Thành phố Bắc Ninh', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (46, N'Huyện Yên Phong', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (47, N'Huyện Quế Võ.', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (48, N'Huyện Tiên Du', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (49, N'Huyện Từ Sơn', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (50, N'Huyện Thuận Thành', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (51, N'Huyện Gia Bình', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (52, N'Huyện Lương Tài', 6)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (53, N'Thị xã Bến Tre', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (54, N'Huyện Châu Thành', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (55, N'Huyện Chợ Lách', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (56, N'Huyện Mỏ Cày', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (57, N'Huyện Giồng Trôm', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (58, N'Huyện Bình Đại', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (59, N'Huyện Ba Tri', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (60, N'Huyện Thạnh Phú', 7)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (61, N'Thị xã Thủ Dầu Một', 8)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (62, N'Huyện Bến Cát', 8)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (63, N'Huyện Tân Uyên', 8)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (64, N'Huyện Thuận An', 8)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (65, N'Huyện Dĩ An', 8)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (66, N'Huyện Phú Giáo', 8)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (67, N'Huyện Dầu Tiếng', 8)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (68, N'Thành phố Quy Nhơn', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (69, N'Huyện An Lão', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (70, N'Huyện Hoài Ân', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (71, N'Huyện Hoài Nhơn', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (72, N'Huyện Phù Mỹ', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (73, N'Huyện Phù Cát', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (74, N'Huyện Vĩnh Thạnh', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (75, N'Huyện Tây Sơn', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (76, N'Huyện Vân Canh', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (77, N'Huyện An Nhơn', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (78, N'Huyện Tuy Phước', 9)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (79, N'Thị xã Đồng Xoài', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (80, N'Huyện Đồng Phú', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (81, N'Huyện Chơn Thành', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (82, N'Huyện Bình Long', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (83, N'Huyện Lộc Ninh', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (84, N'Huyện Bù Đốp', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (85, N'Huyện Phước Long', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (86, N'Huyện Bù Đăng', 10)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (87, N'Thành phố Phan Thiết', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (88, N'Huyện Tuy Phong', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (89, N'Huyện Bắc Bình', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (90, N'Huyện Hàm Thuận Bắc', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (91, N'Huyện Hàm Thuận Nam', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (92, N'Huyện Hàm Tân', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (93, N'Huyện Đức Linh', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (94, N'Huyện Tánh Linh', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (95, N'Huyện đảo Phú Quý', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (96, N'Thị xã LaGi', 11)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (97, N'Thành phố Cà Mau', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (98, N'Huyện Thới Bình', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (99, N'Huyện U Minh', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (100, N'Huyện Trần Văn Thời', 12)
GO
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (101, N'Huyện Cái Nước', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (102, N'Huyện Đầm Dơi', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (103, N'Huyện Ngọc Hiển', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (104, N'Huyện Năm Căn', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (105, N'Huyện Phú Tân', 12)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (106, N'Thị xã Cao Bằng', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (107, N'Huyện Bảo Lạc', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (108, N'Huyện Thông Nông', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (109, N'Huyện Hà Quảng', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (110, N'Huyện Trà Lĩnh', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (111, N'Huyện Trùng Khánh', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (112, N'Huyện Nguyên Bình', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (113, N'Huyện Hoà An', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (114, N'Huyện Quảng Uyên', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (115, N'Huyện Thạch An', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (116, N'Huyện Hạ Lang', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (117, N'Huyện Bảo Lâm', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (118, N'Huyện Phục Hoà', 13)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (119, N'Quận Ninh Kiều', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (120, N'Quận Bình Thuỷ', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (121, N'Quận Cái Răng', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (122, N'Quận Ô Môn', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (123, N'Huyện Phong Điền', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (124, N'Huyện Cờ Đỏ', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (125, N'Huyện Vĩnh Thạnh', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (126, N'Huyện Thốt Nốt', 14)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (127, N'Quận Hải Châu', 15)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (128, N'Quận Thanh Khê', 15)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (129, N'Quận Sơn Trà', 15)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (130, N'Quận Ngũ Hành Sơn', 15)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (131, N'Quận Liên Chiểu', 15)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (132, N'Huyện Hoà Vang', 15)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (133, N'Quận Cẩm Lệ', 15)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (134, N'Thành phố Buôn Ma Thuột', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (135, N'Huyện Ea H Leo', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (136, N'Huyện Krông Buk', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (137, N'Huyện Krông Năng', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (138, N'Huyện Ea Súp', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (139, N'Huyện Cư M gar', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (140, N'Huyện Krông Pắc', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (141, N'Huyện Ea Kar', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (142, N'Huyện M`Đrăk', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (143, N'Huyện Krông Ana', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (144, N'Huyện Krông Bông', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (145, N'Huyện Lăk', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (146, N'Huyện Buôn Đôn', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (147, N'Huyện Cư Kuin', 16)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (148, N'Thị xã Gia Nghĩa', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (149, N'Huyện Dăk RLấp', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (150, N'Huyện Dăk Mil', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (151, N'Huyện Cư Jút', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (152, N'Huyện Dăk Song', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (153, N'Huyện Krông Nô', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (154, N'Huyện Dăk GLong', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (155, N'Huyện Tuy Đức', 17)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (156, N'TP. Điện Biên Phủ', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (157, N'Thị xã Mường Lay', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (158, N'Huyện Điện Biên', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (159, N'Huyện Tuần Giáo', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (160, N'Huyện Mường Chà', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (161, N'Huyện Tủa Chùa', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (162, N'Huyện Điện Biên Đông', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (163, N'Huyện Mường Nhé', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (164, N'Huyện Mường Ảng', 18)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (165, N'Thành phố Biên Hoà', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (166, N'Huyện Vĩnh Cửu', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (167, N'Huyện Tân Phú', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (168, N'Huyện Định Quán', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (169, N'Huyện Thống Nhất', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (170, N'Thị xã Long Khánh', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (171, N'Huyện Xuân Lộc', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (172, N'Huyện Long Thành', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (173, N'Huyện Nhơn Trạch', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (174, N'Huyện Trảng Bom', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (175, N'Huyện Cẩm Mỹ', 19)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (176, N'Thành phố Cao Lãnh', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (177, N'Thị xã Sa Đéc', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (178, N'Huyện Tân Hồng', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (179, N'Huyện Hồng Ngự', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (180, N'Huyện Tam Nông', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (181, N'Huyện Thanh Bình', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (182, N'Huyện Cao Lãnh', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (183, N'Huyện Lấp Vò', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (184, N'Huyện Tháp Mười', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (185, N'Huyện Lai Vung', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (186, N'Huyện Châu Thành', 20)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (187, N'Huyện Krông Pa', 21)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (188, N'Huyện Ia Grai', 21)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (189, N'Huyện Đăk Đoa', 21)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (190, N'Huyện Ia Pa', 21)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (191, N'Huyện Đăk Pơ', 21)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (192, N'Huyện Phú Thiện', 21)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (193, N'Thành phố Hà Giang', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (194, N'Huyện Đồng Văn', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (195, N'Huyện Mèo Vạc', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (196, N'Huyện Yên Minh', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (197, N'Huyện Quản Bạ', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (198, N'Huyện Vị Xuyên', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (199, N'Huyện Bắc Mê', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (200, N'Huyện Hoàng Su Phì', 22)
GO
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (201, N'Huyện Xín Mần', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (202, N'Huyện Bắc Quang', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (203, N'Huyện Quang Bình', 22)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (204, N'Thị xã Phủ Lý', 23)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (205, N'Huyện Duy Tiên', 23)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (206, N'Huyện Kim Bảng', 23)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (207, N'Huyện Lý Nhân', 23)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (208, N'Huỵện Thanh Liêm', 23)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (209, N'Huyện Bình Lục', 23)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (210, N'Quận Ba Đình', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (211, N'Quận Hoàn Kiếm', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (212, N'Quận Hai Bà Trưng', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (213, N'Quận Đống Đa', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (214, N'Quận Tây Hồ', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (215, N'Quận Cầu Giấy', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (216, N'Quận Thanh Xuân', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (217, N'Quận Hoàng Mai', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (218, N'Quận Long Biên', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (219, N'Huyện Từ Liêm', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (220, N'Huyện Thanh Trì', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (221, N'Huyện Gia Lâm', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (222, N'Huyện Đông Anh', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (223, N'Huyện Sóc Sơn', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (224, N'Quận Hà Đông', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (225, N'Thị xã Sơn Tây', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (226, N'Huyện Ba Vì', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (227, N'Huyện Phúc Thọ', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (228, N'Huyện Thạch Thất', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (229, N'Huyện Quốc Oai', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (230, N'Huyện Chương Mỹ', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (231, N'Huyện Đan Phượng', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (232, N'Huyện Hoài Đức', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (233, N'Huyện Thanh Oai', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (234, N'Huyện Mỹ Đức', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (235, N'Huyện Ứng Hoà', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (236, N'Huyện Thường Tín', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (237, N'Huyện Phú Xuyên', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (238, N'Huyện Mê Linh', 24)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (239, N'Thành phố Hà Tĩnh', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (240, N'Thị xã Hồng Lĩnh', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (241, N'Huyện Hương Sơn', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (242, N'Huyện Đức Thọ', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (243, N'Huyện Nghi Xuân', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (244, N'Huyện Can Lộc', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (245, N'Huyện Hương Khê', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (246, N'Huyện Thạch Hà', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (247, N'Huyện Cẩm Xuyên', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (248, N'Huyện Kỳ Anh', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (249, N'Huyện Vũ Quang', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (250, N'Huyện Lộc Hà', 25)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (251, N'Thành phố Hải Dương', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (252, N'Huyện Chí Linh', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (253, N'Huyện Nam Sách', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (254, N'Huyện Kinh Môn', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (255, N'Huyện Gia Lộc', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (256, N'Huyện Tứ Kỳ', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (257, N'Huyện Thanh Miện', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (258, N'Huyện Ninh Giang', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (259, N'Huyện Cẩm Giàng', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (260, N'Huyện Thanh Hà', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (261, N'Huyện Kim Thành', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (262, N'Huyện Bình Giang', 26)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (263, N'Quận Hồng Bàng', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (264, N'Quận Lê Chân', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (265, N'Quận Ngô Quyền', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (266, N'Quận Kiến An', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (267, N'Quận Hải An', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (268, N'Quận Đồ Sơn', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (269, N'Huyện An Lão', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (270, N'Huyện Kiến Thuỵ', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (271, N'Huyện Thủy Nguyên', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (272, N'Huyện An Dương', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (273, N'Huyện Tiên Lãng', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (274, N'Huyện Vĩnh Bảo', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (275, N'Huyện Cát Hải', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (276, N'Huyện Bạch Long Vĩ', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (277, N'Quận Dương Kinh', 27)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (278, N'Thành phố Hoà Bình', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (279, N'Huyện Đà Bắc', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (280, N'Huyện Mai Châu', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (281, N'Huyện Tân Lạc', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (282, N'Huyện Lạc Sơn', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (283, N'Huyện Kỳ Sơn', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (284, N'Huyện Lưương Sơn', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (285, N'Huyện Kim Bôi', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (286, N'Huyện Lạc Thuỷ', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (287, N'Huyện Yên Thuỷ', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (288, N'Huyện Cao Phong', 28)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (289, N'Quận Một', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (290, N'Quận Hai', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (291, N'Quận Ba', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (292, N'Quận Bốn', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (293, N'Quận Năm', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (294, N'Quận Sáu', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (295, N'Quận Bảy', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (296, N'Quận Tám', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (297, N'Quận Chín', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (298, N'Quận Mười', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (299, N'Quận Mười một', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (300, N'Quận Mười hai', 29)
GO
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (301, N'Quận Gò Vấp', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (302, N'Quận Tân Bình', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (303, N'Quận Tân Phú', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (304, N'Quận Bình Thạnh', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (305, N'Quận Phú Nhuận', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (306, N'Quận Thủ Đức', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (307, N'Quận Bình Tân', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (308, N'Huyện Bình Chánh', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (309, N'Huyện Củ Chi', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (310, N'Huyện Hóc Môn', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (311, N'Huyện Nhà Bè', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (312, N'Huyện Cần Giờ', 29)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (313, N'Thành phố Vị Thanh', 30)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (314, N'Huyện Vị Thuỷ', 30)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (315, N'Huyện Long Mỹ', 30)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (316, N'Huyện Phụng Hiệp', 30)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (317, N'Huyện Châu Thành', 30)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (318, N'Huyện Châu Thành A', 30)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (319, N'Thị xã Ngã Bảy', 30)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (320, N'Thị xã Hưng Yên', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (321, N'Huyện Kim Động', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (322, N'Huyện Ân Thi', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (323, N'Huyện Khoái Châu', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (324, N'Huyện Yên Mỹ', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (325, N'Huyện Tiên Lữ', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (326, N'Huyện Phù Cừ', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (327, N'Huyện Mỹ Hào', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (328, N'Huyện Văn Lâm', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (329, N'Huyện Văn Giang', 31)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (330, N'Thành phố Nha Trang', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (331, N'Huyện Vạn Ninh', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (332, N'Huyện Ninh Hoà', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (333, N'Huyện Diên Khánh', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (334, N'Huyện Khánh Vĩnh', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (335, N'Thị xã Cam Ranh', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (336, N'Huyện Khánh Sơn', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (337, N'Huyện Trường Sa', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (338, N'Huyện Cam Lâm', 32)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (339, N'Thành phố Rạch Giá', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (340, N'Thị xã Hà Tiên', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (341, N'Huyện Kiên Lương', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (342, N'Huyện Hòn Đất', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (343, N'Huyện Tân Hiệp', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (344, N'Huyện Châu Thành', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (345, N'Huyện Giồng Riềng', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (346, N'Huyện Gò Quao', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (347, N'Huyện An Biên', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (348, N'Huyện An Minh', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (349, N'Huyện Vĩnh Thuận', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (350, N'Huyện Phú Quốc', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (351, N'Huyện Kiên Hải', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (352, N'Huyện U minh Thượng', 33)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (353, N'Thị xã KonTum', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (354, N'Huyện Đăk Glei', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (355, N'Huyện Ngọc Hồi', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (356, N'Huyện Đăk Tô', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (357, N'Huyện Sa Thầy', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (358, N'Huyện Kon Plong', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (359, N'Huyện Đăk Hà', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (360, N'Huyện Kon Rộy', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (361, N'Huyện Tu Mơ Rông', 34)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (362, N'Thị xã Lai Châu', 35)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (363, N'Huyện Tam Đường', 35)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (364, N'Huyện Phong Thổ', 35)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (365, N'Huyện Sìn Hồ', 35)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (366, N'Huyện Mường Tè', 35)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (367, N'Huyện Than Uyên', 35)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (368, N'Thành phố Lào Cai', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (369, N'Huyện Xi Ma Cai', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (370, N'Huyện Bát Xát', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (371, N'Huyện Bảo Thắng', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (372, N'Huyện Sa Pa', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (373, N'Huyện Văn Bàn', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (374, N'Huyện Bảo Yên', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (375, N'Huyện Bắc Hà', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (376, N'Huyện Mường Khương', 36)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (377, N'Thành phố Lạng Sơn', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (378, N'Huyện Tràng Định', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (379, N'Huyện Bình Gia', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (380, N'Huyện Văn Lãng', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (381, N'Huyện Bắc Sơn', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (382, N'Huyện Văn Quan', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (383, N'Huyện Cao Lộc', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (384, N'Huyện Lộc Bình', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (385, N'Huyện Chi Lăng', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (386, N'Huyện Đình Lập', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (387, N'Huyện Hữu Lũng', 37)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (388, N'Thành phố Đà Lạt', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (389, N'Thị xã. Bảo Lộc', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (390, N'Huyện Đức Trọng', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (391, N'Huyện Di Linh', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (392, N'Huyện Đơn Dương', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (393, N'Huyện Lạc Dương', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (394, N'Huyện Đạ Huoai', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (395, N'Huyện Đạ Tẻh', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (396, N'Huyện Cát Tiên', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (397, N'Huyện Lâm Hà', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (398, N'Huyện Bảo Lâm', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (399, N'Huyện Đam Rông', 38)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (400, N'Thị xã Tân An', 39)
GO
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (401, N'Huyện Vĩnh Hưng', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (402, N'Huyện Mộc Hoá', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (403, N'Huyện Tân Thạnh', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (404, N'Huyện Thạnh Hoá', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (405, N'Huyện Đức Huệ', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (406, N'Huyện Đức Hoà', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (407, N'Huyện Bến Lức', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (408, N'Huyện Thủ Thừa', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (409, N'Huyện Châu Thành', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (410, N'Huyện Tân Trụ', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (411, N'Huyện Cần Đước', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (412, N'Huyện Cần Giuộc', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (413, N'Huyện Tân Hưng', 39)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (414, N'TP. Nam Định', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (415, N'Huyện Mỹ Lộc', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (416, N'Huyện Xuân Trường', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (417, N'Huyện Giao Thủy', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (418, N'Huyện ý Yên', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (419, N'Huyện Vụ Bản', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (420, N'Huyện Nam Trực', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (421, N'Huyện Trực Ninh', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (422, N'Huyện Nghĩa Hưng', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (423, N'Huyện Hải Hậu', 40)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (424, N'Thành phố Vinh', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (425, N'Thị xã Cửa Lò', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (426, N'Huyện Quỳ Châu', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (427, N'Huyện Quỳ Hợp', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (428, N'Huyện Nghĩa Đàn', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (429, N'Huyện Quỳnh Lưu', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (430, N'Huyện Kỳ Sơn', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (431, N'Huyện Tương Dương', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (432, N'Huyện Con Cuông', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (433, N'Huyện Tân Kỳ', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (434, N'Huyện Yên Thành', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (435, N'Huyện Diễn Châu', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (436, N'Huyện Anh Sơn', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (437, N'Huyện Đô Lương', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (438, N'Huyện Thanh Chương', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (439, N'Huyện Nghi Lộc', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (440, N'Huyện Nam Đàn', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (441, N'Huyện Hưng Nguyên', 41)
INSERT [dbo].[tblHuyen] ([ID], [TenHuyen], [IDTinh]) VALUES (442, N'Huyện Quế Phong', 41)
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00001', N'Nguyễn Văn Hải', N'Tp.Vinh - Tỉnh Nghệ An', N'0987667887', N'hai@gmail.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00002', N'Nguyễn Thị Vân', N'Quỳnh Lưu - Nghệ An', N'0876567766', N'van@gmail.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00003', N'Lý Thế Hợp', N'Số 193,đường 428 Thị trấn Vân Đình ,Ứng Hòa, HN', N'0933918563', N'Artglass@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00004', N'Trần văn Giới', N'TT Vân Đình ứng Hòa Hà Nội', N'0933991599', N'ast-airticket@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00005', N'Ngô Quang Bảo ', N'TT Vân Đinh Ứng Hòa - HN', N'0907288378', N'nhdminh@apac.ko.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00006', N'Dương Văn Hồng ', N'Của Hàng Dược Phẩm Ứng Hòa, HN ', N'0907288378', N'tnlco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00007', N'Nguyễn Thị Mai Châu ', N'Vân Đình, Ứng Hòa, HN ', N'0932511933', N'tsm238@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00008', N'Nguyễn Mạnh Cường ', N'Ứng Hòa, Hà Tây ', N'0908862882', N'truongminhhuy@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00009', N'Đoàn Văn Đệ ', N'Của Hàng Dược Phẩm Ứng Hòa, HN ', N'', N'wavelotus@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00010', N'Nguyễn Xuân Thanh ', N'thị trấn Vân Đình, Ứng Hòa, Hà Tây ', N'01673285535', N'duchy@fiditourvietnam.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00011', N'Nguyễn Như Nghiêm ', N'18 xóm Nông Cụ, Thôn Thanh Ấm, Thị Trấn Vân Đình, Ứng Hòa, HN ', N'0913683616', N'iptco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00012', N'Trần Văn Cường ', N'Hòa Nam - ứng Hòa - Hà Nội ', N'0909128006', N'ngtam@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00013', N'Ngô Công Trường ', N'Cửa hàng dược phẩm ứng Hòa, HN ', N'01656423750', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00014', N'Nguyễn Thị Tuyết ', N'Đồng Tân, Ứng Hòa, Hà Tây ', N'0983696599', N'hanadang@goldsunvn.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00015', N'Dương Thị Hiền ', N'Ứng Hòa, HN ', N'0939462358', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00016', N'Đỗ Thị Thái ', N'Cửa hàng dược phẩm ứng Hòa, HN ', N'09081961350', N'hungtu@tlnet.com.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00017', N'Nguyễn duy Huyến', N'Vạn Thái, Ứng Hòa, Hà Nội ', N'0913933125', N'pnco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00018', N'Hà Vũ Đan Thanh', N'Căn hộ 702 nhà C4,Mỹ Đình 1, Từ liêm ', N'0907364593', N'sales@itsolution2b.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00019', N'Nguyễn Đắc Cảnh', N'702 nhà C4,Mỹ Đình 1, Từ liêm, HN', N'0907364593', N'haquockhanh@fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00020', N'Chu Tiến Đức', N'Tây mỗ từ liêm HN', N'0903695007', N'hacongthai77@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00021', N'Vương Đăng Ngọc', N'Xóm 4A Cổ Nhuế- Từ Liêm- HN', N'0903127954', N'tantrao@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00022', N'Chu Văn Thắng', N'Tập Thể K80 - Xuân Tình - Từ Liêm -HN', N'0909322034', N'dalena@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00023', N'Đỗ Quốc Cường', N'Số 670 TT cầu diễn Từ Liêm, HN', N'0906646352', N'manh-khoi.pham@metro.com.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00024', N'Đỗ Quốc Cường', N'Thôn Đông Sơ - Thủy Phương - Từ Liêm - Hà Nọi', N'0932511933', N'ttnghia@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00025', N'Chu Hồng Hải', N'Thôn Đông Sen Thụy Phương, Từ Liêm, Hà Nội', N'0903834509', N'hychi-adv@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00026', N'Chu Tiến Đức', N'Xóm Cổ Nhuế, Từ Liêm, Hà Nội', N'0983949414', N'NQ_JOY@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00027', N'Nguyễn Hồng Lâm', N'Cổ Nhuế, Từ Liêm, HN', N'0913640599', N'printshop@saigonnet.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00028', N'Tô Xuân Thanh', N'Xóm 1, Cỗ Nhuế, Từ Liêm, Hà Nội', N'', N'ngoisaonho@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00029', N'Nguyễn Văn Hòa', N'Số 1212 CT 1A ĐN II Mỹ Đình II, Từ Liêm, Hà Nội', N'', N'phusoco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00030', N'Nguyễn Hoài Phương', N'Tổ 13, Cầu Diễn, Từ Liêm, Hà Nội', N'', N'phi-nga@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00031', N'Hoàng Minh Tiến', N'Số 20, Tổ 13, Cầu Diễn, Từ Liêm, Hà Nội', N'0988664624', N'lvtruong@cinet.vnnews.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00032', N'Đào Tuấn Anh', N'Xóm 1, Xã Cổ Nhuế, Từ Liêm, Hà Nội', N'0913117803', N'qh-quang@hotmail.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00033', N'Nguyễn Thị Lan Hương', N'Xóm 1, Xã Cổ Nhuế, Từ Liêm, Hà Nội', N'0913117803', N'kha.ngo@sonyericsson.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00034', N'Đỗ Xuân Hùng', N'Xóm 1, Xã Cổ Nhuế, Từ Liêm, Hà Nội', N'0983329101', N'kimngocho@tatacopeanuts.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00035', N'Lê Huyền Trang', N'Thôn Nhang, Xuân Đỉnh, Từ Liêm, Hà Nội', N'0988027222', N'tinnhanco@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00036', N'Phạm Huỳnh Quang', N'Cầu Diễn, Từ Liêm, Hà Nội', N'0988204242', N'tinphatco@fptnet.com.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00037', N'Nguyễn Thị Lan Hương', N'Ngõ Trại, Xóm Đình, Đại Mỗ, Từ Liêm, HN', N'0933724729', N'hoatonvn@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00038', N'Phạm Văn Đức', N'Xóm 1 Cổ Nhuế ,Từ Liêm ,Hà Nội', N'0903017369', N'gicolor@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00039', N'Lê Thu Thủy', N'SN 21, Ngách 3, Ngõ 2, Đường nông Lâm, Đông Ngạc, Từ Liêm, Hà Nội', N'0903017369', N'vietphone@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00040', N'Nguyễn Trọng Nghĩa ', N'P301 CT5A Khu đô thị Mễ Trì Hạ-Từ Liêm-Hà Nội', N'0933696789', N'a-b.interiodeco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00041', N'Phạm Thùy Linh ', N'P901 Cầu tháng 1 CT5 khu ĐT Mỹ Đình, Từ Liêm, HN ', N'0933056068', N'nguyen_thang@colpal.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00042', N'Nguyễn Đức Trung ', N'Xóm 5A, Đông Ngạc, Từ Liêm, HN ', N'', N'ipesco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00043', N'Lê Thị Vĩnh Hà ', N'Phòng 04 -T15, Tòa nhà Sông Đà, Mỹ Đình, Từ Liêm, HN ', N'0989712295', N'nxdhuy@tcmcompany.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00044', N'Dương Thúy Lan ', N'Khu tập thể Xí nghiệp Gạch Hữu Hưng, Đại Mỗ, Từ Liêm, HN ', N'0913613818', N'kienliemco@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00045', N'Phạm Thị Mẫn ', N'27 Đường Hồ, Mễ Trì, Từ Liêm, HN ', N'0968812790', N'Pham-Son@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00046', N'Đỗ Văn Thái ', N'CTy TNHH Hoàng Trà, 36 Phạm Văn Đồng, Từ Liêm, Hà Nội ', N'0968812790', N'tnco@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00047', N'Lê Khánh Hưng ', N'5/72 Phùng Khoang, Trung Văn, Từ Liêm, HN ', N'0907774249', N'hai-au@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00048', N'Cao Quý Lân ', N'Phùng khoang, Trung Văn, Từ Liêm, Hà Nội ', N'0938286030', N'bang@saosang.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00049', N'Đặng Thị Thuyết ', N'Xóm 2, Cổ Nhuế, Từ Liêm, Hà Nội ', N'0939333037', N'nhatloi@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00050', N'Nguyễn Văn Huynh ', N'Xóm 2, cổ nhuế, từ liêm, Hà Nội ', N'0913730517', N'sangtaotre@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00051', N'Nguyễn Thị Thùy Linh ', N'Nhân Mỹ, Mỹ Đình, Từ Liêm, HN ', N'0913730517', N'info@songmay.net')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00052', N'Nguyễn Xuân Phán ', N'Thô Đông Sen xã Thụy Phương, Từ Liêm, Hà Nội ', N'0903746113', N'songhanhad@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00053', N'Nguyễn Thị Hoài Thu ', N'Số 45 khu B tổ 10, Đông Ngạc, Từ Liêm, Hà Nội ', N'0913728281', N'sanhu@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00054', N'Nguyễn Thị Phương Lê ', N'Số 2 ngõ 42 Đường K4 Phú Diễn, từ Liêm, HN ', N'0933636466', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00055', N'Nguyễn Hữu Long ', N'Phòng 604 - CT5 Mỹ Đình II, Từ Liêm. HN ', N'0909212523', N't.q.m.co@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00056', N'Hoàng Thị Minh Đức ', N'P1014 - CT3B Mỹ Đình II, Từ Liêm, HN ', N'0909454580', N'tkcompany@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00057', N'Nguyễn Anh Tuấn ', N'Đội 7, Thôn ĐÌnh Thôn, Mỹ Đình, Từ liêm, HN ', N'0987901259', N'hoadinhngo2003@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00058', N'Nguyễn Như Phương ', N'Số 2 Khối 1 - Đại Mỗ - Từ Liêm - Hà Nội ', N'0987901259', N'hungphat.co@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00059', N'Trần Thành Long ', N'Số 4 chung cư Trung Văn II, Trung Văn, Từ Liêm, HN ', N'0919308745', N'daiphuccantho@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00060', N'Nguyễn Thị Hà ', N'Xóm 6, Đông Ngạc, Từ Liêm, HN ', N'0938773003', N'mc_co@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00061', N'Nguyễn Hải minh ', N'87 Tổ 9 Cầu Diễn, Từ Liêm, Hà Nội ', N'0938773003', N'mkp@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00062', N'Lê Công Hùng ', N'Số 65 ngõ 13 xóm Tháp, Xuân Đỉnh, Từ Liêm, HN ', N'0918045799', N'tvmt@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00063', N'Công ty TNHH Kế toán và Tư vấn VTA ', N'26/F khu tập thể TC2, Xuân Đỉnh, Từ Liêm, HN ', N'0982431114', N'hangocsonnt@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00064', N'Đinh Xuân Hạng ', N'P1406, nhà C3 khu đô thị mỹ Đình I, Từ Liêm, Hà Nội ', N'01223050122', N'nhonco@msn.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00065', N'Nguyễn Thị Minh ', N'A2, 142 tập thể học viện tài chính, Cầu Diễn, Từ Liêm, HN ', N'01223050122', N'vts@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00066', N'NGuyễn Văn Bốn ', N'Tập thể Đài phát tín,Đại Mỗ, Từ Liêm, Hà Nội ', N'0919818133', N'info@vipcomnet.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00067', N'Nguyễn Thị Vân Khánh ', N'Số 9 ngõ 43 Phùng Khoang Trung Văn Từ Liêm, HN ', N'0919818133', N'donaco2@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00068', N'Đỗ Văn Thành ', N'Số 4, Trung Cự, Trung Văn 2, Trung Văn, Từ Liêm, HN ', N'0913702574', N'apcompany@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00069', N'Nguyễn Thị Dịu ', N'Phùng Khoang, Trung Văn, Từ Liêm, HN ', N'0913702574', N'tuan.phung@luatviet.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00070', N'Cao Thị Anh ', N'Ngõ 34 đường chùa Nhân Mỹ, Mỹ ĐÌnh, Từ Liêm, HN ', N'0919701072', N'info@ypvn.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00071', N'Lê Thị Hiền ', N'Số 13 khu tập thể Điện Lực , Phủ Diễn, Từ Liêm, HN ', N'0988435768', N'vongxeptho@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00072', N'Đỗ Thị Thơ ', N'SN 110 B6 tập thể học viện tài chính, Cầu Diễn, Từ Liêm, Hà Nội ', N'0917014265', N'centrepoint@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00073', N'Đỗ Hải Yến ', N'Xóm 8B, Cổ Nhuế, Từ Liêm, HN ', N'0918557117', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00074', N'Nguyễn Thị Hạnh ', N'Xóm Tháp, xã Đại Mỗ, Từ Liêm, HN ', N'0938804748', N'tiencd@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00075', N'Phạm Huỳnh Quang ', N'Ngõ Trại, Thôn Đình, Đại Mỗ, Từ Liêm, HN ', N'0934459192', N'hungminh@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00076', N'Hoàng Thị Minh Ngọc ', N'Chợ Sáng, Ngõ Trại, Thôn Đình, Đại Mỗ, Từ Liêm, HN ', N'0908668861', N'airquocthai@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00077', N'Đỗ Thị Ánh Dương ', N'Ngọc Trục, Đại Mỗ, Từ Liêm, HN ', N'0934459192', N'brian20302003@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00078', N'Nguyễn Thị Huyên ', N'TT viện Công nghệ Đông Ngạc, Từ liêm, HN ', N'0913980939', N'dophuvinh@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00079', N'Tòng Quang Thành ', N'Xóm 2, thôn Hạ, Mễ Trì, Từ Liêm, HN ', N'0983627624', N'v-contractor@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00080', N'Nguyễn Khánh Toàn ', N'Xóm Ngang Đại Mỗ Từ Liêm HN ', N'0916856856', N'danghanhtuan@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00081', N'Mai Thị Hằng ', N'P1116 CT2A Mỹ Đình 2 Từ Liêm Hà Nội ', N'0973442020', N'ngocvancompany@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00082', N'Vũ Thị THu Hương ', N'Số 37, ngõ 8 Phùng Khoang Trung Văn, Từ liêm, HN ', N'0938700399', N'quanghuynh@vn.hsbc.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00083', N'Lưu Bách Khoa ', N'số 6, khu tập thể cục Hậu Cần, Xuân Đỉnh, Từ Liêm, HN ', N'0948788159', N'orient@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00084', N'Nguyễn Thi Tuyết Hạnh ', N'Xóm 6, Đông Ngạc, Từ Liêm, HN ', N'0948788159', N'tan.aac@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00085', N'Nguyễn Thị Hải Hà ', N'34 tổ 3K Cầu Diễn, Từ Liêm, HN ', N'0938185268', N'btchinh@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00086', N'Chu Võ Thu Hà ', N'156 xóm 18B Thôn Trù 2, Cổ Nhuế, Từ Liêm, Hà Nội ', N'0938185268', N'quan@sutrixmedia.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00087', N'Đinh Văn Thanh ', N'122A tổ 19 Cầu Diễn, Từ Liêm, HN ', N'0908299279', N'hntscbranch@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00088', N'Nguyễn Quý Ngọc ', N'Phòng 305 B5, khu ĐT Mỹ ĐÌnh, Từ Liêm, HN ', N'0908806200', N'gfk.du@fmail.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00089', N'Dương Hưng Thịnh ', N'Xóm Đình - Đại Mỗ - Từ Liêm - Hà Nội ', N'0903863244', N'cuong.nguyen@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00090', N'Bùi Liên Hà ', N'P1701 Mỹ Đình Sông Đà, Từ Liêm, HN ', N'0933676868', N'nguyen_thang@colpal.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00091', N'Nguyễn Thanh Bình ', N'Xóm 2 Cổ Nhuế, Từ Liêm, Hà Nội ', N'0822191887', N'dophuvinh@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00092', N'Lưu Xuân Trường ', N'Xóm 2, Cổ Nhuế, Từ Liêm, Hà Nội ', N'0822191887', N'danghanhtuan@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00093', N'Nguyễn Quý Nhâm ', N'Đông Ngạc, Từ Liêm, Hà Nội ', N'0918736442', N'anhhoa@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00094', N'Hoàng Thị Lan Phương ', N'Xóm Ngang, Đại Mỗ, Từ Liêm, Hà Nội ', N'0977535078', N'nhonhuu@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00095', N'Vũ Thị Nga ', N'Mỹ Đình, Từ Liêm, Hà Nội ', N'0919651166', N'cbam_son@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00096', N'Nguyễn Thị Liền ', N'649C tổ 17 Cầu Diến, Từ Liêm, HN ', N'0982771202', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00097', N'Lê Đình Trọng ', N'Số 48 - Tổ 27 - Cụm 9 - Thôn Tân Xuân- Xuân Đỉnh - Từ Liêm - hà Nội ', N'0902910404', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00098', N'Phạm Thị An ', N'Số 48 tổ 27 Tân Xuân, Xuân Đỉnh, Từ Liêm, HN ', N'0902910404', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00099', N'Ngô Bá Duy ', N'Số nhà 35, Ngõ 18, Khu Trung Xuân Đỉnh, Từ Liêm, Hà Nội ', N'0983329469', N'anh@itfvn.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00100', N'Nguyễn Việt Hùng ', N'Xóm Lại, Phú Mỹ, Mỹ Đình, Từ Liêm, HN ', N'0989064113', N'pxbach@hcm.vnn.vn')
GO
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00101', N'Phạm Thị Lan Anh ', N'Phồng 807 B5 Mỹ Đình1, Từ Liêm, Hà Nội ', N'0987188015', N'phancong@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00102', N'Nguyễn Thị Loan ', N'tt 361 Xuân Đỉnh, Từ Liêm, Hà Nội ', N'0913980939', N'robeduc@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00103', N'Nguyễn Thanh Tùng ', N'P707, Nhà B3, Mỹ Đình I, Từ Liêm, Hà Nội ', N'0918543423', N'trung_dung@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00104', N'Nguyễn Đình Huy ', N'Xóm I, Mễ Trì, Từ Liêm, HN ', N'0938898838', N'aseanci@saigonnet.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00105', N'Vi Thị Nhi ', N'Nhân Mỹ, Mỹ Đình, Từ Liêm, HN ', N'0983829070', N'lanpl@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00106', N'Nguyễn Thị Vân Anh ', N'TX92, Nhân Chính, Từ Liêm, HN ', N'0909631599', N'nmaidloi@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00107', N'Đỗ Thị Nga ', N'Xóm 1, Thôn Thượng, Mễ Trì, Từ Liêm, HN ', N'0907288378', N'nxl@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00108', N'Tạ Thị Vân Trang ', N'P508A - CT5 khu ĐT Sông Đà, Mỹ Đình, Từ Liêm, HN ', N'0903745113', N'cqc@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00109', N'Huỳnh Lâm ', N'Số 221, Khu Tập thể Điện Cơ, Đông Ngạc, Từ Liêm, Hà Nội ', N'0903875217', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00110', N'Lê Thuý Hạnh', N'83 Đường Sông Nhuệ, Xóm 6, Đông Ngạc, Từ Liêm, HN ', N'0932716838', N'gierepofficehcmc@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00111', N'Lê Huy Thức', N'02 Villa E-The Manor- My Dinh-Từ Liêm - Ha Noi', N'0979635353', N'thanh-ngoc@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00112', N'Ôn Thái Trần', N'VPC: Số 83 Ngân Hàng-Cầu Diễn-Từ Liêm-Hà Nội', N'0987400574', N'tiags@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00113', N'Nguyễn Quang Ngọc', N'02- Villa E- The Manor - My Dinh, Từ Liêm, Ha Noi', N'0938510698', N'dinhchanh123@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00114', N'Nguyễn Hà Thái Sơn', N'Phòng 302 C3 KĐT Mỹ Đình 1, Từ Liêm, HN', N'0938510698', N'vinh.chi.nguyen@holcim.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00115', N'Nguyễn Văn Cường', N'Số nhà 12 Ngõ 190 Hoàng Quốc Việt, Từ Liêm, Hà Nội', N'0933992920', N'maystar@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00116', N'Nguyễn Văn Dũng', N'14 Trung Văn Từ Liêm _ Hà Nội ', N'0918093645', N'giao-yen@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00117', N'Trần Thị Việt', N'14 Trung Văn- Từ Liêm_ Hà Nội ', N'0989002439', N'3asg@saigonnet.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00118', N'Nguyễn Văn Hưng', N'103 Phung Khoang Từ Liêm Hà Nội ', N'0983771819', N'nhattuongyao@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00119', N'Nguyễn Văn Nhat', N'106 A3 Tập Thể T262 Cục Quân Khí,Phú Diễn,Từ Liêm,Hà Nội ', N'0932661449', N'linhdao@mail.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00120', N'Trần Văn Dan', N'107G - Ngõ 5 - Xóm Xếp - Cầu Diễn - Từ Liêm - Hà Nội ', N'0937230184', N'minhbinhduong@fptnet.com.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00121', N'Nguyễn Văn Tuan', N'10D Tt Tcục 2, Bqp, Xuân Đỉnh, Từ Liêm, Hà Nội ', N'0934139286', N'dungton@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00122', N'Trần Thị Thu', N'11 Pham Hung - Từ Liêm - Hà Nội', N'0983416641', N'nguyenduonghuynh@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00123', N'Trần Thị Hương', N'11/43 Phùng Khoang- Trung Văn- Từ Liêm, Hà Nội', N'0983416641', N'leanhkiet@mail.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00124', N'Nguyễn Thị Liên', N'110 N4 Thi Tran Cau Dien Từ Liêm Hà Nội, ', N'0989365056', N'ttnhlac@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00125', N'Nguyễn Ngọc Khải', N'228 Cầu Diễn - Từ Liêm, Hà Nội, ', N'0933439172', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00126', N'Hoàng Quỳnh Trang', N'233 Tt In Quân Dội - Tt Cầu Diễn - Từ Liêm - Hà Nội ', N'0933439172', N'buss7979@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00127', N'Nguyễn Thị Chín', N'25Phung Khoang Từ Liêm Hà Nội', N'0919175888', N'wind@bdvn.vnd.net')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00128', N'Lê Mạnh Nhu', N'264 Cầu Diễn ,Từ Liêm, Hà Nội, ', N'0919175888', N'savidecor@fmail.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00129', N'Nguyễn Văn Hóa ', N'28 Tổ 10 Cầu Diễn, Từ Liêm, Hà Nội ', N'0919175888', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00130', N'Quách Thanh Sơn ', N'Thị trấn Thường Tín, Hà Nội ', N'01679528227', N'vivudt@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00131', N'Nguyễn Ngọc Đôn ', N'251 Phố Ga, Thường Tín, Hà Nội ', N'0983404864', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00132', N'Trương Thị Hạc ', N'Duyên Thái, Thường Tín, HN ', N'', N'annie@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00133', N'Uông Đức Lượng ', N'Tô Hiệu, Thường Tín, Hà Tây ', N'0903878811', N'kalanta@petronas.com.my')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00134', N'Trịnh Đình Cương ', N'Liên phương, Thường Tín, HN ', N'0989004705', N'vilube@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00135', N'Phạm Quang Hanh ', N'Thường Tín, Hà Nội ', N'0934727797', N'Artglass@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00136', N'Trần Thanh Tùng ', N'Tô Hiệu Thường Tín, Hà Nội ', N'0907221929', N'ast-airticket@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00137', N'Phạm Thị Nguyệt Hằng ', N'thị trấn Thường Tín, HN ', N'0982101310', N'nhdminh@apac.ko.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00138', N'Phạm Thị Thanh Vân ', N'Tân Minh Thường Tín Hà Tây ', N'09089518767', N'tnlco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00139', N'Nguyễn Quang Hưởng ', N'Thị trấn Thường Tín ', N'01682769393', N'tsm238@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00140', N'Trần Đức Vũ', N'Duyên Thái, Thường Tín, HN ', N'0933169016', N'truongminhhuy@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00141', N'Nguyễn Thị Ngọc Thuỷ', N'503 - A1Thanh Xuân Bắc - HN', N'0948052003', N'wavelotus@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00142', N'Nguyễn Thị Thuỷ', N'Số 8 - ngõ 102 - Khuất Duy Tiến - Thanh Xuân - HN', N'0918649733', N'duchy@fiditourvietnam.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00143', N'Nguyễn Văn Tuyết', N'Nhà máy oto Hoà Bình - Thanh Xuân Nam - HN', N'0933423302', N'iptco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00144', N'Do Thanh Hai', N'62 Phố Cự Lộc - Thanh Xuân - HN', N'0913117803', N'ngtam@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00145', N'Dao Xuan Khanh', N'60A Nguy Nhu Kon Tum - Thanh Xuân - HN', N'0913117803', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00146', N'Dang Huy Trinh', N'P111 E4 - Thanh Xuân Bac - Thanh Xuân - HN', N'0989004705', N'hanadang@goldsunvn.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00147', N'Nguyễn Thị Thủy', N'P201- c5 - Thanh Xuân Bac - Ha Noi', N'0918587891', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00148', N'Nguyễn Đức Tân', N'TT Nhà Máy ô tô Hòa Bình, Thanh Xuân, Hà Nội', N'0973273939', N'hungtu@tlnet.com.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00149', N'Vũ Thị kim Tuyến', N'71 Chính Kinh, Thanh Xuân, Hà Nội', N'0937907183', N'pnco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00150', N'Nguyễn Anh Văn', N'5/H12 Thanh Xuân Nam, Hà Nội', N'0913935593', N'sales@itsolution2b.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00151', N'Nguyễn Việt Chiến', N'Tổ 1 Phương Liệt, Thanh Xuân, Hà nội', N'0988896981', N'haquockhanh@fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00152', N'Hoàng Hữu Chiến', N'Số 3 Ngõ 93/73 Hoàng Văn Thái, Thanh Xuân, Hà Nội', N'0913584857', N'hacongthai77@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00153', N'Nguyễn Thành Trung', N'P102-D5, TT ĐHNN, Thanh Xuân Bắc, HN', N'0982887279', N'tantrao@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00154', N'Đỗ Duy Lai', N'Số 6, Ngõ 46, Nhân Hòa, Nhân Chính, Thanh Xuân, HN', N'0982887279', N'dalena@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00155', N'Lê Bích Hà', N'SN 25 - Ngõ 80 - Lê Trọng Tấn - Khương Mai - Thanh xuân - Hà Nội', N'0979708096', N'manh-khoi.pham@metro.com.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00156', N'Nguyễn Văn Ngôi', N'So10 Ngõ 153 - Trường Chinh - Thanh Xuân - Hà Nội', N'0933606677', N'ttnghia@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00157', N'Ngô Anh Tuấn', N'Tổng công ty XD Trường Sơn - - 475 Nguyễn Mai - Thanh Xuân - Hà Nội', N'0908114241', N'hychi-adv@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00158', N'Nguyễn Hồng Thao', N'19 Ngách 64 Ngõ 132 Khương Trung - Thanh Xuân - Hà Nội', N'0982237843', N'NQ_JOY@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00159', N'Nguyễn Anh Thư', N'8/102 Khuất Duy Tiến-Thanh Xuân-Hà Nội', N'0976830219', N'printshop@saigonnet.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00160', N'Nguyễn Mạnh Thắng', N'Số 21 - Ngõ 122 - Khương Đình - Thanh Xuân - Hà Nội', N'0917722801', N'ngoisaonho@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00161', N'Nguyễn Thị Vũ Thịnh', N'601 Nguyễn Trãi - Thanh Xuân - Hà Nội', N'0917722801', N'phusoco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00162', N'Bùi Thị Hương Giang', N'381 Nguyễn Trãi,Thanh Xuân ,Hà Nội', N'0905733343', N'phi-nga@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00163', N'Lê Thị Thủy ', N'P404 - B12 - Thanh Xuân Bắc - Hà Nội', N'0913935593', N'lvtruong@cinet.vnnews.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00164', N'Nguyễn Thị Hải Hà ', N'SN 100 - Ngõ 80 - Ngụy Như Kon Tum - Quận Thanh Xuân - HN ', N'0973039079', N'qh-quang@hotmail.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00165', N'Đinh Thị Thảo ', N'Số 11C ngõ 144/8 Quan Nhân, Thanh Xuân, HN ', N'0937907183', N'kha.ngo@sonyericsson.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00166', N'Trần Thị Thanh Huyền ', N'Phòng Nhân sự, PG Bank Chi nhánh Hà Nội, 18T1-18T2 Lê Văn Lương, Thanh Xuân, HN ', N'0919031238', N'kimngocho@tatacopeanuts.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00167', N'Nguyễn Thị Thúy ', N'Tòa nhà Vinaconex, khu đô thị Trung Hòa - Nhân Chính, Thanh Xuân, HN ', N'0947789969', N'tinnhanco@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00168', N'Phạm Xuân Đông ', N'P 023, Chung cư I9, Thanh Xuân Bắc, HN ', N'0918093039', N'tinphatco@fptnet.com.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00169', N'Hoàng Thị Thu Thủy ', N'Số 18 ngõ 22 Kim giang, Thanh Xuân, HN ', N'0919220377', N'hoatonvn@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00170', N'Nguyễn Quang Hà ', N'P1102 Nhà 18T2, Trung Hòa - Nhân Chính, Thanh Xuân, HN ', N'0903877999', N'gicolor@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00171', N'Đỗ Đức Thắng ', N'18 ngõ 73 Nguyễn Trãi, Thanh Xuân, HN ', N'0933654444', N'vietphone@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00172', N'Nguyễn Mạnh Dũng ', N'P1105 - 18T1, Trung Hòa - Nhân Chính, Thanh xuân, HN ', N'0933654444', N'a-b.interiodeco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00173', N'Hoàng Mạnh Tuấn ', N'Số nhà 21 - 320/5 Khương Đình, Thanh Xuân, HN ', N'0937136488', N'nguyen_thang@colpal.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00174', N'Lã Thúy Quỳnh ', N'Số 1 ngách 3/29 Cù Chính Lan, Thanh Xuân, Hà Nội ', N'0905123012', N'ipesco@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00175', N'Nguyễn Thúy Vinh ', N'Km 9,200 Nguyễn Trãi, Thanh Xuân, Hà Nội ', N'0933317383', N'nxdhuy@tcmcompany.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00176', N'Lê Quang Vinh ', N'Số 38 - C16 - Ngách 23 - Ngõ 102 Hoàng Đạo Thành - Thanh Xuân - Hà Nội ', N'0958877666', N'kienliemco@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00177', N'Lại Tiến Quân ', N'Phòng 205 - I5, Thanh Xuân Bắc, HN ', N'0918469369', N'Pham-Son@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00178', N'Chu Thị Thu Hà ', N'Chi nhánh Ngân hàng BIDV Thanh Xuân, HN ', N'0909612420', N'tnco@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00179', N'Lê Hồng Thịnh ', N'Số 32 nghách 3 ngõ 198 Lê Trọng Tấn, Thanh Xuân, HN ', N'0982237843', N'hai-au@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00180', N'Vũ Bảo Long ', N'Số 3/146 Vương Thừa Vũ. Thanh Xuân, Hà Nội ', N'0984760109', N'bang@saosang.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00181', N'Đinh Cảnh Tùng ', N'Số 01 ngõ 01 Phan Đình Giót, Phương Liệt, Thanh Xuân, HN ', N'0983916990', N'nhatloi@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00182', N'Trần Thị Thanh Huyền ', N'30 Bùi Xương Trạch, Thanh Xuân, HN ', N'0918191983', N'sangtaotre@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00183', N'Nguyễn Vũ Anh Thư ', N'Tầng 5 Số 01 ngõ 01 Phan Đình Giót, Phương Liệt, Thanh Xuân, HN ', N'0913711621', N'info@songmay.net')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00184', N'Trần Ngọc Ký ', N'P612 nhà 18T2, Trung Hòa - Nhân Chính, Thanh Xuân,HN ', N'0913476449', N'songhanhad@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00185', N'Trần Quốc Hoàn ', N'121 Hoàng Văn Thái, Thanh Xuân, HN ', N'0913403131', N'sanhu@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00186', N'Nguyễn Thúy Nga ', N'Số 28/2/129 Nguyễn Trỗi, Thanh Xuân, HN ', N'0908799247', N'')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00187', N'Đinh Thị Huê ', N'P605 nhà 17T8, trung hòa, Nhân Chính, Thanh Xuân, HN ', N'0935194555', N't.q.m.co@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00188', N'Hoàng Ngọc Thảo ', N'Tập thể H14, Thanh Xuân, HN ', N'0909923823', N'tkcompany@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00189', N'Chu Anh Đức ', N'P506 A4, Khu tập thể Bộ công an, ngõ 102 Nguyễn Huy Tưởng, Thanh Xuân, HN ', N'0906958003', N'hoadinhngo2003@yahoo.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00190', N'Phùng Văn Nhượng ', N'Số 4, Ngụy Nhu Kom Tum, Nhân Chính, Thanh Xuân Hà Nội ', N'0918070031', N'hungphat.co@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00191', N'Nguyễn Hoàng Giang ', N'T7 Lê Văn Thiêm, Nhân Chính, Thanh Xuân, Hà Nội ', N'0918650166', N'daiphuccantho@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00192', N'Đặng Thi Hảo ', N'375A đường Trường Chinh, Phường Khương Trung, Phường Thanh Xuân, Hà Nội ', N'0977158270', N'mc_co@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00193', N'Dương Thị thu Hà ', N'100 Nguyễn Huy Tưởng, Thanh Xuân, HN ', N'0972402929', N'mkp@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00194', N'Nguyễn Thị Ngọc Lựu ', N'P177, I9, Đường Khuất Duy Tiến, thanh Xuân, Hà Nội ', N'0938938090', N'tvmt@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00195', N'Nguyễn Thị Dung ', N'Công Ty CP Tư Vấn Sông Đà, 69 Thanh Xuân, Hà Nội ', N'0909220146', N'hangocsonnt@hcm.vnn.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00196', N'Mai Thị Loan ', N'P507-B7, Thanh Xuân BẮc, HN ', N'0913858686', N'nhonco@msn.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00197', N'Phạm Thị Kiều Yến ', N'BIDV Thanh Xuân ', N'0977878558', N'vts@hcm.fpt.vn')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00198', N'Bùi Bích Diệp ', N'P310 A3, Ngõ 104 Nguyễn Huy Tưởng, Thanh Xuân, HN ', N'0905733343', N'info@vipcomnet.com')
INSERT [dbo].[tblKhachHang] ([MaKH], [Name], [DiaChi], [SDT], [Email]) VALUES (N'KH00199', N'Nguyễn Thị Thanh Hoa ', N'P506, 17T9 KHu ĐTM Trung Hòa Nhân Chính - Thanh Xuân - Hà Nội ', N'0978755882', N'donaco2@hcm.vnn.vn')
INSERT [dbo].[tblMauSac] ([IDMauSac], [TenMauSac]) VALUES (N'MS001', N'Màu đỏ')
INSERT [dbo].[tblMauSac] ([IDMauSac], [TenMauSac]) VALUES (N'MS002', N'Màu cam')
INSERT [dbo].[tblMauSac] ([IDMauSac], [TenMauSac]) VALUES (N'MS003', N'Màu xanh lá')
INSERT [dbo].[tblMauSac] ([IDMauSac], [TenMauSac]) VALUES (N'MS004', N'Màu xanh da')
INSERT [dbo].[tblMenu] ([ID], [Name], [Link], [Order], [Content]) VALUES (N'MN00001', N'Quần áo bé trai', N'NguoiDungLayDanhSachSanPhamTheoMenuServlet', NULL, N'Quần áo bé trai đẹp, giá rẻ nhiều mẫu thời trang bé trai mới cập nhật thường xuyên mỗi ngày. DolaKids là nơi chọn mua đồ bé trai tin cậy nhất tại Tp.HCM.')
INSERT [dbo].[tblMenu] ([ID], [Name], [Link], [Order], [Content]) VALUES (N'MN00002', N'Quần áo bé gái', N'NguoiDungLayDanhSachSanPhamTheoMenuServlet', NULL, N'Ngắm con gái xinh xắn, dễ thương trong bộ quần áo thời trang mới tinh là niềm hạnh phúc của mẹ. Để con bạn luôn đáng yêu trong mắt mình và mọi người hãy mua ngay quần áo thời trang bé gái cực xinh để làm điệu cho bé.')
INSERT [dbo].[tblMenu] ([ID], [Name], [Link], [Order], [Content]) VALUES (N'MN00003', N'Quần áo sơ sinh', N'NguoiDungLayDanhSachSanPhamTheoMenuServlet', NULL, N'Muốn mua quần áo sơ sinh cho bé tại Sài Gòn, mua ở đâu? Babi tự hào là địa điểm bán quần áo thời trang trẻ em online uy tín nhất được nhiều mẹ biết đến. Sản phẩm của cửa hàng là hàng Việt Nam chất lượng tốt, rất an toàn cho làn da của trẻ.')
INSERT [dbo].[tblMenu] ([ID], [Name], [Link], [Order], [Content]) VALUES (N'MN00004', N'Đồ dùng cho bé', N'NguoiDungLayDanhSachSanPhamTheoMenuServlet', NULL, N'Không phải lặn lội tới cửa hàng để mua đồ dùng cho bé, chỉ cần ngồi nhà và thực hiện vài thao tác click chuột là mẹ có ngay đủ loại đồ dùng cho bé. Mua đồ dùng cho trẻ tại cửa hàng các mẹ yên tâm không sợ hàng giả, hàng nhái, hàng kém chất lượng. Sản phẩm của Babi là hàng chính hãng có xuất xứ rõ ràng. Vì sức khỏe của con yêu, mẹ hãy có sự chọn lựa đúng đắn nhé!')
INSERT [dbo].[tblMenu] ([ID], [Name], [Link], [Order], [Content]) VALUES (N'MN00005', N'Quần áo trẻ em từ 10-12 tuổi', N'NguoiDungLayDanhSachSanPhamTheoMenuServlet', NULL, N'Mua quần áo trẻ em size lớn ở đâu tại Tp.HCM? Không ít mẹ lăn tăn vì rất ít cửa hàng thời trang trẻ em bán đồ size đại cho bé. Mẹ không phải khó khăn khi chọn quần áo cho bé nhà mình vì không có đồ phù hợp với size của bé nữa. Babi dành riêng hẳn một chuyên mục quần áo size lớn cho bé từ 10 - 12 tuổi để mẹ có thể dễ dàng lựa chọn những bộ quần áo xinh xắn, vừa vặn cho con.')
INSERT [dbo].[tblMenu] ([ID], [Name], [Link], [Order], [Content]) VALUES (N'MN00006', N'Hàng mới về', N'NguoiDungLayDanhSachSanPhamTheoMenuServlet', NULL, N'Quần áo thời trang trẻ em hàng chất giá tốt 2018. Mẫu mới về mỗi ngày. Số lượng có hạn, hãy Đặt hàng ngay!')
INSERT [dbo].[tblMenu] ([ID], [Name], [Link], [Order], [Content]) VALUES (N'MN00007', N'Quần áo trẻ em hình thú', N'NguoiDungLayDanhSachSanPhamTheoMenuServlet', NULL, NULL)
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (N'NCC00001', N'Xưởng sỉ quần áo trẻ em OVmart', N'150B Tổ 6 Phố Vọng, Phương Liệt, Thanh Xuân, Hà Nội', N'0968 475 823', N'ovmart@gmail.com')
INSERT [dbo].[tblNhaCungCap] ([MaNCC], [TenNCC], [DiaChi], [SDT], [Email]) VALUES (N'NCC00002', N'Xưởng may Minh Anh', N'số 9A, ngách 44/148, ngõ 36 Dịch Vọng Hậu, Cầu Giấy, Hà Nội', N'0984 988 028', N'minhanh@gmail.com')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00001', N'Áo sơ mi bé trai', N'Bé trai trông lịch lãm và đáng yêu hơn khi diện áo sơ mi mới tinh. Mua ngay áo sơ mi cho bé trai đẹp, giá rẻ tại cửa hàng thời trang Babi, mẹ sẽ rất hài lòng.', N'ao-so-mi-soc-caro-tay-dai-cho-be-trai_(2).jpg', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00002', N'Áo thun bé trai', N'Đơn giản và tiện lợi, chiếc áo thun cho bé trai đẹp có thể phối quần short, quần dài, quần lửng tạo phong cách khỏe khoắn, năng động cho bé.', N'ao-thun-dai-tay-in-chu-cho-be-trai.jpg', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00003', N'Áo khoác bé trai', N'Một chiếc áo khoác cho bé trai là phương tiện không thể thiếu mỗi khi bé đi ra ngoài nhằm bảo vệ bé tránh những tác hại thời tiết. Để bảo về tốt nhất cho bé, Mẹ hãy mua ngay áo khoác trẻ em tại Babi để bổ sung vào tủ quần áo của bé.', N'ao-khoac-cho-be-trai-1-5-tuoi-vai-kaki-phoi-2-tui_(2).jpg', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00004', N'Quần kiểu bé trai', N'Những chiếc quần kiểu cho bé trai đầy cá tính không thể thiếu cho các bé năng động, có thể kết hợp với nhiều kiểu áo tạo phong cách khỏe khoắn, tinh nghịch cho bé.', N'quan-dai-theu-chu-cho-be-trai.jpg', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00005', N'Quần jeans bé trai', N'Thời trang quần jeans cho bé trai chưa bao giờ lỗi mốt, quần jeans đẹp, giá rẻ bán nhiều tại cửa hàng Babi, mẹ hãy mua ngay để bổ sung vào tủ quần áo cho bé.', N'bo-quan-ao-be-trai-in-chu-superem-6-11-tuoi_(1).jpg', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00006', N'Đồ bộ bé trai', N'Đồ bộ bé trai giá rẻ, mẫu mã đẹp, họa tiết phong phú là các nhân vật hoạt hình, siêu nhân, hình thú... được các bé trai yêu thích. Quần áo trẻ em bán tại cửa hàng chất liệu tốt, giá rẻ được rất nhiều mẹ quan tâm tại Tp.HCM.', N'do-bo-be-trai-1-10-tuoi-phong-cach-the-thao_(2).jpg', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00007', N'Đồ bơi bé trai', N'Đồ bơi cho bé trai giá rẻ, chất liệu vải thun co giãn tốt, bền và thời trang. Mua ngay đồ bơi để đảm bảo bé trai nhà bạn học bơi nhanh và giỏi nhất.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00008', N'Quần lót bé trai', N'Không chỉ bé gái, các bé trai cũng cần mặc quần lót nhằm giúp bé giữ ghìn cơ thể sạch sẽ và tránh trầy xước da vùng kín, các mẹ hãy mua ngay quần lót cho bé trai tại cửa hàng quần áo trẻ em Babi, giá rẻ, dịch vụ tốt.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00009', N'Giày dép bé trai', N'Giày dép cho bé trai hàng tốt, siêu bền mang êm chân cho bé từ tập đi đến các bé lớn. Các mẹ có thể mua online hoặc đến cửa hàng để chọn nhiều mẫu giày đẹp, thời trang cho bé. ', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00010', N'Đồ dùng phụ kiện bé trai', N'Thêm phụ kiện cho bé trai như: Nón, caravat, nơ, thắt lưng đi kèm với bộ quần áo mới mỗi khi đi chơi, đi lễ hay đi tiệc trông bé trai nhà mẹ rất phong cách và sành điệu hơn hẳn. Mẹ đừng quên mix phụ kiện cho con với những bộ đồ phù hợp mẹ nhé để bé trông nam tính và đáng yêu hơn đấy ạ.', N'phu-kien-cho-be-3-10-tuoi-khan-choang-co-tron-tron-am-ap_(1).jpg', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00011', N'Váy Đầm Công Chúa bé gái', N'Đầm công chúa cho bé gái bán tại cửa hàng Babi là những mẫu đầm công chúa trẻ em cao cấp được chọn lựa kỹ từ khâu thiết kế đến chất liệu. Mẹ hãy mua ngay váy công chúa đẹp cho bé để ngắm con yêu xúng xính như một nàng công chúa nhỏ.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00012', N'Váy Đầm bé gái', N'Đầm bé gái đa dạng từ áo đầm trẻ em cao cấp đến đầm em bé giá rẻ được tỉ mỉ từ khâu chọn vải tới kiểu dáng. Đừng bỏ lỡ cơ hội diện đầm, váy xinh cho bé mẹ ạ.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00013', N'Áo bé Gái', N'Thời trang áo cho bé gái rất đa dạng về kiểu dáng: Áo sơ mi, áo kiểu, áo thun...được Babi tỉ mỉ từ khâu chọn vải đến từng đường kim mũi chỉ để cho ra sản phẩm đẹp, giá rẻ đảm bảo làm hài lòng các mẹ khó tính nhất.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00014', N'Áo khoác bé gái', N'Những chiếc áo khoác cho bé gái để che nắng, che gió, chống rét nhưng không kém phần thời trang được Babi nhập kho số lượng nhiều, mẫu mã đa dạng. Mẹ hãy mua ngay cho con để giúp bé chống lại những tác hại của thời tiết.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00015', N'Quần trẻ em gái', N'Quần cho bé gái đa dạng chất liệu: Jeans, kaki, thun đến kiểu dáng: Legging, short, lửng tạo nên bộ sưu tập thời trang dễ thương cho các cô nàng nhí.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00016', N'Đồ bộ bé gái', N'Đồ bộ cho bé gái họa tiết dễ thương được thiết kế phù hợp theo mùa. Ở Tp.HCM mua quần áo ở đâu? Đến với Babi mẹ dễ dàng chọn mua đồ bộ trẻ em giá rẻ, đẹp.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00017', N'Đồ bơi bé gái', N'Mua đồ bơi bé gái ở đâu đẹp, giá rẻ tại Tp.HCM? Cửa hàng Babi bán đồ bơi bé gái nhiều kiểu dáng bé mặc xinh xắn, đáng yêu: Đồ bơi liền váy, đồ bơi một mảnh, đồ bơi 2 mảnh, bikini được may bằng chất liệu thun co giãn tốt, mặc mát giúp bé thoải mái trong quá trình bơi.  ', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00018', N'Quần lót bé gái', N'Mẹ hãy tập cho bé mặc quần lót(quần chip) ngay từ bây giờ để giúp bé ý thức giữ ghìn vệ sinh vùng kín sạch sẽ. Ngoài ra trong quá trình vui chơi bé cũng sẽ có những va chạm đôi khi ảnh hưởng tới bộ phận sinh dục vì vậy việc mặc quần lót là cần thiết cho các bé.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00019', N'Giày dép bé gái', N'Với kiểu dáng đa dạng được làm từ chất liệu an toàn, bền, đẹp mang êm chân, giày dép bé gái xinh xắn, đáng yêu bán đủ loại cho bé từ sơ sinh, các bé tập đi đến các bé đến trường. Hãy cùng Babi nâng niu bàn chân của bé.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00002')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00020', N'Đồ dùng Phụ kiện bé gái', N'Bé trông sinh xắn và đáng yêu hơn nhiều khi mẹ biết phối đồ cho bé, ngoài những bộ đồ thời trang hợp mốt, phụ kiện bé gái đi kèm giúp bé tỏa sáng, sành điệu hơn. Một chiếc nơ cài tóc, một cái mắt kính hay chiếc đồng hồ đeo tay giúp tôn lên nét đáng yêu ở bé.', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00021', N'Đồ dùng phụ kiện sơ sinh cho bé', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00022', N'Quần áo sơ sinh bé trai', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00003')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00023', N'Quần áo sơ sinh bé gái', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00003')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00024', N'Đồ sơ sinh trọn gói', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00003')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00025', N'Giày sơ sinh', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00003')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00026', N'Đồ dùng bé ăn', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00027', N'Đồ dùng bé ngủ', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00028', N'Đồ dùng bé vệ sinh', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00029', N'Đồ dùng bé ra ngoài', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00030', N'Đồ dùng bé khỏe an toàn', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00031', N'Đồ dùng, chơi cho bé', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00004')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00032', N'Quần áo bé gái 10 - 12 tuổi', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00005')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00033', N'Quần áo bé trai 10 - 12 tuổi', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00005')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00034', N'Size 8.5-10.5kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00035', N'Size 10.5-11.5kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00036', N'Size 11.5-13.5kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00037', N'Size 13.5-15kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00038', N'Size 15-17kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00039', N'Size 17 - 20kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00040', N'Size 20 - 23kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00041', N'Size 23 - 26kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00042', N'Size 26 - 30kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00043', N'Size 30 - 35kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00044', N'Size 35 - 40kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00045', N'Size 40 - 45kg', N'', N'', NULL, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00007')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00046', N'Áo bé trai', N'Quần áo bé trai đẹp, giá rẻ nhiều mẫu thời trang bé trai mới cập nhật thường xuyên mỗi ngày. Babi là nơi chọn mua đồ bé trai tin cậy nhất tại Tp.HCM.', N'ao-ghile-sat-nach-co-tim-cho-be_(3).jpg', 1, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00001')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00047', N'Phụ kiện sơ sinh cho bé', N'Chuẩn bị đồ sơ sinh cho bé luôn là việc bố mẹ rất quan tâm bởi làn da con trẻ vô cùng nhạy cảm. Những món đồ dùng cho trẻ sơ sinh của Babi.vn cũng vì thế luôn được đầu tư từ chất liệu đến kiểu dáng sao cho đẹp và an toàn để bé yêu sử dụng. Đồ sơ sinh trọn gói như tã, bỉm, nón, khăn,... với giá rẻ và chất lượng đảm bảo sẽ khiến những bố mẹ khó tính nhất hài lòng.', N'set-non-yem-hinh-robot-cho-be-mlb03.jpg', 1, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00003')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00048', N'Áo sơ sinh', N'Đối với việc mua sắm đồ để chào đón thiên thần bé nhỏ, dù đây là lần đầu tiên hay đã có kinh nghiệm thì các bà mẹ cũng rất lung túng trong việc chọn mua quần áo sơ sinh. Tại Babi, đồ trẻ sơ sinh với nhiều mẫu mã đa dạng, phong phú với kiểu dáng, chất lượng, đặc biệt an toàn sẽ là sự lựa chọn hàng đầu cho quý khách hàng khi chọn quần áo sơ sinh, đồ trẻ sơ sinh.', N'ao-cho-be-so-sinh-bac-si-tay-ngan-in-hinh-de-thuong_(4).jpg', 1, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00003')
INSERT [dbo].[tblNhomSP] ([MaNhomSP], [Name], [Content], [NameImage], [OrderTT], [Status], [Link], [MainMenuID]) VALUES (N'NH00049', N'Quần sơ sinh', N'Đối với việc mua sắm đồ để chào đón thiên thần bé nhỏ, dù đây là lần đầu tiên hay đã có kinh nghiệm thì các bà mẹ cũng rất lung túng trong việc chọn mua quần áo sơ sinh. Tại Babi, đồ trẻ sơ sinh với nhiều mẫu mã đa dạng, phong phú với kiểu dáng, chất lượng, đặc biệt an toàn sẽ là sự lựa chọn hàng đầu cho quý khách hàng khi chọn quần áo sơ sinh, đồ trẻ sơ sinh.', N'set-5-quan-dai-nhieu-mau-cho-be-trai_(7).jpg', 1, NULL, N'NguoiDungLayDanhSachSPTheoNhomSPServlet', N'MN00003')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00001', N'DT04')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00001', N'DT05')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00001', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00002', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00002', N'DT09')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00002', N'DT10')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00003', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00003', N'DT09')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00003', N'DT10')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00004', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00004', N'DT07')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00004', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00005', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00005', N'DT07')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00005', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00006', N'DT05')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00006', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00006', N'DT07')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00007', N'DT05')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00007', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00007', N'DT07')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00007', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00007', N'DT09')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00008', N'DT02')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00008', N'DT03')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00008', N'DT04')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00010', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00010', N'DT07')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00010', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00012', N'DT02')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00012', N'DT03')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00012', N'DT04')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00012', N'DT05')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00012', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00014', N'DT05')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00014', N'DT06')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00014', N'DT07')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00014', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00014', N'DT09')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00017', N'DT08')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00023', N'DT02')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00023', N'DT03')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00023', N'DT04')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00024', N'DT01')
INSERT [dbo].[tblSanPhamDoTuoi] ([MaSP], [IDNhomTuoi]) VALUES (N'SP00024', N'DT02')
INSERT [dbo].[tblSanPhamMauSac] ([IDSanPham], [IDMauSac], [Images]) VALUES (N'SP00001', N'MS001', N'ao-so-mi-soc-caro-tay-dai-cho-be-trai_(2).jpg')
INSERT [dbo].[tblSanPhamMauSac] ([IDSanPham], [IDMauSac], [Images]) VALUES (N'SP00001', N'MS002', N'ao-so-mi-soc-caro-tay-dai-cho-be-trai_(4).jpg')
INSERT [dbo].[tblSanPhamMauSac] ([IDSanPham], [IDMauSac], [Images]) VALUES (N'SP00001', N'MS003', N'ao-so-mi-soc-caro-tay-dai-cho-be-trai_(5).jpg')
INSERT [dbo].[tblSanPhamMauSac] ([IDSanPham], [IDMauSac], [Images]) VALUES (N'SP00002', N'MS001', N'ao-so-mi-soc-caro-tay-dai-cho-be-trai-size-dai_(4).jpg')
INSERT [dbo].[tblSanPhamMauSac] ([IDSanPham], [IDMauSac], [Images]) VALUES (N'SP00002', N'MS002', N'ao-so-mi-soc-caro-tay-dai-cho-be-trai-size-dai_(5).jpg')
INSERT [dbo].[tblSanPhamMauSac] ([IDSanPham], [IDMauSac], [Images]) VALUES (N'SP00002', N'MS003', N'ao-so-mi-soc-caro-tay-dai-cho-be-trai-size-dai_(6).jpg')
INSERT [dbo].[tblTaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Rules], [Ten], [SDT], [NgaySinh], [DiaChi], [Email]) VALUES (N'TK00001', N'Admin', N'1', 1, N'Trần Ngọc Vinh', N'0123455668', CAST(0x0000878A00000000 AS DateTime), N'Đô Lương', N'vinh@gmail.com')
INSERT [dbo].[tblTaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Rules], [Ten], [SDT], [NgaySinh], [DiaChi], [Email]) VALUES (N'TK00002', N'NhanVien', N'1', 2, N'Nguyễn Văn Hoàng', N'0123765456', CAST(0x000088F700000000 AS DateTime), N'Vinh', N'cnguyen@gmail.com')
INSERT [dbo].[tblTaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Rules], [Ten], [SDT], [NgaySinh], [DiaChi], [Email]) VALUES (N'TK00003', N'KhachHang', N'1', 3, N'Trần Văn Hùng', NULL, NULL, NULL, N'vhung@gmail.com')
INSERT [dbo].[tblTaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Rules], [Ten], [SDT], [NgaySinh], [DiaChi], [Email]) VALUES (N'Tk00004', N'KhachHang1', N'1', 3, N'Nguyễn Thị Mai', NULL, NULL, NULL, N'tmai@gmail.com')
INSERT [dbo].[tblTaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Rules], [Ten], [SDT], [NgaySinh], [DiaChi], [Email]) VALUES (N'TK00005', N'KhachHang3', N'1', 3, N'KhachHang3', NULL, NULL, NULL, N'hoainam031095@gmail.com')
INSERT [dbo].[tblTaiKhoan] ([MaTK], [TaiKhoan], [MatKhau], [Rules], [Ten], [SDT], [NgaySinh], [DiaChi], [Email]) VALUES (N'TK00006', N'KhachHang2', N'1', 3, N'KhachHang2', NULL, NULL, NULL, N'hoainam031095@gmail.com')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (1, N'An Giang')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (2, N'Bà Rịa – Vũng Tàu')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (3, N'Bạc Liêu')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (4, N'Bắc Kạn')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (5, N'Bắc Giang')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (6, N'Bắc Ninh')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (7, N'Bến Tre')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (8, N'Bình Dương')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (9, N'Bình Định')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (10, N'Bình Phước')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (11, N'Bình Thuận')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (12, N'Cà Mau')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (13, N'Cao Bằng')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (14, N'Cần Thơ')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (15, N'Đà Nẵng')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (16, N'Đắk Lắk')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (17, N'Đắk Nông')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (18, N'Điện Biên')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (19, N'Đồng Nai')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (20, N'Đồng Tháp')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (21, N'Gia Lai')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (22, N'Hà Giang')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (23, N'Hà Nam')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (24, N'Hà Nội')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (25, N'Hà Tĩnh')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (26, N'Hải Dương')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (27, N'Hải Phòng')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (28, N'Hòa Bình')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (29, N'Hồ Chí Minh')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (30, N'Hậu Giang')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (31, N'Hưng Yên')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (32, N'Khánh Hòa')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (33, N'Kiên Giang')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (34, N'Kon Tum')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (35, N'Lai Châu')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (36, N'Lào Cai')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (37, N'Lạng Sơn')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (38, N'Lâm Đồng')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (39, N'Long An')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (40, N'Nam Định')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (41, N'Nghệ An')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (42, N'Ninh Bình')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (43, N'Ninh Thuận')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (44, N'Phú Thọ')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (45, N'Phú Yên')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (46, N'Quảng Bình')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (47, N'Quảng Nam')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (48, N'Quảng Ngãi')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (49, N'Quảng Ninh')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (50, N'Quảng Trị')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (51, N'Sóc Trăng')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (52, N'Sơn La')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (53, N'Tây Ninh')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (54, N'Thái Bình')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (55, N'Thái Nguyên')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (56, N'Thanh Hóa')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (57, N'Thừa Thiên – Huế')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (58, N'Tiền Giang')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (59, N'Trà Vinh')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (60, N'Tuyên Quang')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (61, N'Vĩnh Long')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (62, N'Vĩnh Phúc')
INSERT [dbo].[tblTinh] ([ID], [TenTinh]) VALUES (63, N'Yên Bái')
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (1, N'Phường Mỹ Bình', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (2, N'Phường Mỹ Long', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (3, N'Phường Đông Xuyên', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (4, N'Phường Mỹ Xuyên', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (5, N'Phường Bình Đức', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (6, N'Phường Bình Khánh', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (7, N'Phường Mỹ Phước', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (8, N'Phường Mỹ Quý', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (9, N'Phường Mỹ Thới', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (10, N'Phường Mỹ Thạnh', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (11, N'Phường Mỹ Hòa', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (12, N'Xã Mỹ Khánh', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (13, N'Xã Mỹ Hoà Hưng', 1)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (14, N'Phường Châu Phú B', 2)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (15, N'Phường Châu Phú A', 2)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (16, N'Phường Vĩnh Mỹ', 2)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (17, N'Phường Núi Sam', 2)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (18, N'Phường Vĩnh Ngươn', 2)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (19, N'Xã Vĩnh Tế', 2)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (20, N'Xã Vĩnh Châu', 2)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (21, N'Thị trấn An Phú', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (22, N'Xã Khánh An', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (23, N'Thị Trấn Long Bình', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (24, N'Xã Khánh Bình', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (25, N'Xã Quốc Thái', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (26, N'Xã Nhơn Hội', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (27, N'Xã Phú Hữu', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (28, N'Xã Phú Hội', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (29, N'Xã Phước Hưng', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (30, N'Xã Vĩnh Lộc', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (31, N'Xã Vĩnh Hậu', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (32, N'Xã Vĩnh Trường', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (33, N'Xã Vĩnh Hội Đông', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (34, N'Xã Đa Phước', 3)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (35, N'Thị trấn Tân Châu', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (36, N'Xã Tân Hà', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (37, N'Xã Tân Đông', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (38, N'Xã Tân Hội', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (39, N'Xã Tân Hòa', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (40, N'Xã Suối Ngô', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (41, N'Xã Suối Dây', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (42, N'Xã Tân Hiệp', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (43, N'Xã Thạnh Đông', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (44, N'Xã Tân Thành', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (45, N'Xã Tân Phú', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (46, N'Xã Tân Hưng', 4)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (47, N'Thị trấn Phú Mỹ', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (48, N'Thị trấn Chợ Vàm', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (49, N'Xã Long Hoà', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (50, N'Xã Phú Long', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (51, N'Xã Phú Lâm', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (52, N'Xã Phú Hiệp', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (53, N'Xã Phú Thạnh', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (54, N'Xã Hoà Lạc', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (55, N'Xã Phú Thành', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (56, N'Xã Phú An', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (57, N'Xã Phú Xuân', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (58, N'Xã Hiệp Xương', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (59, N'Xã Phú Bình', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (60, N'Xã Phú Thọ', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (61, N'Xã Phú Hưng', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (62, N'Xã Bình Thạnh Đông', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (63, N'Xã Tân Hòa', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (64, N'Xã Tân Trung', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (65, N'Thị trấn Cái Đôi Vàm', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (66, N'Xã Phú Thuận', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (67, N'Xã Phú Mỹ', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (68, N'Xã Phú Tân', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (69, N'Xã Tân Hải', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (70, N'Xã Việt Thắng', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (71, N'Xã Tân Hưng Tây', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (72, N'Xã Rạch Chèo', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (73, N'Xã Nguyễn Việt Khái', 5)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (74, N'Thị trấn Nhà Bàng', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (75, N'Thị trấn Chi Lăng', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (76, N'Xã Núi Voi', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (77, N'Xã Nhơn Hưng', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (78, N'Xã An Phú', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (79, N'Xã Thới Sơn', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (80, N'Thị trấn Tịnh Biên', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (81, N'Xã Văn Giáo', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (82, N'Xã An Cư', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (83, N'Xã An Nông', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (84, N'Xã Vĩnh Trung', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (85, N'Xã Tân Lợi', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (86, N'Xã An Hảo', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (87, N'Xã Tân Lập', 6)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (88, N'Thị trấn Tri Tôn', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (89, N'Thị trấn Ba Chúc', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (90, N'Xã Lạc Quới', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (91, N'Xã Lê Trì', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (92, N'Xã Vĩnh Gia', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (93, N'Xã Vĩnh Phước', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (94, N'Xã Châu Lăng', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (95, N'Xã Lương Phi', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (96, N'Xã Lương An Trà', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (97, N'Xã Tà Đảnh', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (98, N'Xã Núi Tô', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (99, N'Xã An Tức', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (100, N'Xã Cô Tô', 7)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (101, N'Xã Tân Tuyến', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (102, N'Xã Ô Lâm', 7)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (103, N'Thị trấn Cái Dầu', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (104, N'Xã Khánh Hòa', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (105, N'Xã Mỹ Đức', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (106, N'Xã Mỹ Phú', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (107, N'Xã Ô Long Vỹ', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (108, N'Xã Vĩnh Thạnh Trung', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (109, N'Xã Thạnh Mỹ Tây', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (110, N'Xã Bình Long', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (111, N'Xã Bình Mỹ', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (112, N'Xã Bình Thủy', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (113, N'Xã Đào Hữu Cảnh', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (114, N'Xã Bình Phú', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (115, N'Xã Bình Chánh', 8)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (116, N'Thị trấn Chợ Mới', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (117, N'Xã Tân Sơn', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (118, N'Xã Thanh Vận', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (119, N'Xã Mai Lạp', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (120, N'Xã Hoà Mục', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (121, N'Xã Thanh Mai', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (122, N'Xã Cao Kỳ', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (123, N'Xã Nông Hạ', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (124, N'Xã Yên Cư', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (125, N'Xã Nông Thịnh', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (126, N'Xã Yên Hân', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (127, N'Xã Thanh Bình', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (128, N'Xã Như Cố', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (129, N'Xã Bình Văn', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (130, N'Xã Yên Đĩnh', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (131, N'Xã Quảng Chu', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (132, N'Thị trấn Chợ Mới', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (133, N'Thị trấn Mỹ Luông', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (134, N'Xã Kiến An', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (135, N'Xã Mỹ Hội Đông', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (136, N'Xã Long Điền A', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (137, N'Xã Tấn Mỹ', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (138, N'Xã Long Điền B', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (139, N'Xã Kiến Thành', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (140, N'Xã Mỹ Hiệp', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (141, N'Xã Mỹ An', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (142, N'Xã Nhơn Mỹ', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (143, N'Xã Long Giang', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (144, N'Xã Long Kiến', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (145, N'Xã Bình Phước Xuân', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (146, N'Xã An Thạnh Trung', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (147, N'Xã Hội An', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (148, N'Xã Hòa Bình', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (149, N'Xã Hòa An', 9)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (150, N'Thị trấn Châu Thành', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (151, N'Xã Hảo Đước', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (152, N'Xã Phước Vinh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (153, N'Xã Đồng Khởi', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (154, N'Xã Thái Bình', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (155, N'Xã An Cơ', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (156, N'Xã Biên Giới', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (157, N'Xã Hòa Thạnh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (158, N'Xã Trí Bình', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (159, N'Xã Hòa Hội', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (160, N'Xã An Bình', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (161, N'Xã Thanh Điền', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (162, N'Xã Thành Long', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (163, N'Xã Ninh Điền', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (164, N'Xã Long Vĩnh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (165, N'Thị trấn Tầm Vu', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (166, N'Xã Bình Quới', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (167, N'Xã Hòa Phú', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (168, N'Xã Phú Ngãi Trị', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (169, N'Xã Vĩnh Công', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (170, N'Xã Thuận Mỹ', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (171, N'Xã Hiệp Thạnh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (172, N'Xã Phước Tân Hưng', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (173, N'Xã Thanh Phú Long', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (174, N'Xã Dương Xuân Hội', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (175, N'Xã An Lục Long', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (176, N'Xã Long Trì', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (177, N'Xã Thanh Vĩnh Đông', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (178, N'Thị trấn Tân Hiệp', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (179, N'Xã Tân Hội Đông', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (180, N'Xã Tân Hương', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (181, N'Xã Tân Lý Đông', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (182, N'Xã Tân Lý Tây', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (183, N'Xã Thân Cửu Nghĩa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (184, N'Xã Tam Hiệp', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (185, N'Xã Điềm Hy', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (186, N'Xã Nhị Bình', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (187, N'Xã Dưỡng Điềm', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (188, N'Xã Đông Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (189, N'Xã Long Định', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (190, N'Xã Hữu Đạo', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (191, N'Xã Long An', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (192, N'Xã Long Hưng', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (193, N'Xã Bình Trưng', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (194, N'Xã Thạnh Phú', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (195, N'Xã Bàn Long', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (196, N'Xã Vĩnh Kim', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (197, N'Xã Bình Đức', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (198, N'Xã Song Thuận', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (199, N'Xã Kim Sơn', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (200, N'Xã Phú Phong', 10)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (201, N'Thị trấn Châu Thành', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (202, N'Xã Tân Thạch', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (203, N'Xã Qưới Sơn', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (204, N'Xã An Khánh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (205, N'Xã Giao Long', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (206, N'Xã Giao Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (207, N'Xã Phú Túc', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (208, N'Xã Phú Đức', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (209, N'Xã Phú An Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (210, N'Xã An Phước', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (211, N'Xã Tam Phước', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (212, N'Xã Thành Triệu', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (213, N'Xã Tường Đa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (214, N'Xã Tân Phú', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (215, N'Xã Quới Thành', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (216, N'Xã Phước Thạnh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (217, N'Xã An Hóa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (218, N'Xã Tiên Long', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (219, N'Xã An Hiệp', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (220, N'Xã Hữu Định', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (221, N'Xã Tiên Thủy', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (222, N'Xã Sơn Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (223, N'Thị trấn Châu Thành', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (224, N'Xã Đa Lộc', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (225, N'Xã Mỹ Chánh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (226, N'Xã Thanh Mỹ', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (227, N'Xã Lương Hoà A', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (228, N'Xã Lương Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (229, N'Xã Song Lộc', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (230, N'Xã Nguyệt Hóa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (231, N'Xã Hòa Thuận', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (232, N'Xã Hòa Lợi', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (233, N'Xã Phước Hảo', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (234, N'Xã Hưng Mỹ', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (235, N'Xã Hòa Minh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (236, N'Xã Long Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (237, N'Thị trấn Cái Tàu Hạ', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (238, N'Xã An Hiệp', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (239, N'Xã An Nhơn', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (240, N'Xã Tân Nhuận Đông', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (241, N'Xã Tân Bình', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (242, N'Xã Tân Phú Trung', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (243, N'Xã Phú Long', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (244, N'Xã An Phú Thuận', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (245, N'Xã Phú Hựu', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (246, N'Xã An Khánh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (247, N'Xã Tân Phú', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (248, N'Xã Hòa Tân', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (249, N'Thị trấn An Châu', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (250, N'Xã An Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (251, N'Xã Cần Đăng', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (252, N'Xã Vĩnh Hanh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (253, N'Xã Bình Thạnh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (254, N'Xã Vĩnh Bình', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (255, N'Xã Bình Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (256, N'Xã Vĩnh An', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (257, N'Xã Hòa Bình Thạnh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (258, N'Xã Vĩnh Lợi', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (259, N'Xã Vĩnh Nhuận', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (260, N'Xã Tân Phú', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (261, N'Xã Vĩnh Thành', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (262, N'Thị trấn Minh Lương', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (263, N'Xã Mong Thọ A', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (264, N'Xã Mong Thọ B', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (265, N'Xã Mong Thọ', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (266, N'Xã Giục Tượng', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (267, N'Xã Vĩnh Hòa Hiệp', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (268, N'Xã Vĩnh Hoà Phú', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (269, N'Xã Minh Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (270, N'Xã Bình An', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (271, N'Xã Thạnh Lộc', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (272, N'Thị Trấn Ngã Sáu', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (273, N'Xã Đông Thạnh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (274, N'Xã Phú An', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (275, N'Xã Đông Phú', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (276, N'Xã Phú Hữu', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (277, N'Xã Phú Tân', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (278, N'Thị trấn Mái Dầm', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (279, N'Xã Đông Phước', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (280, N'Xã Đông Phước A', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (281, N'Thị trấn Châu Thành', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (282, N'Xã Hồ Đắc Kiện', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (283, N'Xã Phú Tâm', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (284, N'Xã Thuận Hòa', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (285, N'Xã Phú Tân', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (286, N'Xã Thiện Mỹ', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (287, N'Xã An Hiệp', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (288, N'Xã An Ninh', 10)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (289, N'Thị trấn Núi Sập', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (290, N'Thị trấn Phú Hoà', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (291, N'Thị Trấn Óc Eo', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (292, N'Xã Tây Phú', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (293, N'Xã An Bình', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (294, N'Xã Vĩnh Phú', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (295, N'Xã Vĩnh Trạch', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (296, N'Xã Phú Thuận', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (297, N'Xã Vĩnh Chánh', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (298, N'Xã Định Mỹ', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (299, N'Xã Định Thành', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (300, N'Xã Mỹ Phú Đông', 11)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (301, N'Xã Vọng Đông', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (302, N'Xã Vĩnh Khánh', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (303, N'Xã Thoại Giang', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (304, N'Xã Bình Thành', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (305, N'Xã Vọng Thê', 11)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (306, N'Phường 1', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (307, N'Phường Thắng Tam', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (308, N'Phường 2', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (309, N'Phường 3', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (310, N'Phường 4', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (311, N'Phường 5', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (312, N'Phường Thắng Nhì', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (313, N'Phường 7', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (314, N'Phường Nguyễn An Ninh', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (315, N'Phường 8', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (316, N'Phường 9', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (317, N'Phường Thắng Nhất', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (318, N'Phường Rạch Dừa', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (319, N'Phường 10', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (320, N'Phường 11', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (321, N'Phường 12', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (322, N'Xã Long Sơn', 12)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (323, N'Thị trấn Phước Bửu', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (324, N'Xã Phước Thuận', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (325, N'Xã Phước Tân', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (326, N'Xã Xuyên Mộc', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (327, N'Xã Bông Trang', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (328, N'Xã Tân Lâm', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (329, N'Xã Bàu Lâm', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (330, N'Xã Hòa Bình', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (331, N'Xã Hòa Hưng', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (332, N'Xã Hòa Hiệp', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (333, N'Xã Hòa Hội', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (334, N'Xã Bưng Riềng', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (335, N'Xã Bình Châu', 14)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (336, N'Thị trấn Long Điền', 15)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (337, N'Thị trấn Long Hải', 15)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (338, N'Xã An Ngãi', 15)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (339, N'Xã Tam Phước', 15)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (340, N'Xã An Nhứt', 15)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (341, N'Xã Phước Tỉnh', 15)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (342, N'Xã Phước Hưng', 15)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (343, N'Thị trấn Phú Mỹ', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (344, N'Xã Tân Hoà', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (345, N'Xã Tân Hải', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (346, N'Xã Phước Hoà', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (347, N'Xã Tân Phước', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (348, N'Xã Mỹ Xuân', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (349, N'Xã Sông Xoài', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (350, N'Xã Hắc Dịch', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (351, N'Xã Châu Pha', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (352, N'Xã Tóc Tiên', 17)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (353, N'Xã Bàu Chinh', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (354, N'Thị trấn Ngãi Giao', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (355, N'Xã Bình Ba', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (356, N'Xã Suối Nghệ', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (357, N'Xã Xuân Sơn', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (358, N'Xã Sơn Bình', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (359, N'Xã Bình Giã', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (360, N'Xã Bình Trung', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (361, N'Xã Xà Bang', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (362, N'Xã Cù Bị', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (363, N'Xã Láng Lớn', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (364, N'Xã Quảng Thành', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (365, N'Xã Kim Long', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (366, N'Xã Suối Rao', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (367, N'Xã Đá Bạc', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (368, N'Xã Nghĩa Thành', 18)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (369, N'Thị trấn Đất Đỏ', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (370, N'Xã Phước Long Thọ', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (371, N'Xã Phước Hội', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (372, N'Xã Long Mỹ', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (373, N'Thị trấn Phước Hải', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (374, N'Xã Long Tân', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (375, N'Xã Láng Dài', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (376, N'Xã Lộc An', 19)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (377, N'Phường Phúc Xá', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (378, N'Phường Trúc Bạch', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (379, N'Phường Vĩnh Phúc', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (380, N'Phường Cống Vị', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (381, N'Phường Liễu Giai', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (382, N'Phường Nguyễn Trung Trực', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (383, N'Phường Quán Thánh', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (384, N'Phường Ngọc Hà', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (385, N'Phường Điện Biên', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (386, N'Phường Đội Cấn', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (387, N'Phường Ngọc Khánh', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (388, N'Phường Kim Mã', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (389, N'Phường Giảng Võ', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (390, N'Phường Thành Công', 210)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (391, N'Phường Phúc Tân', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (392, N'Phường Đồng Xuân', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (393, N'Phường Hàng Mã', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (394, N'Phường Hàng Buồm', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (395, N'Phường Hàng Đào', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (396, N'Phường Hàng Bồ', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (397, N'Phường Cửa Đông', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (398, N'Phường Lý Thái Tổ', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (399, N'Phường Hàng Bạc', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (400, N'Phường Hàng Gai', 211)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (401, N'Phường Chương Dương', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (402, N'Phường Hàng Trống', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (403, N'Phường Cửa Nam', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (404, N'Phường Hàng Bông', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (405, N'Phường Tràng Tiền', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (406, N'Phường Trần Hưng Đạo', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (407, N'Phường Phan Chu Trinh', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (408, N'Phường Hàng Bài', 211)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (409, N'Phường Nguyễn Du', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (410, N'Phường Bạch Đằng', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (411, N'Phường Phạm Đình Hổ', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (412, N'Phường Bùi Thị Xuân', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (413, N'Phường Ngô Thì Nhậm', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (414, N'Phường Lê Đại Hành', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (415, N'Phường Đồng Nhân', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (416, N'Phường Phố Huế', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (417, N'Phường Đống Mác', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (418, N'Phường Thanh Lương', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (419, N'Phường Thanh Nhàn', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (420, N'Phường Cầu Dền', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (421, N'Phường Bách Khoa', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (422, N'Phường Đồng Tâm', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (423, N'Phường Vĩnh Tuy', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (424, N'Phường Bạch Mai', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (425, N'Phường Quỳnh Mai', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (426, N'Phường Quỳnh Lôi', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (427, N'Phường Minh Khai', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (428, N'Phường Trương Định', 212)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (429, N'Phường Cát Linh', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (430, N'Phường Văn Miếu', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (431, N'Phường Quốc Tử Giám', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (432, N'Phường Láng Thượng', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (433, N'Phường Ô Chợ Dừa', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (434, N'Phường Văn Chương', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (435, N'Phường Hàng Bột', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (436, N'Phường Láng Hạ', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (437, N'Phường Khâm Thiên', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (438, N'Phường Thổ Quan', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (439, N'Phường Nam Đồng', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (440, N'Phường Trung Phụng', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (441, N'Phường Quang Trung', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (442, N'Phường Trung Liệt', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (443, N'Phường Phương Liên', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (444, N'Phường Thịnh Quang', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (445, N'Phường Trung Tự', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (446, N'Phường Kim Liên', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (447, N'Phường Phương Mai', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (448, N'Phường Ngã Tư Sở', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (449, N'Phường Khương Thượng', 213)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (450, N'Phường Phú Thượng', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (451, N'Phường Nhật Tân', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (452, N'Phường Tứ Liên', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (453, N'Phường Quảng An', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (454, N'Phường Xuân La', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (455, N'Phường Yên Phụ', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (456, N'Phường Bưởi', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (457, N'Phường Thụy Khuê', 214)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (458, N'Phường Nghĩa Đô', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (459, N'Phường Nghĩa Tân', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (460, N'Phường Mai Dịch', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (461, N'Phường Dịch Vọng', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (462, N'Phường Dịch Vọng Hậu', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (463, N'Phường Quan Hoa', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (464, N'Phường Yên Hoà', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (465, N'Phường Trung Hoà', 215)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (466, N'Phường Nhân Chính', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (467, N'Phường Thượng Đình', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (468, N'Phường Khương Trung', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (469, N'Phường Khương Mai', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (470, N'Phường Thanh Xuân Trung', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (471, N'Phường Phương Liệt', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (472, N'Phường Hạ Đình', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (473, N'Phường Khương Đình', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (474, N'Phường Thanh Xuân Bắc', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (475, N'Phường Thanh Xuân Nam', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (476, N'Phường Kim Giang', 216)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (477, N'Phường Thanh Trì', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (478, N'Phường Vĩnh Hưng', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (479, N'Phường Định Công', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (480, N'Phường Mai Động', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (481, N'Phường Tương Mai', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (482, N'Phường Đại Kim', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (483, N'Phường Tân Mai', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (484, N'Phường Hoàng Văn Thụ', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (485, N'Phường Giáp Bát', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (486, N'Phường Lĩnh Nam', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (487, N'Phường Thịnh Liệt', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (488, N'Phường Trần Phú', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (489, N'Phường Hoàng Liệt', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (490, N'Phường Yên Sở', 217)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (491, N'Phường Thượng Thanh', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (492, N'Phường Ngọc Thụy', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (493, N'Phường Giang Biên', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (494, N'Phường Đức Giang', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (495, N'Phường Việt Hưng', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (496, N'Phường Gia Thụy', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (497, N'Phường Ngọc Lâm', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (498, N'Phường Phúc Lợi', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (499, N'Phường Bồ Đề', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (500, N'Phường Sài Đồng', 218)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (501, N'Phường Long Biên', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (502, N'Phường Thạch Bàn', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (503, N'Phường Phúc Đồng', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (504, N'Phường Cự Khối', 218)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (505, N'Phường Cầu Diễn', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (506, N'Phường Xuân Phương', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (507, N'Phường Phương Canh', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (508, N'Phường Mỹ Đình 1', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (509, N'Phường Mỹ Đình 2', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (510, N'Phường Tây Mỗ', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (511, N'Phường Mễ Trì', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (512, N'Phường Phú Đô', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (513, N'Phường Đại Mỗ', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (514, N'Phường Trung Văn', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (515, N'Phường Thượng Cát', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (516, N'Phường Liên Mạc', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (517, N'Phường Đông Ngạc', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (518, N'Phường Đức Thắng', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (519, N'Phường Thụy Phương', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (520, N'Phường Tây Tựu', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (521, N'Phường Xuân Đỉnh', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (522, N'Phường Xuân Tảo', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (523, N'Phường Minh Khai', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (524, N'Phường Cổ Nhuế 1', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (525, N'Phường Cổ Nhuế 2', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (526, N'Phường Phú Diễn', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (527, N'Phường Phúc Diễn', 219)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (528, N'Thị trấn Văn Điển', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (529, N'Xã Tân Triều', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (530, N'Xã Thanh Liệt', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (531, N'Xã Tả Thanh Oai', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (532, N'Xã Hữu Hoà', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (533, N'Xã Tam Hiệp', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (534, N'Xã Tứ Hiệp', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (535, N'Xã Yên Mỹ', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (536, N'Xã Vĩnh Quỳnh', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (537, N'Xã Ngũ Hiệp', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (538, N'Xã Duyên Hà', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (539, N'Xã Ngọc Hồi', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (540, N'Xã Vạn Phúc', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (541, N'Xã Đại áng', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (542, N'Xã Liên Ninh', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (543, N'Xã Đông Mỹ', 220)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (544, N'Thị trấn Yên Viên', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (545, N'Xã Yên Thường', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (546, N'Xã Yên Viên', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (547, N'Xã Ninh Hiệp', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (548, N'Xã Đình Xuyên', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (549, N'Xã Dương Hà', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (550, N'Xã Phù Đổng', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (551, N'Xã Trung Mầu', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (552, N'Xã Lệ Chi', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (553, N'Xã Cổ Bi', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (554, N'Xã Đặng Xá', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (555, N'Xã Phú Thị', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (556, N'Xã Kim Sơn', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (557, N'Thị trấn Trâu Quỳ', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (558, N'Xã Dương Quang', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (559, N'Xã Dương Xá', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (560, N'Xã Đông Dư', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (561, N'Xã Đa Tốn', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (562, N'Xã Kiêu Kỵ', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (563, N'Xã Bát Tràng', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (564, N'Xã Kim Lan', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (565, N'Xã Văn Đức', 221)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (566, N'Thị trấn Đông Anh', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (567, N'Xã Xuân Nộn', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (568, N'Xã Thuỵ Lâm', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (569, N'Xã Bắc Hồng', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (570, N'Xã Nguyên Khê', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (571, N'Xã Nam Hồng', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (572, N'Xã Tiên Dương', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (573, N'Xã Vân Hà', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (574, N'Xã Uy Nỗ', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (575, N'Xã Vân Nội', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (576, N'Xã Liên Hà', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (577, N'Xã Việt Hùng', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (578, N'Xã Kim Nỗ', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (579, N'Xã Kim Chung', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (580, N'Xã Dục Tú', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (581, N'Xã Đại Mạch', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (582, N'Xã Vĩnh Ngọc', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (583, N'Xã Cổ Loa', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (584, N'Xã Hải Bối', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (585, N'Xã Xuân Canh', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (586, N'Xã Võng La', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (587, N'Xã Tàm Xá', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (588, N'Xã Mai Lâm', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (589, N'Xã Đông Hội', 222)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (590, N'Thị trấn Sóc Sơn', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (591, N'Xã Bắc Sơn', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (592, N'Xã Minh Trí', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (593, N'Xã Hồng Kỳ', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (594, N'Xã Nam Sơn', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (595, N'Xã Trung Giã', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (596, N'Xã Tân Hưng', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (597, N'Xã Minh Phú', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (598, N'Xã Phù Linh', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (599, N'Xã Bắc Phú', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (600, N'Xã Tân Minh', 223)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (601, N'Xã Quang Tiến', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (602, N'Xã Hiền Ninh', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (603, N'Xã Tân Dân', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (604, N'Xã Tiên Dược', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (605, N'Xã Việt Long', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (606, N'Xã Xuân Giang', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (607, N'Xã Mai Đình', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (608, N'Xã Đức Hoà', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (609, N'Xã Thanh Xuân', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (610, N'Xã Đông Xuân', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (611, N'Xã Kim Lũ', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (612, N'Xã Phú Cường', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (613, N'Xã Phú Minh', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (614, N'Xã Phù Lỗ', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (615, N'Xã Xuân Thu', 223)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (616, N'Phường Nguyễn Trãi', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (617, N'Phường Mộ Lao', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (618, N'Phường Văn Quán', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (619, N'Phường Vạn Phúc', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (620, N'Phường Yết Kiêu', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (621, N'Phường Quang Trung', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (622, N'Phường La Khê', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (623, N'Phường Phú La', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (624, N'Phường Phúc La', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (625, N'Phường Hà Cầu', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (626, N'Phường Yên Nghĩa', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (627, N'Phường Kiến Hưng', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (628, N'Phường Phú Lãm', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (629, N'Phường Phú Lương', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (630, N'Phường Dương Nội', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (631, N'Phường Đồng Mai', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (632, N'Phường Biên Giang', 224)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (633, N'Phường Lê Lợi', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (634, N'Phường Phú Thịnh', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (635, N'Phường Ngô Quyền', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (636, N'Phường Quang Trung', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (637, N'Phường Sơn Lộc', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (638, N'Phường Xuân Khanh', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (639, N'Xã Đường Lâm', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (640, N'Phường Viên Sơn', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (641, N'Xã Xuân Sơn', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (642, N'Phường Trung Hưng', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (643, N'Xã Thanh Mỹ', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (644, N'Phường Trung Sơn Trầm', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (645, N'Xã Kim Sơn', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (646, N'Xã Sơn Đông', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (647, N'Xã Cổ Đông', 225)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (648, N'Thị trấn Tây Đằng', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (649, N'Xã Phú Cường', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (650, N'Xã Cổ Đô', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (651, N'Xã Tản Hồng', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (652, N'Xã Vạn Thắng', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (653, N'Xã Châu Sơn', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (654, N'Xã Phong Vân', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (655, N'Xã Phú Đông', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (656, N'Xã Phú Phương', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (657, N'Xã Phú Châu', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (658, N'Xã Thái Hòa', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (659, N'Xã Đồng Thái', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (660, N'Xã Phú Sơn', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (661, N'Xã Minh Châu', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (662, N'Xã Vật Lại', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (663, N'Xã Chu Minh', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (664, N'Xã Tòng Bạt', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (665, N'Xã Cẩm Lĩnh', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (666, N'Xã Sơn Đà', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (667, N'Xã Đông Quang', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (668, N'Xã Tiên Phong', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (669, N'Xã Thụy An', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (670, N'Xã Cam Thượng', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (671, N'Xã Thuần Mỹ', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (672, N'Xã Tản Lĩnh', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (673, N'Xã Ba Trại', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (674, N'Xã Minh Quang', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (675, N'Xã Ba Vì', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (676, N'Xã Vân Hòa', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (677, N'Xã Yên Bài', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (678, N'Xã Khánh Thượng', 226)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (679, N'Thị trấn Phúc Thọ', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (680, N'Xã Vân Hà', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (681, N'Xã Vân Phúc', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (682, N'Xã Vân Nam', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (683, N'Xã Xuân Phú', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (684, N'Xã Phương Độ', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (685, N'Xã Sen Chiểu', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (686, N'Xã Cẩm Đình', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (687, N'Xã Võng Xuyên', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (688, N'Xã Thọ Lộc', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (689, N'Xã Long Xuyên', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (690, N'Xã Thượng Cốc', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (691, N'Xã Hát Môn', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (692, N'Xã Tích Giang', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (693, N'Xã Thanh Đa', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (694, N'Xã Trạch Mỹ Lộc', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (695, N'Xã Phúc Hòa', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (696, N'Xã Ngọc Tảo', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (697, N'Xã Phụng Thượng', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (698, N'Xã Tam Thuấn', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (699, N'Xã Tam Hiệp', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (700, N'Xã Hiệp Thuận', 227)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (701, N'Xã Liên Hiệp', 227)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (702, N'Xã Yên Trung', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (703, N'Xã Yên Bình', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (704, N'Xã Tiến Xuân', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (705, N'Thị trấn Liên Quan', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (706, N'Xã Đại Đồng', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (707, N'Xã Cẩm Yên', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (708, N'Xã Lại Thượng', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (709, N'Xã Phú Kim', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (710, N'Xã Hương Ngải', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (711, N'Xã Canh Nậu', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (712, N'Xã Kim Quan', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (713, N'Xã Dị Nậu', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (714, N'Xã Bình Yên', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (715, N'Xã Chàng Sơn', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (716, N'Xã Thạch Hoà', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (717, N'Xã Cần Kiệm', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (718, N'Xã Hữu Bằng', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (719, N'Xã Phùng Xá', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (720, N'Xã Tân Xã', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (721, N'Xã Thạch Xá', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (722, N'Xã Bình Phú', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (723, N'Xã Hạ Bằng', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (724, N'Xã Đồng Trúc', 228)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (725, N'Xã Đông Xuân', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (726, N'Thị trấn Quốc Oai', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (727, N'Xã Sài Sơn', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (728, N'Xã Phượng Cách', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (729, N'Xã Yên Sơn', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (730, N'Xã Ngọc Liệp', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (731, N'Xã Ngọc Mỹ', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (732, N'Xã Liệp Tuyết', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (733, N'Xã Thạch Thán', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (734, N'Xã Đồng Quang', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (735, N'Xã Phú Cát', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (736, N'Xã Tuyết Nghĩa', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (737, N'Xã Nghĩa Hương', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (738, N'Xã Cộng Hòa', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (739, N'Xã Tân Phú', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (740, N'Xã Đại Thành', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (741, N'Xã Phú Mãn', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (742, N'Xã Cấn Hữu', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (743, N'Xã Tân Hòa', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (744, N'Xã Hòa Thạch', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (745, N'Xã Đông Yên', 229)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (746, N'Thị trấn Chúc Sơn', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (747, N'Thị trấn Xuân Mai', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (748, N'Xã Phụng Châu', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (749, N'Xã Tiên Phương', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (750, N'Xã Đông Sơn', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (751, N'Xã Đông Phương Yên', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (752, N'Xã Phú Nghĩa', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (753, N'Xã Trường Yên', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (754, N'Xã Ngọc Hòa', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (755, N'Xã Thủy Xuân Tiên', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (756, N'Xã Thanh Bình', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (757, N'Xã Trung Hòa', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (758, N'Xã Đại Yên', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (759, N'Xã Thụy Hương', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (760, N'Xã Tốt Động', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (761, N'Xã Lam Điền', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (762, N'Xã Tân Tiến', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (763, N'Xã Nam Phương Tiến', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (764, N'Xã Hợp Đồng', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (765, N'Xã Hoàng Văn Thụ', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (766, N'Xã Hoàng Diệu', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (767, N'Xã Hữu Văn', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (768, N'Xã Quảng Bị', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (769, N'Xã Mỹ Lương', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (770, N'Xã Thượng Vực', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (771, N'Xã Hồng Phong', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (772, N'Xã Đồng Phú', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (773, N'Xã Trần Phú', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (774, N'Xã Văn Võ', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (775, N'Xã Đồng Lạc', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (776, N'Xã Hòa Chính', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (777, N'Xã Phú Nam An', 230)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (778, N'Thị trấn Phùng', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (779, N'Xã Trung Châu', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (780, N'Xã Thọ An', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (781, N'Xã Thọ Xuân', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (782, N'Xã Hồng Hà', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (783, N'Xã Liên Hồng', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (784, N'Xã Liên Hà', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (785, N'Xã Hạ Mỗ', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (786, N'Xã Liên Trung', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (787, N'Xã Phương Đình', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (788, N'Xã Thượng Mỗ', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (789, N'Xã Tân Hội', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (790, N'Xã Tân Lập', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (791, N'Xã Đan Phượng', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (792, N'Xã Đồng Tháp', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (793, N'Xã Song Phượng', 231)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (794, N'Thị trấn Trạm Trôi', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (795, N'Xã Đức Thượng', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (796, N'Xã Minh Khai', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (797, N'Xã Dương Liễu', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (798, N'Xã Di Trạch', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (799, N'Xã Đức Giang', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (800, N'Xã Cát Quế', 232)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (801, N'Xã Kim Chung', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (802, N'Xã Yên Sở', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (803, N'Xã Sơn Đồng', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (804, N'Xã Vân Canh', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (805, N'Xã Đắc Sở', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (806, N'Xã Lại Yên', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (807, N'Xã Tiền Yên', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (808, N'Xã Song Phương', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (809, N'Xã An Khánh', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (810, N'Xã An Thượng', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (811, N'Xã Vân Côn', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (812, N'Xã La Phù', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (813, N'Xã Đông La', 232)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (814, N'Thị trấn Kim Bài', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (815, N'Xã Cự Khê', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (816, N'Xã Bích Hòa', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (817, N'Xã Mỹ Hưng', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (818, N'Xã Cao Viên', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (819, N'Xã Bình Minh', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (820, N'Xã Tam Hưng', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (821, N'Xã Thanh Cao', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (822, N'Xã Thanh Thùy', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (823, N'Xã Thanh Mai', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (824, N'Xã Thanh Văn', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (825, N'Xã Đỗ Động', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (826, N'Xã Kim An', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (827, N'Xã Kim Thư', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (828, N'Xã Phương Trung', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (829, N'Xã Tân Ước', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (830, N'Xã Dân Hòa', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (831, N'Xã Liên Châu', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (832, N'Xã Cao Dương', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (833, N'Xã Xuân Dương', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (834, N'Xã Hồng Dương', 233)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (835, N'Thị trấn Đại Nghĩa', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (836, N'Xã Đồng Tâm', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (837, N'Xã Thượng Lâm', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (838, N'Xã Tuy Lai', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (839, N'Xã Phúc Lâm', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (840, N'Xã Mỹ Thành', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (841, N'Xã Bột Xuyên', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (842, N'Xã An Mỹ', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (843, N'Xã Hồng Sơn', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (844, N'Xã Lê Thanh', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (845, N'Xã Xuy Xá', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (846, N'Xã Phùng Xá', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (847, N'Xã Phù Lưu Tế', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (848, N'Xã Đại Hưng', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (849, N'Xã Vạn Kim', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (850, N'Xã Đốc Tín', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (851, N'Xã Hương Sơn', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (852, N'Xã Hùng Tiến', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (853, N'Xã An Tiến', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (854, N'Xã Hợp Tiến', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (855, N'Xã Hợp Thanh', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (856, N'Xã An Phú', 234)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (857, N'Thị trấn Thường Tín', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (858, N'Xã Ninh Sở', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (859, N'Xã Nhị Khê', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (860, N'Xã Duyên Thái', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (861, N'Xã Khánh Hà', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (862, N'Xã Hòa Bình', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (863, N'Xã Văn Bình', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (864, N'Xã Hiền Giang', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (865, N'Xã Hồng Vân', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (866, N'Xã Vân Tảo', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (867, N'Xã Liên Phương', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (868, N'Xã Văn Phú', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (869, N'Xã Tự Nhiên', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (870, N'Xã Tiền Phong', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (871, N'Xã Hà Hồi', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (872, N'Xã Thư Phú', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (873, N'Xã Nguyễn Trãi', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (874, N'Xã Quất Động', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (875, N'Xã Chương Dương', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (876, N'Xã Tân Minh', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (877, N'Xã Lê Lợi', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (878, N'Xã Thắng Lợi', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (879, N'Xã Dũng Tiến', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (880, N'Xã Thống Nhất', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (881, N'Xã Nghiêm Xuyên', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (882, N'Xã Tô Hiệu', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (883, N'Xã Văn Tự', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (884, N'Xã Vạn Điểm', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (885, N'Xã Minh Cường', 236)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (886, N'Thị trấn Phú Minh', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (887, N'Thị trấn Phú Xuyên', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (888, N'Xã Hồng Minh', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (889, N'Xã Phượng Dực', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (890, N'Xã Văn Nhân', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (891, N'Xã Thụy Phú', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (892, N'Xã Tri Trung', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (893, N'Xã Đại Thắng', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (894, N'Xã Phú Túc', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (895, N'Xã Văn Hoàng', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (896, N'Xã Hồng Thái', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (897, N'Xã Hoàng Long', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (898, N'Xã Quang Trung', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (899, N'Xã Nam Phong', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (900, N'Xã Nam Triều', 237)
GO
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (901, N'Xã Tân Dân', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (902, N'Xã Sơn Hà', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (903, N'Xã Chuyên Mỹ', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (904, N'Xã Khai Thái', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (905, N'Xã Phúc Tiến', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (906, N'Xã Vân Từ', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (907, N'Xã Tri Thủy', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (908, N'Xã Đại Xuyên', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (909, N'Xã Phú Yên', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (910, N'Xã Bạch Hạ', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (911, N'Xã Quang Lãng', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (912, N'Xã Châu Can', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (913, N'Xã Minh Tân', 237)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (914, N'Thị trấn Chi Đông', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (915, N'Xã Đại Thịnh', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (916, N'Xã Kim Hoa', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (917, N'Xã Thạch Đà', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (918, N'Xã Tiến Thắng', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (919, N'Xã Tự Lập', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (920, N'Thị trấn Quang Minh', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (921, N'Xã Thanh Lâm', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (922, N'Xã Tam Đồng', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (923, N'Xã Liên Mạc', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (924, N'Xã Vạn Yên', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (925, N'Xã Chu Phan', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (926, N'Xã Tiến Thịnh', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (927, N'Xã Mê Linh', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (928, N'Xã Văn Khê', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (929, N'Xã Hoàng Kim', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (930, N'Xã Tiền Phong', 238)
INSERT [dbo].[tblXa] ([ID], [TenXa], [IDHuyen]) VALUES (931, N'Xã Tráng Việt', 238)
ALTER TABLE [dbo].[tblChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHoaDonBan_tblChiTietSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tblChiTietSP] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietHoaDonBan] CHECK CONSTRAINT [FK_tblChiTietHoaDonBan_tblChiTietSP]
GO
ALTER TABLE [dbo].[tblChiTietHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHoaDonBan_tblHoaDonBan] FOREIGN KEY([MaHD])
REFERENCES [dbo].[tblHoaDonBan] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietHoaDonBan] CHECK CONSTRAINT [FK_tblChiTietHoaDonBan_tblHoaDonBan]
GO
ALTER TABLE [dbo].[tblChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHoaDonNhap_tblChiTietSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tblChiTietSP] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietHoaDonNhap] CHECK CONSTRAINT [FK_tblChiTietHoaDonNhap_tblChiTietSP]
GO
ALTER TABLE [dbo].[tblChiTietHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietHoaDonNhap_tblHoaDonNhap] FOREIGN KEY([MaHD])
REFERENCES [dbo].[tblHoaDonNhap] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietHoaDonNhap] CHECK CONSTRAINT [FK_tblChiTietHoaDonNhap_tblHoaDonNhap]
GO
ALTER TABLE [dbo].[tblChiTietSP]  WITH CHECK ADD  CONSTRAINT [FK_tblChiTietSP_tblNhomSP] FOREIGN KEY([IDNhomSP])
REFERENCES [dbo].[tblNhomSP] ([MaNhomSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblChiTietSP] CHECK CONSTRAINT [FK_tblChiTietSP_tblNhomSP]
GO
ALTER TABLE [dbo].[tblGioHang]  WITH CHECK ADD  CONSTRAINT [FK_tblGioHang_tblChiTietSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tblChiTietSP] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblGioHang] CHECK CONSTRAINT [FK_tblGioHang_tblChiTietSP]
GO
ALTER TABLE [dbo].[tblGioHang]  WITH CHECK ADD  CONSTRAINT [FK_tblGioHang_tblDoTuoi] FOREIGN KEY([MaDoTuoi])
REFERENCES [dbo].[tblDoTuoi] ([IDNhomTuoi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblGioHang] CHECK CONSTRAINT [FK_tblGioHang_tblDoTuoi]
GO
ALTER TABLE [dbo].[tblGioHang]  WITH CHECK ADD  CONSTRAINT [FK_tblGioHang_tblTaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[tblTaiKhoan] ([MaTK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblGioHang] CHECK CONSTRAINT [FK_tblGioHang_tblTaiKhoan]
GO
ALTER TABLE [dbo].[tblHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonBan_tblKhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[tblKhachHang] ([MaKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHoaDonBan] CHECK CONSTRAINT [FK_tblHoaDonBan_tblKhachHang]
GO
ALTER TABLE [dbo].[tblHoaDonBan]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonBan_tblTaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[tblTaiKhoan] ([MaTK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHoaDonBan] CHECK CONSTRAINT [FK_tblHoaDonBan_tblTaiKhoan]
GO
ALTER TABLE [dbo].[tblHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonNhap_tblNhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[tblNhaCungCap] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHoaDonNhap] CHECK CONSTRAINT [FK_tblHoaDonNhap_tblNhaCungCap]
GO
ALTER TABLE [dbo].[tblHoaDonNhap]  WITH CHECK ADD  CONSTRAINT [FK_tblHoaDonNhap_tblTaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[tblTaiKhoan] ([MaTK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHoaDonNhap] CHECK CONSTRAINT [FK_tblHoaDonNhap_tblTaiKhoan]
GO
ALTER TABLE [dbo].[tblHuyen]  WITH CHECK ADD  CONSTRAINT [FK_tblHuyen_tblTinh] FOREIGN KEY([IDTinh])
REFERENCES [dbo].[tblTinh] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblHuyen] CHECK CONSTRAINT [FK_tblHuyen_tblTinh]
GO
ALTER TABLE [dbo].[tblNhomSP]  WITH CHECK ADD  CONSTRAINT [FK_tblNhomSP_tblMenu] FOREIGN KEY([MainMenuID])
REFERENCES [dbo].[tblMenu] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblNhomSP] CHECK CONSTRAINT [FK_tblNhomSP_tblMenu]
GO
ALTER TABLE [dbo].[tblSanPhamDoTuoi]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamDoTuoi_tblChiTietSP] FOREIGN KEY([MaSP])
REFERENCES [dbo].[tblChiTietSP] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSanPhamDoTuoi] CHECK CONSTRAINT [FK_SanPhamDoTuoi_tblChiTietSP]
GO
ALTER TABLE [dbo].[tblSanPhamDoTuoi]  WITH CHECK ADD  CONSTRAINT [FK_SanPhamDoTuoi_tblDoTuoi] FOREIGN KEY([IDNhomTuoi])
REFERENCES [dbo].[tblDoTuoi] ([IDNhomTuoi])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSanPhamDoTuoi] CHECK CONSTRAINT [FK_SanPhamDoTuoi_tblDoTuoi]
GO
ALTER TABLE [dbo].[tblSanPhamMauSac]  WITH CHECK ADD  CONSTRAINT [FK_tblSanPhamMauSac_tblChiTietSP] FOREIGN KEY([IDSanPham])
REFERENCES [dbo].[tblChiTietSP] ([MaSP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSanPhamMauSac] CHECK CONSTRAINT [FK_tblSanPhamMauSac_tblChiTietSP]
GO
ALTER TABLE [dbo].[tblSanPhamMauSac]  WITH CHECK ADD  CONSTRAINT [FK_tblSanPhamMauSac_tblMauSac] FOREIGN KEY([IDMauSac])
REFERENCES [dbo].[tblMauSac] ([IDMauSac])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblSanPhamMauSac] CHECK CONSTRAINT [FK_tblSanPhamMauSac_tblMauSac]
GO
ALTER TABLE [dbo].[tblXa]  WITH CHECK ADD  CONSTRAINT [FK_tblXa_tblHuyen] FOREIGN KEY([IDHuyen])
REFERENCES [dbo].[tblHuyen] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblXa] CHECK CONSTRAINT [FK_tblXa_tblHuyen]
GO
USE [master]
GO
ALTER DATABASE [QuanLyShopQuanAo] SET  READ_WRITE 
GO
