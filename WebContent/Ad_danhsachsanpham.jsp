<%@page import="model.bean.SanPham"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Shop Admin | Danh sách sản phẩm</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="shortcut icon" type="image/png"href="FoderUpLoad/Us_images/power1.png">
<link rel="stylesheet" href="Ad_bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="Ad_bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="Ad_bower_components/Ionicons/css/ionicons.min.css">

<!-- DataTables -->
<link rel="stylesheet" href="Ad_bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="Ad_dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
  folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="Ad_dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet" href="Ad_dist/css/fonts/SourceSansPro.css">

<link rel="stylesheet" href="Ad_dist/css/Ad_hoaiNam.css">
</head>
<body id="body" class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<%@include file="Ad_header.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>Danh sách sản phẩm</h1>
				
				<!-- POPUP_Message  -->
				<div class="popup">
				  <span class="popuptext" id="myPopup_Message"><%=request.getAttribute("thongbao")%></span>
				</div>
				
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-xs-12">
						<div class="row-header">
							<a href="QuanTriThemSanPhamservlet"><button class="btn btn-primary" style="width: 90px;">Thêm mới</button></a>
						</div>
						<div class="box">
							<!-- box-header -->
							<!-- /.box-header -->
							<div class="box-body">
								<table id="example2" class="table table-bordered table-hover">
									<thead>
										<tr>
											<th>STT</th>
											<th>ID</th>
											<th>Tên sản phẩm</th>
											<th>Chi tiết</th>
											<th>Giá</th>
											<th>Giá mới</th>
											<th>Số lượng</th>
											<th></th>
										</tr>
									</thead>
									<tbody>
									<% ArrayList<SanPham> listSP = (ArrayList<SanPham>)request.getAttribute("listSP");
										int i=1;
										for(SanPham sp : listSP){
									%>
										<tr>
											<td><%=i%></td>
											<td class="col-md-1 col-sm-1"><a href="#"><%=sp.getMaSanPham() %></a></td>
											<td class="col-md-2 col-sm-2"><%=sp.getTenSanPham() %></td>
											<td class="col-md-5 col-sm-5"><%=sp.getChiTietSanPham() %></td>
											<td class="col-md-1 col-sm-1"><%=sp.getGia()%>$</td>
											<td class="col-md-1 col-sm-1"><%=sp.getGiaMoi()%>$</td>
											<td class=""><%=sp.getSoLuong()%></td>
											<td class="col-md-2 col-sm-2" style="text-align: center;">
												<a href="QuanTriNhapThemSanPhamServlet?maSP=<%=sp.getMaSanPham()%>" style="padding: 0px 5px; font-size: 16px; color: #00805ee0">
													<i class="fa fa-plus" aria-hidden="true"></i>
												</a>
												<a href="QuanTriSuaSanPhamServlet?maSP=<%=sp.getMaSanPham()%>" style="padding: 0px 5px; font-size: 16px;">
													<i class="fa fa-pencil"></i>
												</a> 
											<a href="QuanTriXoaSanPhamServlet?maSP=<%=sp.getMaSanPham()%>" style="padding: 0px 5px; font-size: 17px; color: red;">
												<i class="fa fa-trash-o"></i>
											</a>	
											</td>
										</tr>
										<%
										i++;
										}
										%>
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

	<!-- AdminLTE App -->
	<script src="Ad_dist/js/adminlte.min.js"></script>

	<!-- DataTables -->
	<script
		src="Ad_bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="Ad_bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script src="Ad_dist/js/pages/dashboard2.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="Ad_dist/js/demo.js"></script>
	<script type="text/javascript" src="Ad_bower_components/chart.js/src/Chart.HoaiNam.js"></script>
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
			});
			
			
		});
		
		/* POPUP  */
		 window.onload = function () {
			myFunction_Message();
		};
		function myFunction_Message() {
			var thongbao = document.getElementById("myPopup_Message").innerHTML;
			if(thongbao != 'null'){
			    var popup = document.getElementById("myPopup_Message");
			    popup.classList.toggle("show");
			}
		};
		$('html,body').on('click',function(){
			$('.popup').hide();
		});
		$(window).scroll(function() {
			$('.popup').hide();
		});
		/*.POPUP  */
		
	</script>
</body>
</html>