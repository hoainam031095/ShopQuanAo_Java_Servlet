<%@page import="model.bean.SanPham"%>
<%@page import="model.bean.NhaCungCap"%>
<%@page import="Common.StringProcess"%>
<%@page import="model.bean.DoTuoi"%>
<%@page import="model.bean.NhomSanPham"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="shortcut icon" type="image/png"
	href="FoderUpLoad/Us_images/power1.png">
<link rel="stylesheet"
	href="Ad_bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="Ad_bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="Ad_bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="Ad_dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="Ad_bower_components/jvectormap/jquery-jvectormap.css">

<link rel="stylesheet"
	href="Ad_bower_components/select2/dist/css/select2.min.css">

<link rel="stylesheet" href="Ad_dist/css/AdminLTE.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet" href="Ad_dist/css/fonts/SourceSansPro.css">

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@include file="Ad_header.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Sửa thông tin sản phẩm</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<!-- left column -->
					<div class="col-md-offset-1 col-md-10 col-xs-10 col-xs-offset-1">
						<!-- general form elements -->
						<div class="box box-primary" style="padding: 40px;">
							<div class="box-header with-border">
								<h3 class="box-title">Sửa thông tin sản phẩm</h3>
							</div>
							<!-- /.box-header -->
							<!-- form start -->
							<form action="QuanTriNhapThemSanPhamServlet">
								<%
									SanPham sp = (SanPham)request.getAttribute("sp");
								%>
								<div class="box-body">
									<input type="text" name="maSanPham" value="<%=sp.getMaSanPham()%>">
									<input type="text" name="giaBan" value="<%=sp.getGiaMoi()%>">
									<div class="form-group"">
										<table>
											<tr>
												<td class="muc">Mã sản phẩm:</td>
												<td class="tt"><%=sp.getMaSanPham()%></td>
											</tr>
											<tr>
												<td class="muc">Tên sản phẩm:</td>
												<td class="tt"><%=sp.getTenSanPham()%></td>
											</tr>
										</table>
									</div>
									<div class="form-group"">
										<label for="selectNhaCungCap">Nhà cung cấp:</label> <select
											id="selectNhaCungCap" class="form-control select2"
											name="nhaCungCap">
											<%
												ArrayList<NhaCungCap> listNCC = (ArrayList<NhaCungCap>) request.getAttribute("listNCC");
												for (NhaCungCap ncc : listNCC) {
											%>

											<option value="<%=ncc.getMaNhaCungCap()%>"><%=ncc.getTenNhaCungCap()%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="form-group"">
										<label for="inputSoLuong">Số lượng:</label> 
										<input type="number" id="inputSoLuong" class="form-control" name="soLuong" placeholder="VD: 100">
									</div>
								</div>
								<!-- /.box-body -->
								<div class="box-footer">
									<button class="btn btn-danger"
										style="margin-right: 10px; width: 80px;">Hủy</button>
									<button type="submit" class="btn btn-primary" name="subMit"
										value="submit" style="width: 80px;">Nhập</button>
								</div>
							</form>
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col-md-12-->
				</div>
				<!-- /.box-body -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@include file="Ad_footer.jsp"%>

	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="Ad_bower_components/jquery/dist/jquery.min.js"></script>
	<script src="Ad_bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="Ad_bower_components/fastclick/lib/fastclick.js"></script>
	<script src="Ad_dist/js/adminlte.min.js"></script>
	<script
		src="Ad_bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<script
		src="Ad_bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>


	<!-- Form nhập -->
	<script src="Ad_bower_components/select2/dist/js/select2.full.min.js"></script>

	<!-- AdminLTE for demo purposes -->
	<script src="Ad_dist/js/demo.js"></script>
	<script type="text/javascript"
		src="Ad_bower_components/chart.js/src/Chart.HoaiNam.js"></script>

</body>
</html>
