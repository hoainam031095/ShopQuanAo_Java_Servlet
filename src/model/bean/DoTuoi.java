package model.bean;

public class DoTuoi {
	private String maDoTuoi;
	private String tuoi;
	private String chieuCao;
	private String trongLuong;
	private String Size;
	
	public DoTuoi() {
		super();
	}

	public DoTuoi(String maDoTuoi, String tuoi, String chieuCao, String trongLuong, String Size) {
		super();
		this.maDoTuoi = maDoTuoi;
		this.tuoi = tuoi;
		this.chieuCao = chieuCao;
		this.trongLuong = trongLuong;
		this.Size = Size;
	}

	public String getMaDoTuoi() {
		return maDoTuoi;
	}

	public void setMaDoTuoi(String maDoTuoi) {
		this.maDoTuoi = maDoTuoi;
	}

	public String getTuoi() {
		return tuoi;
	}

	public void setTuoi(String tuoi) {
		this.tuoi = tuoi;
	}

	public String getChieuCao() {
		return chieuCao;
	}

	public void setChieuCao(String chieuCao) {
		this.chieuCao = chieuCao;
	}

	public String getTrongLuong() {
		return trongLuong;
	}

	public void setTrongLuong(String trongLuong) {
		this.trongLuong = trongLuong;
	}

	public String getSize() {
		return Size;
	}

	public void setSize(String size) {
		Size = size;
	}

	@Override
	public String toString() {
		return "DoTuoi [maDoTuoi=" + maDoTuoi + ", tuoi=" + tuoi + ", chieuCao=" + chieuCao + ", trongLuong="
				+ trongLuong + ", Size=" + Size + "]";
	}
	
}
