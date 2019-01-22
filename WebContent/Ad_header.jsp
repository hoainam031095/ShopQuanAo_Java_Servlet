<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header class="main-header">
	
	<%HttpSession ss = request.getSession();
		if(ss.getAttribute("Ten") == null){response.sendRedirect("DangXuatServlet");return;}
	%>
	<script type="text/javascript">
		sessionStorage.setItem('ssStQuyen', <%=ss.getAttribute("Quyen")%>);
	</script>
      <!-- Logo -->
      <a href="QuanTriTrangChuServlet" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><b>K</b>en</span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg"><b>Shop </b>Admin</span>
      </a>

      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <!-- Messages: style can be found in dropdown.less-->
            <li class="dropdown messages-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-envelope-o"></i>
                <span class="label label-success">4</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">Bạn có 4 tin nhắn</li>
                <li>
                  <!-- inner menu: contains the actual data -->
                  <ul class="menu">
                    <li><!-- start message -->
                      <a href="#">
                        <div class="pull-left">
                          <img src="Ad_dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          Nguyễn Văn A
                          <small><i class="fa fa-clock-o"></i> 5 mins</small>
                        </h4>
                        <p>Why not buy a new awesome theme?</p>
                      </a>
                    </li>
                    <li><!-- start message -->
                      <a href="#">
                        <div class="pull-left">
                          <img src="Ad_dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                        </div>
                        <h4>
                          Nguyễn Văn B
                          <small><i class="fa fa-clock-o"></i> 5 mins</small>
                        </h4>
                        <p>Tại sao không mua một chủ đề mới tuyệt vời?</p>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="footer"><a href="#">Xem tất cả tin nhắn</a></li>
              </ul>
            </li>
            <!-- Notifications: style can be found in dropdown.less -->
            <li class="dropdown notifications-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <i class="fa fa-bell-o"></i>
                <span class="label label-warning">10</span>
              </a>
              <ul class="dropdown-menu">
                <li class="header">Bạn có 10 thông báo</li>
                <li>
                  <!-- inner menu: contains the actual data -->
                  <ul class="menu">
                    <li>
                      <a href="#">
                        <i class="fa fa-users text-aqua"></i> 5 thành viên mới đã tham gia hôm nay
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-warning text-yellow"></i> Mô tả rất dài ở đây có thể không phù hợp với
                                               trang và có thể gây ra vấn đề về thiết kế
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-users text-red"></i> 5 thành viên mới đã tham gia
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-shopping-cart text-green"></i> 25 doanh số bán hàng được thực hiện
                      </a>
                    </li>
                    <li>
                      <a href="#">
                        <i class="fa fa-user text-red"></i> Bạn đã thay đổi tên người dùng của mình
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="footer"><a href="#">Xem tất cả</a></li>
              </ul>
            </li>
            <!-- User Account: style can be found in dropdown.less -->
            
             <% if(ss.getAttribute("Ten") == null){ %>
              	<li class="dropdown user user-menu">
             		 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height: 50px;">
                		<img src="Ad_dist/img/anonymous.jpg" class="user-image" alt="Image">
                	 </a>
              		<ul class="dropdown-menu">
              			<li class="user-header">
                  			<img src="Ad_dist/img/anonymous.jpg" class="img-circle" alt="Image">
                  		</li>
                  	</ul>
                </li>
                <%}else if(ss.getAttribute("Image") == null){ %>
                		<li class="dropdown user user-menu">
             				 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height: 50px;">
                					<img src="Ad_dist/img/user3-128x128.jpg" class="user-image" alt="Image">
                					<span class="hidden-xs"><%= ss.getAttribute("Ten") %></span>
		                	 </a>
		              		<ul class="dropdown-menu">
		              			<li class="user-header">
		                  			<img src="Ad_dist/img/user3-128x128.jpg" class="img-circle" alt="Image">
		                			<p>
					                    <%=ss.getAttribute("Ten")%>
					                    <small> -- Web developer -- </small>
				                  	</p>
		                  		</li>
		                  		<li class="user-footer">
					                <div class="pull-left">
					                  <a href="#" class="btn btn-default btn-flat">Hồ sơ</a>
					                </div>
					                <div class="pull-right">
					                  <a href="DangXuatServlet" class="btn btn-default btn-flat">Đăng xuất</a>
					                </div>
				              	</li>
		                  	</ul>
		                 </li>
	                	<%}else{ %>
	                			<li class="dropdown user user-menu">
		             				 <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="height: 50px;">
		                					<img src="Ad_images/taikhoan/<%=ss.getAttribute("Image")%>" class="user-image" alt="Image">
			                				<span class="hidden-xs"><%= ss.getAttribute("Ten") %></span>
				                	 </a>
				              		<ul class="dropdown-menu">
				              			<li class="user-header">
				                  			<img src="Ad_images/taikhoan/<%=ss.getAttribute("Image")%>" class="img-circle" alt="Image">
			                				<p>
							                    <%=ss.getAttribute("Ten")%>
							                    <small> -- Web developer -- </small>
						                  	</p>
				                  		</li>
				                  		<li class="user-footer">
							                <div class="pull-left">
							                  <a href="#" class="btn btn-default btn-flat">Hồ sơ</a>
							                </div>
							                <div class="pull-right">
							                  <a href="DangXuatServlet" class="btn btn-default btn-flat">Đăng xuất</a>
							                </div>
						              	</li>
				                  	</ul>
		                 		</li>
	                			<%}%>
	                			
	         
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
        <li>
          <a href="KhachHangTrangChuServlet">
            <i class="fa fa-home"></i><span>Trang chủ</span>
          </a>
        </li>
        <li>
          <a href="QuanTriTrangChuServlet">
            <i class="fa fa-dashboard"></i> <span>Tổng quan</span>
          </a>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-product-hunt"></i> <span>Sản phẩm</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="QuanTriThemSanPhamservlet"><i class="fa fa-plus"></i></i> Thêm sản phẩm</a></li>
            <li><a href="QuanTriDanhSachSanPhamServlet"><i class="fa fa-list"></i> Danh sách sản phẩm</a></li>
            <li><a href="QuanTriThemNhomSanPhamServlet"><i class="fa fa-plus"></i></i> Thêm nhóm sản phẩm</a></li>
            <li><a href="QuanTriDanhSachNhomSanPhamServlet"><i class="fa fa-list-alt"></i> Danh sách nhóm sản phẩm</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-cart-arrow-down"></i> <span>Nhập hàng</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html"><i class="fa fa-plus"></i> Nhập thêm</a></li>
            <li><a href="QuanTriDanhSachChiTietHoaDonNhapServlet"><i class="fa fa-list-alt"></i> Kiểm tra nhập hàng</a></li>
          </ul>
        </li>
        <li>
          <a href="QuanTriDanhSachHoaDonBanServlet">
            <i class="fa fa-files-o"></i><span>Đơn đặt hàng</span>
          </a>
        </li>
        <li>
          <a href="QuanTriDanhSachNhaCungCapServlet">
            <i class="fa fa-users"></i> <span>Nhà cung cấp</span>
          </a>
        </li>
        <!-- <li>
          <a href="pages/calendar.html">
            <i class="fa fa-bar-chart"></i> <span>Doanh số</span>
          </a>
        </li> -->
        <% if(ss.getAttribute("Quyen").equals("1")){%>
	        <li class="treeview">
	          <a href="#">
	            <i class="fa fa-usd" aria-hidden="true"></i> <span>Lợi nhuận</span>
	            <span class="pull-right-container">
	              <i class="fa fa-angle-left pull-right"></i>
	            </span>
	          </a>
	          <ul class="treeview-menu">
	            <li><a href="pages/tables/simple.html"><i class="fa fa-line-chart"></i> Thống kê</a></li>
	            <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i> Chi</a></li>
	            <li><a href="pages/tables/simple.html"><i class="fa fa-circle-o"></i> Thu</a></li>
	          </ul>
	        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-user"></i> <span>Người dùng</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="pages/tables/simple.html"><i class="fa fa-plus"></i> Thêm tài khoản</a></li>
            <li><a href="DanhSachTaiKhoanServlet"><i class="fa fa-address-book"></i> Danh sách</a></li>
          </ul>
        </li>
        <%}else{ %>
	        <%} %>
        <li>
          <a href="pages/calendar.html">
            <i class="fa fa-calendar"></i> <span>Công việc</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-red">3</small>
              <small class="label pull-right bg-blue">17</small>
            </span>
          </a>
        </li>
        <li>
          <a href="pages/mailbox/mailbox.html">
            <i class="fa fa-envelope"></i> <span>Hộp thư</span>
            <span class="pull-right-container">
              <small class="label pull-right bg-yellow">12</small>
              <small class="label pull-right bg-green">16</small>
              <small class="label pull-right bg-red">5</small>
            </span>
          </a>
        </li>
        <li><a href="https://adminlte.io/docs"><i class="fa fa-book"></i> <span>Tài liệu</span></a></li>
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>