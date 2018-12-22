package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.HuyenBO;
import model.bo.PhuongBO;
import model.bo.TinhBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungXacNhanMuaHangServlet
 */
public class NguoiDungXacNhanMuaHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungXacNhanMuaHangServlet() {
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
		
		String tennguoinhan = request.getParameter("tennguoinhan");
		String dienthoainguoinhan = request.getParameter("dienthoainguoinhan");
		int maTinhThanh = Integer.parseInt(request.getParameter("tinhthanhpho"));
		int maQuanHuyen = Integer.parseInt(request.getParameter("quanhuyen"));
		int maPhuongXa = Integer.parseInt(request.getParameter("phuongxa"));
		
		TinhBO tBo = new TinhBO();
		String tinhthanhpho = tBo.layThongTinTinhTheoMa(maTinhThanh).getTenTinhThanh();
		
		HuyenBO hBo = new HuyenBO();
		String quanhuyen = hBo.layThongTinHuyenTheoMa(maQuanHuyen).getTenQuanHuyen();
		
		PhuongBO pBo = new PhuongBO();
		String phuongxa = pBo.layThongTinXaTheoMa(maPhuongXa).getTenPhuongXa();
		
		String diachicuthe = request.getParameter("diachicuthe");
		String diachi =  diachicuthe + ", " + phuongxa + ", " + quanhuyen + ", " + tinhthanhpho; 
		
		request.setAttribute("tennguoinhan", tennguoinhan);
		request.setAttribute("dienthoainguoinhan", dienthoainguoinhan +"");
		request.setAttribute("diachi", diachi + "");
		request.setAttribute("maTinhThanh", maTinhThanh +"");
		
		RequestDispatcher rd = request.getRequestDispatcher("Us_xacnhanmuahang.jsp");
		rd.forward(request, response);
	}

}
