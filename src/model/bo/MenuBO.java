package model.bo;

import java.util.ArrayList;

import model.bean.Menu;
import model.dao.MenuDAO;

public class MenuBO {
	MenuDAO dao = new MenuDAO();
	public ArrayList<Menu> layDanhSachMenu() {
		
		return dao.layDanhSachMenu();
	}
	public Menu layThongTinMenuTheoMa(String maMenu) {
		// TODO Auto-generated method stub
		return dao.layThongTinMenuTheoMa(maMenu);
	}

}
