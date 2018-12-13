package model.bean;

public class KhachHang {
	private String maKhachHang;
	private String tenKhachHang;
	private String diaChi;
	private String soDienThoai;
	private String email;
	
	public KhachHang() {
		super();
	}

	public KhachHang(String maKhachHang, String tenKhachHang, String diaChi, String soDienThoai, String email) {
		super();
		this.maKhachHang = maKhachHang;
		this.tenKhachHang = tenKhachHang;
		this.diaChi = diaChi;
		this.soDienThoai = soDienThoai;
		this.email = email;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public String getTenKhachHang() {
		return tenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "KhachHang [maKhachHang=" + maKhachHang + ", tenKhachHang=" + tenKhachHang + ", diaChi=" + diaChi
				+ ", soDienThoai=" + soDienThoai + ", email=" + email + "]";
	}
	
	
}
