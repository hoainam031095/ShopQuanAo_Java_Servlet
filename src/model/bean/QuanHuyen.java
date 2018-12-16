package model.bean;

public class QuanHuyen {
	private int maQuanHuyen;
	private String tenQuanHuyen;
	private int maTinhThanh;
	
	
	public QuanHuyen() {
		super();
	}


	public QuanHuyen(int maQuanHuyen, String tenQuanHuyen, int maTinhThanh) {
		super();
		this.maQuanHuyen = maQuanHuyen;
		this.tenQuanHuyen = tenQuanHuyen;
		this.maTinhThanh = maTinhThanh;
	}


	public int getMaQuanHuyen() {
		return maQuanHuyen;
	}


	public void setMaQuanHuyen(int maQuanHuyen) {
		this.maQuanHuyen = maQuanHuyen;
	}


	public String getTenQuanHuyen() {
		return tenQuanHuyen;
	}


	public void setTenQuanHuyen(String tenQuanHuyen) {
		this.tenQuanHuyen = tenQuanHuyen;
	}


	public int getMaTinhThanh() {
		return maTinhThanh;
	}


	public void setMaTinhThanh(int maTinhThanh) {
		this.maTinhThanh = maTinhThanh;
	}


	@Override
	public String toString() {
		return "QuanHuyen [maQuanHuyen=" + maQuanHuyen + ", tenQuanHuyen=" + tenQuanHuyen + ", maTinhThanh="
				+ maTinhThanh + "]";
	}
	
	
}
