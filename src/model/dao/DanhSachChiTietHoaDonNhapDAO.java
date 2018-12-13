package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Common.SplitDate;
import model.bean.ChiTietHoaDonNhap;

public class DanhSachChiTietHoaDonNhapDAO {
	static Connection conn;
	static ResultSet rs = null;
	static ArrayList<ChiTietHoaDonNhap> listCTHDN;
	
	public ArrayList<ChiTietHoaDonNhap> layDanhSachChiTietHoaDonNhap() {
		listCTHDN = new ArrayList<>();
		conn = ConnectDB.getConnection();
		CallableStatement call;
		try {
			call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachChiTietHoaDonNhap}");
			rs = call.executeQuery();
			while(rs.next()) {
				ChiTietHoaDonNhap cthd = new ChiTietHoaDonNhap();
				cthd.setMaHoaDon(rs.getString("MaHD"));
				cthd.setMaSanPham(rs.getString("MaSP"));
				cthd.setTenSanPham(rs.getString("Name"));
				cthd.setMaTaiKhoan(rs.getString("MaTK"));
				cthd.setTenTaiKhoan(rs.getString("Ten"));
				cthd.setMaNhaCungCap(rs.getString("MaNCC"));
				cthd.setTenNhaCungCap(rs.getString("TenNCC"));
				cthd.setNgayNhap(SplitDate.splitDate(rs.getString("NgayNhap")));
				cthd.setSoLuong(rs.getInt("SoLuong"));
				cthd.setDonGia(rs.getInt("DonGia"));
				listCTHDN.add(cthd);
			}
			return listCTHDN;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listCTHDN;
	}

}
