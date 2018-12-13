<%@page import="model.bean.GioHang"%>
<%@page import="model.bean.MauSac"%>
<%@page import="model.bo.MauSacBO"%>
<%@page import="model.bean.SanPham"%>
<%@page import="model.bo.SanPhamBO"%>
<%@page import="model.bean.Menu"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quần Áo Trẻ Em DolaKids.vn 2018 - Thời Trang Cho Bé Xinh,
	Đẹp Mỗi Ngày</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=1">

<link rel="shortcut icon" type="image/png"href="FoderUpLoad/Us_images/power1.png">
<link rel="stylesheet" type="text/css" href="Us_font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="Us_js/bxslider/jquery.bxslider.css">
<link type="text/css" rel="stylesheet" href="Us_css/trangchu.css">
<link type="text/css" rel="stylesheet" href="Us_css/vietthem/trangchu2.css">
<link type="text/css" rel="stylesheet" href="Us_css/vietthem/muahang.css">
<link type="text/css" rel="stylesheet" href="Us_css/vietthem/quanaobetrai.css">

<script type="text/javascript" src="Us_css/boostrap/bootstrap-3.1.1-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="Us_js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="Us_js/jquery.min.js"></script>
<script type="text/javascript" src="Us_js/pagination.js"></script>
<script type="text/javascript" src="Us_js/bxslider/jquery.bxslider.min.js"></script>


<body id="index" class="index">
	<% HttpSession ss = request.getSession();
		if(ss.getAttribute("limit")==null){response.sendRedirect("DangXuatServlet");return;}
		if((Boolean)ss.getAttribute("limit")==false){response.sendRedirect("LimitServlet");return;}
	%>
	<script type="text/javascript">
		sessionStorage.setItem('ssStQuyen', <%=ss.getAttribute("Quyen")%>);
	</script>
	<div class="ty-tygh" id="tygh_container">
		<div class="ty-helper-container no-touch" id="tygh_main_container">
			<!-- start thanh tieu de -->
			<div class="tygh-top-panel clearfix">
				<div class="container-fluid  ">
					<div class="row-fluid ">
						<div class="span16 babi-top">
							<div class=" babi-logo">
								<div class="ty-logo-container">
									<h1>
										<a href="KhachHangTrangChuServlet"
											title="Quần áo trẻ em - thời trang trẻ em"> <img
											src="FoderUpLoad/Us_images/logoHeader3.png" width="150px"
											alt="Quần áo trẻ em - thời trang trẻ em"
											class="ty-logo-container__image">
										</a>
									</h1>
								</div>
							</div>
							<div class=" babi-search">
								<div class="ty-dropdown-box ty-search-block"
									id="advance_search_579">
									<!-- <form action="#" name="search_form" method="get" class="cm-processed-form"> -->
										<input type="text" name="hint_q" value="" id="search_input579" 
										title="Tìm kiếm sản phẩm" 
										class="ty-search-block__input cm-quick-search cm-hint" 
										autocomplete="off"
										placeholder="Bạn cần tìm gì?">
										<!-- <button title="Tìm kiếm" class="ty-search-magnifier"
											type="submit">
											<i class="fa fa-search" aria-hidden="true"></i>
										</button> -->
									<!-- </form> -->
									<!--advance_search_579-->
								</div>
							</div>
								
							<div class=" babi-cart">
								<div class="ty-dropdown-box" id="cart_status_577">
										<%
										if(ss.getAttribute("Quyen") != null){
											if(ss.getAttribute("Quyen").equals("1") || ss.getAttribute("Quyen").equals("2")) {%>
											<a class="ty-account-info__title" href="QuanTriTrangChuServlet"> 
												<span class="title_quantri">Quản Trị</span>
											</a>
											<% }else{ %>
											<div id="sw_dropdown_577" class="ty-dropdown-box__title cm-combination">
												<a href="#">
													<i class="fa fa-shopping-cart" aria-hidden="true"></i> 
													<i class="icon-highlight_off"></i> 
													<span class="ty-minicart-title ty-hand"></span>
													<span class="cart_amount hidden"></span>
												</a>
											</div>
										<%}
										}else{%>
											<div id="sw_dropdown_577" class="ty-dropdown-box__title cm-combination">
												<a href="#">
													<i class="fa fa-shopping-cart" aria-hidden="true"></i> 
													<i class="icon-highlight_off"></i> 
													<span class="ty-minicart-title ty-hand"></span>
													<span class="cart_amount hidden"></span>
												</a>
											</div>
										<%} %>
										
									<div id="dropdown_577" class="cm-popup-box ty-dropdown-box__content hidden">
										<div class="cm-cart-content cm-cart-content-thumb cm-cart-content-delete">
											<a href="#" id="close_dropdown_577"><span>x</span></a>
											<div class="ty-cart-items">
											
												<%
												if(ss.getAttribute("Quyen") == null)
												{
													Cookie[] cookies = request.getCookies();
													if (cookies != null)
													{
														if("JSESSIONID".equals(cookies[cookies.length-1].getName()))
														{
												%>
															<script type="text/javascript">
															$(document).ready(function(){
																$('.cart_amount').addClass('hidden');
															});
															</script>
															<p>Bạn chưa thêm sản phẩm vào Giỏ</p>
															</div>
												<% 		}else{%>
													<ul class="ty-cart-items__list">
												<%
															int soluongTrongGioHang = 0;
															for (Cookie ck : cookies) {
																if("JSESSIONID".equals(ck.getName())){
																	continue;
																}else{
																	
																	String maSanPham = ck.getName().split("#")[0];
																	String maMau = ck.getName().split("#")[1];
																	String maDoTuoi = ck.getName().split("#")[2];
																	String soLuong = ck.getValue().split("#")[0];
																	soluongTrongGioHang += Integer.parseInt(soLuong);
																	String donGia = ck.getValue().split("#")[1];
																	SanPhamBO spBo = new SanPhamBO();
																	SanPham sp1 = spBo.layThongTinSanPhamTheoMa(maSanPham);
																	MauSacBO msBo = new MauSacBO();
																	MauSac ms = msBo.layImageSanPhamTheoMauSac(maSanPham, maMau);
												%>
																<li class="ty-cart-items__list-item">
																	<div class="ty-cart-items__list-item-image">
			                                                            <span class="hidden icon-83"></span><span class="babi-icon babi-icon-2"></span>
			                                                            <%if("Default".equals(maMau)){ %>
			                                                            	<img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=sp1.getImages()%>" width="60" height="60">
			                                                            <%}else{ %>
			                                                            	<img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=ms.getImages()%>" width="60" height="60">
			                                                            <%} %>
			                                                        </div>
															    	<div class="ty-cart-items__list-item-desc">
															    		<a href="NguoiDungChonSanPhamServlet?msp=<%=sp1.getMaSanPham()%>"><%=sp1.getTenSanPham()%>_<%=maMau%>_<%=maDoTuoi%></a>
															            <p>
															                <span><%=soLuong%></span><span>&nbsp;x&nbsp;</span><span id="sec_price_604966631_577" class="none"><%=donGia%>.000</span>&nbsp;<span class="none">đ</span>
															            </p>
															         </div>
															         <div class="ty-cart-items__list-item-tools cm-cart-item-delete">
															            <a href="NguoiDungXoaGioHangServlet?maSP=<%=maSanPham%>&maMau=<%=maMau%>&maDoTuoi=<%=maDoTuoi%>" class="cm-ajax cm-ajax-full-render"><i title="Xóa bỏ" class="fa fa-times-circle" aria-hidden="true" style="font-size: 16px;color: #cd3591;"></i></a>
															         </div>
															    </li>
												<%
																}
															}
												%>
														<script type="text/javascript">
															$(document).ready(function(){
																$('.cart_amount').removeClass('hidden');
																$('.cart_amount').html(<%=soluongTrongGioHang%>);
															});
														</script>
													</ul>
												</div>
												<div
													class="cm-cart-buttons ty-cart-content__buttons buttons-container">
													<div class="ty-float-right">
														<a href="NguoiDungChiTietGioHangServlet" rel="nofollow" class="ty-btn ty-btn__primary">Chi tiết</a>
														<a href="https://DolaKids.vn/index.php?dispatch=checkout.checkout"
															rel="nofollow" class="ty-btn ty-btn__primary">Đặt hàng</a>
													</div>
												</div>
												<%
														}
													} else {
												%>
														<script type="text/javascript">
															$(document).ready(function(){
																$('.cart_amount').addClass('hidden');
															});
														</script>
														<p>Bạn chưa thêm sản phẩm vào Giỏ</p>
														</div>
												<%
													}
												}
												else
												{
													if(ss.getAttribute("Quyen").equals("3"))
													{
														ArrayList<GioHang> listGioHang = (ArrayList<GioHang>)ss.getAttribute("listGioHang");
														if(listGioHang.isEmpty())
														{
														%>
															<script type="text/javascript">
																$(document).ready(function(){
																	$('.cart_amount').addClass('hidden');
																});
															</script>
															<p>Bạn chưa thêm sản phẩm vào Giỏ</p>
															</div>
														<% 
														}else{
														%>
														<ul class="ty-cart-items__list">
														<%
																	int soluongTrongGioHang = 0;
																	for (GioHang gh2 : listGioHang) {
																		soluongTrongGioHang += gh2.getSoLuong();
																		SanPhamBO spBo = new SanPhamBO();
																		SanPham sp1 = spBo.layThongTinSanPhamTheoMa(gh2.getMaSanPham());
																		MauSacBO msBo = new MauSacBO();
																		MauSac ms = msBo.layImageSanPhamTheoMauSac(gh2.getMaSanPham(), gh2.getMaMau());
														%>
																	<li class="ty-cart-items__list-item">
																		<div class="ty-cart-items__list-item-image">
				                                                            <span class="hidden icon-83"></span><span class="babi-icon babi-icon-2"></span>
				                                                            <%if("Default".equals(gh2.getMaMau())){ %>
				                                                            	<img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=sp1.getImages()%>" width="60" height="60">
				                                                            <%}else{ %>
				                                                            	<img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=ms.getImages()%>" width="60" height="60">
				                                                            <%} %>
				                                                        </div>
																    	<div class="ty-cart-items__list-item-desc">
																    		<a href="NguoiDungChonSanPhamServlet?msp=<%=sp1.getMaSanPham()%>"><%=sp1.getTenSanPham()%>_<%=gh2.getMaMau()%>_<%=gh2.getMaDoTuoi()%></a>
																            <p>
																                <span><%=gh2.getSoLuong()%></span><span>&nbsp;x&nbsp;</span><span id="sec_price_604966631_577" class="none"><%=sp1.getGiaMoi()%>.000</span>&nbsp;<span class="none">đ</span>
																            </p>
																         </div>
																         <div class="ty-cart-items__list-item-tools cm-cart-item-delete">
																            <a href="NguoiDungXoaGioHangServlet?maGH=<%=gh2.getMaGioHang()%>" class="cm-ajax cm-ajax-full-render"><i title="Xóa bỏ" class="fa fa-times-circle" aria-hidden="true" style="font-size: 16px;color: #cd3591;"></i></a>
																         </div>
																    </li>
													<%
																	}
													%>
															<script type="text/javascript">
																$(document).ready(function(){
																	$('.cart_amount').removeClass('hidden');
																	$('.cart_amount').html(<%=soluongTrongGioHang%>);
																});
															</script>
														</ul>
													</div>
													<div
														class="cm-cart-buttons ty-cart-content__buttons buttons-container">
														<div class="ty-float-right">
															<a href="NguoiDungChiTietGioHangServlet" rel="nofollow" class="ty-btn ty-btn__primary">Chi tiết</a>
															<a href="https://DolaKids.vn/index.php?dispatch=checkout.checkout"
																rel="nofollow" class="ty-btn ty-btn__primary">Đặt hàng</a>
														</div>
													</div>
													<%
														}
												}
												else{
													%>
													</div>
													<%
													}
												}
												%>
												
										</div>
									</div>
									<!--cart_status_577-->
								</div>
							</div>
						
							<!--=============popup tai khoan=============  -->
							<div class="ty-dropdown-box  babi-account">
								<%
									if (ss.getAttribute("Ten") == null) {
								%>
								<div id="" data-popup-open="popup-dangky-dangnhap"
									class="ty-dropdown-box__title cm-combination unlogged">
									<a class="ty-account-info__title" href=""
										data-popup-open="popup-dangky-dangnhap"> <span
										class="ty-account-info__title-txt">Đăng nhập</span>
									</a>
								</div>
								<div id="dropdown_3"
									class="cm-popup-box ty-dropdown-box__content hidden"
									data-popup="popup-dangky-dangnhap">
									<div style="height: 15px;">
										<a href="#">
											<p data-popup-close="popup-dangky-dangnhap" style="float: right; margin-right: 10px;">X</p>
										</a>
									</div>
									<div id="">
										<ul class="ty-account-info">
											<li>
												<div class="user-text">Đăng ký thành viên Dolakis để
													nhận những ưu đãi từ chúng tôi.</div>
												<div class="user-register">
													<a href="NguoiDungDangKyServlet" rel="nofollow" class="ty-btn ty-btn__primary">Đăng
														ký</a><br> hoặc bạn đã có tài khoản?<br> <a href="#"
														data-ca-target-id="login_block3"
														data-popup-open="popup-dangnhap"
														data-popup-close="popup-dangky-dangnhap"
														class="cm-dialog-opener cm-dialog-auto-size ty-btn ty-btn__secondary"
														rel="nofollow">Đăng nhập</a>
												</div>
											</li>
										</ul>
										<!--account_info_3-->
									</div>
								</div>
								<div class="cm-popup-box ty-dropdown-box__content hidden"
									title="Đăng nhập" data-popup="popup-dangnhap">
									<div style="height: 40px;">
										<a href="#">
											<p data-popup-close="popup-dangnhap"
												style="float: right; margin-right: 10px;">X</p>
										</a>
									</div>
									<div class="ty-login-popup">
										<form name="popup3_form" action="" class="cm-processed-form">
											<p id="thongbao-dangnhap" class="hidden">Sai tên đăng nhập hoặc mật khẩu</p>
											<div class="ty-control-group">
												<label for="login_popup3" class="ty-login__filed-label ty-control-group__label cm-required cm-trim cm-email">Tên
													đăng nhập: </label> 
													<input type="text" id="dangNhapUserName" name="userName" size="30" value="" class="ty-login__input cm-focus">
											</div>
											<div class="ty-control-group ty-password-forgot">
												<label for="psw_popup3"class="ty-login__filed-label ty-control-group__label ty-password-forgot__label cm-required">
												Mật khẩu: </label> 
													<input type="password" id="dangNhapPassWord" name="passWord" size="30" value="" class="ty-login__input" maxlength="32">
											</div>
											<div class="ty-login-reglink ty-center">
												<a class="ty-login-reglink__a" href="NguoiDungDangKyServlet"
													rel="nofollow">Đăng ký tài khoản mới</a>
											</div>
											<div class="buttons-container clearfix">
												<div class="ty-float-right">
													<button id = "dangnhap-ajax" class="ty-btn__login ty-btn__secondary ty-btn" onclick="event.preventDefault();" type="submit" value="submit">Đăng nhập</button>
												</div>
												<!-- <div class="ty-login__remember-me ty-center">
                                                                            <label for="remember_me_popup3" class="ty-login__remember-me-label"><input class="checkbox login" style="" type="checkbox" name="remember_me" id="remember_me_popup3" value="Y">Nhớ đăng nhập</label>
                                                                        </div> -->
											</div>
										</form>
									</div>
								</div>
								<%
									} else {
								%>
								<div id=""
									class="ty-dropdown-box__title cm-combination unlogged" data-popup-open="popup-taikhoan">
									<a class="ty-account-info__title" href=""
										data-popup-open="popup-taikhoan"> <span
										class="ty-account-info__title-txt"><%=ss.getAttribute("Ten")%></span>
									</a>
								</div>
								<div id="" class="cm-popup-box ty-dropdown-box__content hidden"
									data-popup="popup-taikhoan">
									<div style="height: 15px;">
										<a href="#">
											<p data-popup-close="popup-taikhoan"
												style="float: right; margin-right: 10px;">X</p>
										</a>
									</div>
									<div id="header-taikhoan-info">
										<ul class="ty-account-info">
											<li>
												<div class="logo"></div>
												<div class="user-text" style="text-align: center; font-size: 20px;">
													<h4><%=ss.getAttribute("Ten")%></h4>
													<small> -- Web developer -- </small>
												</div>
												<div class="user-register">
													<div class="pull-left">
														<a href="#" class="ty-btn ty-btn__primary">Hồ sơ</a>
													</div>
													<div class="pull-right">
														<a href="DangXuatServlet" class="ty-btn ty-btn__primary">Đăng xuất</a>
													</div>
												</div>
											</li>
										</ul>
									</div>
									<!--account_info_3-->
								</div>
							<%
								}
							%>
						</div>
							<!--============= ./ popup tai khoan=============  -->
					</div>
				</div>
			</div>
		</div>

		<!-- start menu -->
		<div class="tygh-header clearfix">
			<div class="container-fluid  header-grid header-left">
				<div class="row-fluid ">
					<div class="span16 header-right">
						<div class="row-fluid ">
							<div class="span16 ">
								<div class=" main-nav">
									<ul class="ty-menu__items cm-responsive-menu">
										<li class="ty-menu__item ty-menu__menu-btn visible-phone">
											<a class="ty-menu__item-link"> <i
												class="ty-icon-short-list"></i> <span>Menu</span>
										</a>
										</li>
										<%
										ArrayList<Menu> listMenu = (ArrayList<Menu>)ss.getAttribute("listMenu");
										int i = 255;
										for(Menu mn: listMenu){%>
										<li class="item_<%=i%> ty-menu__item cm-menu-item-responsive">
											<input type="hidden" value="<%=mn.getMaMenu()%>" class="maMenu">
											<a
											class="ty-menu__item-toggle visible-phone cm-responsive-menu-toggle">
												<i class="ty-menu__icon-open ty-icon-down-open"></i> <i
												class="ty-menu__icon-hide ty-icon-up-open"></i>
											</a> 
											<a href="<%=mn.getLinkMenu()%>?mamn=<%=mn.getMaMenu()%>" class="ty-menu__item-link"><%=mn.getTenMenu()%></a>
											<div class="ty-menu__submenu"></div>
										</li>
										<%i++;
										} %>
										
										
									</ul>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>