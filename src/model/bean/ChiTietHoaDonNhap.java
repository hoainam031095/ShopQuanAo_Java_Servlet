package model.bean;

public class ChiTietHoaDonNhap {
	private String maHoaDon;
	private String maSanPham;
	private String tenSanPham;
	private String maTaiKhoan;
	private String tenTaiKhoan;
	private String maNhaCungCap;
	private String tenNhaCungCap;
	private String ngayNhap;
	private int soLuong;
	private int donGia;
	
	
	public ChiTietHoaDonNhap() {
		super();
	}


	public ChiTietHoaDonNhap(String maHoaDon, String maSanPham, String tenSanPham, String maTaiKhoan,
			String tenTaiKhoan, String maNhaCungCap, String tenNhaCungCap, String ngayNhap, int soLuong,
			int donGia) {
		super();
		this.maHoaDon = maHoaDon;
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		this.maTaiKhoan = maTaiKhoan;
		this.tenTaiKhoan = tenTaiKhoan;
		this.maNhaCungCap = maNhaCungCap;
		this.tenNhaCungCap = tenNhaCungCap;
		this.ngayNhap = ngayNhap;
		this.soLuong = soLuong;
		this.donGia = donGia;
	}


	public String getMaHoaDon() {
		return maHoaDon;
	}


	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}


	public String getMaSanPham() {
		return maSanPham;
	}


	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}


	public String getTenSanPham() {
		return tenSanPham;
	}


	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}


	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}


	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}


	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}


	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}


	public String getMaNhaCungCap() {
		return maNhaCungCap;
	}


	public void setMaNhaCungCap(String maNhaCungCap) {
		this.maNhaCungCap = maNhaCungCap;
	}


	public String getTenNhaCungCap() {
		return tenNhaCungCap;
	}


	public void setTenNhaCungCap(String tenNhaCungCap) {
		this.tenNhaCungCap = tenNhaCungCap;
	}


	public String getNgayNhap() {
		return ngayNhap;
	}


	public void setNgayNhap(String ngayNhap) {
		this.ngayNhap = ngayNhap;
	}


	public int getSoLuong() {
		return soLuong;
	}


	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}


	public int getDonGia() {
		return donGia;
	}


	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}


	@Override
	public String toString() {
		return "ChiTietHoaDonNhap [maHoaDon=" + maHoaDon + ", maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham
				+ ", maTaiKhoan=" + maTaiKhoan + ", tenTaiKhoan=" + tenTaiKhoan + ", maNhaCungCap=" + maNhaCungCap
				+ ", tenNhaCungCap=" + tenNhaCungCap + ", ngayNhap=" + ngayNhap + ", soLuong=" + soLuong + ", donGia="
				+ donGia + "]";
	}
	
	
}
