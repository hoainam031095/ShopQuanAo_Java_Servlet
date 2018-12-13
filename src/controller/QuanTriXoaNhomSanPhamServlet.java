package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.NhomSanPham;
import model.bo.NhomSanPhamBO;

/**
 * Servlet implementation class QuanTriXoaNhomSanPhamServlet
 */
public class QuanTriXoaNhomSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanTriXoaNhomSanPhamServlet() {
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
		if ((ss.getAttribute("Quyen") == null) || (ss.getAttribute("Quyen").equals("3"))) {
			response.sendRedirect("KhachHangTrangChuServlet");
			return;
		}
		
		String maNhomSP = request.getParameter("maNhomSP");
		NhomSanPhamBO bo = new NhomSanPhamBO();
		bo.xoaNhomSanPhamTheoMa(maNhomSP);
		
		ArrayList<NhomSanPham> listNSP = bo.layDanhSachNhomSanPham();
		request.setAttribute("thongbao", "Xóa thành công nhóm sản phẩm");
		request.setAttribute("listNSP", listNSP);
		RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachnhomsanpham.jsp");
		rd.forward(request, response);
	}

}
