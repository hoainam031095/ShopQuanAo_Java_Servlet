package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class ChiTietHoaDonNhapDAO {
	static Connection conn;
	public void themChiTietHoaDonNhap(String maHoaDonNhap, String maSanPham, int soLuong, int dongia) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();

		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemChiTietHoaDonNhap(?,?,?,?)}");
			call.setString(1, maHoaDonNhap);
			call.setString(2, maSanPham);
			call.setInt(3, soLuong);
			call.setInt(4, dongia);
			call.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
