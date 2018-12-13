package model.bo;

import java.util.ArrayList;

import model.bean.ChiTietHoaDonNhap;
import model.dao.DanhSachChiTietHoaDonNhapDAO;

public class DanhSachChiTietSanPhamBO {

	public ArrayList<ChiTietHoaDonNhap> layDanhSachChiTietHoaDonNhap() {
		DanhSachChiTietHoaDonNhapDAO dao = new DanhSachChiTietHoaDonNhapDAO();
		return dao.layDanhSachChiTietHoaDonNhap();
	}

}
