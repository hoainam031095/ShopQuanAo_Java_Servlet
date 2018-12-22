<%@page import="model.bean.DoTuoi"%>
<%@page import="model.bo.DoTuoiBO"%>
<%@page import="model.bean.ChiTietHoaDonBan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="Us_header.jsp"%>
<link type="text/css" rel="stylesheet"
	href="Us_css/vietthem/xacnhanmuahang.css">
<!-- start content -->
<div class="tygh-content clearfix">
	<div class="container-fluid  content-grid">
		<div class="row-fluid ">
			<div class="span16 breadcrumbs-grid">
				<div id="breadcrumbs_10">
					<div class="ty-breadcrumbs clearfix">
						<a href="https://babi.vn/" class="ty-breadcrumbs__a">Trang chủ</a>
						<span class="ty-breadcrumbs__slash">/</span><span
							class="ty-breadcrumbs__current">Chi tiết hóa đơn mua hàng</span>
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid ">
			<div class="main-content-grid">
				<div class="ty-mainbox-container clearfix">
					<%
						ArrayList<ChiTietHoaDonBan> listCTHDban = (ArrayList<ChiTietHoaDonBan>) request.getAttribute("listCTHDban");
						ChiTietHoaDonBan CTHDban1 = listCTHDban.get(0);
					%>
					<div class="">
						<div class="thongtin-giaohang">
							<table>
								<tr>
									<td class="muc">Tên người nhận:</td>
									<td class="tt"><%=CTHDban1.getTenNguoiNhan()%></td>
								</tr>
								<tr>
									<td class="muc">Số điện thoại:</td>
									<td class="tt"><%=CTHDban1.getSoDienThoai()%></td>
								</tr>
								<tr>
									<td class="muc">Địa chỉ:</td>
									<td class="tt"><%=CTHDban1.getDiaChi()%></td>
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
										SanPhamBO spBo = new SanPhamBO();
										MauSacBO msBo = new MauSacBO();
										DoTuoiBO doTuoiBo = new DoTuoiBO();
										int tongtien = 0;
										for (ChiTietHoaDonBan CTHDban : listCTHDban) {
											SanPham sp = spBo.layThongTinSanPhamTheoMa(CTHDban.getMaSP());

											MauSac ms = msBo.layImageSanPhamTheoMauSac(CTHDban.getMaSP(), CTHDban.getMaMau());

											String tenMauSac = ms.getTenMauSac();
											if (tenMauSac == null || "".equals(tenMauSac)) {
												tenMauSac = "Default";
											}
											DoTuoi dt = doTuoiBo.layThongTinDoTuoiTheoMaDoTuoi(CTHDban.getMaDoTuoi());
											tongtien = tongtien + CTHDban.getSoLuong() * CTHDban.getDonGia();
									%>
									<tr>
										<td>
											<div class="thong-tin-san-pham">
												<%=sp.getTenSanPham()%><br>
												<%=sp.getMaSanPham()%><br> Chọn kích cỡ:
												<%=dt.getChieuCao()%>
												và
												<%=dt.getTrongLuong()%><br> Chọn màu:
												<%=tenMauSac%>;
											</div>
										</td>
										<td><%=CTHDban.getSoLuong()%></td>
										<td><%=sp.getGiaMoi()%>.000 đ</td>
										<td><%=CTHDban.getSoLuong() * CTHDban.getDonGia()%>.000 đ</td>
									</tr>
									<%
										}
									%>
									<tr>
										<td style="font-size: 20px;font-style: italic;font-weight: 600;">
											Tổng tiền + phí vận chuyển:
										</td>
										<td></td>
										<td></td>
										<td style="font-size: 20px;font-style: italic;font-weight: 600;">
											<%=tongtien + 30%>.000 đ
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="Us_footer.jsp"%>