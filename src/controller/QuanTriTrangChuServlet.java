package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.SanPham;
import model.bo.ChiTietHoaDonBO;
import model.bo.HoaDonBanBO;
import model.bo.SanPhamBO;
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
//				Tổng doanh thu cua năm
				String responseText = "";
				int tongDoanhThuCuaNam = 0;
				for (int i = 1; i <= nowMonth; i++) {
					String doanhThu = cthdBo.tongDoanhThuTrongThang(nowYear+"", i+"");
					responseText = responseText + doanhThu + ", ";
					tongDoanhThuCuaNam = tongDoanhThuCuaNam + Integer.parseInt(doanhThu);
				}
				request.setAttribute("doanhThuCuaThang", responseText);
				request.setAttribute("tongDoanhThuCuaNam", tongDoanhThuCuaNam+"");
				
//				Tổng số lượng khách hàng của năm
				String soLuongKhachHang = hdbBo.laySoLuongKhachHangTrongThang(nowYear+"", nowMonth+"");
				request.setAttribute("soLuongKhachHang", soLuongKhachHang);
				
//				Tổng số lượng đơn hàng của năm
				String soLuongDonHang = hdbBo.laySoLuongDonHangTrongThang(nowYear+"", nowMonth+"");
				request.setAttribute("soLuongDonHang", soLuongDonHang);
				
//				Danh sách khu vực tiêu thụ nhiều
				String khuVucTieuThuNhieu = hdbBo.layDanhSachKhuVucTieuThuNhieuCuaNam(nowYear+"");
				String danhSach = khuVucTieuThuNhieu.split("/")[0];
				String danhSachDonHang = khuVucTieuThuNhieu.split("/")[1];
				request.setAttribute("danhSach", danhSach);
				request.setAttribute("danhSachDonHang", danhSachDonHang);
				
//				Danh sách nhóm sản phẩm tiêu thụ nhiều
				SanPhamBO sanphambo = new SanPhamBO();
				ArrayList<SanPham> listSPbanchayQuanTri = sanphambo.layDanhSachSanPhamBanChayQuanTri();
				request.setAttribute("listSPbanchayQuanTri", listSPbanchayQuanTri);
				
//				Danh sách sản phẩm tiêu thụ nhiều
				
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
