package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.TaiKhoanBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungDangKyServlet
 */
public class NguoiDungDangKyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungDangKyServlet() {
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
		if("submit".equals(request.getParameter("submit"))) {
			TaiKhoanBO tkBO = new TaiKhoanBO();
			String maTaiKhoan = "TK" + String.format("%05d", tkBO.sinhma()+1);
			String tenHienThi = request.getParameter("tenHienThi");
			String tenTaiKhoan = request.getParameter("taiKhoan");
			String matKhau = request.getParameter("passWord");
			int rule = 3;
			if(ss.getAttribute("Quyen")==null){
				rule = 3;
			}
			String email = request.getParameter("email");
			tkBO.themTaiKhoan(maTaiKhoan,tenHienThi, tenTaiKhoan, matKhau.hashCode()+"",rule, email);
			response.sendRedirect("DangNhapServlet?userName="+tenTaiKhoan+"&passWord="+matKhau);
		}
		else {
			response.sendRedirect("Us_dangky.jsp");
		}
	}

}
