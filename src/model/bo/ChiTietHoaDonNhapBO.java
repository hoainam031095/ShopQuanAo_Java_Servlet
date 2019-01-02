package model.bo;

import model.dao.ChiTietHoaDonNhapDAO;

public class ChiTietHoaDonNhapBO {
	ChiTietHoaDonNhapDAO cthdnDao = new ChiTietHoaDonNhapDAO();
	public void themChiTietHoaDonNhap(String maHoaDonNhap, String maSanPham, int soLuong, int dongia) {
		// TODO Auto-generated method stub
		cthdnDao.themChiTietHoaDonNhap(maHoaDonNhap, maSanPham, soLuong, dongia);
	}

}
