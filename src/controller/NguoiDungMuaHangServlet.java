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
import model.bean.SanPham;
import model.bo.GioHangBO;
import model.bo.HoaDonBanBO;
import model.bo.SanPhamBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungMuaHangServlet
 */
public class NguoiDungMuaHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NguoiDungMuaHangServlet() {
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
		HttpSession ss = request.getSession();
		ss.setAttribute("limit", ConnectDB.limit());

		String tennguoinhan = request.getParameter("tennguoinhan");
		String dienthoainguoinhan = request.getParameter("dienthoainguoinhan");
		String diachi = request.getParameter("diachi");
		int maTinhThanh = Integer.parseInt(request.getParameter("maTinhThanh"));

		// Xét nếu là khách vãng lai

		HoaDonBanBO hdbBo = new HoaDonBanBO();
		String maHD = "HD" + String.format("%05d", hdbBo.sinhma() + 1);
		String ngayban = java.time.LocalDate.now() + "";

		if (ss.getAttribute("Quyen") == null) {

			Cookie[] cookies = request.getCookies();
			if (request.getCookies() != null) {
				if ("JSESSIONID".equals(cookies[cookies.length - 1].getName())) {
					response.sendRedirect("KhachHangTrangChuServlet");
					return;
				} else {
					hdbBo.themHoaDonBanKhachVangLai(maHD, tennguoinhan, dienthoainguoinhan, maTinhThanh, diachi,
							ngayban);
					for (Cookie ck : request.getCookies()) {
						if ("JSESSIONID".equals(ck.getName())) {
						} else {
							// Code thêm csdl
							String maSanPham = ck.getName().split("#")[0];
							String maMau = ck.getName().split("#")[1];
							if ("Default".equals(maMau)) {
								maMau = "MS005";
							}
							String maDoTuoi = ck.getName().split("#")[2];

							int soLuong = Integer.parseInt(ck.getValue().split("#")[0]);
							int donGia = Integer.parseInt(ck.getValue().split("#")[1]);

							hdbBo.themChiTietHoaDonBan(maHD, maSanPham, maMau, maDoTuoi, soLuong, donGia);
						}
						ck.setMaxAge(0);
						response.addCookie(ck);
					}
				}
			} else {
			}
		}
		// Xét nếu có tài khoản
		else {
			String maTaiKhoan = (String) ss.getAttribute("MaTaiKhoan");
			GioHangBO ghBo = new GioHangBO();
			ArrayList<GioHang> listGioHang = ghBo.layDanhSachSanPhamTrongGioHang(maTaiKhoan);
			if (listGioHang.isEmpty()) {
				response.sendRedirect("KhachHangTrangChuServlet");
				return;
			} else {
				hdbBo.themHoaDonBanKhachTaiKhoan(maHD, maTaiKhoan, tennguoinhan, dienthoainguoinhan, maTinhThanh, diachi,
						ngayban);
				for (GioHang ghTK : listGioHang) {
					// Code thêm csdl
					String maSanPham = ghTK.getMaSanPham();
					String maMau = ghTK.getMaMau();
					if ("Default".equals(maMau)) {
						maMau = "MS005";
					}
					String maDoTuoi = ghTK.getMaDoTuoi();

					int soLuong = ghTK.getSoLuong();
					SanPhamBO spBo = new SanPhamBO();
					SanPham sp1 = spBo.layThongTinSanPhamTheoMa(ghTK.getMaSanPham());
					int donGia = sp1.getGiaMoi();

					hdbBo.themChiTietHoaDonBan(maHD, maSanPham, maMau, maDoTuoi, soLuong, donGia);
					ghBo.xoaGioHangTheoMa(ghTK.getMaGioHang());
				}
			}
		}
		request.setAttribute("maHD", maHD);
		RequestDispatcher rd = request.getRequestDispatcher("NguoiDungHoaDonNhapServlet");
		rd.forward(request, response);
	}

}
