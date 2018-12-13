package model.bo;

import java.util.ArrayList;

import model.bean.DoTuoi;
import model.dao.DoTuoiDAO;

public class DoTuoiBO {
	
	DoTuoiDAO dao = new DoTuoiDAO();
	public ArrayList<DoTuoi> layDanhSachDoTuoi() {
		// TODO Auto-generated method stub
		return dao.layDanhSachDoTuoi();
	}
	public void themLienKetGiuaSanPhamVaSize(String maSanPham, String nhomDoTuoi) {
		dao.themLienKetGiuaSanPhamVaSize(maSanPham, nhomDoTuoi);
		
	}
	public ArrayList<DoTuoi> layDanhSachDoTuoiTheoMa(String maSanPham) {
		// TODO Auto-generated method stub
		return dao.layDanhSachDoTuoiTheoMa(maSanPham);
	}
	public DoTuoi layThongTinDoTuoiTheoMaDoTuoi(String selectedMaDoTuoi) {
		// TODO Auto-generated method stub
		return dao.layThongTinDoTuoiTheoMaDoTuoi(selectedMaDoTuoi);
	}
	

}
