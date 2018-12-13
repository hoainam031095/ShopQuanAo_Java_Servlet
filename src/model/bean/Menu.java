package model.bean;

public class Menu {
	private String maMenu;
	private String tenMenu;
	private String linkMenu;
	private String order;
	private String content;
	
	public Menu() {
		super();
	}
	
	public Menu(String maMenu, String tenMenu, String linkMenu, String order, String content) {
		super();
		this.maMenu = maMenu;
		this.tenMenu = tenMenu;
		this.linkMenu = linkMenu;
		this.order = order;
		this.content = content;
	}

	public String getMaMenu() {
		return maMenu;
	}

	public void setMaMenu(String maMenu) {
		this.maMenu = maMenu;
	}

	public String getTenMenu() {
		return tenMenu;
	}

	public void setTenMenu(String tenMenu) {
		this.tenMenu = tenMenu;
	}

	public String getLinkMenu() {
		return linkMenu;
	}

	public void setLinkMenu(String linkMenu) {
		this.linkMenu = linkMenu;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Menu [maMenu=" + maMenu + ", tenMenu=" + tenMenu + ", linkMenu=" + linkMenu + ", order=" + order
				+ ", content=" + content + "]";
	}

	
}
