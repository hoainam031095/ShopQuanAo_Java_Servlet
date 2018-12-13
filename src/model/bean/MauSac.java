package model.bean;

public class MauSac {
	private String idMauSac;
	private String tenMauSac;
	private String images;
	
	public MauSac() {
		super();
	}

	public MauSac(String idMauSac, String tenMauSac, String images) {
		super();
		this.idMauSac = idMauSac;
		this.tenMauSac = tenMauSac;
		this.images = images;
	}

	public String getIdMauSac() {
		return idMauSac;
	}

	public void setIdMauSac(String idMauSac) {
		this.idMauSac = idMauSac;
	}

	public String getTenMauSac() {
		return tenMauSac;
	}

	public void setTenMauSac(String tenMauSac) {
		this.tenMauSac = tenMauSac;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	@Override
	public String toString() {
		return "MauSac [idMauSac=" + idMauSac + ", tenMauSac=" + tenMauSac + ", images=" + images + "]";
	}

}
