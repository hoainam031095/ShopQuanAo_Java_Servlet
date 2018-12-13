package model.bo;

import java.util.ArrayList;

import model.bean.SanPham;
import model.dao.ConnectDB;
import model.dao.SanPhamDAO;

public class SanPhamBO {
	SanPhamDAO dao = new SanPhamDAO();
	public int sinhma() {
		return ConnectDB.sinhMa("MaSP", "tblChiTietSP");
	}
	public ArrayList<SanPham> layDanhSachSanPham() {
		return dao.layDanhSachSanPham();
	}

	public void themSanPhamBo(String maSanPham, String tenSanPham, String chiTietSanPham, String giaBan, String order, String nhomSanPham,
			String fileName1) {
		dao.themSanPhamDAO(maSanPham, tenSanPham, chiTietSanPham, giaBan, order, nhomSanPham, fileName1);	
	}
	public void xoaSanPhamTheoMa(String maSanPham) {
		
		dao.xoaSanPhamTheoMa(maSanPham);
		
	}
	public SanPham layThongTinSanPhamTheoMa(String maSP) {
		return dao.layThongTinSanPhamTheoMa(maSP);
	}
	public ArrayList<SanPham> layDanhSachSanPhamBanChay() {
		return dao.layDanhSachSanPhamBanChay();
	}
	public ArrayList<SanPham> layDanhSachSanPhamTheonhom(int soluong, String nhom) {
		// TODO Auto-generated method stub
		return dao.layDanhSachSanPhamTheoNhom(soluong, nhom);
	}
	public ArrayList<SanPham> layDanhSachSanPhamTheoMenu(String maMenu) {
		// TODO Auto-generated method stub
		return dao.layDanhSachSanPhamTheoMenu(maMenu);
	}
	public ArrayList<SanPham> layDanhSachSanPhamTheoKeyWordSearch(String keyWord) {
		// TODO Auto-generated method stub
		return dao.layDanhSachSanPhamTheoKeyWordSearch(keyWord);
	}
	public int layMaxGia() {
		// TODO Auto-generated method stub
		return dao.layMaxGia();
	}
	public ArrayList<SanPham> locDanhSachSanPhamTheogia(String maMenu, String doTuoi, int giaMin, int giaMax) {
		// TODO Auto-generated method stub
		return dao.locDanhSachSanPhamTheogia(maMenu, doTuoi, giaMin, giaMax);
	}
	public ArrayList<SanPham> layDanhSachSanPhamTheoNhomSP(String maNSP) {
		// TODO Auto-generated method stub
		return dao.layDanhSachSanPhamTheoNhomSP(maNSP);
	}
	public ArrayList<SanPham> locDanhSachSanPhamTheogiaVaNhom(String maNhom, String doTuoi, int giaMin, int giaMax) {
		// TODO Auto-generated method stub
		return dao.locDanhSachSanPhamTheogiaVaNhom(maNhom, doTuoi, giaMin, giaMax);
	}

}
