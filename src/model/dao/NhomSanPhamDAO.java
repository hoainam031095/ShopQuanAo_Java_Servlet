package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.NhomSanPham;
import model.bean.SanPham;

public class NhomSanPhamDAO {
	static Connection conn;
	static ArrayList<NhomSanPham> listNSP;
	static ResultSet rs = null;
	
	public ArrayList<NhomSanPham> layDanhSachNhomSanPham() {
		conn = ConnectDB.getConnection();
		listNSP = new ArrayList<>();
		CallableStatement call;
		try {
			call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachNhomSanPham }");
			rs = call.executeQuery();
			while(rs.next()) {
				NhomSanPham nsp = new NhomSanPham();
				nsp.setMaNhomSP(rs.getString("MaNhomSP"));
				nsp.setTenNhomSP(rs.getString("Name"));
				nsp.setContent(rs.getString("Content"));
				nsp.setImages(rs.getString("NameImage"));
				nsp.setOrder(rs.getInt("OrderTT"));
				nsp.setStatus(rs.getInt("Status"));
				nsp.setLink(rs.getString("Link"));
				nsp.setMaMainMenu(rs.getString("MainMenuID"));
				listNSP.add(nsp);
			}
			return listNSP;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listNSP;
	}

	public void themNhomSanPham(String maNhomSanPham, String tenNhomSanPham, String chiTietNhomSanPham, String order,
			String fileName1, String nhomChinh) {
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemNhomSanPham(?,?,?,?,?,?)}");
			call.setString(1, maNhomSanPham);
			call.setString(2, tenNhomSanPham);
			call.setString(3, chiTietNhomSanPham);
			call.setString(4, order);
			call.setString(5, fileName1);
			call.setString(6, nhomChinh);
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

	public void xoaNhomSanPhamTheoMa(String maNhomSP) {
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_XoaNhomSanPham(?)}");
			call.setString(1, maNhomSP);
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

	public ArrayList<NhomSanPham> layDanhSachNhomSanPhamTheoMenu(String menu) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		listNSP = new ArrayList<>();
		CallableStatement call;
		try {
			call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachNhomSanPhamTheoMenu(?)}");
			call.setString(1, menu);
			rs = call.executeQuery();
			while(rs.next()) {
				NhomSanPham nsp = new NhomSanPham();
				nsp.setMaNhomSP(rs.getString("MaNhomSP"));
				nsp.setTenNhomSP(rs.getString("Name"));
				nsp.setContent(rs.getString("Content"));
				nsp.setImages(rs.getString("NameImage"));
				nsp.setOrder(rs.getInt("OrderTT"));
				nsp.setStatus(rs.getInt("Status"));
				nsp.setLink(rs.getString("Link"));
				nsp.setMaMainMenu(rs.getString("MainMenuID"));
				listNSP.add(nsp);
			}
			return listNSP;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listNSP;
	}

	public NhomSanPham layThongTinNhomSP(String maNSP) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		CallableStatement call;
		NhomSanPham nsp = new NhomSanPham();
		try {
			call = conn.prepareCall("{call QuanLyShopQuanAo_LayThongTinNhomSanPhamTheoMa(?)}");
			call.setString(1, maNSP);
			rs = call.executeQuery();
			if(rs.next()) {
				nsp.setMaNhomSP(rs.getString("MaNhomSP"));
				nsp.setTenNhomSP(rs.getString("Name"));
				nsp.setContent(rs.getString("Content"));
				nsp.setImages(rs.getString("NameImage"));
				nsp.setOrder(rs.getInt("OrderTT"));
				nsp.setStatus(rs.getInt("Status"));
				nsp.setLink(rs.getString("Link"));
				nsp.setMaMainMenu(rs.getString("MainMenuID"));
			}
			return nsp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return nsp;
	}

	public ArrayList<NhomSanPham> layDanhSachNhomSanPhamBanChayQuanTri() {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		listNSP = new ArrayList<>();
		CallableStatement call;
		try {
			call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachNhomSanPhamBanChayQuanTri}");
			rs = call.executeQuery();
			while(rs.next()) {
				NhomSanPham nsp = new NhomSanPham();
				nsp.setMaNhomSP(rs.getString("MaNhomSP"));
				nsp.setTenNhomSP(rs.getString("Name"));
				nsp.setContent(rs.getString("Content"));
				nsp.setImages(rs.getString("NameImage"));
				nsp.setOrder(rs.getInt("OrderTT"));
				nsp.setStatus(rs.getInt("Status"));
				nsp.setLink(rs.getString("Link"));
				nsp.setMaMainMenu(rs.getString("MainMenuID"));
				listNSP.add(nsp);
			}
			return listNSP;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listNSP;
	}

}
