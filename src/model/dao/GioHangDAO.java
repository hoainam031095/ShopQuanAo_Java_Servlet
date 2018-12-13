package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.GioHang;

public class GioHangDAO {
	static Connection conn;
	ResultSet rs;
	ArrayList<GioHang> listGioHang;
	public ArrayList<GioHang> layDanhSachSanPhamTrongGioHang(String maTaiKhoan) {
		// TODO Auto-generated method stub
		listGioHang = new ArrayList<>();
		rs = null;
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachSanPhamTrongGioHang(?)}");
			call.setString(1, maTaiKhoan);
			rs = call.executeQuery();
			while(rs.next()) {
				GioHang gh = new GioHang();
				gh.setMaGioHang(rs.getString("MaGioHang"));
				gh.setMaTaiKhoan(rs.getString("MaTK"));
				gh.setMaSanPham(rs.getString("MaSP"));
				gh.setMaMau(rs.getString("MaMau"));
				gh.setMaDoTuoi(rs.getString("MaDoTuoi"));
				gh.setSoLuong(rs.getInt("SoLuong"));
				listGioHang.add(gh);
			}
			return listGioHang;
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
		return listGioHang;
	}
	public void themSanPhamVaoGioHang(String maGioHang, String maTaiKhoan, String maSanPham, String maMau, String maDoTuoi, int soLuong) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemSanPhamVaoGioHang(?,?,?,?,?,?)}");
			call.setString(1, maGioHang);
			call.setString(2, maTaiKhoan);
			call.setString(3, maSanPham);
			call.setString(4, maMau);
			call.setString(5, maDoTuoi);
			call.setInt(6, soLuong);
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
	public void updateSoLuongSanPhamTrongGioHang(String maTaiKhoan, String maSanPham, String maMau, String maDoTuoi,
			int soluong) {
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_UpDateThongTinGioHang(?,?,?,?,?)}");
			call.setString(1, maTaiKhoan);
			call.setString(2, maSanPham);
			call.setString(3, maMau);
			call.setString(4, maDoTuoi);
			call.setInt(5, soluong);
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
	public int laySoLuongSanPhamTrongGioHangSanPhamTrongGioHangTheoMaSanPham(String maSP) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		rs = null;
		int soLuong = 0;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LaySoLuongGioHangTheoMa(?)}");
			call.setString(1, maSP);
			rs = call.executeQuery();
			if(rs.next()) {
				soLuong = rs.getInt("sl");
			}
			return soLuong;
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
		return soLuong;
	}
	public void xoaGioHangTheoMa(String maGioHang) {
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_XoaSanPhamTrongGioHangTheoMa(?)}");
			call.setString(1, maGioHang);
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
