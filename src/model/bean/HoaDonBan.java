package model.bean;

public class HoaDonBan {
	private String maHD;
	private String maTK;
	private String tenNguoiNhan;
	private String soDienThoai;
	private int maTinhThanh;
	private String diaChi;
	private String ngayBan;
	private int trangThai;
	
	
	public HoaDonBan() {
		super();
	}


	public HoaDonBan(String maHD, String maTK, String tenNguoiNhan, String soDienThoai, int maTinhThanh, String diaChi,
			String ngayBan, int trangThai) {
		super();
		this.maHD = maHD;
		this.maTK = maTK;
		this.tenNguoiNhan = tenNguoiNhan;
		this.soDienThoai = soDienThoai;
		this.maTinhThanh = maTinhThanh;
		this.diaChi = diaChi;
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
		return "HoaDonBan [maHD=" + maHD + ", maTK=" + maTK + ", tenNguoiNhan=" + tenNguoiNhan + ", soDienThoai="
				+ soDienThoai + ", maTinhThanh=" + maTinhThanh + ", diaChi=" + diaChi + ", ngayBan=" + ngayBan
				+ ", trangThai=" + trangThai + "]";
	}
	
	
	
}
