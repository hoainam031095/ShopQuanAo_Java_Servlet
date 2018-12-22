package model.bean;

public class ChiTietHoaDonBan {
	private String maHD;
	private String maTK;
	private String tenNguoiNhan;
	private String soDienThoai;
	private int maTinhThanh;
	private String diaChi;
	private String maSP;
	private String maMau;
	private String maDoTuoi;
	private int soLuong;
	private int donGia;
	private String ngayBan;
	private int trangThai;
	
	public ChiTietHoaDonBan() {
		super();
	}

	public ChiTietHoaDonBan(String maHD, String maTK, String tenNguoiNhan, String soDienThoai, int maTinhThanh,
			String diaChi, String maSP, String maMau, String maDoTuoi, int soLuong, int donGia, String ngayBan,
			int trangThai) {
		super();
		this.maHD = maHD;
		this.maTK = maTK;
		this.tenNguoiNhan = tenNguoiNhan;
		this.soDienThoai = soDienThoai;
		this.maTinhThanh = maTinhThanh;
		this.diaChi = diaChi;
		this.maSP = maSP;
		this.maMau = maMau;
		this.maDoTuoi = maDoTuoi;
		this.soLuong = soLuong;
		this.donGia = donGia;
		this.ngayBan = ngayBan;
		this.trangThai = trangThai;
	}
	
	public String getMaHD() {
		return maHD;
	}

	public void setMaHD(String maHD) {
		this.maHD = maHD;
	}

	public String getMaTK() {
		return maTK;
	}

	public void setMaTK(String maTK) {
		this.maTK = maTK;
	}

	public String getTenNguoiNhan() {
		return tenNguoiNhan;
	}

	public void setTenNguoiNhan(String tenNguoiNhan) {
		this.tenNguoiNhan = tenNguoiNhan;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public int getMaTinhThanh() {
		return maTinhThanh;
	}

	public void setMaTinhThanh(int maTinhThanh) {
		this.maTinhThanh = maTinhThanh;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getMaSP() {
		return maSP;
	}

	public void setMaSP(String maSP) {
		this.maSP = maSP;
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

	public String getNgayBan() {
		return ngayBan;
	}

	public void setNgayBan(String ngayBan) {
		this.ngayBan = ngayBan;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}

	@Override
	public String toString() {
		return "ChiTietHoaDonBan [maHD=" + maHD + ", maTK=" + maTK + ", tenNguoiNhan=" + tenNguoiNhan + ", soDienThoai="
				+ soDienThoai + ", maTinhThanh=" + maTinhThanh + ", diaChi=" + diaChi + ", maSP=" + maSP + ", maMau="
				+ maMau + ", maDoTuoi=" + maDoTuoi + ", soLuong=" + soLuong + ", donGia=" + donGia + ", ngayBan="
				+ ngayBan + ", trangThai=" + trangThai + "]";
	}
	
	
}
