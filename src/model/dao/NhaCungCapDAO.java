package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.NhaCungCap;

public class NhaCungCapDAO {
	Connection conn;
	ArrayList<NhaCungCap> listNCC;
	ResultSet rs = null;
	
	public ArrayList<NhaCungCap> layDanhSachNhaCungCap() {
		conn = ConnectDB.getConnection();
		listNCC = new ArrayList<>();
		
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachNhaCungCap}");
			rs = call.executeQuery();
			while(rs.next()) {
				NhaCungCap ncc = new NhaCungCap();
				ncc.setMaNhaCungCap(rs.getString("MaNCC"));
				ncc.setTenNhaCungCap(rs.getString("TenNCC"));
				ncc.setDiaChi(rs.getString("DiaChi"));
				ncc.setSoDienThoai(rs.getString("SDT"));
				ncc.setEmail(rs.getString("Email"));
				listNCC.add(ncc);
			}
			return listNCC;
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
		return listNCC;
	}

}
