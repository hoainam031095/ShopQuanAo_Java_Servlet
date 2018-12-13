package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;
import model.bean.Menu;
import model.bean.SanPham;
import model.bo.GioHangBO;
import model.bo.MenuBO;
import model.bo.SanPhamBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class KhachHangTrangChuServlet
 */
public class KhachHangTrangChuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KhachHangTrangChuServlet() {
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
		
		if(ss.getAttribute("Quyen") !=null)
		{
			if(ss.getAttribute("Quyen").equals("3"))
			{
			GioHangBO gioHangBO = new GioHangBO();
			String maTaiKhoan = (String)ss.getAttribute("MaTaiKhoan");
			ArrayList<GioHang> listGioHang = gioHangBO.layDanhSachSanPhamTrongGioHang(maTaiKhoan);
			ss.setAttribute("listGioHang", listGioHang);
			}
		}
		
		SanPhamBO sanphambo = new SanPhamBO();
		
		ArrayList<SanPham> listSPbanchay = sanphambo.layDanhSachSanPhamBanChay();
		request.setAttribute("listSPbanchay", listSPbanchay);
		
		
		ArrayList<SanPham> listSPbegai = sanphambo.layDanhSachSanPhamTheonhom(8,"gái");
		request.setAttribute("listSPbegai", listSPbegai);
		
		ArrayList<SanPham> listSPbetrai = sanphambo.layDanhSachSanPhamTheonhom(8,"trai");
		request.setAttribute("listSPbetrai", listSPbetrai);
		
		ArrayList<SanPham> listSPsosinh = sanphambo.layDanhSachSanPhamTheonhom(8,"sơ sinh");
		request.setAttribute("listSPsosinh", listSPsosinh);
		
		ArrayList<SanPham> listSPphukien = sanphambo.layDanhSachSanPhamTheonhom(8,"ĐỒ DÙNG");
		request.setAttribute("listSPphukien", listSPphukien);
		
		RequestDispatcher rd = request.getRequestDispatcher("Us_index.jsp");
		rd.forward(request, response);
	}

}
