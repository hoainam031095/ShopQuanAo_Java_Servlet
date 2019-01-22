package model.bo;

import java.util.ArrayList;

import model.bean.TaiKhoan;
import model.dao.ConnectDB;
import model.dao.TaiKhoanDAO;

public class TaiKhoanBO {
	TaiKhoanDAO dao = new TaiKhoanDAO();
	
	public int sinhma() {
		return ConnectDB.sinhMa("MaTK", "tblTaiKhoan");
	}
	public TaiKhoan layNguoiDung(String userName, String passWord) {
		return dao.layNguoiDung(userName, passWord);
	}

	public void themTaiKhoan(String maTaiKhoan, String tenHienThi, String tenTaiKhoan, String matKhau,int rule, String email) {
		dao.themTaiKhoan(maTaiKhoan, tenHienThi, tenTaiKhoan,matKhau,rule,email);
		
	}
	public ArrayList<TaiKhoan> layDanhSachTaiKhoan() {
		// TODO Auto-generated method stub
		return dao.layDanhSachTaiKhoan();
	}
	
}
