package model.bo;

import java.util.ArrayList;

import model.bean.QuanHuyen;
import model.dao.HuyenDAO;

public class HuyenBO {

	HuyenDAO hDao = new HuyenDAO();
	public ArrayList<QuanHuyen> layDanhSachHuyenTheoTinh(int maTinh) {
		// TODO Auto-generated method stub
		return hDao.layDanhSachHuyenTheoTinh(maTinh);
	}

}
