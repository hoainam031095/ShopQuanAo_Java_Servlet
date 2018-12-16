package model.bo;

import java.util.ArrayList;

import model.bean.PhuongXa;
import model.dao.PhuongDAO;

public class PhuongBO {
	PhuongDAO pDao = new PhuongDAO();
	public ArrayList<PhuongXa> layDanhSachPhuongXaTheoHuyen(int maHuyen) {
		// TODO Auto-generated method stub
		return pDao.layDanhSachPhuongXaTheoHuyen(maHuyen);
	}

}
