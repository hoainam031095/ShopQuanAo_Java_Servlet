<%@page import="model.bean.DoTuoi"%>
<%@page import="model.bo.DoTuoiBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "Us_header.jsp"%>
<!-- start content -->
                <style type="text/css">
                	.tygh-content .ty-mainbox-body .gio-hang .danh-sach-gio-hang{
                		border: 1px solid #f5d9ea;
                	}
                	.tygh-content .ty-mainbox-body .gio-hang .danh-sach-gio-hang td, th{
                		border: 1px solid #f5d9ea;
                		padding-top: 5px;
                	}
                </style>
                <div class="tygh-content clearfix">
                    <div class="container-fluid  content-grid">
                        <div class="row-fluid ">                
                            <div class="span16 breadcrumbs-grid">
                                <div id="breadcrumbs_10">
                                    <div class="ty-breadcrumbs clearfix">
                                        <a href="https://babi.vn/" class="ty-breadcrumbs__a">Trang chủ</a>
                                        <span class="ty-breadcrumbs__slash">/</span><span class="ty-breadcrumbs__current">Thông tin giỏ hàng</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid ">               
                                    <h1 class="ty-mainbox-title">Thông tin giỏ hàng</h1><button class="btn btn-dathang">Đặt hàng</button>
                                    <div class="ty-mainbox-body"><!-- Inline script moved to the bottom of the page -->
                                        <div class="gio-hang">
                                            <form name="profiles_register_form" class="cm-processed-form">
                                            	<style type="text/css">
                                            		.field{
													  width:25%;
													  margin:0 auto;
													}
													.field input{
													  width:55px;
													  text-align: center;
													}
													.field button{
													  width:55px;
													  height: 30px;
													}
													.btn-dathang{
								                		position: fixed;
													    right: 2px;
													    top: 93px;
													    padding: 18px;
													    border: none;
													    background-color: #cd3591;
													    color: #fff;
													    border-radius: 50%;
								                	}
								                	.btn-dathang:hover {
								                		background: #bd0b77;
								                	}
                                            	</style>
                                                <table class="danh-sach-gio-hang" style="text-align: center; width: 100%;">
                                                	<thead style="color: #fff; background-color: #cd3591;">
                                                		<tr style="height: 35px;">
	                                                        <th style="text-align: center;">STT</th>
	                                                        <th class="col-md-4" style="text-align: center;">Sản phẩm</th>
	                                                        <th class="col-md-2" style="text-align: center;">Loại Màu</th>
	                                                        <th class="col-md-2" style="text-align: center;">Độ tuổi</th>
	                                                        <th class="col-md-2" style="text-align: center;">Số lượng</th>
	                                                        <th class="col-md-2" style="text-align: center;">Đơn giá</th>
                                                    	</tr>
                                                	</thead>
                                                    <tbody>
                                                    <%
														if(ss.getAttribute("Quyen") == null)
														{
															int k = 1;
															for (Cookie ck : request.getCookies()) {
																if("JSESSIONID".equals(ck.getName())){
																	continue;
																}else{
																	
																	String maSanPham = ck.getName().split("#")[0];
																	String maMau = ck.getName().split("#")[1];
																	String maDoTuoi = ck.getName().split("#")[2];
																	
																	String soLuong = ck.getValue().split("#")[0];
																	String donGia = ck.getValue().split("#")[1];
																	
																	SanPhamBO spBo = new SanPhamBO();
																	SanPham sp1 = spBo.layThongTinSanPhamTheoMa(maSanPham);
																	String maxSoLuong = Integer.parseInt(sp1.getSoLuong()+"") - Integer.parseInt(soLuong) +"";
																	MauSacBO msBo = new MauSacBO();
																	MauSac ms = msBo.layImageSanPhamTheoMauSac(maSanPham, maMau);
																	
																	String tenMauSac = ms.getTenMauSac();
																	if(tenMauSac == null || "".equals(tenMauSac)){
																		tenMauSac = "Default";
																	}
																	String imagesMau = ms.getImages();
																	if(imagesMau == null || "".equals(imagesMau)){
																		imagesMau = sp1.getImages();
																	}
																	DoTuoiBO doTuoiBo = new DoTuoiBO();
																	DoTuoi dt = doTuoiBo.layThongTinDoTuoiTheoMaDoTuoi(maDoTuoi);
																	
													%>
	                                                    <tr>
	                                                        <td><%=k%></td>
	                                                        <td>
	                                                        	<div><img src="FoderUpLoad/Us_images/SanPham/<%=imagesMau%>" style="width: 130px; height: 150px !important;"></div>
	                                                        	<p><%=sp1.getTenSanPham()%></p>
	                                                        </td>
	                                                        <td><%=tenMauSac%></td>
	                                                        <td><%=dt.getTuoi()%><br><br><%=dt.getChieuCao()%><br><br><%=dt.getTrongLuong()%></td>
	                                                        <td>
	                                                        	<div class="field">
																    <button type="button" id="sub" class="sub">-</button>
																    <input type="number" class="value-giohang" value="<%=soLuong%>" min="1" max="<%=maxSoLuong%>" />
																    <button type="button" id="add" class="add">+</button>
																</div>
	                                                        </td>
	                                                        <td><%=donGia%>.000 đ</td>
	                                                    </tr>
	                                                    <%
																}
																k++;
															}
													}else{
														int k = 1;
														for (GioHang gh2 : (ArrayList<GioHang>)ss.getAttribute("listGioHang")) {
															SanPhamBO spBo = new SanPhamBO();
															SanPham sp1 = spBo.layThongTinSanPhamTheoMa(gh2.getMaSanPham());
															MauSacBO msBo = new MauSacBO();
															MauSac ms = msBo.layImageSanPhamTheoMauSac(gh2.getMaSanPham(), gh2.getMaMau());
															String tenMauSac = ms.getTenMauSac();
															if(tenMauSac == null || "".equals(tenMauSac)){
																tenMauSac = "Default";
															}
															String imagesMau = ms.getImages();
															if(imagesMau == null || "".equals(imagesMau)){
																imagesMau = sp1.getImages();
															}
															DoTuoiBO doTuoiBo = new DoTuoiBO();
															DoTuoi dt = doTuoiBo.layThongTinDoTuoiTheoMaDoTuoi(gh2.getMaDoTuoi());
															int maxSoLuong = sp1.getSoLuong() - gh2.getSoLuong();
													%>
														<tr>
	                                                        <td><%=k%></td>
	                                                        <td>
	                                                        	<div><img src="FoderUpLoad/Us_images/SanPham/<%=imagesMau%>" style="width: 130px; height: 150px !important;"></div>
	                                                        	<p><%=sp1.getTenSanPham()%></p>
	                                                        </td>
	                                                        <td><%=tenMauSac%></td>
	                                                        <td><%=dt.getTuoi()%><br><br><%=dt.getChieuCao()%><br><br><%=dt.getTrongLuong()%></td>
	                                                        <td>
	                                                        	<div class="field">
																    <button type="button" id="sub" class="sub">-</button>
																    <input type="number" class="value-giohang" value="<%=gh2.getSoLuong()%>" min="1" max="<%=maxSoLuong%>" />
																    <button type="button" id="add" class="add">+</button>
																</div>
	                                                        </td>
	                                                        <td><%=sp1.getGiaMoi()%>.000 đ</td>
	                                                    </tr>
													<%
														k++;
														}
                                                    }
	                                                    %>
                                                    </tbody>
                                                </table>
                                                <script type="text/javascript">
	                                                $(document).ready(function(){
	                                                	$('.add').click(function () {
	                                                		if ($(this).prev().val() < parseInt($(this).parent().children('.value-giohang').attr("max"))) {
	                                                    	$(this).prev().val(+$(this).prev().val() + 1);
	                                                		}
		                                                });
		                                                $('.sub').click(function () {
		                                                		if ($(this).next().val() > 1) {
		                                                    	if ($(this).next().val() > 1) $(this).next().val(+$(this).next().val() - 1);
		                                                		}
		                                                });
	                                            	});
                                                </script>
                                            </form>
                                            
                                        </div>
                                    </div>
                        </div>
                    </div>
                </div>

<%@include file="Us_footer.jsp"%>