package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.KhachHang;
import model.bo.KhachHangBO;

/**
 * Servlet implementation class QuanTriDanhSachKhachHangServlet
 */
public class QuanTriDanhSachKhachHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanTriDanhSachKhachHangServlet() {
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
		
		KhachHangBO bo = new KhachHangBO();
		ArrayList<KhachHang> listKH = bo.layDanhSachKhachHang();
		
		request.setAttribute("listKH", listKH);
		RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachkhachhang.jsp");
		rd.forward(request, response);
	}

}
