<%@page import="model.bean.MauSac"%>
<%@page import="model.bean.DoTuoi"%>
<%@page import="model.bean.NhomSanPham"%>
<%@page import="model.bean.SanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "Us_header.jsp"%>
<div class="tygh-content clearfix">
		<% SanPham sp = (SanPham)request.getAttribute("sanPham");
			NhomSanPham nsp = (NhomSanPham)request.getAttribute("nhomSanPham");
			Menu mn = (Menu)request.getAttribute("maMenu");
			ArrayList<DoTuoi> listDoTuoi = (ArrayList<DoTuoi>)request.getAttribute("listDoTuoi");
			ArrayList<MauSac> listMauSac =(ArrayList<MauSac>)request.getAttribute("listMauSac");
		%>
                <div class="container-fluid  content-grid">
                    <div class="row-fluid ">
                        <div class="span16 breadcrumbs-grid">
                            <div id="breadcrumbs_10">
                                <div class="ty-breadcrumbs clearfix">
                                    <a href="KhachHangTrangChuServlet" class="ty-breadcrumbs__a">Trang chủ</a><span class="ty-breadcrumbs__slash">/</span><a href="<%=mn.getLinkMenu()%>?mamn=<%=mn.getMaMenu()%>" class="ty-breadcrumbs__a"><%=mn.getTenMenu()%></a>
                                    <span class="ty-breadcrumbs__slash">/</span><a href="<%=nsp.getLink()%>?maNSP=<%=nsp.getMaNhomSP()%>" class="ty-breadcrumbs__a"><%=nsp.getTenNhomSP()%></a>
                                    <span class="ty-breadcrumbs__slash">/</span><span class="ty-breadcrumbs__current"><%=sp.getTenSanPham()%></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row-fluid ">
                        <div class="span16 detail-page-bottom">
                            <div class="row-fluid ">
                                <div class="span16 detail-page-top">
                                    <div class="row-fluid ">
                                        <div class="span12 ">
                                            <div class="ty-product-block ty-product-detail">
                                                <div class="row-fluid ty-product-block__wrapper clearfix">
                                                    <div class="product-main-block">
                                                        <div class="row-fluid">
                                                            <div class="span6">
                                                                <div class="ty-product-block__img-wrapper">
                                                                    <div class="ty-product-block__img" id="product_images_399273_update">
                                                                        <div class="ty-product-img cm-preview-wrapper">
                                                                            <a id="det_img_link_preview_399273_58135" class="cm-image-previewer ">
                                                                                    <span class="babi-icon babi-icon-2"></span>
                                                                                    <img class="ty-pict" id="myimage" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages()%>" width="600" height="" alt="Màu cam" title="Màu cam">
                                                                                    <div id="myresult" class="img-zoom-result"></div>
                                                                           </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="span10 ty-product-block__left">
                                                                <form method="post" name="product_form_399273" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
                                                                    <h1 class="ty-product-block-title"><%=sp.getTenSanPham()%></h1>
                                                                    <div class="short_description">
                                                                        <div class="product_excerpt">
                                                                            <p><%=sp.getChiTietSanPham()%></p>
                                                                        </div>
                                                                    </div>
                                                                    <div class="prices-container price-wrap">
                                                                        <span class="cm-reload-399273 ty-price-update" id="price_update_399273">
                                                                                <span class="list-price-label">Giá bán:</span>
                                                                        		<span class="ty-price" id="line_discounted_price_399273">
                                                                                <span id="sec_discounted_price_399273" class="ty-price-num"><%=sp.getGiaMoi()%>.000 </span><span class="ty-price-num">đ</span>
                                                                        </span>
                                                                        </span>
                                                                        <br>
                                                                        <span class="cm-reload-399273" id="old_price_update_399273"></span>
                                                                    </div>
                                                                    <div class="options-overlay"></div>
                                                                    <div class="product-action-block ">
                                                                        <div class="ty-product-block__option">
                                                                            <div class="cm-reload-399273" id="product_options_update_399273">
                                                                                <div class="cm-picker-product-options ty-product-options" id="opt_399273">
                                                                                    <div class="ty-control-group ty-product-options__item product-list-field clearfix" id="opt_399273_21865">
                                                                                        <label for="option_399273_21865" class="ty-control-group__label ty-product-options__item-label cm-required">Chọn màu
                                                                                            <span class="ty-tooltip-block">
                                                                                            <a class="cm-tooltip" ><i class="fa fa-question-circle-o" aria-hidden="true"></i></a>
                                                                                            </span>:
                                                                                        </label>
                                                                                        <div class="ty-product-variant-image ty-show-icon">
                                                                                            <ul id="dataChonMau">
                                                                                            <% int j = 0;
                                                                                            for(MauSac ms: listMauSac){
                                                                                            	if(j==0){
                                                                                            	%>
                                                                                                <li>
                                                                                                	<input type="hidden" class="dataMaMauSelected" value="<%=ms.getIdMauSac()%>">
                                                                                                    <div class="babi-product-variant-image div-image">
                                                                                                        <img class="ty-pict  product-variant-image-selected ty-product-options__image" id="det_img_variant_image_399273_21865_210647" 
                                                                                                        src="FoderUpLoad/Us_images/SanPham/<%=ms.getImages()%>" width="50" height="60" alt="<%=ms.getTenMauSac()%>" 
                                                                                                        title="<%=ms.getTenMauSac()%>">
                                                                                                        <div id="babi-out-of-color-58135" class="babi-product-variant-image__description hidden">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </li>
                                                                                                <%}else{%>
                                                                                                <li>
                                                                                                	<input type="hidden" class="dataMaMau" value="<%=ms.getIdMauSac()%>">
                                                                                                    <div class="babi-product-variant-image div-image">
                                                                                                        <img class="ty-pict  product-variant-image-unlected ty-product-options__image" id="det_img_variant_image_399273_21865_210647" 
                                                                                                        src="FoderUpLoad/Us_images/SanPham/<%=ms.getImages()%>" width="50" height="60" alt="<%=ms.getTenMauSac()%>" 
                                                                                                        title="<%=ms.getTenMauSac()%>">
                                                                                                        <div id="babi-out-of-color-58135" class="babi-product-variant-image__description hidden">
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </li>
                                                                                                <%
                                                                                            	}
                                                                                            	j++;
                                                                                            	} %>
                                                                                            </ul>
                                                                                        </div>
                                                                                        <!--  -->
                                                                                        
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="ty-product-block__option">
                                                                            <div class="cm-reload-399273">
                                                                                <div class="cm-picker-product-options ty-product-options">
                                                                                    <div class="ty-control-group ty-product-options__item product-list-field clearfix">
                                                                                    	<label for="option_399273_21865" class="ty-control-group__label ty-product-options__item-label cm-required">Chọn size
                                                                                            <span class="ty-tooltip-block">
                                                                                            <a class="cm-tooltip" ><i class="fa fa-question-circle-o" aria-hidden="true"></i></a>
                                                                                            </span>:
                                                                                        </label>
                                                                                        <div class="ty-product-variant-image ty-show-icon">
                                                                                            <select id="selectDoTuoi">
                                                                                            	<% for(DoTuoi dt: listDoTuoi){ 
	                                                                                            	if(dt.getSize()==null){%>
	                                                                                            	<option value="<%=dt.getMaDoTuoi()%>">Sơ sinh</option>
	                                                                                            	<%}else{ %>
	                                                                                            	<option value="<%=dt.getMaDoTuoi()%>" ><%="Size "+ dt.getSize()+", "+dt.getChieuCao()+", "+dt.getTrongLuong()%></option>
	                                                                                            	<%}
	                                                                                            }%>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="ty-product-block__advanced-option clearfix">
                                                                            <div class="cm-reload-399273" id="advanced_options_update_399273">
                                                                            </div>
                                                                        </div>
                                                                        <div class="product-cart-block">
                                                                            <div class="choice-quantity">
                                                                            	<%
                                                                            	int soluongcon = sp.getSoLuong();
                                                                        		int soluongTrongGH = (int)(request.getAttribute("soLuongGH"));
                                                                            	if(ss.getAttribute("Quyen")==null){
                                                                            		soluongcon = sp.getSoLuong() - soluongTrongGH;
	                                                                            	for(Cookie ck : request.getCookies()){
	                                                                            		if(sp.getMaSanPham().equals(ck.getName().split("#")[0]))
	                                                                            			soluongcon = soluongcon - Integer.parseInt(ck.getValue().split("#")[0]);
	                                                                            	}
                                                                            	}
                                                                            	else{
                                                                            			soluongcon = sp.getSoLuong() - soluongTrongGH;
                                                                            	}
                                                                            	%>
                                                                           		<input type="hidden" value="<%=soluongcon%>" id="soLuongSanPhamCon">
                                                                           		
                                                                                <div class="cm-reload-399273 stock-wrap hidden" id="product_amount_update_399273">
                                                                                    <div class="ty-control-group product-list-field">
                                                                                        	<span class="ty-qty-in-stock ty-control-group__item" id="in_stock_info_399273" style="color:red;">Không đủ số lượng
                                                                                    </div>
                                                                                </div>
                                                                                <div class="cm-reload-399273" id="qty_update_399273">
                                                                                    <div class="ty-qty clearfix changer" id="qty_399273">
                                                                                        <label class="ty-control-group__label" for="qty_count_399273">Số lượng:</label>
                                                                                        <select name="" id="selectSoLuong">
                                                                                            <option value="1">1</option>
                                                                                            <option value="2">2</option>
                                                                                            <option value="3">3</option>
                                                                                            <option value="4">4</option>
                                                                                            <option value="5">5</option>
                                                                                            <option value="6">6</option>
                                                                                            <option value="7">7</option>
                                                                                        </select>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            
                                                                            <input type="hidden" id ="selectedMaSanPham" value="<%=sp.getMaSanPham()%>" name="selectedMaSanPham">
                                                                            <input type="hidden" id ="selectedMaMau" value="" name="selectedMaMau">
                                                                            <input type="hidden" id ="selectedMaDoTuoi" value="" name="selectedMaMau">
                                                                            <input type="hidden" id ="selectedSoLuong" value="" name="selectedMaMau">
                                                                            <input type="hidden" id ="selectedDonGia" value="<%=sp.getGiaMoi() %>" name="selectedDonGia">
                                                                            
                                                                            <div class="popup" data-popup="popup-2">
																				<div class="popup-inner xac-nhan">
																					<div class="popup-header">
																						<h2>Đã thêm vào giỏ hàng</h2>
																					</div>
																					<div class="popup-content">
																						<div class="notification-body-extended">
																					        <div class="ty-product-notification__body cm-notification-max-height" style="max-height: 306px;">
																					            <!-- <div class="ty-product-notification__item clearfix">
																					                <span class="hidden icon-83"></span><span class="babi-icon babi-icon-2"></span><img class="ty-pict  ty-product-notification__image  " src="https://babi.vn/images/thumbnails/60/60/variant_image/47/do-bo-be-gai-tay-canh-doi-phoi-ren-dieu-da_(2).jpg?t=1541212258" width="60" height="60" alt="Màu xanh" title="Màu xanh">
																					                <div class="ty-product-notification__content clearfix">
																					                    <a href="https://babi.vn/do-bo-be-gai-tay-canh-doi-phoi-ren-dieu-da.html" class="ty-product-notification__product-name">Đồ bộ bé gái tay cánh dơi phối ren điệu đà</a>
																					                    <div class="ty-product-notification__price">
																					                        <span class="none">1</span>&nbsp;x&nbsp;<span id="sec_price_604966631" class="none">66.000</span>&nbsp;<span class="none">đ</span>
																					                    </div>
																					                    <div class="clearfix"></div>
																					                    Size: 8.5 - 10.5kg<br>
																					                    Color: 1 - Màu xanh<br>
																					                </div>
																					            </div>
																					            <div class="clearfix"></div>
																					            <hr class="ty-product-notification__divider">
																					            <div class="ty-product-notification__total-info clearfix">
																					                <div class="ty-product-notification__amount ty-float-left"> Bạn có 7 sản phẩm trong giỏ hàng</div>
																					                <div class="ty-product-notification__subtotal ty-float-right">
																					                    Tổng giỏ hàng <span>471.000</span>&nbsp;đ
																					                </div>
																					            </div> -->
																					        </div>
																					        <div class="ty-product-notification__buttons clearfix">
																					            <div class="ty-float-left">
																					                <a href="KhachHangTrangChuServlet" class="ty-btn ty-btn__secondary ">Chọn thêm</a>
																					            </div>
																					            <div class="ty-float-right">
																					                <a href="NguoiDungChiTietGioHangServlet" class="ty-btn ty-btn__primary ">Đặt hàng</a>
																					            </div>
																					            <div class="clearfix"></div>
																					            <div class="clearfix ty-product-notification__tooltip">Mẹo: "Chọn thêm" vào Giỏ hàng nhiều mẫu bạn thích và chỉ cần "Đặt hàng" 1 lần nhiều món.</div>
																					        </div>
																					    </div>
																					</div>
																				</div>
																			</div>
                                                                            <div class="add-cart-button">
                                                                                <div class="ty-product-block__button">
                                                                                    <div class="cm-reload-399273 " id="add_to_cart_update_399273">
                                                                                        <button id="button_cart_399273" onclick="event.preventDefault()" class="ty-btn__primary ty-btn__big ty-btn__add-to-cart cm-form-dialog-closer ty-btn">
                                                                                            <i class="fa fa-cart-plus" aria-hidden="true"></i><span>Thêm vào Giỏ</span>
                                                                                        </button>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="call-babi supportphone">
                                                                                <a href="tel:1900545477">
                                                                                <i class="fa fa-whatsapp" aria-hidden="true"></i>
                                                                                <div class="info">
                                                                                    <span><b>Hỗ trợ đặt hàng</b></span><br>
                                                                                    <span style="color:#dc0309;">1900 54 54 77</span><br>
                                                                                </div>
                                                                            </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="ty-product-block__note">
                                                                        <h3>Thông tin &amp; Khuyến mãi</h3>
                                                                        <div class="clearfix"></div>
                                                                        <p><a href="https://dolakis.vn/phuong-thuc-van-chuyen.html"><span style="color:#006400;">- Từ ngày 1/9 - 30/9/2018, Dolakis trợ giá Phí giao hàng <strong>đi tỉnh chỉ còn 20.000đ</strong>/lần giao. <em><strong>Xem chi tiết nhé!</strong></em></span></a></p>
                                                                        <p><em><strong>-&nbsp;</strong></em><span style="color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;">Đặc biệt, </span><span style="color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;">chỉ áp dụng cho Ba Mẹ </span><span style="color:#cc1884;"><span style="font-family: Arial, Helvetica, sans-serif; font-size: small;"><strong>đến tận Shop mua hàng&nbsp;</strong><span style="color: rgb(204, 24, 132);"><span style="font-family: Arial, Helvetica, sans-serif; font-size: small;"><strong>GIẢM THÊM 5%</strong></span></span></span></span><span style="color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small;">&nbsp;từ ngày 04.09 - 30.09.2018. Đến Shop Dolakis ngay nhé:</span></p>
                                                                        <ol>
                                                                            <li>380/9B Nam Kỳ Khởi Nghĩa, P8, Quận 3, TP.HCM</li>
                                                                            <li>124 Trường Chinh, P12, Quận Tân Bình, TP.HCM</li>
                                                                        </ol>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Inline script moved to the bottom of the page -->
                                        <!-- Inline script moved to the bottom of the page -->
                                        <!-- Inline script moved to the bottom of the page -->
                                        <div class="span4 ">
                                            <div class="ty-sidebox-important babi-sidebox">
                                                <h3 class="ty-sidebox-important__title">
                                                    <span class="ty-sidebox-important__title-wrapper">An tâm mua sắm tại Dolakis</span>
                                                </h3>
                                                <div class="ty-sidebox-important__body">
                                                    <div class="ty-wysiwyg-content">
                                                        <ul>
                                                            <li><strong><i class="fa fa-heart" aria-hidden="true" style="color: #ff0099;"></i>&nbsp;&nbsp; Giao hàng Toàn quốc</strong></li>
                                                            <li><strong><i class="fa fa-heart" aria-hidden="true" style="color: #ff0099;"></i>&nbsp;&nbsp; Nhận hàng mới trả tiền</strong></li>
                                                            <li><strong><i class="fa fa-heart" aria-hidden="true" style="color: #ff0099;"></i>&nbsp;&nbsp; Hình sản phẩm thật tại Dolakis</strong></li>
                                                            <li><strong><i class="fa fa-heart" aria-hidden="true" style="color: #ff0099;"></i>&nbsp;&nbsp; Không vừa được đổi size</strong></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="ty-sidebox-important babi-sidebox cart">
                                                <h3 class="ty-sidebox-important__title">
                                                    <span class="ty-sidebox-important__title-wrapper">Giỏ hàng của bạn đang có</span>
                                                </h3>
                                                <div class="ty-sidebox-important__body">
                                                    <div id="cart_status_570">
                                                        <div class="ty-cart-items__empty ty-center">Bạn chưa thêm sản phẩm vào Giỏ</div>
                                                        <div class="cm-cart-buttons ty-cart-content__buttons buttons-container hidden">
                                                            <div class="ty-float-left">
                                                                sản phẩm<br>
                                                                Tổng: <span id="sec_total_price_178000" class="ty-nowrap">0</span>&nbsp;<span class="ty-nowrap">đ</span>
                                                            </div>
                                                            <div class="ty-float-right">
                                                                <a href="https://dolakis.vn/index.php?dispatch=checkout.checkout" rel="nofollow" class="ty-btn ty-btn__primary">Đặt hàng
                                                        </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!-- Inline script moved to the bottom of the page -->
                                                    <!-- Inline script moved to the bottom of the page -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid ">
                            <div class="span12 ">
                                <div class="product-details">
                                    <div class="product-detail-info">
                                        <!-- Inline script moved to the bottom of the page -->
                                        <div class="ty-tabs cm-j-tabs clearfix">
                                            <ul class="ty-tabs__list">
                                                <li id="description" class="ty-tabs__item cm-js active"><a class="ty-tabs__a">Chi tiết sản phẩm</a></li>
                                            </ul>
                                        </div>
                                        <div class="cm-tabs-content ty-tabs__content clearfix" id="tabs_content">
                                            <div id="content_description" class="ty-wysiwyg-content content-description" style="display: block;">
                                                <div>
                                                    <h2 style="color: rgb(70, 83, 99); font-family: Arial, Helvetica, sans-serif; margin: 0px; padding: 6px 0px; line-height: 20.8px;"><%=sp.getTenSanPham() %>
                                                </h2>
                                                    <p style="text-align: justify;"><%=sp.getChiTietSanPham()%></p>
                                                    
                                                    <% if(listMauSac.isEmpty()){
                                                    %>
                                                    	<div class="img_desc_top" style="text-align:center;">
	                                                        <img alt="" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages()%>" style="width:800px;height:800px;">
	                                                    </div>
	                                                    <div class="img_desc_top" style="text-align:center;">
	                                                        <img alt="" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages()%>" style="width:800px;height:800px;">
	                                                    </div>
                                                    <%}else{
                                                    for(MauSac ms : listMauSac){ %>
                                                    <div class="img_desc_top" style="text-align:center;">
                                                        <img alt="" src="FoderUpLoad/Us_images/SanPham/<%=ms.getImages()%>" style="width:800px;height:800px;">
                                                    </div>
                                                    <%}}%>
                                                    
                                                    <p style="color: rgb(70, 83, 99); font-family: Arial, Helvetica, sans-serif; margin: 0px; padding: 6px 0px; line-height: 20.8px;">
                                                        <span style="color: rgb(0, 0, 0);"><strong>THÔNG TIN SẢN PHẨM</strong></span>
                                                    </p>
                                                    <table align="center" border="1" cellpadding="0" cellspacing="0" dir="ltr" style="color: rgb(70, 83, 99); border-collapse: collapse; border-spacing: 0px; border: 1px solid rgb(204, 204, 204); font-family: arial, sans, sans-serif; table-layout: fixed;">
                                                        <colgroup>
                                                            <col width="125">
                                                            <col width="391">
                                                        </colgroup>
                                                        <tbody>
                                                            <tr style="height: 25px;">
                                                                <td style="border: 1px solid rgb(0, 0, 0); padding: 0px 3px; font-family: Arial; color: rgb(0, 0, 0); vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS">Tên Sản Phẩm</font>
                                                                </td>
                                                                <td style="border-width: 1px 1px 1px thin; border-style: solid; padding: 0px 3px; vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS"><%=sp.getTenSanPham() %></font>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 25px;">
                                                                <td style="border-width: thin 1px 1px; border-style: solid; padding: 0px 3px; font-family: Arial; color: rgb(0, 0, 0); vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS">Mã Sản Phẩm</font>
                                                                </td>
                                                                <td style="border-width: thin 1px 1px thin; border-style: solid; padding: 0px 3px; font-family: Arial; color: rgb(0, 0, 0); vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS"><%=sp.getMaSanPham()%></font>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 25px;">
                                                                <td style="border-width: thin 1px 1px; border-style: solid; padding: 0px 3px; font-family: Arial; color: rgb(0, 0, 0); vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS">Tuổi</font>
                                                                </td>
                                                                <td style="border-width: thin 1px 1px thin; border-style: solid; padding: 0px 3px; font-family: Arial; color: rgb(0, 0, 0); vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS">dành cho trẻ em <% for(DoTuoi dt : listDoTuoi){%><%=dt.getTuoi()%>. <%}%></font>
                                                                </td>
                                                            </tr>
                                                            <tr style="height: 25px;">
                                                                <td style="border-width: thin 1px 1px; border-style: solid; padding: 0px 3px; font-family: Arial; color: rgb(0, 0, 0); vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS">Xuất xứ</font>
                                                                </td>
                                                                <td style="border-width: thin 1px 1px thin; border-style: solid; padding: 0px 3px; vertical-align: middle;">
                                                                    <font color="#333333" face="sans-serif, Arial, Verdana, Trebuchet MS">VIệt Nam</font>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- Facebook bình luận -->
                                        <!-- <div class="ty-tabs cm-j-tabs clearfix">
                                    <ul class="ty-tabs__list">
                                        <li id="product_tab_28" class="ty-tabs__item cm-js active"><a class="ty-tabs__a">Bình luận Facebook</a></li>
                                        <li id="tags" class="ty-tabs__item cm-js"><a class="ty-tabs__a">Tags</a></li>
                                    </ul>
                                </div>
                                <div class="cm-tabs-content ty-tabs__content clearfix" id="tabs_content">
                                    <div id="content_product_tab_28" class="ty-wysiwyg-content content-product_tab_28" style="display: block;">
                                        <div class="fb-comments fb_iframe_widget fb_iframe_widget_fluid" data-href="https://dolakis.vn/khau-trang-tre-em-in-hinh-superman-cho-be-trai.html" data-width="100%" data-numposts="5" fb-xfbml-state="rendered">
                                            <span style="height: 178px;">
                                                <iframe id="f24d34aa8150fbc" name="f37cf7d7e2aed8" scrolling="no" title="Facebook Social Plugin" class="fb_ltr" src="./muahang_files/comments.html" style="border: none; overflow: hidden; height: 178px; width: 100%;">    
                                                </iframe>
                                            </span>
                                        </div>
                                    </div>
                                    <div id="content_tags" class="ty-wysiwyg-content content-tags" style="display: none;">

                                        <div id="content_tags_tab">
                                            <div class="ty-control-group">
                                                <ul class="ty-tags-list clearfix">
                                                    <li class="ty-tags-list__item">
                                                        <a class="ty-tags-list__a" href="https://dolakis.vn/t/khau-trang-cho-be-vi-2/">
                                                            Khẩu trang cho bé
                                                        </a>
                                                    </li>
                                                    <li class="ty-tags-list__item">
                                                        <a class="ty-tags-list__a" href="https://dolakis.vn/t/khau-trang-tre-em-vi/">
                                                            Khẩu trang trẻ em
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>  
                                        </div>
                                    </div>
                                </div> -->
                                    </div>
                                </div>
                            </div>
                            <div class="span4 ">
                                <div class="ty-sidebox-important babi-sidebox showroom">
                                    <h3 class="ty-sidebox-important__title">
                                        <span class="ty-sidebox-important__title-wrapper">Thời trang Dolakis</span>
                                    </h3>
                                    <div class="ty-sidebox-important__body">
                                        <div class="ty-wysiwyg-content">
                                            <p><span class="address">
                                        <span><i class="fa fa-tag" aria-hidden="true"></i> Địa chỉ:</span><br>
                                                -&nbsp;380/9B Nam Kỳ Khởi Nghĩa, Q.3, TpHCM<br>
                                                ĐT: <span style="color:red">0932.064.588</span><br>
                                                - 124 Trường Chinh, P.12, Q.Tân Bình, TP.HCM<br>
                                                ĐT: <span style="color:red"> (028) 3620.5066</span></span>
                                            </p>
                                            <p><span class="hotline"><span><i class="fa fa-whatsapp" aria-hidden="true"></i> Hotline:</span> 1900 54 54 77</span><br>
                                                <span class="open"><span><i class="fa fa-clock-o" aria-hidden="true"></i> Mở cửa:</span></span><br>
                                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;T2 - T7: 9h00 - 20h30</span><br>
                                                <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CN: 8h30 - 17h30</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="ty-sidebox-important babi-sidebox">
                                    <h3 class="ty-sidebox-important__title">
                                        <span class="ty-sidebox-important__title-wrapper">Đồ cho bé cùng loại</span>
                                    </h3>
                                    <div class="ty-sidebox-important__body">
                                        <!-- Inline script moved to the bottom of the page -->
                                        <div class="grid-list">
                                        <% ArrayList<SanPham> listSP = (ArrayList<SanPham>)request.getAttribute("listSPtheoNhom");
                                        int n = 1;
                                        for(SanPham sanpham: listSP){
                                        	if(n<=8)
	                                        {%>
	                                            <div class="ty-column1">
	                                                <div class="ty-grid-list__item ty-quick-view-button__wrapper">
	                                                    <form action="" method="post" name="product_form_78000398426" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
	                                                        <div class="ty-grid-list__image">
	                                                            <a href="NguoiDungChonSanPhamServlet?msp=<%=sanpham.getMaSanPham()%>">
	                                                                <span class="hidden icon-83"></span>
	                                                                <span class="babi-icon babi-icon-2"></span>
	                                                                <img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=sanpham.getImages()%>">
	                                                            </a>
	                                                        </div>
	                                                        <h3 class="ty-grid-list__item-name">
	                                                            <a href="NguoiDungChonSanPhamServlet?msp=<%=sanpham.getMaSanPham()%>" class="product-title" title="<%=sanpham.getTenSanPham()%>"><%=sanpham.getTenSanPham()%>
	                                                            </a>    
	                                                        </h3>
	                                                        <div class="ty-grid-list__price ">
	                                                            <span class="cm-reload-78000398426" id="old_price_update_78000398426">
	                                                            <!--old_price_update_78000398426-->
	                                                            </span>
	                                                            <span class="cm-reload-78000398426 ty-price-update" id="price_update_78000398426">
	                                                            <span class="ty-price" id="line_discounted_price_78000398426">
	                                                            <span id="sec_discounted_price_78000398426" class="ty-price-num"><%=sanpham.getGiaMoi() %>.000 </span><span class="ty-price-num">đ</span>
	                                                                <!--price_update_78000398426-->
	                                                            </span>
	                                                        </div>
	                                                        <div class="grid-list__rating">
	                                                        </div>
	                                                        <div class="ty-grid-list__control">
	                                                        </div>
	                                                    </form>
	                                                </div>
	                                            </div>
	                                            <%} n++;}%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<script>
function imageZoom(imgID, resultID) {

  var img, lens, result, cx, cy;
  img = document.getElementById(imgID);
  result = document.getElementById(resultID);
  /*create lens:*/
  lens = document.createElement("DIV");
  lens.setAttribute("class", "img-zoom-lens");
  /*insert lens:*/
  img.parentElement.insertBefore(lens, img);
  /*calculate the ratio between result DIV and lens:*/
  cx = result.offsetWidth / lens.offsetWidth;
  cy = result.offsetHeight / lens.offsetHeight;
  /*set background properties for the result DIV:*/
  result.style.backgroundImage = "url('" + img.src + "')";
  result.style.backgroundSize = (img.width * cx) + "px " + (img.height * cy) + "px";
  /*execute a function when someone moves the cursor over the image, or the lens:*/
  lens.addEventListener("mousemove", moveLens);
  img.addEventListener("mousemove", moveLens);
  /*and also for touch screens:*/
  lens.addEventListener("touchmove", moveLens);
  img.addEventListener("touchmove", moveLens);
  
  function moveLens(e) {
    var pos, x, y;
    /*prevent any other actions that may occur when moving over the image:*/
    e.preventDefault();
    /*get the cursor's x and y positions:*/
    pos = getCursorPos(e);
    /*calculate the position of the lens:*/
    x = pos.x - (lens.offsetWidth / 2);
    y = pos.y - (lens.offsetHeight / 2);
    /*prevent the lens from being positioned outside the image:*/
    if (x > img.width - lens.offsetWidth) {x = img.width - lens.offsetWidth;}
    if (x < 0) {x = 0;}
    if (y > img.height - lens.offsetHeight) {y = img.height - lens.offsetHeight;}
    if (y < 0) {y = 0;}
    /*set the position of the lens:*/
    lens.style.left = x + "px";
    lens.style.top = y + "px";
    /*display what the lens "sees":*/
    result.style.backgroundPosition = "-" + (x * cx) + "px -" + (y * cy) + "px";
  }
  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /*get the x and y positions of the image:*/
    a = img.getBoundingClientRect();
    /*calculate the cursor's x and y coordinates, relative to the image:*/
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /*consider any page scrolling:*/
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}
</script>
<script>
// Initiate zoom effect:
    
	imageZoom("myimage", "myresult");
	/* $(document).on('load',function() {
		 $('#myresult').addClass('hidden');
	}); */
	$('.ty-product-block__img').mouseenter(function(){
  	  $('#myresult').removeClass('hidden');
	  });
	$('.ty-product-block__img').mouseleave(function() {
	  	 $('#myresult').addClass('hidden');
	})
  
</script>
<script type="text/javascript">
$(document).ready(function() {
    /*Lấy mã đọ tuổi  */
    $('#selectedMaDoTuoi').val($('#selectDoTuoi').val());
    $('#selectDoTuoi').on('change', function() {
        $('#selectedMaDoTuoi').val($('#selectDoTuoi').val());
    });
    /*Lấy mã màu  */
    /* $('#myimage').attr('src',$(".div-image").children('.product-variant-image-selected').attr('src')); */
    $('#selectedMaMau').val($('.dataMaMauSelected').val());
    $('#dataChonMau li').on('click', function() {
        var href = $(this);
        $('#dataChonMau .ty-pict').removeClass('product-variant-image-selected');
        href.children(".div-image").children('.ty-pict').addClass('product-variant-image-selected');
        $('#myimage').attr('src', $(".div-image").children('.product-variant-image-selected').attr('src'));
        $('#selectedMaMau').val(href.children('.dataMaMau').val());
    });
    /*Lấy số lượng  */

    if (parseInt($('#selectSoLuong').val()) > parseInt($('#soLuongSanPhamCon').val()))
        $('#product_amount_update_399273').removeClass('hidden');
    else
        $('#selectedSoLuong').val($('#selectSoLuong').val());
    $('#selectSoLuong').on('change', function() {
        if (parseInt($('#selectSoLuong').val()) > parseInt($('#soLuongSanPhamCon').val()))
            $('#product_amount_update_399273').removeClass('hidden');
        else {
            $('#product_amount_update_399273').addClass('hidden');
            $('#selectedSoLuong').val($('#selectSoLuong').val());
        }
    });
    /* Thêm vào giỏ Hàng click  */
    $('#button_cart_399273').on('click',function(){
    	if(sessionStorage.getItem('ssStQuyen') == '1' || sessionStorage.getItem('ssStQuyen')=='2'){
    		location.href = "KhachHangTrangChuServlet";
    	}
    	else{
	    	$.ajax({
	    		url:'NguoiDungThemGioHangServlet',
	    		data:{
	    			selectedMaSanPham: $('#selectedMaSanPham').val(),
	    			selectedMaMau: $('#selectedMaMau').val(),
	    			selectedMaDoTuoi: $('#selectedMaDoTuoi').val(),
	    			selectedSoLuong: $('#selectedSoLuong').val(),
	    			selectedDonGia: $('#selectedDonGia').val(),
	    		},
	    		success: function(responseText){
	    			if(responseText != ""){
	    				$('.ty-product-notification__body').html(responseText);
	    				$('[data-popup="popup-2"]').show();
			    		e.preventDefault();
	    			}
	    		},
	    	});
    	}
    });

});
</script>
<%@include file="Us_footer.jsp"%>