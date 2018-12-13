package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.MauSac;

public class MauSacDAO {
	static Connection conn = null;
	static ResultSet rs = null;
	public ArrayList<MauSac> layDanhSachMauSacTheoMaSP(String maSanPham) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		ArrayList<MauSac> listMauSac = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachMauSacTheoMa(?)}");
			call.setString(1, maSanPham);
			rs = call.executeQuery();
			while(rs.next()) {
				MauSac ms = new MauSac();
				ms.setIdMauSac(rs.getString("IDMauSac"));
				ms.setTenMauSac(rs.getString("TenMauSac"));
				ms.setImages(rs.getString("Images"));
				listMauSac.add(ms);
			}
			return listMauSac;
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
		return listMauSac;
	}
	public MauSac layImageSanPhamTheoMauSac(String maSanPham, String maMauSac) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		MauSac ms = new MauSac();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayImageSPTheoMaSPvaMaMS(?,?)}");
			call.setString(1, maSanPham);
			call.setString(2, maMauSac);
			rs = call.executeQuery();
			if(rs.next()) {
				ms.setIdMauSac(rs.getString("IDMauSac"));
				ms.setTenMauSac(rs.getString("TenMauSac"));
				ms.setImages(rs.getString("Images"));
				return ms;
			}
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
		return ms;
	}

}
