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

import com.sun.java.swing.plaf.windows.resources.windows;

import model.dao.UpLoadFileDAO;
import model.bean.DoTuoi;
import model.bean.NhomSanPham;
import model.bean.SanPham;
import model.bo.DoTuoiBO;
import model.bo.NhomSanPhamBO;
import model.bo.SanPhamBO;

/**
 * Servlet implementation class QuanTriThemSanPhamservlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB

public class QuanTriThemSanPhamservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QuanTriThemSanPhamservlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession ss = request.getSession();
		if ((ss.getAttribute("Quyen") == null) || (ss.getAttribute("Quyen").equals("3"))) {
			response.sendRedirect("KhachHangTrangChuServlet");
			return;
		}

		SanPhamBO bo = new SanPhamBO();
		if ("submit".equals(request.getParameter("subMit"))) {
			
			// TẢI ẢNH LÊN THƯ MỤC
			for (Part part : request.getParts()) {
				String fileName = UpLoadFileDAO.extractFileName(part);
//				System.out.println(fileName);
				// refines the fileName in case it is an absolute path
				fileName = new File(fileName).getName();
				String Path_FoderUpLoad = "D:/code/java(eclipse)/ShopQuanAo2/WebContent/FoderUpLoad/Us_images/" + "SanPham";
				try {
					part.write(UpLoadFileDAO.getFolderUpload(Path_FoderUpLoad).getAbsolutePath() + File.separator + fileName);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			// ĐƯA DỮ LIỆU VÀO CSDL
				String maSanPham = "SP" + String.format("%05d", bo.sinhma()+1);
				String tenSanPham = request.getParameter("tenSanPham");
				String chiTietSanPham = request.getParameter("chiTietSanPham");
				String giaBan = request.getParameter("giaBan");
				String order = request.getParameter("orDer");
				String nhomSanPham = request.getParameter("nhomSanPham");
				String nhomDoTuoi = "";
				if("".equals(request.getParameter("nhomDoTuoi")))
				{
					DoTuoiBO doTuoiBo = new DoTuoiBO();
					ArrayList<DoTuoi> listNhomDoTuoi = doTuoiBo.layDanhSachDoTuoi();
					for(DoTuoi dt: listNhomDoTuoi) {
						nhomDoTuoi = nhomDoTuoi + " " + dt.getMaDoTuoi();
					}
				}
				else
					nhomDoTuoi = request.getParameter("nhomDoTuoi");
				
				Part filePart = request.getPart("fileName"); // Retrieves <input type="file" name="fileName">
			    String fileName1 = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
				bo.themSanPhamBo(maSanPham, tenSanPham, chiTietSanPham, giaBan, order, nhomSanPham, fileName1);
				
				DoTuoiBO dtBo = new DoTuoiBO();
				dtBo.themLienKetGiuaSanPhamVaSize(maSanPham, nhomDoTuoi.trim());
				
				ArrayList<SanPham> listSP = bo.layDanhSachSanPham();
				request.setAttribute("thongbao", "Thêm thành công sản phẩm");
				request.setAttribute("listSP", listSP);
				RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachsanpham.jsp");
				rd.forward(request, response);
		} else {
			NhomSanPhamBO nSPbo = new NhomSanPhamBO();
			ArrayList<NhomSanPham> listNSP = nSPbo.layDanhSachNhomSanPham();
			request.setAttribute("listNSP", listNSP);
			DoTuoiBO doTuoi = new DoTuoiBO();
			ArrayList<DoTuoi> listDoTuoi = doTuoi.layDanhSachDoTuoi();
			request.setAttribute("listDoTuoi", listDoTuoi);
			RequestDispatcher rd = request.getRequestDispatcher("Ad_themsanpham.jsp");
			rd.forward(request, response);
		}

	}

}
