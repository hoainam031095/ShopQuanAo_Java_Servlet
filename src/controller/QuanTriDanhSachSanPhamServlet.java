package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.SanPham;
import model.bo.SanPhamBO;

/**
 * Servlet implementation class QuanTriDanhSachSanPhamServlet
 */
public class QuanTriDanhSachSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanTriDanhSachSanPhamServlet() {
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
		if((ss.getAttribute("Quyen")==null) || (ss.getAttribute("Quyen").equals("3"))) {
			response.sendRedirect("KhachHangTrangChuServlet");
			return;
		}
		
		SanPhamBO bo = new SanPhamBO();
		ArrayList<SanPham> listSP = bo.layDanhSachSanPham();
		request.setAttribute("listSP", listSP);
		RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachsanpham.jsp");
		rd.forward(request, response);
//		response.sendRedirect("Admin/danhsachsanpham.jsp");
	}

}
