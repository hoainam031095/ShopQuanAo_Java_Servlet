<%@page import="model.bean.DoTuoi"%>
<%@page import="model.bo.DoTuoiBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="Us_header.jsp"%>

<link type="text/css" rel="stylesheet" href="Us_css/vietthem/xacnhanmuahang.css">
<!-- start content -->

<div class="tygh-content clearfix">
	<div class="container-fluid  content-grid">
		<div class="row-fluid ">
			<div class="span16 breadcrumbs-grid">
				<div id="breadcrumbs_10">
					<div class="ty-breadcrumbs clearfix">
						<a href="https://babi.vn/" class="ty-breadcrumbs__a">Trang chủ</a>
						<span class="ty-breadcrumbs__slash">/</span><span
							class="ty-breadcrumbs__current">Xác nhận đặt hàng</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid ">
			<div class="main-content-grid">
				<div class="ty-mainbox-container clearfix">
					<div class="">
						<div class="thongtin-giaohang">
							<% String tennguoinhan = (String)request.getAttribute("tennguoinhan");
							String dienthoainguoinhan = (String)request.getAttribute("dienthoainguoinhan");
							String diachi = (String)request.getAttribute("diachi");
							String maTinhThanh = (String) request.getAttribute("maTinhThanh");%>
							
							<table>
								<tr>
									<td class="muc">Tên người nhận:</td>
									<td class="tt"><%=tennguoinhan %></td>
								</tr>
								<tr>
									<td class="muc">Số điện thoại:</td>
									<td class="tt"><%=dienthoainguoinhan %></td>
								</tr>
								<tr>
									<td class="muc">Địa chỉ:</td>
									<td class="tt"><%=diachi %></td>
								</tr>

							</table>
						</div>
						<div class="thongtin-sanpham">
							<table>
								<thead>
									<tr>
										<th class="col-md-5">Sản phẩm</th>
										<th class="col-md-2">Số lượng</th>
										<th class="col-md-2">Đơn giá</th>
										<th class="col-md-2">Thành tiền</th>
									</tr>
								</thead>
								<tbody>
												<%
													int tongtien = 0;
														if(ss.getAttribute("Quyen") == null)
														{
															
															for (Cookie ck : request.getCookies()) {
																if("JSESSIONID".equals(ck.getName())){
																	continue;
																}else{
																	
																	String maSanPham = ck.getName().split("#")[0];
																	String maMau = ck.getName().split("#")[1];
																	String maDoTuoi = ck.getName().split("#")[2];
																	
																	String soLuong = ck.getValue().split("#")[0];
																	String donGia = ck.getValue().split("#")[1];
																	int tien = Integer.parseInt(soLuong) * Integer.parseInt(donGia);
																	tongtien = tongtien + tien;
																	
																	SanPhamBO spBo = new SanPhamBO();
																	SanPham sp1 = spBo.layThongTinSanPhamTheoMa(maSanPham);
																	String maxSoLuong = Integer.parseInt(sp1.getSoLuong()+"") - Integer.parseInt(soLuong) +"";
																	MauSacBO msBo = new MauSacBO();
																	MauSac ms = msBo.layImageSanPhamTheoMauSac(maSanPham, maMau);
																	
																	String tenMauSac = ms.getTenMauSac();
																	if(tenMauSac == null || "".equals(tenMauSac)){
																		tenMauSac = "Default";
																	}
																	
																	DoTuoiBO doTuoiBo = new DoTuoiBO();
																	DoTuoi dt = doTuoiBo.layThongTinDoTuoiTheoMaDoTuoi(maDoTuoi);
																	
													%>
	                                                    <tr>
															<td>
																<div class="thong-tin-san-pham">
																	<%=sp1.getTenSanPham()%><br>
																	<%=sp1.getMaSanPham()%><br>
																	Chọn kích cỡ: <%=dt.getChieuCao()%> và <%=dt.getTrongLuong()%><br>
																	Chọn màu: <%=tenMauSac%>;
																</div>
															</td>
															<td><%=soLuong%></td>
															<td><%=donGia%>.000 đ</td>
															<td><%=tien%>.000 đ</td>
														</tr>
	                                                    <%
																}
															}
													}else{
														for (GioHang gh2 : (ArrayList<GioHang>)ss.getAttribute("listGioHang")) {
															SanPhamBO spBo = new SanPhamBO();
															SanPham sp1 = spBo.layThongTinSanPhamTheoMa(gh2.getMaSanPham());
															MauSacBO msBo = new MauSacBO();
															MauSac ms = msBo.layImageSanPhamTheoMauSac(gh2.getMaSanPham(), gh2.getMaMau());
															String tenMauSac = ms.getTenMauSac();
															if(tenMauSac == null || "".equals(tenMauSac)){
																tenMauSac = "Default";
															}
															
															DoTuoiBO doTuoiBo = new DoTuoiBO();
															DoTuoi dt = doTuoiBo.layThongTinDoTuoiTheoMaDoTuoi(gh2.getMaDoTuoi());
															int maxSoLuong = sp1.getSoLuong() - gh2.getSoLuong();
															tongtien = tongtien + (sp1.getGiaMoi() * gh2.getSoLuong());
													%>
	                                                    <tr>
															<td>
																<div class="thong-tin-san-pham">
																	<%=sp1.getTenSanPham()%><br>
																	Mã SP: <%=sp1.getMaSanPham()%><br>
																	Chọn kích cỡ: <%=dt.getChieuCao()%> và <%=dt.getTrongLuong()%><br>
																	Chọn màu: <%=tenMauSac%>;
																</div>
															</td>
															<td><%=gh2.getSoLuong()%></td>
															<td><%=sp1.getGiaMoi()%>.000 đ</td>
															<td><%=sp1.getGiaMoi() * gh2.getSoLuong()%>.000 đ</td>
															
														</tr>
													<%
														}
                                                    }
	                                                    %>
								</tbody>
							</table>
						</div>
					</div>
					<div class="thanhtoan">
						<table>
							<tr>
								<td class="muc">Hình thức thanh toán:</td>
								<td>Thanh toán khi nhận hàng</td>
							</tr>
							<tr>
								<td class="muc">Phương pháp vận chuyển:</td>
								<td>Giao hàng tận nơi</td>
							</tr>
							<tr>
								<td class="muc">Thành tiền:</td>
								<td ><%=tongtien%>.000 đ</td>
							</tr>
							<tr>
								<td class="muc">Phí vận chuyển:</td>
								<td >30.000 đ</td>
							</tr>
							<tr>
								<td class="muc">Tổng cộng:</td>
								<td class="tt"><%=tongtien + 30%>.000 đ</td>
							</tr>

						</table>
					</div>
					<form action="NguoiDungMuaHangServlet">
						<input type="hidden" value="<%=tennguoinhan%>" name="tennguoinhan">
						<input type="hidden" value="<%=dienthoainguoinhan%>" name="dienthoainguoinhan">
						<input type="hidden" value="<%=diachi%>" name="diachi">
						<input type="hidden" value="<%=maTinhThanh%>" name="maTinhThanh">
						
						<button type="submit" class="btn ty-btn ty-xacnhan">Xác nhận</button>
						<button  onclick="event.preventDefault(); location.href='NguoiDungChiTietGioHangServlet'" class="btn ty-btn ty-btn__primary">Hủy</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

<%@include file="Us_footer.jsp"%>