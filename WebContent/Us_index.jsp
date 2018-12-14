<%@page import="model.bean.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "Us_header.jsp"%>
			<div class="tygh-content clearfix">
						<div class = "div-slider">
                            <div class = "slider paralax" class="bounceInDown center">
                                <ul class = "blider">
                                    <li>
                                        <div class= "paralax-slider slide1">
                                            <div class = "paralax-text">
                                                <!-- <h3>Welcome to Parallels</h3>
                                                <h4>Clean Responsive Parallax Theme</h4> -->
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class= "paralax-slider slide2">
                                            <div class = "paralax-text">
                                                <!-- <h3>Welcome to Parallels</h3>
                                                <h4>Clean Responsive Parallax Theme</h4> -->
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class= "paralax-slider slide3">
                                            <div class = "paralax-text">
                                                <!-- <h3>Welcome to Parallels</h3>
                                                <h4>Clean Responsive Parallax Theme</h4> -->
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- <style type="text/css">
                        	
                        </style> -->
                    <div class="container-fluid  content-grid">
                        <div class="row-fluid ">                
                            <div class="span16 main-content-grid">

                                <!-- Đồ trẻ em bán chạy -->
                                <div class=" homepage-hotdeals">
                                    <div class="ty-wysiwyg-content"> 
                                        <h2 class="ty-mainbox-simple-title">Đồ trẻ em bán chạy</h2>
                                    </div>
                                </div>
                                <!-- Inline script moved to the bottom of the page -->
                                <!-- Inline script moved to the bottom of the page -->
                                <div class="grid-list">
                                	<% ArrayList<SanPham> listSPbanchay = (ArrayList<SanPham>)request.getAttribute("listSPbanchay");
                                	for(SanPham spbc: listSPbanchay){%>
                                    <div class="ty-column4">
                                    	<%
                                    	int giam = ((spbc.getGia() - spbc.getGiaMoi()) * 100) / spbc.getGia();
                                    	if(giam >=1){
                                    	 %>
	                                    	<div class="giam-gia">
	                                            <img alt="" src="FoderUpLoad/Us_images/hot.png">
	                                            <span>-<%=giam%>%</span>
	                                        </div>
                                        <% }%>    
                                        <div class="ty-grid-list__item ty-quick-view-button__wrapper">
                                            <form action="" method="post" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
                                                <div class="ty-grid-list__image">
                                                    <a href="NguoiDungChonSanPhamServlet?msp=<%=spbc.getMaSanPham()%>">
                                                        <span class="hidden icon-83"></span>
                                                        <span class="babi-icon babi-icon-2"></span>
                                                        <img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=spbc.getImages()%>" width="315" height="315" alt="<%=spbc.getImages() %>" title="<%=spbc.getTenSanPham()%>">
                                                    </a>
                                                </div>
                                                <h3 class="ty-grid-list__item-name">
                                                    <a href="NguoiDungChonSanPhamServlet?msp=<%=spbc.getMaSanPham()%>" class="product-title" title="<%= spbc.getTenSanPham()%>"><%= spbc.getTenSanPham()%></a>    
                                                </h3>    
                                                <div class="ty-grid-list__price ">           
                                                   <span class="cm-reload-22000399268" id="old_price_update_22000399268"></span>
                                                   <span class="cm-reload-22000399268 ty-price-update" id="price_update_22000399268">
                                                    <span class="ty-price" id="line_discounted_price_22000399268">
                                                    	<%if (giam >=1){%>
                                                    		<span style="color:#afa998a8;"><del><%=spbc.getGia()%>.000&nbsp;đ</del></span>&nbsp;
                                                    		
                                                    	<%} %>
	                                                    <span id="sec_discounted_price_22000399268" class="ty-price-num"><%=spbc.getGiaMoi()%>.000</span>&nbsp;
	                                                    <span class="ty-price-num">đ</span>
                                                    </span>
                                                    <!--price_update_22000399268--></span>
                                                </div>
                                                <div class="grid-list__rating">    
                                                </div>
                                                <div class="ty-grid-list__control"></div>
                                            </form>
                                        </div>
                                    </div>
                                    <%} %> 
                                </div>


                                <!-- List Quần áo bé gái -->
                                <div class=" homepage-girl-clothes">
                                    <div class="ty-wysiwyg-content">
                                        <a href="#"><h2 class="ty-mainbox-simple-title">Quần áo bé gái</h2></a>
                                        <div class="ty-mainbox-submenu">
                                            <ul>
                                                <li><a href="#">Đồ bộ trẻ em</a></li>
                                                <li><a href="#">Áo thun</a></li>
                                                <li><a href="#">Áo sơ mi</a></li>
                                                <li><a href="#">Quần cho bé</a></li>
                                                <li><a href="#">Áo khoác</a></li>
                                                <li><a href="#">Đồ tắm</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="grid-list">
                                <%ArrayList<SanPham> listSPbegai = (ArrayList<SanPham>)request.getAttribute("listSPbegai");
                                for(SanPham sp: listSPbegai){%>
                                    <div class="ty-column4">
                                    	<%
                                    	int giam = ((sp.getGia() - sp.getGiaMoi()) * 100) / sp.getGia();
                                    	if(giam >=1){
                                    	 %>
	                                    	<div class="giam-gia">
	                                            <img alt="" src="FoderUpLoad/Us_images/hot.png">
	                                            <span>-<%=giam%>%</span>
	                                        </div>
                                        <% }%>     
                                        <div class="ty-grid-list__item ty-quick-view-button__wrapper">
                                            <form action="https://DolaKids.vn/" method="post" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
                                                <div class="ty-grid-list__image">
                                                    <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>">
                                                        <span class="hidden icon-83"></span>
                                                        <span class="babi-icon babi-icon-2"></span>
                                                        <img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages() %>" width="315" height="315" alt="<%=sp.getImages()%>" title="<%= sp.getMaSanPham()%>">
                                                    </a>
                                                </div>
                                                <h3 class="ty-grid-list__item-name">
                                                    <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>" class="product-title" title="<%=sp.getTenSanPham()%>"><%=sp.getTenSanPham()%></a>    
                                                </h3>    
                                                <div class="ty-grid-list__price ">            
                                                    <span class="cm-reload-110000399271" id="old_price_update_110000399271">
                                                        <!--old_price_update_110000399271-->

                                                    </span>
                                                    <span class="cm-reload-110000399271 ty-price-update" id="price_update_110000399271">
                                                        <span class="ty-price" id="line_discounted_price_110000399271">
                                                        	<%if (giam >=1){%>
                                                    			<span style="color:#afa998a8;"><del><%=sp.getGia()%>.000&nbsp;đ</del></span>&nbsp;
                                                    		<%} %>
                                                            <span id="sec_discounted_price_110000399271" class="ty-price-num"><%=sp.getGiaMoi() %>.000</span>&nbsp;
                                                            <span class="ty-price-num">đ</span>
                                                        </span>
                                                    </span>
                                                </div>
                                                <div class="grid-list__rating">    
                                                </div>
                                                <div class="ty-grid-list__control"></div>
                                            </form>
                                        </div>
                                    </div>
                                    <%} %>  
                                  </div>

                                    <!-- List quần áo bé trai -->
                                    <div class=" homepage-boy-clothes">
                                        <div class="ty-wysiwyg-content">
                                            <a href="#">
                                                <h2 class="ty-mainbox-simple-title">Quần áo bé trai</h2>
                                            </a>
                                            <div class="ty-mainbox-submenu">
                                                <ul>
                                                    <li><a href="#">Đồ tắm</a></li>
                                                    <li><a href="#">Đồ bộ</a></li>
                                                    <li><a href="#">Quần Jeans</a></li>
                                                    <li><a href="#">Quần kiểu</a></li>
                                                    <li><a href="#">Áo khoác</a></li>
                                                    <li><a href="#">Áo thun</a></li>
                                                    <li><a href="#">Áo sơ mi</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grid-list">
                                    <%ArrayList<SanPham> listSPbetrai = (ArrayList<SanPham>)request.getAttribute("listSPbetrai");
                                    for(SanPham sp: listSPbetrai){%>
                                        <div class="ty-column4">
                                        	<%
	                                    	int giam = ((sp.getGia() - sp.getGiaMoi()) * 100) / sp.getGia();
	                                    	if(giam >=1){
	                                    	 %>
		                                    	<div class="giam-gia">
		                                            <img alt="" src="FoderUpLoad/Us_images/hot.png">
		                                            <span>-<%=giam%>%</span>
		                                        </div>
	                                        <% }%>   
                                            <div class="ty-grid-list__item ty-quick-view-button__wrapper">
                                                <form action="#" method="post" name="product_form_117000399268" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
                                                    <div class="ty-grid-list__image">
                                                        <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>">
                                                            <span class="hidden icon-83"></span>
                                                            <span class="babi-icon babi-icon-2"></span>
                                                            <img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages() %>" width="315" height="315" alt="<%=sp.getImages() %>" title="<%=sp.getTenSanPham()%>">
                                                        </a>
                                                    </div>
                                                    <h3 class="ty-grid-list__item-name">
                                                        <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>" class="product-title" title="<%=sp.getTenSanPham()%>"><%=sp.getTenSanPham() %></a>    
                                                    </h3>   
                                                    <div class="ty-grid-list__price ">           
                                                      <span class="cm-reload-117000399268" id="old_price_update_117000399268">
                                                        <!--old_price_update_117000399268--></span>
                                                        <span class="cm-reload-117000399268 ty-price-update" id="price_update_117000399268">
                                                            <span class="ty-price" id="line_discounted_price_117000399268">
                                                            	<%if (giam >=1){%>
	                                                    			<span style="color:#afa998a8;"><del><%=sp.getGia()%>.000&nbsp;đ</del></span>&nbsp;
	                                                    		<%} %>
                                                                <span id="sec_discounted_price_117000399268" class="ty-price-num"><%=sp.getGiaMoi() %>.000</span>&nbsp;
                                                                <span class="ty-price-num">đ</span>
                                                            </span>
                                                        </span>
                                                    </div>
                                                    <div class="grid-list__rating">    
                                                    </div>
                                                    <div class="ty-grid-list__control"></div>
                                                </form>
                                            </div>
                                        </div>
                                        <%} %>
                                     </div>

                                            <!--List Quần áo sơ sinh -->
                                            <div class=" homepage-baby-clothes">
                                                <div class="ty-wysiwyg-content"><a href="https://DolaKids.vn/thoi-trang-so-sinh-182.html">
                                                    <h2 class="ty-mainbox-simple-title">Quần áo sơ sinh</h2></a>
                                                    <div class="ty-mainbox-submenu">
                                                        <ul>
                                                            <li><a href="https://DolaKids.vn/thoi-trang-so-sinh-182/quan-ao-so-sinh-be-gai.html">Quần sơ sinh bé gái</a></li>
                                                            <li><a href="https://DolaKids.vn/thoi-trang-so-sinh-182/quan-ao-so-sinh-be-trai.html">Quần sơ sinh bé trai</a></li>
                                                            <li><a href="https://DolaKids.vn/thoi-trang-so-sinh-182/phu-kien-so-sinh-216.html">Phụ kiện sơ sinh</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="grid-list">
                                            	<%ArrayList<SanPham> listSPsosinh = (ArrayList<SanPham>)request.getAttribute("listSPsosinh");
                                            	 for(SanPham sp:listSPsosinh){%>
                                                <div class="ty-column4">
                                                	<%
			                                    	int giam = ((sp.getGia() - sp.getGiaMoi()) * 100) / sp.getGia();
			                                    	if(giam >=1){
			                                    	 %>
				                                    	<div class="giam-gia">
				                                            <img alt="" src="FoderUpLoad/Us_images/hot.png">
				                                            <span>-<%=giam%>%</span>
				                                        </div>
			                                        <% }%>    
                                                    <div class="ty-grid-list__item ty-quick-view-button__wrapper">
                                                        <form action="https://DolaKids.vn/" method="post" name="product_form_118000399219" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
                                                            <div class="ty-grid-list__image">
                                                                <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>">
                                                                    <span class="hidden icon-83"></span><span class="babi-icon babi-icon-2"></span>
                                                                    <img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages() %>" width="315" height="315" alt="<%=sp.getImages() %>" title="<%=sp.getTenSanPham()%>">
                                                                </a>
                                                            </div>
                                                            <h3 class="ty-grid-list__item-name">
                                                                <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>" class="product-title" title="<%=sp.getTenSanPham() %>"><%=sp.getTenSanPham() %></a>    
                                                            </h3>    
                                                            <div class="ty-grid-list__price ">            
                                                                <span class="cm-reload-118000399219" id="old_price_update_118000399219">
                                                                </span>
                                                                <span class="cm-reload-118000399219 ty-price-update" id="price_update_118000399219">
                                                                    <span class="ty-price" id="line_discounted_price_118000399219">
                                                                    <%if (giam >=1){%>
		                                                    			<span style="color:#afa998a8;"><del><%=sp.getGia()%>.000&nbsp;đ</del></span>&nbsp;
		                                                    		<%} %>
                                                                    <span id="sec_discounted_price_118000399219" class="ty-price-num"><%=sp.getGiaMoi() %>.000</span>&nbsp;
                                                                    <span class="ty-price-num">đ</span></span>
                                                                </span>
                                                            </div>
                                                            <div class="grid-list__rating">    
                                                            </div>
                                                            <div class="ty-grid-list__control"></div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <%} %>
                                            </div>

                                            <!-- List Phụ kiện thời trang trẻ em -->
                                            <div class=" homepage-accessories">
                                                <div class="ty-wysiwyg-content"><a href="https://DolaKids.vn/phu-kien.html">
                                                    <h2 class="ty-mainbox-simple-title">Phụ kiện thời trang trẻ em</h2></a>
                                                    <div class="ty-mainbox-submenu">
                                                        <ul>
                                                            <li><a href="https://DolaKids.vn/phu-kien/giay-dep-207.html">Giày dép</a></li>
                                                            <li><a href="https://DolaKids.vn/do-dung-cho-be/be-khoe-and-an-toan/tat-vo-cho-be.html">Tất chân</a></li>
                                                            <li><a href="https://DolaKids.vn/phu-kien/ba-lo-189.html">Balo</a></li>
                                                            <li><a href="https://DolaKids.vn/phu-kien/chan-khan-211.html">Chăn khăn</a></li>
                                                            <li><a href="https://DolaKids.vn/phu-kien/ao-mua-214.html">Áo mưa</a></li>
                                                            <li><a href="https://DolaKids.vn/phu-kien/quan-chip-206.html">Quần chíp</a></li>
                                                            <li><a href="https://DolaKids.vn/phu-kien/kep-toc-188.html">Kẹp tóc</a></li>
                                                            <li><a href="https://DolaKids.vn/phu-kien/mat-kinh-222.html">Mắt kính</a></li>
                                                            <li><a href="https://DolaKids.vn/do-dung-cho-be/be-ra-ngoai/non-khau-trang-mat-kinh.html">Nón</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="grid-list">
                                            	<%ArrayList<SanPham>listSPphukien = (ArrayList<SanPham>)request.getAttribute("listSPphukien");
                                            	for(SanPham sp :listSPphukien){%>
                                                <div class="ty-column4">
	                                                <%
				                                    	int giam = ((sp.getGia() - sp.getGiaMoi()) * 100) / sp.getGia();
				                                    	if(giam >=1){
				                                    	 %>
					                                    	<div class="giam-gia">
					                                            <img alt="" src="FoderUpLoad/Us_images/hot.png">
					                                            <span>-<%=giam%>%</span>
					                                        </div>
				                                        <% }%>     
                                                    <div class="ty-grid-list__item ty-quick-view-button__wrapper">
                                                        <form action="" method="post" name="product_form_77000397256" class="cm-disable-empty-files  cm-ajax cm-ajax-full-render cm-ajax-status-middle  cm-processed-form">
                                                            <div class="ty-grid-list__image">
                                                                <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>">
                                                                    <span class="hidden icon-83"></span><span class="babi-icon babi-icon-2"></span>
                                                                    <img class="ty-pict" src="FoderUpLoad/Us_images/SanPham/<%=sp.getImages() %>" width="315" height="315" alt="<%=sp.getImages() %>" title="<%=sp.getTenSanPham()%>">
                                                                </a>
                                                            </div>
                                                            <h3 class="ty-grid-list__item-name">
                                                                <a href="NguoiDungChonSanPhamServlet?msp=<%=sp.getMaSanPham()%>" class="product-title" title="<%=sp.getTenSanPham()%>"><%=sp.getTenSanPham()%></a>    
                                                            </h3>    
                                                            <div class="ty-grid-list__price ">            
                                                                <span class="cm-reload-77000397256" id="old_price_update_77000397256">
                                                                    <!--old_price_update_77000397256--></span>
                                                                    <span class="cm-reload-77000397256 ty-price-update" id="price_update_77000397256">
                                                                        <span class="ty-price" id="line_discounted_price_77000397256">
                                                                        <%if (giam >=1){%>
			                                                    			<span style="color:#afa998a8;"><del><%=sp.getGia()%>.000&nbsp;đ</del></span>&nbsp;
			                                                    		<%} %>
                                                                        <span id="sec_discounted_price_77000397256" class="ty-price-num"><%=sp.getGiaMoi()%>.000</span>&nbsp;
                                                                        <span class="ty-price-num">đ</span>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                            <div class="grid-list__rating">    
                                                            </div>
                                                            <div class="ty-grid-list__control"></div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <%} %>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
		<%@include file="Us_footer.jsp"%>