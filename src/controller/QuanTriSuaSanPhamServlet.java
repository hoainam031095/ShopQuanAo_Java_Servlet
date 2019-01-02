package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import model.bean.DoTuoi;
import model.bean.NhaCungCap;
import model.bean.NhomSanPham;
import model.bean.SanPham;
import model.bo.ChiTietHoaDonNhapBO;
import model.bo.DoTuoiBO;
import model.bo.HoaDonNhapBO;
import model.bo.NhaCungCapBO;
import model.bo.NhomSanPhamBO;
import model.bo.SanPhamBO;
import model.dao.UpLoadFileDAO;

/**
 * Servlet implementation class QuanTriSuaSanPhamServlet
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 50, // 50MB
		maxRequestSize = 1024 * 1024 * 50) // 50MB

public class QuanTriSuaSanPhamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuanTriSuaSanPhamServlet() {
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
		SanPhamBO bo = new SanPhamBO();
		if ("submit".equals(request.getParameter("subMit"))) {
			
			// TẢI ẢNH LÊN THƯ MỤC
			for (Part part : request.getParts()) {
				String fileName = UpLoadFileDAO.extractFileName(part);
				// refines the fileName in case it is an absolute path
				fileName = new File(fileName).getName();
				String Path_FoderUpLoad = "D:/code/java(eclipse)/ShopQuanAo2/WebContent/FoderUpLoad/Us_images/" + "SanPham";
				try {
					part.write(UpLoadFileDAO.getFolderUpload(Path_FoderUpLoad).getAbsolutePath() + File.separator + fileName);
				}catch (Exception e) {
					e.printStackTrace();
				}
			}
			// UPLOAD DỮ LIỆU VÀO CSDL
				String maSanPham = request.getParameter("maSanPham");
				String tenSanPham = request.getParameter("tenSanPham");
				String chiTietSanPham = request.getParameter("chiTietSanPham");
				String giaCu = request.getParameter("giaCu");
				String giaBanCu = request.getParameter("giaBanCu");
				String giaBan = request.getParameter("giaBan");
				String giaCuUpDate="";
				if(giaBanCu.trim().equals(giaBan.trim()))
				{
					giaCuUpDate = giaCu;
				}
				else
				{
					giaCuUpDate = giaBanCu;
				}
				String order = request.getParameter("orDer");
				String nhomSanPham = request.getParameter("nhomSanPham");
				String nhomDoTuoi = "";
				
				//xây dựng nhóm độ tuổi phù hợp
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
				System.out.println(nhomDoTuoi);
				//thêm sản phẩm mới
				Part filePart = request.getPart("fileName"); // Retrieves <input type="file" name="fileName">
			    String fileName1 = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
			    String fileName2 = "";
			    if("".equals(fileName1)) {
			    	fileName2 = request.getParameter("fileNameCu");
			    }else
			    	fileName2 = fileName1;
				bo.updateSanPhamBo(maSanPham, tenSanPham, chiTietSanPham,giaCuUpDate, giaBan, order, nhomSanPham, fileName2);
				
				//Update liên kết vào bảng sản phẩm độ tuổi
				DoTuoiBO dtBo = new DoTuoiBO();
				dtBo.xoaLienKetGiuaSanPhamVaSizeCu(maSanPham);
				dtBo.themLienKetGiuaSanPhamVaSize(maSanPham, nhomDoTuoi.trim());
				
				ArrayList<SanPham> listSP = bo.layDanhSachSanPham();
				request.setAttribute("thongbao", "Sửa thành công sản phẩm");
				request.setAttribute("listSP", listSP);
				RequestDispatcher rd = request.getRequestDispatcher("Ad_danhsachsanpham.jsp");
				rd.forward(request, response);
		} else {
			String maSanPham = request.getParameter("maSP");
			
			SanPhamBO spBo = new SanPhamBO();
			SanPham sp = spBo.layThongTinSanPhamTheoMa(maSanPham);
			request.setAttribute("sp", sp);
			
			NhomSanPhamBO nSPbo = new NhomSanPhamBO();
			ArrayList<NhomSanPham> listNSP = nSPbo.layDanhSachNhomSanPham();
			request.setAttribute("listNSP", listNSP);
			
			NhaCungCapBO nccBo = new NhaCungCapBO();
			ArrayList<NhaCungCap> listNCC = nccBo.layDanhSachNhaCungCap();
			request.setAttribute("listNCC", listNCC);
			
			DoTuoiBO doTuoi = new DoTuoiBO();
			ArrayList<DoTuoi> listDoTuoi = doTuoi.layDanhSachDoTuoi();
			request.setAttribute("listDoTuoi", listDoTuoi);
			ArrayList<DoTuoi> listDoTuoiTheoMa = doTuoi.layDanhSachDoTuoiTheoMa(maSanPham);
			request.setAttribute("listDoTuoiTheoMa", listDoTuoiTheoMa);
			
			RequestDispatcher rd = request.getRequestDispatcher("Ad_suasanpham.jsp");
			rd.forward(request, response);
		}
	}

}
