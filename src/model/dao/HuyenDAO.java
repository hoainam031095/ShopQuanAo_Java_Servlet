package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.QuanHuyen;

public class HuyenDAO {
	static Connection conn;
	static ResultSet rs;
	ArrayList<QuanHuyen> listQuanHuyen;
	public ArrayList<QuanHuyen> layDanhSachHuyenTheoTinh(int maTinh) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		listQuanHuyen = new ArrayList<>();
		try {
			PreparedStatement psttm = conn.prepareStatement("select * from tblHuyen where IDTinh = ?");
			psttm.setInt(1, maTinh);
			rs = psttm.executeQuery();
			while(rs.next()) {
				QuanHuyen ttp = new QuanHuyen();
				ttp.setMaQuanHuyen(rs.getInt("ID"));
				ttp.setTenQuanHuyen(rs.getString("TenHuyen"));
				ttp.setMaTinhThanh(rs.getInt("IDTinh"));
				listQuanHuyen.add(ttp);
			}
			return listQuanHuyen;
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
		return listQuanHuyen;
	}
	public QuanHuyen layThongTinHuyenTheoMa(int ma) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		QuanHuyen ttp = new QuanHuyen();
		try {
			PreparedStatement psttm = conn.prepareStatement("select * from tblHuyen where ID = ?");
			psttm.setInt(1, ma);
			rs = psttm.executeQuery();
			if(rs.next()) {
				ttp.setMaQuanHuyen(rs.getInt("ID"));
				ttp.setTenQuanHuyen(rs.getString("TenHuyen"));
				ttp.setMaTinhThanh(rs.getInt("IDTinh"));
			}
			return ttp;
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
		return ttp;
	}

}
