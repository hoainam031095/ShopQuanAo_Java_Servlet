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
import model.bo.ChiTietHoaDonBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungChiTietHoaDonBanServlet
 */
public class NguoiDungChiTietHoaDonBanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungChiTietHoaDonBanServlet() {
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
		
		String maHD = request.getParameter("maHD");
		ChiTietHoaDonBO cthdBo = new ChiTietHoaDonBO();
		ArrayList<ChiTietHoaDonBan> listCTHDban = cthdBo.layThongTinHoaDonBanTheoMa(maHD);
		
		request.setAttribute("listCTHDban", listCTHDban);
		RequestDispatcher rd = request.getRequestDispatcher("Us_chitiethoadonmuahang.jsp");
		rd.forward(request, response);
	}

}
