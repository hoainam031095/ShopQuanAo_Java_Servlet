<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<link rel="shortcut icon" type="image/png"href="FoderUpLoad/Us_images/power1.png">
<link rel="stylesheet" href="Ad_bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="Ad_bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="Ad_bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="Ad_dist/css/skins/_all-skins.min.css">

<link rel="stylesheet" href="Ad_dist/css/AdminLTE.min.css">

<link rel="stylesheet" href="Ad_dist/css/Ad_hoaiNam.css">
<!-- Google Font -->
<link rel="stylesheet" href="Ad_dist/css/fonts/SourceSansPro.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@include file="Ad_header.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<%
		int nowYear = Calendar.getInstance().get(Calendar.YEAR);
		int nowMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
		%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					Tổng quan tính đến tháng <%=nowMonth%>-<%=nowYear%>
					<!-- <small>Tháng 10</small> -->
				</h1>
				<!-- <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol> -->
			</section>

			<!-- Main content -->
			<section class="content">
				<!-- Info boxes -->
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
							<span class="info-box-icon bg-aqua"><i
								class="fa fa-line-chart"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Doanh số</span> <span
									class="info-box-number">90<small>%</small></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
						<% String soLuongKhachHang = (String)request.getAttribute("soLuongKhachHang"); %>
							<span class="info-box-icon bg-red"><i
								class="ion ion-ios-people-outline"></i></span>
							<div class="info-box-content">
								<span class="info-box-text">Khách hàng</span> 
								<span class="info-box-number"><%=soLuongKhachHang%></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<!-- fix for small devices only -->
					<div class="clearfix visible-sm-block"></div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
						<% String soLuongDonHang = (String)request.getAttribute("soLuongDonHang"); %>
							<span class="info-box-icon bg-green"><i
								class="fa fa-cart-plus" aria-hidden="true"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Đơn hàng</span> <span
									class="info-box-number"><%=soLuongDonHang %></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>

					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="info-box">
						<%String tongDoanhThuCuaNam = (String)request.getAttribute("tongDoanhThuCuaNam");%>
							<span class="info-box-icon  bg-yellow"><i
								class="fa fa-usd" aria-hidden="true"></i></span>

							<div class="info-box-content">
								<span class="info-box-text">Tổng tiền thu được</span> <span
									class="info-box-number"><%=tongDoanhThuCuaNam %>.000<small>đ</small></span>
							</div>
							<!-- /.info-box-content -->
						</div>
						<!-- /.info-box -->
					</div>
					<!-- /.col -->

					<!-- /.col -->
				</div>
				<!-- /.row -->

				<div class="row">
					<div class="col-md-12">
						<div class="box">
							<div class="box-header with-border">
								<h3 class="box-title">Biểu đồ doanh số của shop</h3>
								<select id="yearSelect" style="    border: none; font-size: 17px; font-weight: 600;">
									<%
									for(int i = nowYear-5; i<= nowYear; i++){
									 	if(i == nowYear){%>
										<option value="<%=i%>" selected="selected"><%=i%></option>
										<%}else{ %>
										<option value="<%=i%>"><%=i%></option>
										<%}
									}%>
								</select>
								
								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<!-- <div class="btn-group">
						                  <button type="button" class="btn btn-box-tool dropdown-toggle" data-toggle="dropdown">
						                    <i class="fa fa-wrench"></i></button>
						                  <ul class="dropdown-menu" role="menu">
						                    <li><a href="#">Action</a></li>
						                    <li><a href="#">Another action</a></li>
						                    <li><a href="#">Something else here</a></li>
						                    <li class="divider"></li>
						                    <li><a href="#">Separated link</a></li>
						                  </ul>
						              </div> -->
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
							<%String doanhThuCuaThang = (String)request.getAttribute("doanhThuCuaThang"); %>
								<div class="row">
									<div class="col-md-12">
										<!-- <p class="text-center">
						      				<strong>Tổng quan mua hàng của năm: 2018 so với 2017</strong>
						      			</p> -->
										<div class="chart">
											<span id="dataChartLine" style="display: none;"><%=doanhThuCuaThang%></span>
											<div id="chartContainer" style="height: 300px; width: 100%;"></div>
										</div>
										<!-- /.chart-responsive -->
									</div>
									<!-- <div class="col-md-2">
							      			<div class="progress-group" style="height: 30px;">
							      			</div>
							      			<div class="progress-group">
							      				<i class="fa fa-circle" style="color: rgba(220,220,220,1)"></i><span class="progress-text"> Năm 2017</span>
							      			</div>
							      			/.progress-group
							      			<div class="progress-group">
							      				<i class="fa fa-circle" style="color: rgba(26,154,20,1)"></i><span class="progress-text"> Năm 2018</span>
							      			</div>
							      			/.progress-group
							      			/.progress-group
							      		</div> -->
								</div>
								<!-- /.row -->
							</div>
							<!-- ./box-body -->
							<div class="box-footer">
								<div class="row">
									<div class="col-sm-3 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-green"><i
												class="fa fa-caret-up"></i> 17%</span>
											<h5 class="description-header"><%=tongDoanhThuCuaNam%>.000đ</h5>
											<span class="description-text">Tổng doanh thu</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-3 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-yellow"><i
												class="fa fa-caret-left"></i> 0%</span>
											<h5 class="description-header">1390.000đ</h5>
											<span class="description-text">Tổng chi phí</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-3 col-xs-6">
										<div class="description-block border-right">
											<span class="description-percentage text-green"><i
												class="fa fa-caret-up"></i> 20%</span>
											<h5 class="description-header">5432.000đ</h5>
											<span class="description-text">Tổng lợi nhuận</span>
										</div>
										<!-- /.description-block -->
									</div>
									<!-- /.col -->
									<div class="col-sm-3 col-xs-6">
										<div class="description-block">
											<span class="description-percentage text-red"><i
												class="fa fa-caret-down"></i> 18%</span>
											<h5 class="description-header">$4,813.53</h5>
											<span class="description-text">Tổng kết</span>
										</div>
										<!-- /.description-block -->
									</div>
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-footer -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- Main row -->
				<div class="row">
					<!-- Left col -->
					<div class="col-md-12">
						<!-- MAP & BOX PANE -->
						<div class="box box-success">
							<div class="box-header with-border">
								<h3 class="box-title">Thống kê top 5 khu vực tiêu thụ nhiều</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<div class="row">
									<div class="col-md-5 col-sm-5">
										<div class="pad">
											<div id="world-map-markers" style="height: 325px;">
												<img src="FoderUpLoad/Us_images/ban-do-vet-nam-map-co-lon.jpg"
													style="height: 325px; width: 100%">
											</div>
										</div>
									</div>
									<!-- /.col -->
									<div class="col-md-7 col-sm-7">
									<% 
									String danhSach = (String)request.getAttribute("danhSach");
									String danhSachDonHang = (String)request.getAttribute("danhSachDonHang"); %>
										<span id="data-piechart-string" style="display: none"><%=danhSach %></span> <span
											id="data-piechart-number" style="display: none"><%=danhSachDonHang %></span>
										<div id="piechart" style="width: 600px; height: 360px;"></div>
									</div>
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
						</div>
					</div>
				</div>
				<!-- /.box -->
				<div class="row">
					<div class="col-md-6 col-sm-6">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Nhóm sản phẩm được tiêu thụ nhiều</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>STT</th>
												<th>ID</th>
												<th>Tên nhóm</th>
												<th>Số lượng</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>2</td>
												<td><a href="pages/examples/invoice.html">NH00002</a></td>
												<td class="col-md-6">Áo sơ mi bé trai</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>3</td>
												<td><a href="pages/examples/invoice.html">NH00003</a></td>
												<td class="col-md-6">Áo sơ mi bé trai</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>4</td>
												<td><a href="pages/examples/invoice.html">NH00004</a></td>
												<td class="col-md-6">Áo sơ mi bé trai</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>5</td>
												<td><a href="pages/examples/invoice.html">NH00005</a></td>
												<td class="col-md-6">Áo sơ mi bé trai</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>6</td>
												<td><a href="pages/examples/invoice.html">NH00006</a></td>
												<td class="col-md-6">Áo sơ mi bé trai</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>7</td>
												<td><a href="pages/examples/invoice.html">NH00007</a></td>
												<td class="col-md-6">Áo sơ mi bé trai</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<!-- <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
								<a href="QuanTriDanhSachNhomSanPhamServlet"
									class="btn btn-sm btn-default btn-flat pull-right">Xem tất
									cả</a>
							</div>
							<!-- /.box-footer -->
						</div>
					</div>
					<!-- /.col -->

					<div class="col-md-6">
						<!-- USERS LIST -->
						<div class="box box-danger">
							<div class="box-header with-border">
								<h3 class="box-title">Top khách hàng thường xuyên</h3>

								<div class="box-tools pull-right">
									<span class="label label-success ">8 khách hàng thường
										xuyên</span>
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body no-padding">
								<ul class="users-list clearfix">
									<li><img src="Ad_dist/img/user1-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Alexander Pierce</a> <span
										class="users-list-date">Today</span></li>
									<li><img src="Ad_dist/img/user8-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Norman</a> <span
										class="users-list-date">Yesterday</span></li>
									<li><img src="Ad_dist/img/user7-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Jane</a> <span
										class="users-list-date">12 Jan</span></li>
									<li><img src="Ad_dist/img/user6-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">John</a> <span
										class="users-list-date">12 Jan</span></li>
									<li><img src="Ad_dist/img/user2-160x160.jpg" alt="User Image">
										<a class="users-list-name" href="#">Alexander</a> <span
										class="users-list-date">13 Jan</span></li>
									<li><img src="Ad_dist/img/user5-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Sarah</a> <span
										class="users-list-date">14 Jan</span></li>
									<li><img src="Ad_dist/img/user4-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Nora</a> <span
										class="users-list-date">15 Jan</span></li>
									<li><img src="Ad_dist/img/user3-128x128.jpg" alt="User Image">
										<a class="users-list-name" href="#">Nadia</a> <span
										class="users-list-date">15 Jan</span></li>
								</ul>
								<!-- /.users-list -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer text-center">
								<a href="javascript:void(0)" class="uppercase">Xem tất cả</a>
							</div>
							<!-- /.box-footer -->
						</div>
						<!--/.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->

				<!-- TABLE: LATEST ORDERS -->
				<div class="row">
					<div class="col-md-12">
						<div class="box box-info">
							<div class="box-header with-border">
								<h3 class="box-title">Top sản phẩm được tiêu thụ nhiều</h3>

								<div class="box-tools pull-right">
									<button type="button" class="btn btn-box-tool"
										data-widget="collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-box-tool"
										data-widget="remove">
										<i class="fa fa-times"></i>
									</button>
								</div>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="table-responsive">
									<table class="table no-margin">
										<thead>
											<tr>
												<th>STT</th>
												<th>ID</th>
												<th>Tên sản phẩm</th>
												<th>Giá</th>
												<th>Số lượng</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai 1-6 tuổi sọc caro
													tay dài cá tính</td>
												<td>400 $</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai 1-6 tuổi sọc caro
													tay dài cá tính</td>
												<td>400 $</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai 1-6 tuổi sọc caro
													tay dài cá tính</td>
												<td>400 $</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai 1-6 tuổi sọc caro
													tay dài cá tính</td>
												<td>400 $</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai 1-6 tuổi sọc caro
													tay dài cá tính</td>
												<td>400 $</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai 1-6 tuổi sọc caro
													tay dài cá tính</td>
												<td>400 $</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>
											<tr>
												<td>1</td>
												<td><a href="pages/examples/invoice.html">NH00001</a></td>
												<td class="col-md-6">Áo sơ mi bé trai 1-6 tuổi sọc caro
													tay dài cá tính</td>
												<td>400 $</td>
												<td>
													<div class="sparkbar" data-color="#00a65a" data-height="20">200</div>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
								<!-- /.table-responsive -->
							</div>
							<!-- /.box-body -->
							<div class="box-footer clearfix">
								<!-- <a href="javascript:void(0)" class="btn btn-sm btn-info btn-flat pull-left">Place New Order</a> -->
								<a href="QuanTriDanhSachSanPhamServlet" class="btn btn-sm btn-default btn-flat pull-right">Xem tất
									cả</a>
							</div>
							<!-- /.box-footer -->
						</div>
					</div>
				</div>
				<!-- /.box -->
				<!-- /.row -->
			</section>
			<!-- /.content -->

		</div>
		<%@include file="Ad_footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="Ad_bower_components/jquery/dist/jquery.min.js"></script>
	<script type="text/javascript"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="Ad_bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="Ad_dist/js/adminlte.min.js"></script>
	<script src="Ad_dist/js/demo.js"></script>
	<script type="text/javascript" src="Ad_bower_components/chart.js/src/ChartGoogle/loader.js"></script>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
	<script type="text/javascript" src="Ad_bower_components/chart.js/src/Chart.HoaiNam.js"></script>
	<script type="text/javascript" src="Ad_js/Ad_index.js"></script>
</body>
</html>