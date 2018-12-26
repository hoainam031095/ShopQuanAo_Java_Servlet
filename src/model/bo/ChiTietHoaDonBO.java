package model.bo;

import java.util.ArrayList;

import model.bean.ChiTietHoaDonBan;
import model.dao.ChiTietHoaDonDAO;

public class ChiTietHoaDonBO {
	ChiTietHoaDonDAO cthdDao = new ChiTietHoaDonDAO();

	public ArrayList<ChiTietHoaDonBan> layThongTinHoaDonBanTheoMa(String maHD) {
		// TODO Auto-generated method stub
		return cthdDao.layThongTinHoaDonBanTheoMa(maHD);
	}

	public String tongDoanhThuTrongThang(String nowYear, String month) {
		// TODO Auto-generated method stub
		return cthdDao.tongDoanhThuTrongThang(nowYear, month);
	}
	
}
