package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.GioHang;
import model.bo.GioHangBO;

/**
 * Servlet implementation class NguoiDungXoaGioHangServlet
 */
public class NguoiDungXoaGioHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungXoaGioHangServlet() {
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
		
		if(ss.getAttribute("Quyen") == null) {
			String maSP = request.getParameter("maSP");
			String maMau = request.getParameter("maMau");
			String maDoTuoi = request.getParameter("maDoTuoi");
			for(Cookie ck: request.getCookies()) {
				if((maSP+"#"+maMau+"#"+maDoTuoi).equals(ck.getName())) {
					ck.setMaxAge(0);
					response.addCookie(ck);
				}
			}
		}
		else {
			String maGioHang = request.getParameter("maGH");
			GioHangBO ghBO = new GioHangBO();
			ghBO.xoaGioHangTheoMa(maGioHang);
		}
		response.sendRedirect("KhachHangTrangChuServlet");
	}

}
