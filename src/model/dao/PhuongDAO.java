package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.PhuongXa;

public class PhuongDAO {
	static Connection conn;
	static ResultSet rs;
	ArrayList<PhuongXa> listPhuongXa;
	public ArrayList<PhuongXa> layDanhSachPhuongXaTheoHuyen(int maHuyen) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		listPhuongXa = new ArrayList<>();
		try {
			PreparedStatement psttm = conn.prepareStatement("select * from tblXa where IDHuyen = ?");
			psttm.setInt(1, maHuyen);
			rs = psttm.executeQuery();
			while(rs.next()) {
				PhuongXa ttp = new PhuongXa();
				ttp.setMaPhuongXa(rs.getInt("ID"));
				ttp.setTenPhuongXa(rs.getString("TenXa"));
				ttp.setMaQuanHuyen(rs.getInt("IDHuyen"));
				listPhuongXa.add(ttp);
			}
			return listPhuongXa;
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
		return listPhuongXa;
	}
	public PhuongXa layThongTinXaTheoMa(int ma) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		PhuongXa ttp = new PhuongXa();
		try {
			PreparedStatement psttm = conn.prepareStatement("select * from tblXa where ID = ?");
			psttm.setInt(1, ma);
			rs = psttm.executeQuery();
			while(rs.next()) {
				ttp.setMaPhuongXa(rs.getInt("ID"));
				ttp.setTenPhuongXa(rs.getString("TenXa"));
				ttp.setMaQuanHuyen(rs.getInt("IDHuyen"));
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
