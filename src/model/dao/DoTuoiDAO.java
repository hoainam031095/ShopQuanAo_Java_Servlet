package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.DoTuoi;

public class DoTuoiDAO {
	static Connection conn;
	static ResultSet rs = null;
	static Statement sttm;
	public ArrayList<DoTuoi> layDanhSachDoTuoi() {
		ArrayList<DoTuoi> listDoTuoi = new ArrayList<>();
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachNhomDoTuoi}");
			rs = call.executeQuery();
			while(rs.next()) {
				DoTuoi dt = new DoTuoi();
				dt.setMaDoTuoi(rs.getString("IDNhomTuoi"));
				dt.setTuoi(rs.getString("Tuoi"));
				dt.setChieuCao(rs.getString("ChieuCao"));
				dt.setTrongLuong(rs.getString("TrongLuong"));
				dt.setSize(rs.getString("Size"));
				listDoTuoi.add(dt);
			}
			return listDoTuoi;
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
		return listDoTuoi;
	}
	public void themLienKetGiuaSanPhamVaSize(String maSanPham, String nhomDoTuoi) {
		String [] maDoTuoi = nhomDoTuoi.split(" ");
		for(int i = 0; i < maDoTuoi.length; i++) {
			conn = ConnectDB.getConnection();
			String sql = String.format("insert into tblSanPhamDoTuoi(MaSP,IDNhomTuoi) values('%s','%s')", maSanPham, maDoTuoi[i]);
			try {
				 sttm = conn.createStatement();
				 sttm.executeQuery(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					conn.close();
					sttm.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}
	public ArrayList<DoTuoi> layDanhSachDoTuoiTheoMa(String maSanPham) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		ArrayList<DoTuoi> listDoTuoi = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachNhomDoTuoiTheoMa(?)}");
			call.setString(1, maSanPham);
			rs = call.executeQuery();
			while(rs.next()){
				DoTuoi dt = new DoTuoi();
				dt.setMaDoTuoi(rs.getString("IDNhomTuoi"));
				dt.setTuoi(rs.getString("Tuoi"));
				dt.setChieuCao(rs.getString("ChieuCao"));
				dt.setTrongLuong(rs.getString("TrongLuong"));
				dt.setSize(rs.getString("Size"));
				listDoTuoi.add(dt);
			}
			return listDoTuoi;
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
		
		return listDoTuoi;
	}
	public DoTuoi layThongTinDoTuoiTheoMaDoTuoi(String selectedMaDoTuoi) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		DoTuoi dt = new DoTuoi();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayThongTinDoTuoiTheoMa(?)}");
			call.setString(1, selectedMaDoTuoi);
			rs = call.executeQuery();
			if(rs.next()){
				dt.setMaDoTuoi(rs.getString("IDNhomTuoi"));
				dt.setTuoi(rs.getString("Tuoi"));
				dt.setChieuCao(rs.getString("ChieuCao"));
				dt.setTrongLuong(rs.getString("TrongLuong"));
				dt.setSize(rs.getString("Size"));
			}
			return dt;
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
		
		return dt;
	}
	public void xoaLienKetGiuaSanPhamVaSizeCu(String maSanPham) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_XoaLienKetDoTuoiVaSanPham(?)}");
			call.setString(1, maSanPham);
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
