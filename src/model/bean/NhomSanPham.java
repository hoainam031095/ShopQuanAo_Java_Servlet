package model.bean;

public class NhomSanPham {
	private String maNhomSP;
	private String tenNhomSP;
	private String content;
	private String images;
	private int order;
	private int status;
	private String link;
	private String maMainMenu;

	public NhomSanPham() {
		super();
	}

	public NhomSanPham(String maNhomSP, String tenNhomSP, String content, String images, int order, int status, String link, String maMainMenu) {
		super();
		this.maNhomSP = maNhomSP;
		this.tenNhomSP = tenNhomSP;
		this.content = content;
		this.images = images;
		this.order = order;
		this.status = status;
		this.link = link;
		this.maMainMenu = maMainMenu;
	}

	public String getMaNhomSP() {
		return maNhomSP;
	}

	public void setMaNhomSP(String maNhomSP) {
		this.maNhomSP = maNhomSP;
	}

	public String getTenNhomSP() {
		return tenNhomSP;
	}

	public void setTenNhomSP(String tenNhomSP) {
		this.tenNhomSP = tenNhomSP;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public int getOrder() {
		return order;
	}

	public void setOrder(int order) {
		this.order = order;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
	

	public String getMaMainMenu() {
		return maMainMenu;
	}

	public void setMaMainMenu(String maMainMenu) {
		this.maMainMenu = maMainMenu;
	}

	@Override
	public String toString() {
		return "NhomSanPham [maNhomSP=" + maNhomSP + ", tenNhomSP=" + tenNhomSP + ", content=" + content + ", images="
				+ images + ", order=" + order + ", status=" + status + ", link=" + link + ", maMainMenu=" + maMainMenu
				+ "]";
	}
	
}
