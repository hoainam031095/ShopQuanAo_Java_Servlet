package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

//import jdk.internal.dynalink.beans.StaticClass;
import model.bean.TaiKhoan;

public class TaiKhoanDAO {
	static Connection conn;
	static ResultSet rs;
	
	public TaiKhoan layNguoiDung(String userName, String passWord) {
		conn = ConnectDB.getConnection();
		TaiKhoan tk;
		tk = null;
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_CheckTaiKhoan(?,?)}");
			call.setString(1, userName);
			call.setString(2, passWord);
			rs = call.executeQuery();
			if(rs.next())
			{
				tk = new TaiKhoan();
				tk.setMaTaikhoan(rs.getString("MaTK"));
				tk.setHoTen(rs.getString("Ten"));
				tk.setQuyen(rs.getInt("Rules"));
				tk.setTenTaiKhoan(rs.getString("TaiKhoan"));
				return tk;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return tk;
	}

	public void themTaiKhoan(String maTaiKhoan, String tenHienThi, String tenTaiKhoan, String matKhau,int rule, String email) {
		conn = ConnectDB.getConnection();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_ThemTaiKhoan(?,?,?,?,?,?)}");
			call.setString(1, maTaiKhoan);
			call.setString(2, tenHienThi);
			call.setString(3, tenTaiKhoan);
			call.setString(4, matKhau);
			call.setInt(5, rule);
			call.setString(6, email);
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
