package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.TinhThanhPho;

public class TinhDAO {
	static Connection conn;
	static ResultSet rs;
	ArrayList<TinhThanhPho> listTinhThanhPho;
	public ArrayList<TinhThanhPho> layDanhSachTinhThanhPho() {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		listTinhThanhPho = new ArrayList<>();
		try {
			PreparedStatement psttm = conn.prepareStatement("select * from tblTinh");
			rs = psttm.executeQuery();
			while(rs.next()) {
				TinhThanhPho ttp = new TinhThanhPho();
				ttp.setID(rs.getInt("ID"));
				ttp.setTenTinhThanh(rs.getString("TenTinh"));
				listTinhThanhPho.add(ttp);
			}
			return listTinhThanhPho;
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
		return listTinhThanhPho;
	}

}
