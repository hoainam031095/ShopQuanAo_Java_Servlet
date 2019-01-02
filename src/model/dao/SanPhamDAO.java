package model.dao;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.SanPham;

public class SanPhamDAO {
	static Connection conn;
	ResultSet rs;
	ArrayList<SanPham> listSP;
	
	public ArrayList<SanPham> layDanhSachSanPham() {
		listSP = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachSanPham }");
			rs = call.executeQuery();
			
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSP.add(sp);	
			}
			return listSP;
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
		return listSP;
	}

	public void themSanPhamDAO(String maSanPham, String tenSanPham, String chiTietSanPham, String soLuong, String giaBan, String order,
			String nhomSanPham, String fileName1) {
		conn = ConnectDB.getConnection();
		
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemSanPham(?,?,?,?,?,?,?,?)}");
			call.setString(1, maSanPham);
			call.setString(2, tenSanPham);
			call.setString(3, chiTietSanPham);
			call.setInt(4, Integer.parseInt(soLuong));
			call.setInt(5, Integer.parseInt(giaBan));
			call.setInt(6, Integer.parseInt(order));
			call.setString(7, nhomSanPham);
			call.setString(8, fileName1);
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

	public void xoaSanPhamTheoMa(String maSanPham) {
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_XoaSanPham(?)}");
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

	public ArrayList<SanPham> layDanhSachSanPhamBanChay() {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPbanchay = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachSanPhamBanChay}");
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPbanchay.add(sp);
			}
			return listSPbanchay;
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
		return listSPbanchay;
	}
	public ArrayList<SanPham> layDanhSachSanPhamBanChayQuanTri() {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPbanchay = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachSanPhamBanChayQuanTri}");
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPbanchay.add(sp);
			}
			return listSPbanchay;
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
		return listSPbanchay;
	}

	public ArrayList<SanPham> layDanhSachSanPhamTheoNhom(int soluong, String nhom) {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPtheonhom = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_layDanhSachSanPhamTheoNhom(?,?)}");
			call.setInt(1, soluong);
			call.setString(2, nhom);
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPtheonhom.add(sp);
			}
			return listSPtheonhom;
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
		return listSPtheonhom;
	}

	public ArrayList<SanPham> layDanhSachSanPhamTheoMenu(String maMenu) {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPtheomenu = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_layDanhSachSanPhamTheoMenu(?)}");
			call.setString(1, maMenu);
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPtheomenu.add(sp);
			}
			return listSPtheomenu;
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
		return listSPtheomenu;
	}

	public ArrayList<SanPham> layDanhSachSanPhamTheoKeyWordSearch(String keyWord) {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPtheomenu = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachSanPhamTheoKeyWordSearch(?)}");
			call.setString(1, keyWord);
			
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPtheomenu.add(sp);
			}
			return listSPtheomenu;
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
		return listSPtheomenu;
	}

	public int layMaxGia() {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayMaxGia}");
			rs = call.executeQuery();
			SanPham sp = new SanPham();
			if(rs.next()) {
				sp.setGiaMoi(rs.getInt("GiaMoi"));
			}
			return sp.getGiaMoi();
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
		return 0;
	}

	public ArrayList<SanPham> locDanhSachSanPhamTheogia(String maMenu, String doTuoi, int giaMin, int giaMax) {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPtheomenu = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LocSanPhamTheoGia(?,?,?,?)}");
			call.setString(1, maMenu);
			call.setString(2, doTuoi);
			call.setInt(3, giaMin);
			call.setInt(4, giaMax);
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPtheomenu.add(sp);
			}
			return listSPtheomenu;
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
		return listSPtheomenu;
	}

	public ArrayList<SanPham> layDanhSachSanPhamTheoNhomSP(String maNSP) {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPtheomenu = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_layDanhSachSanPhamTheoNhomSP(?)}");
			call.setString(1, maNSP);
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPtheomenu.add(sp);
			}
			return listSPtheomenu;
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
		return listSPtheomenu;
	}

	public ArrayList<SanPham> locDanhSachSanPhamTheogiaVaNhom(String maNhom,String doTuoi, int giaMin, int giaMax) {
		// TODO Auto-generated method stub
		ArrayList<SanPham> listSPtheonhom = new ArrayList<>();
		conn = ConnectDB.getConnection();
		rs = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LocSanPhamTheoGiaVaNhom(?,?,?,?)}");
			call.setString(1, maNhom);
			call.setString(2, doTuoi);
			call.setInt(3, giaMin);
			call.setInt(4, giaMax);
			rs = call.executeQuery();
			while(rs.next()) {
				SanPham sp = new SanPham();
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
				listSPtheonhom.add(sp);
			}
			return listSPtheonhom;
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
		return listSPtheonhom;
	}

	public SanPham layThongTinSanPhamTheoMa(String maSP) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		SanPham sp = new SanPham();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayThongTinSanPhamTheoMaSanPham(?)}");
			call.setString(1, maSP);
			rs = call.executeQuery();
			if(rs.next()) {
				sp.setMaSanPham(rs.getString("MaSP"));
				sp.setTenSanPham(rs.getString("Name"));
				sp.setChiTietSanPham(rs.getString("ChiTiet"));
				sp.setGia(rs.getInt("Gia"));
				sp.setGiaMoi(rs.getInt("GiaMoi"));
				sp.setImages(rs.getString("NameImage"));
				sp.setSoLuong(rs.getInt("SoLuong"));
				sp.setOrder(rs.getInt("OrderTT"));
				sp.setStatus(rs.getInt("Status"));
				sp.setMaNhomSanPham(rs.getString("IDNhomSP"));
			}
			return sp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sp;
	}

	public void updateSanPhamBo(String maSanPham, String tenSanPham, String chiTietSanPham, String giaCu, String giaBan,
			String order, String nhomSanPham, String fileName2) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_SuaThongTinSanPham(?,?,?,?,?,?,?,?)}");
			call.setString(1, maSanPham);
			call.setString(2, tenSanPham);
			call.setString(3, chiTietSanPham);
			call.setInt(4, Integer.parseInt(giaCu));
			call.setInt(5, Integer.parseInt(giaBan));
			call.setInt(6, Integer.parseInt(order));
			call.setString(7, nhomSanPham);
			call.setString(8, fileName2);
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
