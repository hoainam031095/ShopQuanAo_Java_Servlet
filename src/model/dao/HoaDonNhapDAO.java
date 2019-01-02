package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;

public class HoaDonNhapDAO {
	static Connection conn;
	public void themHoaDonNhap(String maHoaDonNhap, String maTaiKhoan, String maNhaCungCap, String ngayNhap) {
		conn = ConnectDB.getConnection();
		
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemHoaDonNhap(?,?,?,?)}");
			call.setString(1, maHoaDonNhap);
			call.setString(2, maTaiKhoan);
			call.setString(3, maNhaCungCap);
			call.setString(4, ngayNhap);
			call.executeUpdate();
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
		
	}

}
