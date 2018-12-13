package model.bean;

public class GioHang {
	private String maGioHang;
	private String maTaiKhoan;
	private String maSanPham;
	private String maMau;
	private String maDoTuoi;
	private int soLuong;
	private int donGia;
	
	public GioHang() {
		super();
	}

	public GioHang(String maGioHang, String maTaiKhoan, String maSanPham, String maMau, String maDoTuoi, int selectedSoLuong, int selectedDonGia) {
		super();
		this.maGioHang = maGioHang;
		this.maTaiKhoan = maTaiKhoan;
		this.maSanPham = maSanPham;
		this.maMau = maMau;
		this.maDoTuoi = maDoTuoi;
		this.soLuong = selectedSoLuong;
		this.donGia = selectedDonGia;
	}

	public String getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getMaMau() {
		return maMau;
	}

	public void setMaMau(String maMau) {
		this.maMau = maMau;
	}

	public String getMaDoTuoi() {
		return maDoTuoi;
	}

	public void setMaDoTuoi(String maDoTuoi) {
		this.maDoTuoi = maDoTuoi;
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

	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}

	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}
	
	public String getMaGioHang() {
		return maGioHang;
	}

	public void setMaGioHang(String maGioHang) {
		this.maGioHang = maGioHang;
	}

	@Override
	public String toString() {
		return "GioHang [maGioHang=" + maGioHang + ", maTaiKhoan=" + maTaiKhoan + ", maSanPham=" + maSanPham
				+ ", maMau=" + maMau + ", maDoTuoi=" + maDoTuoi + ", soLuong=" + soLuong + ", donGia=" + donGia + "]";
	}

}
