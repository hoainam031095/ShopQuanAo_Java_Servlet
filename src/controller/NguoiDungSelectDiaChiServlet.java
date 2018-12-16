package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.PhuongXa;
import model.bean.QuanHuyen;
import model.bo.HuyenBO;
import model.bo.PhuongBO;

/**
 * Servlet implementation class NguoiDungSelectDiaChiServlet
 */
public class NguoiDungSelectDiaChiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungSelectDiaChiServlet() {
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
		String select = request.getParameter("select");
		if("selectTinh".equals(select)) {
			int maTinh = Integer.parseInt(request.getParameter("maTinh"));
			HuyenBO hBo = new HuyenBO();
			ArrayList<QuanHuyen> listQuanHuyen = hBo.layDanhSachHuyenTheoTinh(maTinh);
			String responseText = "<option value=\"\">-- Chọn Quận/Huyện --</option>";
			if(listQuanHuyen.isEmpty()) {
				
			}else {
				for(QuanHuyen qh: listQuanHuyen) {
					responseText = responseText + "<option value=\""+qh.getMaQuanHuyen()+"\">"+qh.getTenQuanHuyen()+"</option>";
				}
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write(responseText);
		}
		else {
			int maHuyen = Integer.parseInt(request.getParameter("maHuyen"));
			PhuongBO hBo = new PhuongBO();
			ArrayList<PhuongXa> listPhuongXa = hBo.layDanhSachPhuongXaTheoHuyen(maHuyen);
			String responseText = "<option value=\"\">-- Chọn Phường/Xã --</option>";
			if(listPhuongXa.isEmpty()) {
				
			}else {
				for(PhuongXa px: listPhuongXa) {
					responseText = responseText + "<option value=\""+px.getMaPhuongXa()+"\">"+px.getTenPhuongXa()+"</option>";
				}
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write(responseText);
		}
	}

}
