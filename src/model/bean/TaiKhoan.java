package model.bean;

public class TaiKhoan {
	private String maTaikhoan;
	private String tenTaiKhoan;
	private String matKhau;
	private int quyen;
	private String hoTen;
	private String soDienThoai;
	private String diaChi;
	private String email;
	
	
	public TaiKhoan() {
		super();
	}


	public TaiKhoan(String maTaiKhoan, String tenTaiKhoan, String matKhau, int quyen, String hoTen, String soDienThoai, String diaChi,
			String email) {
		super();
		this.maTaikhoan = maTaiKhoan;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.quyen = quyen;
		this.hoTen = hoTen;
		this.soDienThoai = soDienThoai;
		this.diaChi = diaChi;
		this.email = email;
	}

	
	public String getMaTaikhoan() {
		return maTaikhoan;
	}


	public void setMaTaikhoan(String maTaikhoan) {
		this.maTaikhoan = maTaikhoan;
	}


	public String getTenTaiKhoan() {
		return tenTaiKhoan;
	}


	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}


	public String getMatKhau() {
		return matKhau;
	}


	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}


	public int getQuyen() {
		return quyen;
	}


	public void setQuyen(int quyen) {
		this.quyen = quyen;
	}


	public String getHoTen() {
		return hoTen;
	}


	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}


	public String getSoDienThoai() {
		return soDienThoai;
	}


	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}


	public String getDiaChi() {
		return diaChi;
	}


	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "TaiKhoan [maTaikhoan=" + maTaikhoan + ", tenTaiKhoan=" + tenTaiKhoan + ", matKhau=" + matKhau
				+ ", quyen=" + quyen + ", hoTen=" + hoTen + ", soDienThoai=" + soDienThoai + ", diaChi=" + diaChi
				+ ", email=" + email + "]";
	}
	
}
