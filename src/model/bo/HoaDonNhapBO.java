package model.bo;

import model.dao.ConnectDB;
import model.dao.HoaDonNhapDAO;

public class HoaDonNhapBO {

	HoaDonNhapDAO hdnDao = new HoaDonNhapDAO();
	public int sinhma() {
		return ConnectDB.sinhMa("MaHD", "tblHoaDonNhap");
	}

	public void themHoaDonNhap(String maHoaDonNhap, String maTaiKhoan, String maNhaCungCap, String ngayNhap) {
		// TODO Auto-generated method stub
		hdnDao.themHoaDonNhap(maHoaDonNhap, maTaiKhoan, maNhaCungCap, ngayNhap);
	}

}
