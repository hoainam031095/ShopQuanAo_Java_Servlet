package model.bean;

public class TinhThanhPho {
	private int ID;
	private String tenTinhThanh;
	
	
	public TinhThanhPho() {
		super();
	}


	public TinhThanhPho(int iD, String tenTinhThanh) {
		super();
		ID = iD;
		this.tenTinhThanh = tenTinhThanh;
	}
	

	public int getID() {
		return ID;
	}


	public void setID(int iD) {
		ID = iD;
	}


	public String getTenTinhThanh() {
		return tenTinhThanh;
	}


	public void setTenTinhThanh(String tenTinhThanh) {
		this.tenTinhThanh = tenTinhThanh;
	}


	@Override
	public String toString() {
		return "TinhThanhPho [ID=" + ID + ", tenTinhThanh=" + tenTinhThanh + "]";
	}
	
	
}
