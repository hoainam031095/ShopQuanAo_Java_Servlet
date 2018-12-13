package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.KhachHang;

public class KhachHangDAO {
	Connection conn;
	ArrayList<KhachHang> listKH;
	ResultSet rs = null;
	
	public ArrayList<KhachHang> layDanhSachKhachHang() {
		conn = ConnectDB.getConnection();
		listKH = new ArrayList<>();
		
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachKhachHang}");
			rs = call.executeQuery();
			while(rs.next()) {
				KhachHang kh = new KhachHang();
				kh.setMaKhachHang(rs.getString("MaKH"));
				kh.setTenKhachHang(rs.getString("Name"));
				kh.setDiaChi(rs.getString("DiaChi"));
				kh.setSoDienThoai(rs.getString("SDT"));
				kh.setEmail(rs.getString("Email"));
				listKH.add(kh);
			}
			return listKH;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listKH;
	}

}
