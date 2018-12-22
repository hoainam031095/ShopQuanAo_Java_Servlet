package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.ChiTietHoaDonBan;

public class ChiTietHoaDonDAO {
	static Connection conn;
	static ResultSet rs;
	ArrayList<ChiTietHoaDonBan> listCTHDban;
	public ArrayList<ChiTietHoaDonBan> layThongTinHoaDonBanTheoMa(String maHD) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		rs = null;
		listCTHDban = new ArrayList<>();
		
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayThongTinHoaDonBanTheoMa(?)}");
			call.setString(1, maHD);
			rs = call.executeQuery();
			while(rs.next()) {
				ChiTietHoaDonBan cthdBan = new ChiTietHoaDonBan();
				cthdBan.setMaHD(rs.getString("MaHD"));
				cthdBan.setMaTK(rs.getString("MaTK"));
				cthdBan.setTenNguoiNhan(rs.getString("TenNguoiNhan"));
				cthdBan.setSoDienThoai(rs.getString("SDT"));
				cthdBan.setMaTinhThanh(rs.getInt("MaTinhThanh"));
				cthdBan.setDiaChi(rs.getString("DiaChi"));
				cthdBan.setMaSP(rs.getString("MaSP"));
				cthdBan.setMaMau(rs.getString("MaMau"));
				cthdBan.setMaDoTuoi(rs.getString("MaDoTuoi"));
				cthdBan.setSoLuong(rs.getInt("SoLuong"));
				cthdBan.setDonGia(rs.getInt("DonGia"));
				cthdBan.setNgayBan(rs.getString("NgayBan"));
				cthdBan.setTrangThai(rs.getInt("TrangThai"));
				listCTHDban.add(cthdBan);
			}
			return listCTHDban;
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
		return listCTHDban;
	}

}
