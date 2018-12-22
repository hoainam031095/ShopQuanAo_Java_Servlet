package model.bo;

import java.util.ArrayList;

import model.bean.TinhThanhPho;
import model.dao.TinhDAO;

public class TinhBO {
	TinhDAO tDao = new TinhDAO();
	public ArrayList<TinhThanhPho> layDanhSachTinhThanh() {
		// TODO Auto-generated method stub
		return tDao.layDanhSachTinhThanhPho();
	}
	public TinhThanhPho layThongTinTinhTheoMa(int ma) {
		// TODO Auto-generated method stub
		return tDao.layThongTinTinhTheoMa(ma);
	}

}
