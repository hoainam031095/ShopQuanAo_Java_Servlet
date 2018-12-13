package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DoTuoi;
import model.bean.GioHang;
import model.bean.MauSac;
import model.bean.Menu;
import model.bean.NhomSanPham;
import model.bean.SanPham;
import model.bo.DoTuoiBO;
import model.bo.GioHangBO;
import model.bo.MauSacBO;
import model.bo.MenuBO;
import model.bo.NhomSanPhamBO;
import model.bo.SanPhamBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungChonSanPhamServlet
 */
public class NguoiDungChonSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungChonSanPhamServlet() {
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
		
		String maSP = request.getParameter("msp");
		SanPhamBO sanPhamBo = new SanPhamBO();
		NhomSanPhamBO nhomSanPhamBo = new NhomSanPhamBO();
		MenuBO menuBo = new MenuBO();
		DoTuoiBO doTuoiBo = new DoTuoiBO();
		MauSacBO mauSacBo = new MauSacBO();
		GioHangBO gioHangBo = new GioHangBO();
		
		SanPham sanpham = sanPhamBo.layThongTinSanPhamTheoMa(maSP);
		request.setAttribute("sanPham", sanpham);
		
		ArrayList<DoTuoi> listDoTuoi = doTuoiBo.layDanhSachDoTuoiTheoMa(sanpham.getMaSanPham());
		request.setAttribute("listDoTuoi", listDoTuoi);
		
		ArrayList<MauSac> listMauSac = mauSacBo.layDanhSachMauSacTheoMaSP(sanpham.getMaSanPham());
		request.setAttribute("listMauSac", listMauSac);
		
		NhomSanPham nsp = nhomSanPhamBo.layThongTinNhomSP(sanpham.getMaNhomSanPham());
		request.setAttribute("nhomSanPham", nsp);
		Menu menu = menuBo.layThongTinMenuTheoMa(nsp.getMaMainMenu());
		request.setAttribute("maMenu", menu);
		
		ArrayList<SanPham> listSPtheoNhom = sanPhamBo.layDanhSachSanPhamTheoNhomSP(nsp.getMaNhomSP());
		request.setAttribute("listSPtheoNhom", listSPtheoNhom);
		
		int soLuongSanPhamTrongGioHang = gioHangBo.laySoLuongSanPhamTrongGioHangSanPhamTrongGioHangTheoMaSanPham(maSP);
		request.setAttribute("soLuongGH", soLuongSanPhamTrongGioHang);
		
		RequestDispatcher rd = request.getRequestDispatcher("Us_chonhangdethemvaogiohang.jsp");
		rd.forward(request, response);
	}

}
