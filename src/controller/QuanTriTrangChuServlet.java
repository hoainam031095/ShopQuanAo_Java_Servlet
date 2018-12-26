package controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.ChiTietHoaDonBO;
import model.bo.HoaDonBanBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class QuanTriTrangChuServlet
 */
public class QuanTriTrangChuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuanTriTrangChuServlet() {
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ss = request.getSession();
		
		String ajaxLimit = request.getParameter("ajaxLimit");
		int nowYear = Calendar.getInstance().get(Calendar.YEAR);
		int nowMonth = Calendar.getInstance().get(Calendar.MONTH)+1;
		ChiTietHoaDonBO cthdBo = new ChiTietHoaDonBO();
		HoaDonBanBO hdbBo = new HoaDonBanBO();
		
		if(ajaxLimit == null || "".equals(ajaxLimit))
		{
			if((ss.getAttribute("Quyen")==null) || (ss.getAttribute("Quyen").equals("3"))) {
				response.sendRedirect("KhachHangTrangChuServlet");
			}
			else
			{
				String responseText = "";
				for (int i = 1; i <= nowMonth; i++) {
					String doanhThu = cthdBo.tongDoanhThuTrongThang(nowYear+"", i+"");
					responseText = responseText + doanhThu + ", ";
				}
				String soLuongKhachHang = hdbBo.laySoLuongKhachHangTrongThang(nowYear+"", nowMonth+"");
				request.setAttribute("soLuongKhachHang", soLuongKhachHang);
				String soLuongDonHang = hdbBo.laySoLuongDonHangTrongThang(nowYear+"", nowMonth+"");
				request.setAttribute("soLuongDonHang", soLuongDonHang);
				request.setAttribute("doanhSo", responseText);
				RequestDispatcher rd = request.getRequestDispatcher("Ad_index.jsp");
				rd.forward(request, response);
			}
		}
		else {
			String selectYear = request.getParameter("selectYear");
			if (selectYear.equals(nowYear+"")) {
				String responseText = "";
				for (int i = 1; i <= nowMonth; i++) {
					String doanhThu = cthdBo.tongDoanhThuTrongThang(nowYear+"", i+"");
					responseText = responseText + doanhThu + ", ";
				}
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				response.getWriter().write(responseText);
			} else {
				String responseText = "";
				for (int i = 1; i <= 12; i++) {
					String doanhThu = cthdBo.tongDoanhThuTrongThang(selectYear+"", i+"");
					responseText = responseText + doanhThu + ", ";
				}
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/plain");
				response.getWriter().write(responseText);
			}
		}
	}

}
