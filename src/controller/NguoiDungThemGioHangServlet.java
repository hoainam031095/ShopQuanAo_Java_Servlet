package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Common.StringProcess;
import model.bean.DoTuoi;
import model.bean.GioHang;
import model.bean.MauSac;
import model.bean.SanPham;
import model.bo.DoTuoiBO;
import model.bo.GioHangBO;
import model.bo.MauSacBO;
import model.bo.SanPhamBO;

/**
 * Servlet implementation class NguoiDungThemGioHangServlet
 */
public class NguoiDungThemGioHangServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NguoiDungThemGioHangServlet() {
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
		
//		Lấy giá trị từ Ajax request
		String selectedMaSanPham = request.getParameter("selectedMaSanPham");
		String selectedMaMau = null;
		if(request.getParameter("selectedMaMau")=="")
			selectedMaMau = "Default";
		else
			selectedMaMau = request.getParameter("selectedMaMau");
		
		SanPhamBO spBo = new SanPhamBO();
		SanPham sp1 = spBo.layThongTinSanPhamTheoMa(selectedMaSanPham);
		MauSacBO msBo = new MauSacBO();
		MauSac ms = msBo.layImageSanPhamTheoMauSac(selectedMaSanPham, selectedMaMau);
		
		DoTuoiBO dtBo = new DoTuoiBO();
		String selectedMaDoTuoi = request.getParameter("selectedMaDoTuoi");
		DoTuoi dt = dtBo.layThongTinDoTuoiTheoMaDoTuoi(selectedMaDoTuoi);
		
		int selectedSoLuong = Integer.parseInt(request.getParameter("selectedSoLuong"));
		int selectedDonGia = Integer.parseInt(request.getParameter("selectedDonGia"));
//		System.out.println(selectedMaSanPham+","+selectedMaMau+","+selectedMaDoTuoi+","+selectedSoLuong+","+selectedDonGia);
		
		GioHang gh = new GioHang("GH0000X", (String)ss.getAttribute("MaTaiKhoan"), selectedMaSanPham, selectedMaMau, selectedMaDoTuoi, selectedSoLuong, selectedDonGia);
		
		//Lấy ảnh sản, tên màu sắc phẩm đang mua
		String imageName = null;
		String tenMauSac = null;
		if("Default".equals(selectedMaMau)) {
			imageName = sp1.getImages();
			tenMauSac = "Default";
		}
		else {
			imageName = ms.getImages();
			tenMauSac = ms.getTenMauSac();
		}

		int tongSoLuongGioHang = 0, tienTrongGioHang = 0;
		
		//Xét nếu là khách vãng lai thì giỏ hàng lưu vào cookie
		if(ss.getAttribute("Quyen")==null) {
			if (request.getCookies() != null) {
				for(Cookie ck: request.getCookies()) {
					if("JSESSIONID".equals(ck.getName())){
					}
					else {
						tongSoLuongGioHang = tongSoLuongGioHang + Integer.parseInt(ck.getValue().split("#")[0]);
						tienTrongGioHang = tienTrongGioHang + (Integer.parseInt(ck.getValue().split("#")[0]) * Integer.parseInt(ck.getValue().split("#")[1]));
					}
					if((gh.getMaSanPham()+"#"+gh.getMaMau()+"#"+gh.getMaDoTuoi()).equals(ck.getName())) {
						
						int newSoLuong = Integer.parseInt(ck.getValue().split("#")[0]) + gh.getSoLuong();
						ck.setValue(newSoLuong +"#"+ gh.getDonGia());
						ck.setMaxAge(-1);
						response.addCookie(ck);
						break;
					}
					else {
						Cookie cookie = new Cookie(gh.getMaSanPham()+"#"+gh.getMaMau()+"#"+gh.getMaDoTuoi(), gh.getSoLuong()+"#"+ gh.getDonGia());
						cookie.setMaxAge(-1);
						response.addCookie(cookie);
					}
				}
			}
			else {
				Cookie cookie = new Cookie(gh.getMaSanPham()+"#"+gh.getMaMau()+"#"+gh.getMaDoTuoi(), gh.getSoLuong()+"#"+ gh.getDonGia());
				cookie.setMaxAge(-1);
				response.addCookie(cookie);
			}
			tongSoLuongGioHang = tongSoLuongGioHang + selectedSoLuong;
			tienTrongGioHang = tienTrongGioHang + (selectedSoLuong*selectedDonGia);
		}
		//Xét nếu có tài khoản thì lưu vào csdl
		else {
			String maTaiKhoan = (String)ss.getAttribute("MaTaiKhoan");
			GioHangBO ghBo= new GioHangBO();
			ArrayList<GioHang> listGioHang = ghBo.layDanhSachSanPhamTrongGioHang(maTaiKhoan);
			if(listGioHang.isEmpty()) {
				String maGioHang = "GH" + String.format("%05d", ghBo.sinhma()+1);
				ghBo.themSanPhamVaoGioHang(maGioHang, gh.getMaTaiKhoan(), gh.getMaSanPham(), gh.getMaMau(), gh.getMaDoTuoi(), gh.getSoLuong());
			}
			else {
				Boolean kt = false;
				int soLuongDaCoTrongGioHang = 0;
				for(GioHang ghTK: listGioHang) {
					SanPham sp = spBo.layThongTinSanPhamTheoMa(ghTK.getMaSanPham());
					tongSoLuongGioHang = tongSoLuongGioHang + ghTK.getSoLuong();
					tienTrongGioHang = tienTrongGioHang + (ghTK.getSoLuong()*sp.getGiaMoi());
					if(selectedMaSanPham.equals(ghTK.getMaSanPham()) && selectedMaMau.equals(ghTK.getMaMau())&& selectedMaDoTuoi.equals(ghTK.getMaDoTuoi()))
					{
						kt = true;
						soLuongDaCoTrongGioHang = ghTK.getSoLuong();
						break;
					}
				}
				if(kt == false) {
					String maGioHang = "GH" + String.format("%05d", ghBo.sinhma()+1);
					ghBo.themSanPhamVaoGioHang(maGioHang, gh.getMaTaiKhoan(), gh.getMaSanPham(), gh.getMaMau(), gh.getMaDoTuoi(), gh.getSoLuong());
				}
				else {
					ghBo.updateSoLuongSanPhamTrongGioHang(gh.getMaTaiKhoan(), gh.getMaSanPham(), gh.getMaMau(), gh.getMaDoTuoi(), gh.getSoLuong() + soLuongDaCoTrongGioHang);
				}
			}
			tongSoLuongGioHang = tongSoLuongGioHang + selectedSoLuong;
			tienTrongGioHang = tienTrongGioHang + (selectedSoLuong*selectedDonGia);
		}
		
		//Xuất thông báo sản phẩm đã mua
		String responseText = "<div class=\"ty-product-notification__item clearfix\">\r\n" + 
				"    <span class=\"hidden icon-83\"></span><span class=\"babi-icon babi-icon-2\"></span><img class=\"ty-pict  ty-product-notification__image  \" src=\"FoderUpLoad/Us_images/SanPham/"+imageName+"\" width=\"60\" height=\"60\">\r\n" + 
				"    <div class=\"ty-product-notification__content clearfix\">\r\n" + 
				"        <a href=\"#\" class=\"ty-product-notification__product-name\">"+sp1.getTenSanPham()+"_"+selectedMaMau+"_"+selectedMaDoTuoi+"</a>\r\n" + 
				"        <div class=\"ty-product-notification__price\" style=\"color:red; font-size:15px;\">\r\n" + 
				"            <span class=\"none\">"+selectedSoLuong+"</span>&nbsp;x&nbsp;<span id=\"sec_price_604966631\" class=\"none\">"+selectedDonGia+".000</span>&nbsp;<span class=\"none\">đ</span>\r\n" + 
				"        </div>\r\n" + 
				"        <div class=\"clearfix\"></div>\r\n" + 
				"        Size: "+StringProcess.getVaildString(dt.getChieuCao())+"; "+StringProcess.getVaildString(dt.getTrongLuong())+"<br>\r\n" + 
				"        Color: "+StringProcess.getVaildString(tenMauSac)+"<br>\r\n" +
				"    </div>\r\n" + 
				"</div>\r\n" + 
				"<div class=\"clearfix\"></div>\r\n" + 
				"<hr class=\"ty-product-notification__divider\">\r\n" + 
				"<div class=\"ty-product-notification__total-info clearfix\">\r\n" + 
				"    <div class=\"ty-product-notification__amount ty-float-left\"> Bạn có "+tongSoLuongGioHang+" sản phẩm trong giỏ hàng</div>\r\n" + 
				"    <div class=\"ty-product-notification__subtotal ty-float-right\">\r\n" + 
				"        Tổng giỏ hàng <span>"+tienTrongGioHang+".000</span>&nbsp;đ\r\n" + 
				"    </div>\r\n" + 
				"</div>";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/plain");
		response.getWriter().write(responseText);
	}

}
