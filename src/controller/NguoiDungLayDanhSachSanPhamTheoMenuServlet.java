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
 * Servlet implementation class NguoiDungLayDanhSachSanPhamTheoMenuServlet
 */
public class NguoiDungLayDanhSachSanPhamTheoMenuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungLayDanhSachSanPhamTheoMenuServlet() {
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
			String maMenu = request.getParameter("mamn");
			
			Menu menu = menubo.layThongTinMenuTheoMa(maMenu);
			request.setAttribute("menu", menu);
			
			ArrayList<SanPham> listSP = sanphambo.layDanhSachSanPhamTheoMenu(maMenu);
			request.setAttribute("listSP", listSP);
			
			ArrayList<NhomSanPham> listNhomSP = nhomSPbo.layDanhSachNhomSanPhamTheoMenu(maMenu);
			request.setAttribute("listNhomSP", listNhomSP);
			
			ArrayList<DoTuoi> listNhomDoTuoi = doTuoiBo.layDanhSachDoTuoi();
			request.setAttribute("listNhomDoTuoi", listNhomDoTuoi);
			
			String maxGia = sanphambo.layMaxGia() + "";
			request.setAttribute("maxGia", maxGia);
			
			RequestDispatcher rd = request.getRequestDispatcher("Us_danhsachsanphamtheoMenu.jsp");
			rd.forward(request, response);
		}
		else {
			
		}
	}

}
