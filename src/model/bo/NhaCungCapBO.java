package model.bo;

import java.util.ArrayList;

import model.bean.NhaCungCap;
import model.dao.NhaCungCapDAO;

public class NhaCungCapBO {

	NhaCungCapDAO nccDao = new NhaCungCapDAO();
	public ArrayList<NhaCungCap> layDanhSachNhaCungCap() {
		// TODO Auto-generated method stub
		return nccDao.layDanhSachNhaCungCap();
	}

}
