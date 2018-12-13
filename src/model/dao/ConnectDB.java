package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Common.Extras;

public class ConnectDB {
	static String url = "jdbc:sqlserver://localhost:1433;databaseName=QuanLyShopQuanAo";
	static String userName = "sa";
	static String password = "26101995";
	
	public static Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			return DriverManager.getConnection(url, userName, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static int sinhMa(String tenTruong, String tenBang) {
		String sql = String.format("SELECT MAX(CAST(RTRIM(RIGHT(%s,5)) as INT)) FROM %s", tenTruong,tenBang);
		Connection conn = ConnectDB.getConnection();
		int index = 0;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				index = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
//				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return index;
	}
	public static boolean limit() {
		String limit = "20190202";
		if(Extras.Extras(limit)==true)return true;
		else return false;
	}
	public static void main(String[] args) {
		if(getConnection() != null) System.out.println("ok");
	}
}
