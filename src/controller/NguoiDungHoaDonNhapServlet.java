package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.ChiTietHoaDonBan;
import model.bo.HoaDonBanBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungHoaDonNhapServlet
 */
public class NguoiDungHoaDonNhapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungHoaDonNhapServlet() {
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
		
		if(ss.getAttribute("Quyen") == null) {
			String maHD = (String)request.getAttribute("maHD");
			request.setAttribute("maHD", maHD);
		}else {
			String maTK = (String)ss.getAttribute("MaTaiKhoan");
			HoaDonBanBO hdbBo = new HoaDonBanBO();
			ArrayList<String> listMaHdbBo = hdbBo.layDanhSachMaHoaDonMuaTheoMaTaiKhoan(maTK);
			request.setAttribute("listMaHdbBo", listMaHdbBo);
		}
		RequestDispatcher rd = request.getRequestDispatcher("Us_hoadonmuahang.jsp");
		rd.forward(request, response);
	}

}
