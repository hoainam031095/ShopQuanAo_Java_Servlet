package model.bo;

import java.util.ArrayList;

import model.bean.HoaDonBan;
import model.dao.ConnectDB;
import model.dao.HoaDonBanDAO;

public class HoaDonBanBO {
	HoaDonBanDAO hdbDao = new HoaDonBanDAO();
	public int sinhma() {
		return ConnectDB.sinhMa("MaHD", "tblHoaDonBan");
	}
	public void themHoaDonBanKhachVangLai(String maHD, String tennguoinhan, String dienthoainguoinhan, int maTinhThanh,
			String diachi, String ngayban) {
		// TODO Auto-generated method stub
		hdbDao.themHoaDonBanKhachVangLai(maHD, tennguoinhan, dienthoainguoinhan, maTinhThanh, diachi, ngayban);
	}
	public void themHoaDonBanKhachTaiKhoan(String maHD, String maTaiKhoan, String tennguoinhan,
			String dienthoainguoinhan, int maTinhThanh, String diachi, String ngayban) {
		// TODO Auto-generated method stub
		hdbDao.themHoaDonBanKhachTaiKhoan(maHD, maTaiKhoan, tennguoinhan, dienthoainguoinhan, maTinhThanh, diachi, ngayban);
	}
	public void themChiTietHoaDonBan(String maHD, String maSanPham, String maMau, String maDoTuoi, int soLuong, int donGia) {
		// TODO Auto-generated method stub
		hdbDao.themChiTietHoaDonBan(maHD, maSanPham, maMau, maDoTuoi, soLuong, donGia);
	}
	public ArrayList<HoaDonBan> layDanhSachMaHoaDonMuaTheoMaTaiKhoan(String maTK) {
		// TODO Auto-generated method stub
		return hdbDao.layDanhSachMaHoaDonMuaTheoMaTaiKhoan(maTK);
	}
	public String laySoLuongKhachHangTrongThang(String nowYear, String nowMonth) {
		// TODO Auto-generated method stub
		return hdbDao.laySoLuongKhachHangTrongThang(nowYear, nowMonth);
	}
	public String laySoLuongDonHangTrongThang(String nowYear, String nowMonth) {
		// TODO Auto-generated method stub
		return hdbDao.laySoLuongDonHangTrongThang(nowYear, nowMonth);
	}
}
