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
import model.bean.NhaCungCap;
import model.bo.KhachHangBO;
import model.bo.NhaCungCapBO;

/**
 * Servlet implementation class QuanTriDanhSachNhaCungCapServlet
 */
public class QuanTriDanhSachNhaCungCapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanTriDanhSachNhaCungCapServlet() {
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
		
		NhaCungCapBO bo = new NhaCungCapBO();
		ArrayList<NhaCungCap> listNCC = bo.layDanhSachNhaCungCap();
		
		request.setAttribute("listNCC", listNCC);
		RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachnhacungcap.jsp");
		rd.forward(request, response);
	}

}
