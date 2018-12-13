package model.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.bean.Menu;

public class MenuDAO {
	Connection conn;
	ResultSet rs = null;
	public ArrayList<Menu> layDanhSachMenu() {
		conn = ConnectDB.getConnection();
		ArrayList<Menu> listMenu = new ArrayList<>();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayDanhSachMenu}");
			rs = call.executeQuery();
			while(rs.next()) {
				Menu mn = new Menu();
				mn.setMaMenu(rs.getString("ID"));
				mn.setTenMenu(rs.getString("Name"));
				mn.setLinkMenu(rs.getString("Link"));
				mn.setOrder(rs.getString("Order"));
				mn.setContent(rs.getString("Content"));
				listMenu.add(mn);
			}
			return listMenu;
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
		return listMenu;
	}
	public Menu layThongTinMenuTheoMa(String maMenu) {
		// TODO Auto-generated method stub
		conn = ConnectDB.getConnection();
		Menu mn = new Menu();
		try {
			CallableStatement call = conn.prepareCall("{call QuanLyShopQuanAo_LayThongTinMenuTheoMa(?)}");
			call.setString(1, maMenu);
			rs = call.executeQuery();
			if(rs.next()) {	
				mn.setMaMenu(rs.getString("ID"));
				mn.setTenMenu(rs.getString("Name"));
				mn.setLinkMenu(rs.getString("Link"));
				mn.setOrder(rs.getString("Order"));
				mn.setContent(rs.getString("Content"));
			}
			return mn;
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
		return mn;
	}

}
