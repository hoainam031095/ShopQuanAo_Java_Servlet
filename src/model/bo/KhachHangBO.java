package model.bo;

import java.util.ArrayList;

import model.bean.KhachHang;
import model.dao.KhachHangDAO;

public class KhachHangBO {

	public ArrayList<KhachHang> layDanhSachKhachHang() {
		KhachHangDAO dao = new KhachHangDAO();
		return dao.layDanhSachKhachHang();
	}

}
