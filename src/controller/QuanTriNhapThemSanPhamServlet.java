package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.NhaCungCap;
import model.bean.SanPham;
import model.bo.ChiTietHoaDonNhapBO;
import model.bo.HoaDonNhapBO;
import model.bo.NhaCungCapBO;
import model.bo.SanPhamBO;

/**
 * Servlet implementation class QuanTriNhapThemSanPhamServlet
 */
public class QuanTriNhapThemSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanTriNhapThemSanPhamServlet() {
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
		request.setCharacterEncoding("UTF-8");
		HttpSession ss = request.getSession();
		if ((ss.getAttribute("Quyen") == null) || (ss.getAttribute("Quyen").equals("3"))) {
			response.sendRedirect("KhachHangTrangChuServlet");
			return;
		}

		SanPhamBO bo = new SanPhamBO();
		if ("submit".equals(request.getParameter("subMit"))) {
			
			// ĐƯA DỮ LIỆU VÀO CSDL
				String maSanPham = request.getParameter("maSanPham");
				String soLuong = request.getParameter("soLuong");
				String giaBan = request.getParameter("giaBan");
				
				//nhập thêm sản phẩmd
				if(Integer.parseInt(soLuong) > 0) {
				bo.nhapThemSanPhamBo(maSanPham, soLuong);
				
				//thêm vào hóa đơn nhập và chi tiết hóa đơn nhập
				HoaDonNhapBO hdnBo = new HoaDonNhapBO();
				String maHoaDonNhap = "HD" + String.format("%05d", hdnBo.sinhma()+1);
				String maTaiKhoan = (String)ss.getAttribute("MaTaiKhoan");
				System.out.println(maTaiKhoan);
				String maNhaCungCap = request.getParameter("nhaCungCap");
				String ngayNhap = java.time.LocalDate.now() + "";
				hdnBo.themHoaDonNhap(maHoaDonNhap,maTaiKhoan,maNhaCungCap, ngayNhap);
				
				ChiTietHoaDonNhapBO cthdnBo = new  ChiTietHoaDonNhapBO();
				cthdnBo.themChiTietHoaDonNhap(maHoaDonNhap, maSanPham, Integer.parseInt(soLuong), Integer.parseInt(soLuong) * Integer.parseInt(giaBan));
				}else {
					
				}
				ArrayList<SanPham> listSP = bo.layDanhSachSanPham();
				request.setAttribute("thongbao", "Nhập thành công hàng hóa");
				request.setAttribute("listSP", listSP);
				RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachsanpham.jsp");
				rd.forward(request, response);
		} else {
			SanPham sp = bo.layThongTinSanPhamTheoMa(request.getParameter("maSP"));
			request.setAttribute("sp", sp);
			
			NhaCungCapBO nccBo = new NhaCungCapBO();
			ArrayList<NhaCungCap> listNCC = nccBo.layDanhSachNhaCungCap();
			request.setAttribute("listNCC", listNCC);
			
			RequestDispatcher rd = request.getRequestDispatcher("Ad_nhapthemsanpham.jsp");
			rd.forward(request, response);
		}
	}

}
