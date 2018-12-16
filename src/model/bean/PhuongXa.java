package model.bean;

public class PhuongXa {
	private int maPhuongXa;
	private String tenPhuongXa;
	private int maQuanHuyen;
	
	public PhuongXa() {
		super();
	}

	public PhuongXa(int maPhuongXa, String tenPhuongXa, int maQuanHuyen) {
		super();
		this.maPhuongXa = maPhuongXa;
		this.tenPhuongXa = tenPhuongXa;
		this.maQuanHuyen = maQuanHuyen;
	}

	public int getMaPhuongXa() {
		return maPhuongXa;
	}

	public void setMaPhuongXa(int maPhuongXa) {
		this.maPhuongXa = maPhuongXa;
	}

	public String getTenPhuongXa() {
		return tenPhuongXa;
	}

	public void setTenPhuongXa(String tenPhuongXa) {
		this.tenPhuongXa = tenPhuongXa;
	}

	public int getMaQuanHuyen() {
		return maQuanHuyen;
	}

	public void setMaQuanHuyen(int maQuanHuyen) {
		this.maQuanHuyen = maQuanHuyen;
	}

	@Override
	public String toString() {
		return "PhuongXa [maPhuongXa=" + maPhuongXa + ", tenPhuongXa=" + tenPhuongXa + ", maQuanHuyen=" + maQuanHuyen
				+ "]";
	}
	
	
}
