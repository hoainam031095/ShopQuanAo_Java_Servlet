package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.TaiKhoan;
import model.bo.TaiKhoanBO;

/**
 * Servlet implementation class DangNhapServlet
 */
public class DangNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DangNhapServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String userName = request.getParameter("userName");
		String passWord = request.getParameter("passWord");
		String ajaxLimit = request.getParameter("ajaxLimit");

		TaiKhoanBO bo = new TaiKhoanBO();
		TaiKhoan tk = bo.layNguoiDung(userName, passWord);
		
		if(ajaxLimit == null || "".equals(ajaxLimit))
		{
			if (tk != null) {
				if (tk.getQuyen() == 3) {
					HttpSession ss = request.getSession();
					ss.setAttribute("MaTaiKhoan", tk.getMaTaikhoan()+"");
					ss.setAttribute("Ten", tk.getHoTen() + "");
					ss.setAttribute("Quyen", tk.getQuyen() + "");
					response.sendRedirect("KhachHangTrangChuServlet");
				} else {
					HttpSession ss = request.getSession();
					ss.setAttribute("Ten", tk.getHoTen() + "");
					ss.setAttribute("Quyen", tk.getQuyen() + "");
					response.sendRedirect("QuanTriTrangChuServlet");
				}
			}
			else {
				response.sendRedirect("KhachHangTrangChuServlet");
			}
			
		}
		else {
			if (tk != null) {
				if (tk.getQuyen() == 3) {
					HttpSession ss = request.getSession();
					ss.setAttribute("MaTaiKhoan", tk.getMaTaikhoan()+"");
					ss.setAttribute("Ten", tk.getHoTen() + "");
					ss.setAttribute("Quyen", tk.getQuyen() + "");
					response.getWriter().write("KhachHangTrangChuServlet");
				} else {
					HttpSession ss = request.getSession();
					ss.setAttribute("Ten", tk.getHoTen() + "");
					ss.setAttribute("Quyen", tk.getQuyen() + "");
					response.getWriter().write("QuanTriTrangChuServlet");
				}
			}
			else {
				String responesText = "Sai";
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				response.getWriter().write(responesText);
			}
		}

	}

}
