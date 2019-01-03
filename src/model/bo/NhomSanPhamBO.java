package model.bo;

import java.util.ArrayList;

import model.bean.NhomSanPham;
import model.bean.SanPham;
import model.dao.ConnectDB;
import model.dao.NhomSanPhamDAO;

public class NhomSanPhamBO {
	NhomSanPhamDAO dao = new NhomSanPhamDAO();
	
	public int sinhma() {
		return ConnectDB.sinhMa("MaNhomSP", "tblNhomSP");
	}
	
	public ArrayList<NhomSanPham> layDanhSachNhomSanPham() {
		return dao.layDanhSachNhomSanPham();
	}

	public void themNhomSanPhamBo(String maNhomSanPham, String tenNhomSanPham, String chiTietNhomSanPham, String order,
			String fileName1) {
		dao.themNhomSanPham(maNhomSanPham, tenNhomSanPham, chiTietNhomSanPham,order, fileName1);
	}

	public void xoaNhomSanPhamTheoMa(String maNhomSP) {
		dao.xoaNhomSanPhamTheoMa(maNhomSP);
		
	}

	public ArrayList<NhomSanPham> layDanhSachNhomSanPhamTheoMenu(String menu) {
		// TODO Auto-generated method stub
		return dao.layDanhSachNhomSanPhamTheoMenu(menu);
	}

	public NhomSanPham layThongTinNhomSP(String maNSP) {
		// TODO Auto-generated method stub
		return dao.layThongTinNhomSP(maNSP);
	}

	public ArrayList<NhomSanPham> layDanhSachNhomSanPhamBanChayQuanTri() {
		// TODO Auto-generated method stub
		return dao.layDanhSachNhomSanPhamBanChayQuanTri() ;
	}

}
