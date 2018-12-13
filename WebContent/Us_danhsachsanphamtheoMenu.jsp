<%@page import="model.bean.DoTuoi"%>
<%@page import="model.bean.NhomSanPham"%>
<%@page import="model.bean.SanPham"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "Us_header.jsp"%>
<div class="tygh-content clearfix">
					<% Menu menu = (Menu)request.getAttribute("menu"); %>
                    <div class="container-fluid  content-grid">
                        <div class="row-fluid ">                
                            <div class="span16 breadcrumbs-grid">
                                <div id="breadcrumbs_10">
                                    <div class="ty-breadcrumbs clearfix">
                                        <a href="https://babi.vn/" class="ty-breadcrumbs__a">Trang chủ</a>
                                        <span class="ty-breadcrumbs__slash">/</span>
                                        <span class="ty-breadcrumbs__current"><%=menu.getTenMenu()%></span>
                                    </div>
                                    <!--breadcrumbs_10--></div>
                                </div>
                            </div>
                            <div class="row-fluid ">                
                                <div class="span12 main-content-grid">
                                    <div class="ty-mainbox-container clearfix">
                                        <h1 class="ty-mainbox-title">
                                            <span><%=menu.getTenMenu()%></span>
                                        </h1>
                                        <div class="ty-mainbox-body">
                                            <div id="category_products_11">
                                                <div class="ty-wysiwyg-content ty-mb-s">
                                                    <p>
                                                        <strong>
                                                            <span id="docs-internal-guid-383c5946-1b5e-5f1b-7e7e-32b06f594771">
                                                                <span style="font-size: 11pt; font-family: Arial; color: rgb(67, 67, 67); background-color: transparent; vertical-align: baseline; white-space: pre-wrap;"><%=menu.getContent()%></span>
                                                            </span>
                                                        </strong>
                                                    </p>
                                                </div>
                                                <!-- Inline script moved to the bottom of the page -->
                                                <div class="ty-pagination-container cm-pagination-container" id="pagination_contents">
                                                    
                                                    <!-- Inline script moved to the bottom of the page -->
                                                    
                                                    <div class="grid-list" id="example2">
                                                    <% ArrayList<SanPham> listSP = (ArrayList<SanPham>)request.getAttribute("listSP");
                                                    if(listSP.isEmpty()){
                                                    	%>
                                                    		<h4 style="text-align: center;font-size: 35px;color: darkgray;">Không có sản phẩm nào</h4>
                                                    	<%
                                                    }
                                                    else
                                                    for(SanPham sp: listSP){%>
                                                        <div class="ty-column3 data-page">    
                                                            <div class="ty-grid-list__item ty-quick-view-button__wrapper">
                                                                <form action="https://babi.vn/" method="post" name="product_form_399268" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
                                                                    <div class="ty-grid-list__image">
                                                                        <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>">
                                                                            <span class="babi-icon babi-icon-2"></span>
                                                                            <img class="ty-pict" id="det_img_399268" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages()%>" width="315" height="315" alt="<%=sp.getImages()%>" title="<%=sp.getTenSanPham()%>">
                                                                        </a>
                                                                    </div>
                                                                    <h3 class="ty-grid-list__item-name">
                                                                        <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>" class="product-title" title="<%=sp.getTenSanPham()%>"><%=sp.getTenSanPham()%>
                                                                        </a>    
                                                                    </h3>    
                                                                    <div class="ty-grid-list__price ">            
                                                                        <span class="cm-reload-399268" id="old_price_update_399268">
                                                                        </span>
                                                                        <span class="cm-reload-399268 ty-price-update" id="price_update_399268">
                                                                            <span class="ty-price" id="line_discounted_price_399268">
                                                                                <span id="sec_discounted_price_399268" class="ty-price-num"><%=sp.getGiaMoi() %>.000</span>&nbsp;
                                                                                <span class="ty-price-num">đ</span>
                                                                            </span>
                                                                        </span>
                                                                    </div>
                                                                    <div class="grid-list__rating">    
                                                                    </div>
                                                                    <div class="ty-grid-list__control">
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                        <%} %>
                                                    </div>
                                                   
                                                    <!-- phân trang -->
                                                    <div class="paging-container" id="tablePaging"></div>
                                                    <!--pagination_contents-->
                                                    
                                                </div>
	                                                <% String tenMenu = menu.getTenMenu().toUpperCase(); %>
	                                                <div class="ty-wysiwyg-content ty-mb-s"><strong><%=tenMenu%> THỜI TRANG ĐẸP, GIÁ RẺ TẠI TP.HCM.</strong>
	                                                	<% ArrayList<NhomSanPham> listNhomsanpham = (ArrayList<NhomSanPham>)request.getAttribute("listNhomSP");
	                                                		int k = 0;
		                                                        for(NhomSanPham nsp: listNhomsanpham){
		                                                        	if(k<8){%>
						                                                  <div style="text-align:justify;"> 
						                                                        	<%= nsp.getContent()%> 
						                                                  </div>
		                                                  			<%}k++;
		                                                  } %>
	                                                 </div>
	                                                 </div>
                                                     <ul class="subcategories clearfix">
                                                            <% 
                                                            for(NhomSanPham nsp: listNhomsanpham){%>
                                                                <li class="ty-subcategories__item">
                                                                    <a href="<%=nsp.getLink()%>?maNSP=<%=nsp.getMaNhomSP()%>">
                                                                        <span><%=nsp.getTenNhomSP()%></span>
                                                                    </a>
                                                                </li>
                                                                <%} %>
                                                           </ul>
                                                            <!-- Inline script moved to the bottom of the page -->
                                                            <!-- Inline script moved to the bottom of the page -->
                                                        </div>
                                                    </div>
                                                    <!-- <div class="fb-comments fb_iframe_widget fb_iframe_widget_fluid" data-href="https://babi.vn/thoi-trang-be-trai-183.html" data-width="100%" data-numposts="5" fb-xfbml-state="rendered">
                                                        <span style="height: 1049px;">
                                                            <iframe id="f1a2085996033b4" name="fe2cff43d55ab" scrolling="no" title="Facebook Social Plugin" class="fb_ltr" src="./Quần Áo Bé Trai - Thời Trang Bé Trai Sành Điệu _ Shop Babi.vn_files/comments.html" style="border: none; overflow: hidden; height: 1049px; width: 100%;">
                                                            </iframe>
                                                        </span>
                                                    </div> -->
                                                </div>


                                                <!-- Side bar lọc -->
                                                <div class="span4 side-grid">
                                                    <div class="ty-sidebox category-menu">
                                                        <h2 class="ty-sidebox__title ty-sidebox__title_product">
                                                            <span class="ty-sidebox__title-wrapper hidden-phone">Bạn muốn mua gì ?</span>
                                                            <i class="fa fa-angle-up" aria-hidden="true" style="float:right; font-size:20px;margin-top: 5px;"></i>
                                                            
                                                        </h2>
                                                        <div class="ty-sidebox__body" id="sidebox_134">
                                                            <ul class="ty-text-links" id="sidebox_134-ul">
                                                            <% ArrayList<NhomSanPham> listNhomsanpham2 = (ArrayList<NhomSanPham>)request.getAttribute("listNhomSP");
                                                            for(NhomSanPham nsp: listNhomsanpham2){%>
                                                                <li class="ty-text-links__item ty-level-1"><a class="ty-text-links__a" href="<%=nsp.getLink()%>?maNSP=<%=nsp.getMaNhomSP()%>"><h2><%=nsp.getTenNhomSP() %></h2></a></li>
                                                            <%} %>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="ty-sidebox" id="fix-ty-sidebox">
                                                        <h2 class="ty-sidebox__title ">
                                                            <span class="ty-sidebox__title-wrapper hidden-phone">Chọn đồ nhanh hơn</span>
                                                            <span class="cm-combination" id="sw_sidebox_29">
                                                                <span class="ty-sidebox__title-wrapper visible-phone">Chọn đồ nhanh hơn</span>
                                                                <span class="ty-sidebox__title-toggle visible-phone">
                                                                    <i class="ty-sidebox__icon-open ty-icon-down-open"></i>
                                                                    <i class="ty-sidebox__icon-hide ty-icon-up-open"></i>
                                                                </span>
                                                            </span>
                                                        </h2>
                                                        <div class="ty-sidebox__body" id="sidebox_29">
                                                            <!-- Inline script moved to the bottom of the page -->
                                                            <div class="cm-product-filters" data-ca-target-id="product_filters_*,products_search_*,category_products_*,product_features_*,breadcrumbs_*,currencies_*,languages_*,selected_filters_*" data-ca-base-url="https://babi.vn/thoi-trang-be-trai-183.html" id="product_filters_29">
                                                                <div class="ty-product-filters__wrapper">
                                                                    <div class="ty-product-filters__block">
                                                                        <div id="sw_content_29_46" class="ty-product-filters__switch cm-combination-filter_29_46 open cm-save-state cm-ss-reverse">
                                                                            <span class="ty-product-filters__title">Độ tuổi</span>
                                                                            <i class="fa fa-angle-down" aria-hidden="true" style="float:right; font-size:20px;"></i>
                                                                        </div>
                                                                        <div class="ty-product-filters hidden" id="content_29_46">
                                                                        	<input id="data-table-input-checkbox" type="hidden" value="">
                                                                        	<table id="table-input-checkbox">
                                                                        	<% ArrayList<DoTuoi> listNhomDoTuoi = (ArrayList<DoTuoi>)request.getAttribute("listNhomDoTuoi");
                                                                        		int n = listNhomDoTuoi.size() / 2;
                                                                        		if( listNhomDoTuoi.size() % 2==0){
	                                                                        		for(int j = 0; j < n; j++ ){%>
		                                                                        		<tr>
		                                                                        			<td><input type="checkbox" name="hobby" value="<%=listNhomDoTuoi.get(j).getMaDoTuoi()%>"/> <label><%= listNhomDoTuoi.get(j).getTuoi()%></label></td>
		                                                                        			<td><input type="checkbox" name="hobby" value="<%=listNhomDoTuoi.get(j+n).getMaDoTuoi()%>"/> <label><%=listNhomDoTuoi.get(j+n).getTuoi() %></label></td>
		                                                                        		</tr>
		                                                                        		<%}
		                                                                        	}else{
		                                                                        		for(int j = 0; j <n; j++ ){%>
		                                                                        		<tr>
		                                                                        			<td><input type="checkbox" name="hobby" value="<%=listNhomDoTuoi.get(j).getMaDoTuoi()%>"/> <label><%= listNhomDoTuoi.get(j).getTuoi()%></label></td>
		                                                                        			<td><input type="checkbox" name="hobby" value="<%=listNhomDoTuoi.get(j+n+1).getMaDoTuoi()%>"/> <label><%=listNhomDoTuoi.get(j+n+1).getTuoi() %></label></td>
		                                                                        		</tr>
		                                                                        	<%}%>
		                                                                        	<tr>
		                                                                        			<td><input type="checkbox" name="hobby" value="<%=listNhomDoTuoi.get(n).getMaDoTuoi()%>"/> <label><%=n%><%= listNhomDoTuoi.get(n).getTuoi()%></label></td>
		                                                                        	</tr>
		                                                                        <%}%>
                                                                        	</table>
                                                                        </div>
                                                                    </div>
                                                                    <div class="ty-product-filters__block">
                                                                    <% String maxGia = (String)request.getAttribute("maxGia"); %>
		                                                                    <div id="sw_content_29_1" class="ty-product-filters__switch cm-combination-filter_29_1 open cm-save-state cm-ss-reverse">
		                                                                            <span class="ty-product-filters__title">Giá</span>
		                                                                    </div>
                                                                        <!-- Inline script moved to the bottom of the page -->
                                                                        <div id="content_29_1" class="cm-product-filters-checkbox-container ty-price-slider  ">
                                                                        	<input type="hidden" class="maMenu" id="maLoc" value="<%=menu.getMaMenu()%>">
	                                                                        <input type="hidden" name="" id="gia-min" value="1">
	                                                                        <input type="hidden" name="" id="gia-max" value="<%=maxGia%>">
	                                                                        <div class="rangeslider">
																		        <input class="min" name="range_1" type="range" min="1" max="<%=maxGia%>" value="1" />
																		        <input class="max" name="range_1" type="range" min="1" max="<%=maxGia%>" value="<%=maxGia%>" />
																		        <input class="range_min light left" value="1"><span><sub style="left: -10px;">.000 đ</sub></span>
																		        <input class="range_max light right" value="<%=maxGia%>"><span class="right-span"><sub>.000 đ</sub></span>
																		    </div>
																		    <input type="text" name="" id="ketqua" style="margin-top: 20px; width: 100%; border:none;">
																		</div>
                                                                	</div>
                                                                </div>

                                                            </div>
                                                            <!--product_filters_29-->
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
          <%@include file="Us_footer.jsp"%>
     