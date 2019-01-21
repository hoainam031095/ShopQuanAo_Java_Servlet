package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.Menu;
import model.bean.NhomSanPham;
import model.bo.MenuBO;
import model.bo.NhomSanPhamBO;
import model.dao.UpLoadFileDAO;

/**
 * Servlet implementation class QuanTriThemNhomSanPhamServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 50, // 50MB
maxRequestSize = 1024 * 1024 * 50) // 50MB

public class QuanTriThemNhomSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanTriThemNhomSanPhamServlet() {
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
		request.setCharacterEncoding("UTF-8");
		HttpSession ss = request.getSession();
		if ((ss.getAttribute("Quyen") == null) || (ss.getAttribute("Quyen").equals("3"))) {
			response.sendRedirect("KhachHangTrangChuServlet");
			return;
		}
		NhomSanPhamBO bo = new NhomSanPhamBO();
if ("submit".equals(request.getParameter("subMit"))) {
			
			// TẢI ẢNH LÊN THƯ MỤC
			for (Part part : request.getParts()) {
				String fileName = UpLoadFileDAO.extractFileName(part);
//				System.out.println(fileName);
				// refines the fileName in case it is an absolute path
				fileName = new File(fileName).getName();
				String Path_FoderUpLoad = "D:/code/java(eclipse)/ShopQuanAo2/WebContent/FoderUpLoad/Us_images/" + "NhomSanPham";
				try {
					part.write(UpLoadFileDAO.getFolderUpload(Path_FoderUpLoad).getAbsolutePath() + File.separator + fileName);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			// ĐƯA DỮ LIỆU VÀO CSDL
				String maNhomSanPham = "NH" + String.format("%05d", bo.sinhma()+1);
				String tenNhomSanPham = request.getParameter("tenNhomSanPham");
				String chiTietNhomSanPham = request.getParameter("chiTietNhomSanPham");
				String nhomChinh = request.getParameter("nhomChinh");
				String order = request.getParameter("orDer");
				
				Part filePart = request.getPart("fileName"); // Retrieves <input type="file" name="fileName">
			    String fileName1 = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
			    
				bo.themNhomSanPhamBo(maNhomSanPham, tenNhomSanPham, chiTietNhomSanPham,order, fileName1, nhomChinh);
				
				ArrayList<NhomSanPham> listNSP = bo.layDanhSachNhomSanPham();
				request.setAttribute("thongbao", "Thêm thành công nhóm sản phẩm");
				request.setAttribute("listNSP", listNSP);
				RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachnhomsanpham.jsp");
				rd.forward(request, response);
		} else {
			MenuBO mnBo = new MenuBO();
			ArrayList<Menu> listMenu = mnBo.layDanhSachMenu();
			request.setAttribute("listMenu", listMenu);
			RequestDispatcher rd = request.getRequestDispatcher("Ad_themnhomsanpham.jsp");
			rd.forward(request, response);
		}
		
	}

}
