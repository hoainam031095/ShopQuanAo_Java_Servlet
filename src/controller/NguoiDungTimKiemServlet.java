package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Common.ChuyenTiengVietThanhKhongDau;
import model.bean.SanPham;
import model.bo.SanPhamBO;

/**
 * Servlet implementation class NguoiDungTimKiemServlet
 */
public class NguoiDungTimKiemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungTimKiemServlet() {
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
		String keyWord = request.getParameter("keyWord");
		keyWord = ChuyenTiengVietThanhKhongDau.covertStringToURL(keyWord);
		
		SanPhamBO sanphambo = new SanPhamBO();
		ArrayList<SanPham> listSP = sanphambo.layDanhSachSanPhamTheoKeyWordSearch(keyWord);
		String responseText ="<div class=\"container-fluid  content-grid\">\r\n" + 
				"                    <div class=\"row-fluid \">\r\n" + 
				"                        <div class=\"span16 breadcrumbs-grid\">\r\n" + 
				"                            <div id=\"breadcrumbs_10\">\r\n" + 
				"                                <div class=\"ty-breadcrumbs clearfix\">\r\n" + 
				"                                    <a href=\"https://babi.vn/\" class=\"ty-breadcrumbs__a\">Tìm kiếm</a>\r\n" + 
				"                                    <span class=\"ty-breadcrumbs__slash\">/</span>\r\n" + 
				"                                    <span class=\"ty-breadcrumbs__current\">Danh sách kết quả</span>\r\n" + 
				"                                </div>\r\n" + 
				"                                <!--breadcrumbs_10-->\r\n" + 
				"                            </div>\r\n" + 
				"                        </div>\r\n" + 
				"                    </div>\r\n" + 
				"                    <div class=\"row-fluid \">\r\n" + 
				"                        <div class=\"span16 main-content-grid\">\r\n" + 
				"                            <!-- Inline script moved to the bottom of the page -->\r\n" + 
				"                            <!-- Inline script moved to the bottom of the page -->\r\n" + 
				"                            <div class=\"grid-list\" id=\"example2\">";
		if(listSP.isEmpty()) {
			responseText = responseText + "<h4 style=\"text-align: center; font-size:30px;padding-top:35px;color:#978888;\"> Không có sản phẩm nào được tìm thấy</h4>"+
					"                            </div>\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>\r\n" + 
					"                </div>";
		}
		else {
			for(SanPham sp:listSP) {
				responseText = responseText + "<div class=\"ty-column4 data-page\">\r\n";
            	int giam = ((sp.getGia() - sp.getGiaMoi()) * 100) / sp.getGia();
            	if(giam >=1){
                	responseText = responseText + "<div class=\"giam-gia\">\r\n" + 
                			"                        <img alt=\"\" src=\"FoderUpLoad/Us_images/hot.png\">\r\n" + 
                			"                        <span>-"+ giam +"%</span>\r\n" + 
                			"                    </div>";
                } 
            	responseText = responseText +
						"                                    <div class=\"ty-grid-list__item ty-quick-view-button__wrapper\">\r\n" + 
						"                                        <form action=\"#\" method=\"post\" name=\"product_form_22000399268\" class=\"cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form\">\r\n" + 
						"                                            <div class=\"ty-grid-list__image\">\r\n" + 
						"                                                <a href=\"NguoiDungChonSanPhamServlet?msp="+sp.getMaSanPham()+"\">\r\n" + 
						"                                                        <span class=\"hidden icon-83\"></span>\r\n" + 
						"                                                        <span class=\"babi-icon babi-icon-2\"></span>\r\n" + 
						"                                                        <img class=\"ty-pict\" src=\"FoderUpLoad/Us_images/SanPham/"+sp.getImages()+"\" width=\"315\" height=\"315\" alt=\""+ sp.getImages() +"\" title=\""+ sp.getTenSanPham()+"\">\r\n" + 
						"                                                    </a>\r\n" + 
						"                                            </div>\r\n" + 
						"                                            <h3 class=\"ty-grid-list__item-name\">\r\n" + 
						"                                                    <a href=\"NguoiDungChonSanPhamServlet?msp="+sp.getMaSanPham()+"\" class=\"product-title\" title=\""+ sp.getTenSanPham()+"\">"+ sp.getTenSanPham()+"</a>\r\n" + 
						"                                                </h3>\r\n" + 
						"                                            <div class=\"ty-grid-list__price \">\r\n" + 
						"                                                <span class=\"cm-reload-22000399268\" id=\"old_price_update_22000399268\"></span>\r\n" + 
						"                                                <span class=\"cm-reload-22000399268 ty-price-update\" id=\"price_update_22000399268\">\r\n";
            	if(giam >=1){
                	responseText = responseText + "<span style=\"color:#afa998a8;\"><del>"+ sp.getGia()+".000&nbsp;đ</del></span>&nbsp;";
                } 
            	responseText = responseText + 
						"                                                    <span class=\"ty-price\" id=\"line_discounted_price_22000399268\"><span id=\"sec_discounted_price_22000399268\" class=\"ty-price-num\">"+ sp.getGiaMoi()+".000 </span>\r\n" + 
						"                                                <span class=\"ty-price-num\">đ</span></span>\r\n" + 
						"                                                <!--price_update_22000399268--></span>\r\n" + 
						"                                            </div>\r\n" + 
						"                                            <div class=\"grid-list__rating\">\r\n" + 
						"                                            </div>\r\n" + 
						"                                            <div class=\"ty-grid-list__control\"></div>\r\n" + 
						"                                        </form>\r\n" + 
						"                                    </div>\r\n" + 
						"                                </div>";
			}
			responseText = responseText + "<!-- phân trang -->\r\n" + 
					"                                    <div class=\"paging-container\" id=\"tablePaging\"></div>\r\n" + 
					"                                <!--pagination_contents-->\r\n" + 
					"                            </div>\r\n" + 
					"                        </div>\r\n" + 
					"                    </div>\r\n" + 
					"                </div>";
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		response.getWriter().write(responseText);
	}

}
