package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Menu;
import model.bean.NhomSanPham;
import model.bo.MenuBO;
import model.bo.NhomSanPhamBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungLayDanhSachMenuParentServlet
 */
public class NguoiDungLayDanhSachMenuParentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungLayDanhSachMenuParentServlet() {
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
		
		String maMenu = request.getParameter("maMenu");
		NhomSanPhamBO nhomSPbo = new NhomSanPhamBO();
		ArrayList<NhomSanPham> listMenuParent = nhomSPbo.layDanhSachNhomSanPhamTheoMenu(maMenu);
		String responesText = "";
		if(listMenuParent.isEmpty() == false) {
			for(NhomSanPham mnp: listMenuParent) {
				responesText = responesText + "<li class=\"ty-menu__submenu-item\">\r\n" + 
						"<a class=\"ty-menu__submenu-link\" href=\"" + mnp.getLink() +"?maNSP="+ mnp.getMaNhomSP() +"\">"+ mnp.getTenNhomSP() + "</a>\r\n" + 
						"</li>";
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/plain");
			response.getWriter().write("<ul class=\"ty-menu__submenu-items ty-menu__submenu-items-simple cm-responsive-menu-submenu\">" + responesText + "</ul>");
		}
	}

}
