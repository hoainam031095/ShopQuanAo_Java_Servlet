package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.DoTuoi;
import model.bean.Menu;
import model.bean.SanPham;
import model.bo.DoTuoiBO;
import model.bo.MenuBO;
import model.bo.SanPhamBO;
import model.dao.ConnectDB;

/**
 * Servlet implementation class NguoiDungLayDanhSachSanPhamTheoGiaServlet
 */
public class NguoiDungLayDanhSachSanPhamTheoGiaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungLayDanhSachSanPhamTheoGiaServlet() {
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
		
		String ajaxLimit = request.getParameter("ajaxLimit");
		String maMenu = request.getParameter("maLoc");
		String doTuoi = "";
		if(request.getParameter("doTuoi")=="") {
			DoTuoiBO doTuoiBo = new DoTuoiBO();
			ArrayList<DoTuoi> listNhomDoTuoi = doTuoiBo.layDanhSachDoTuoi();
			for(DoTuoi dt: listNhomDoTuoi) {
				doTuoi = doTuoi + " " + dt.getMaDoTuoi();
			}
		}
		else {
			doTuoi = request.getParameter("doTuoi");
		}
		int giaMin = Integer.parseInt(request.getParameter("giaMin"));
		int giaMax = Integer.parseInt(request.getParameter("giaMax"));
		
		SanPhamBO sanphambo = new SanPhamBO();
		ArrayList<SanPham> listSP = sanphambo.locDanhSachSanPhamTheogia(maMenu, doTuoi, giaMin, giaMax);
		String responseText = "";
		if(listSP.isEmpty())
			responseText = responseText + "<h4 style=\"text-align: center;font-size: 35px;color: darkgray;\">Không có sản phẩm nào</h4>";
		else
		for(SanPham sp: listSP) {
			responseText = responseText + "<div class=\"ty-column3 data-page\">\r\n" + 
					"    <div class=\"ty-grid-list__item ty-quick-view-button__wrapper\">\r\n" + 
					"        <form action=\"https://babi.vn/\" method=\"post\" name=\"product_form_399268\" class=\"cm-disable-empty-files cm-ajax cm-ajax-full-render cm-ajax-status-middle cm-processed-form\">\r\n" + 
					"            <div class=\"ty-grid-list__image\">\r\n" + 
					"                <a href=\"NguoiDungChonSanPhamServlet?msp="+sp.getMaSanPham()+"\">\r\n" + 
					"                   <span class=\"babi-icon babi-icon-2\"></span>\r\n" + 
					"                        <img class=\"ty-pict\" id=\"det_img_399268\" src=\"FoderUpLoad/Us_images/SanPham/"+ sp.getImages()+"\" width=\"315\" height=\"315\" alt=\""+ sp.getImages()+"\" title=\""+sp.getTenSanPham()+"\">\r\n" + 
					"                </a>\r\n" + 
					"            </div>\r\n" + 
					"            <h3 class=\"ty-grid-list__item-name\">\r\n" + 
					"                 <a href=\"NguoiDungChonSanPhamServlet?msp="+sp.getMaSanPham()+"\" class=\"product-title\" title=\""+sp.getTenSanPham()+"\">"+sp.getTenSanPham()+"\r\n" + 
					"                 </a>    \r\n" + 
					"            </h3>\r\n" + 
					"            <div class=\"ty-grid-list__price \">\r\n" + 
					"                <span class=\"cm-reload-399268\" id=\"old_price_update_399268\">\r\n" + 
					"                </span>\r\n" + 
					"                <span class=\"cm-reload-399268 ty-price-update\" id=\"price_update_399268\">\r\n" + 
					"                    <span class=\"ty-price\" id=\"line_discounted_price_399268\">\r\n" + 
					"                <span id=\"sec_discounted_price_399268\" class=\"ty-price-num\">"+sp.getGiaMoi()+".000 </span>\r\n" + 
					"                <span class=\"ty-price-num\">đ</span>\r\n" + 
					"                </span>\r\n" + 
					"                </span>\r\n" + 
					"            </div>\r\n" + 
					"            <div class=\"grid-list__rating\">\r\n" + 
					"            </div>\r\n" + 
					"            <div class=\"ty-grid-list__control\">\r\n" + 
					"            </div>\r\n" + 
					"        </form>\r\n" + 
					"    </div>\r\n" + 
					"</div>";
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		response.getWriter().write(responseText);
	}

}
