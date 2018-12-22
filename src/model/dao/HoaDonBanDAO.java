package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ChiTietHoaDonBan;

public class HoaDonBanDAO {
	static Connection conn;
	static ResultSet rs;
	public void themHoaDonBanKhachVangLai(String maHD, String tennguoinhan, String dienthoainguoinhan, int maTinhThanh,
			String diachi, String ngayban) {
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemHoaDonBanVangLai(?,?,?,?,?,?)}");
			call.setString(1, maHD);
			call.setString(2, tennguoinhan);
			call.setString(3, dienthoainguoinhan);
			call.setInt(4, maTinhThanh);
			call.setString(5, diachi);
			call.setString(6, ngayban);
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

	public void themHoaDonBanKhachTaiKhoan(String maHD, String maTaiKhoan, String tennguoinhan,
			String dienthoainguoinhan, int maTinhThanh, String diachi, String ngayban) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemHoaDonBanTaiKhoan(?,?,?,?,?,?,?)}");
			call.setString(1, maHD);
			call.setString(2, maTaiKhoan);
			call.setString(3, tennguoinhan);
			call.setString(4, dienthoainguoinhan);
			call.setInt(5, maTinhThanh);
			call.setString(6, diachi);
			call.setString(7, ngayban);
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

	public void themChiTietHoaDonBan(String maHD, String maSanPham, String maMau, String maDoTuoi, int soLuong, int donGia) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemChiTietHoaDonBan(?,?,?,?,?,?)}");
			call.setString(1, maHD);
			call.setString(2, maSanPham);
			call.setString(3, maMau);
			call.setString(4, maDoTuoi);
			call.setInt(5, soLuong);
			call.setInt(6, donGia);
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

	public ArrayList<String> layDanhSachMaHoaDonMuaTheoMaTaiKhoan(String maTK) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		ArrayList<String> listMaHdb = new ArrayList<>();
		CallableStatement call;
		try {
			call = conn.prepareCall("call QuanLyShopQuanAo_LayDanhSachHoaDonMuaTheoMaTaiKhoan(?)");
			call.setString(1, maTK);
			rs = call.executeQuery();
			while(rs.next()) {
				String maHDBan = rs.getString("MaHD");
				listMaHdb.add(maHDBan);
			}
			return listMaHdb;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listMaHdb;
	}

}
