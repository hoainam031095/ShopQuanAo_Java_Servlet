package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DoTuoi;
import model.bean.Menu;
import model.bean.NhomSanPham;
import model.bean.SanPham;
import model.bo.DoTuoiBO;
import model.bo.MenuBO;
import model.bo.NhomSanPhamBO;
import model.bo.SanPhamBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungLayDanhSachSPTheoNhomSPServlet
 */
public class NguoiDungLayDanhSachSPTheoNhomSPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungLayDanhSachSPTheoNhomSPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession ss = request.getSession();
		ss.setAttribute("limit", ConnectDB.limit());
		
		MenuBO menubo = new MenuBO();
		ArrayList<Menu> listMenu = menubo.layDanhSachMenu();
		ss.setAttribute("listMenu", listMenu);
		
		String ajaxLimit = request.getParameter("ajaxLimit");
		SanPhamBO sanphambo = new SanPhamBO();
		NhomSanPhamBO nhomSPbo = new NhomSanPhamBO();
		DoTuoiBO doTuoiBo = new DoTuoiBO();
		
		if(ajaxLimit == null || "".equals(ajaxLimit)) {
			String maNSP = request.getParameter("maNSP");
			
			NhomSanPham nhomSP = nhomSPbo.layThongTinNhomSP(maNSP);
			request.setAttribute("nhomSP", nhomSP);
			
			Menu menu = menubo.layThongTinMenuTheoMa(nhomSP.getMaMainMenu()+"");
			request.setAttribute("menu", menu);
			
			ArrayList<NhomSanPham> listNhomSP = nhomSPbo.layDanhSachNhomSanPhamTheoMenu(menu.getMaMenu());
			request.setAttribute("listNhomSP", listNhomSP);
			
			ArrayList<DoTuoi> listNhomDoTuoi = doTuoiBo.layDanhSachDoTuoi();
			request.setAttribute("listNhomDoTuoi", listNhomDoTuoi);
			
			ArrayList<SanPham> listSP = sanphambo.layDanhSachSanPhamTheoNhomSP(maNSP);
			request.setAttribute("listSP", listSP);
			
			String maxGia = sanphambo.layMaxGia() + "";
			request.setAttribute("maxGia", maxGia);
			
			RequestDispatcher rd = request.getRequestDispatcher("Us_danhsachsanphamtheoNhomSanPham.jsp");
			rd.forward(request, response);
		}
		else {
			
		}
	}

}
