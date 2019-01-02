<%@page import="model.bean.NhaCungCap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Danh sách nhà cung cấp</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="shortcut icon" type="image/png"href="FoderUpLoad/Us_images/power1.png">
<link rel="stylesheet"
	href="Ad_bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="Ad_bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="Ad_bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="Ad_dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="Ad_bower_components/jvectormap/jquery-jvectormap.css">
<!-- Table -->
<link rel="stylesheet"
	href="Ad_bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">

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
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Danh sách nhà cung cấp</h1>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="row-header">
							<button class="btn btn-primary" style="width: 90px;">Thêm mới</button>
						</div>
						<div class="box">
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>STT</th>
											<th>ID</th>
											<th>Tên nhà cung cấp</th>
											<th>Địa Chỉ</th>
											<th>Số điện thoại</th>
											<th>Email</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									<% ArrayList<NhaCungCap> listNCC = (ArrayList<NhaCungCap>)request.getAttribute("listNCC");
									int i = 1;
									for(NhaCungCap ncc: listNCC){%>
										<tr>
											<td><%=i%></td>
											<td class="col-md-1 col-sm-1"><%=ncc.getMaNhaCungCap()%></td>
											<td class="col-md-2 col-sm-2"><%=ncc.getTenNhaCungCap() %></td>
											<td class="col-md-4 col-sm-4"><%=ncc.getDiaChi() %></td>
											<td class="col-md-2 col-sm-2"><%=ncc.getSoDienThoai() %></td>
											<td class="col-md-2 col-sm-2"><%=ncc.getEmail()%></td>
											<td class="col-md-1 col-sm-1" style="text-align: center;">
												<a href="QuanTriSuaNhaCungCapServlet?maKH=<%=ncc.getMaNhaCungCap() %>" style="padding: 0px 5px; font-size: 16px;">
													<i class="fa fa-pencil"></i>
											</a> <a href="QuanTriXoaNhaCungCapServlet?maKH=<%=ncc.getMaNhaCungCap() %>"
												style="padding: 0px 5px; font-size: 17px; color: red;"><i
													class="fa fa-trash-o"></i></a>
											</td>
										</tr>
										
										<% i++; } %>
									</tbody>
									<!-- <tfoot>
                <tr>
                  <th>Rendering engine</th>
                  <th>Browser</th>
                  <th>Platform(s)</th>
                  <th>Engine version</th>
                  <th>CSS grade</th>
                </tr>
              </tfoot> -->
								</table>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<%@include file="Ad_footer.jsp"%>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="Ad_bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="Ad_bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- FastClick -->
	<script src="Ad_bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="Ad_dist/js/adminlte.min.js"></script>
	<!-- Sparkline -->
	<script
		src="Ad_bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
	<!-- jvectormap  -->
	<script src="Ad_plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="Ad_plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<!-- SlimScroll -->
	<script
		src="Ad_bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
	<!-- DataTables -->
	<script
		src="Ad_bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="Ad_bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="Ad_dist/js/pages/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="Ad_dist/js/demo.js"></script>

	<script type="text/javascript"
		src="Ad_bower_components/chart.js/src/Chart.HoaiNam.js"></script>
	<script>
		$(function() {
			$('#example1').DataTable()
			$('#example2').DataTable({
				'paging' : true,
				'lengthChange' : false,
				'searching' : false,
				'ordering' : true,
				'info' : true,
				'autoWidth' : false
			})
		})
	</script>
</body>
</html>