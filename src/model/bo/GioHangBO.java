package model.bo;

import java.util.ArrayList;

import model.bean.GioHang;
import model.dao.ConnectDB;
import model.dao.GioHangDAO;

public class GioHangBO {
	
	GioHangDAO ghDao = new GioHangDAO();
	public int sinhma() {
		return ConnectDB.sinhMa("MaGioHang", "tblGioHang");
	}
	public ArrayList<GioHang> layDanhSachSanPhamTrongGioHang(String maTaiKhoan) {
		// TODO Auto-generated method stub
		return ghDao.layDanhSachSanPhamTrongGioHang(maTaiKhoan);
	}
	public void themSanPhamVaoGioHang(String maGioHang, String maTaiKhoan, String maSanPham, String maMau, String maDoTuoi, int soLuong) {
		// TODO Auto-generated method stub
		ghDao.themSanPhamVaoGioHang(maGioHang, maTaiKhoan, maSanPham, maMau, maDoTuoi, soLuong);
	}
	public void updateSoLuongSanPhamTrongGioHang(String maTaiKhoan, String maSanPham, String maMau, String maDoTuoi,
			int soluong) {
		ghDao.updateSoLuongSanPhamTrongGioHang(maTaiKhoan, maSanPham, maMau, maDoTuoi, soluong);
		
	}
	public int laySoLuongSanPhamTrongGioHangSanPhamTrongGioHangTheoMaSanPham(String maSP) {
		return ghDao.laySoLuongSanPhamTrongGioHangSanPhamTrongGioHangTheoMaSanPham(maSP);
	}
	public void xoaGioHangTheoMa(String maGioHang) {
		ghDao.xoaGioHangTheoMa(maGioHang);
	}

}
