package model.bo;

import java.util.ArrayList;

import model.bean.MauSac;
import model.dao.MauSacDAO;

public class MauSacBO {
	MauSacDAO dao = new MauSacDAO();
	public ArrayList<MauSac> layDanhSachMauSacTheoMaSP(String maSanPham) {
		// TODO Auto-generated method stub
		return dao.layDanhSachMauSacTheoMaSP(maSanPham);
	}
	public MauSac layImageSanPhamTheoMauSac(String maSanPham, String maMauSac) {
		return dao.layImageSanPhamTheoMauSac(maSanPham, maMauSac);
	}

}
