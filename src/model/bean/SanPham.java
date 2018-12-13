package model.bean;

public class SanPham {
	private String maSanPham;
	private String tenSanPham;
	private String chiTietSanPham;
	private int gia;
	private int giaMoi;
	private String images;
	private int soLuong;
	private int Order;
	private int Status;
	private String maNhomSanPham;
	private String dotuoi;
	
	
	
	public SanPham() {
		super();
	}

	public SanPham(String maSanPham, String tenSanPham, String chiTietSanPham, int gia, int giaMoi, String images,
			int soLuong, int order, int status, String maNhomSanPham, String dotuoi) {
		super();
		this.maSanPham = maSanPham;
		this.tenSanPham = tenSanPham;
		this.chiTietSanPham = chiTietSanPham;
		this.gia = gia;
		this.giaMoi = giaMoi;
		this.images = images;
		this.soLuong = soLuong;
		this.Order = order;
		this.Status = status;
		this.maNhomSanPham = maNhomSanPham;
		this.dotuoi = dotuoi;
	}

	public String getMaSanPham() {
		return maSanPham;
	}

	public void setMaSanPham(String maSanPham) {
		this.maSanPham = maSanPham;
	}

	public String getTenSanPham() {
		return tenSanPham;
	}

	public void setTenSanPham(String tenSanPham) {
		this.tenSanPham = tenSanPham;
	}

	public String getChiTietSanPham() {
		return chiTietSanPham;
	}

	public void setChiTietSanPham(String chiTietSanPham) {
		this.chiTietSanPham = chiTietSanPham;
	}

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	public int getGiaMoi() {
		return giaMoi;
	}

	public void setGiaMoi(int giaMoi) {
		this.giaMoi = giaMoi;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public int getOrder() {
		return Order;
	}

	public void setOrder(int order) {
		Order = order;
	}

	public int getStatus() {
		return Status;
	}

	public void setStatus(int status) {
		Status = status;
	}

	public String getMaNhomSanPham() {
		return maNhomSanPham;
	}

	public void setMaNhomSanPham(String maNhomSanPham) {
		this.maNhomSanPham = maNhomSanPham;
	}

	public String getDotuoi() {
		return dotuoi;
	}

	public void setDotuoi(String dotuoi) {
		this.dotuoi = dotuoi;
	}

	@Override
	public String toString() {
		return "SanPham [maSanPham=" + maSanPham + ", tenSanPham=" + tenSanPham + ", chiTietSanPham=" + chiTietSanPham
				+ ", gia=" + gia + ", giaMoi=" + giaMoi + ", images=" + images + ", soLuong=" + soLuong + ", Order="
				+ Order + ", Status=" + Status + ", maNhomSanPham=" + maNhomSanPham + ", dotuoi=" + dotuoi + "]";
	}
	
}
