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
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="shortcut icon" type="image/png"href="FoderUpLoad/Us_images/power1.png">
  <link rel="stylesheet" href="Ad_bower_components/bootstrap/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="Ad_bower_components/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="Ad_bower_components/Ionicons/css/ionicons.min.css">
  <link rel="stylesheet" href="Ad_dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="Ad_bower_components/jvectormap/jquery-jvectormap.css">

  <link rel="stylesheet" href="Ad_bower_components/select2/dist/css/select2.min.css">

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
<%@include file="Ad_header.jsp" %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Thêm sản phẩm mới
      </h1>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-offset-1 col-md-10 col-xs-10 col-xs-offset-1">
          <!-- general form elements -->
          <div class="box box-primary" style="padding: 40px;">
            <div class="box-header with-border">
              <h3 class="box-title">Nhập thông tin sản phẩm</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form role="form" action="QuanTriThemSanPhamservlet" method="post" enctype="multipart/form-data">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputTenSanPham">Tên sản phẩm:</label>
                  <input type="text"  id="inputTenSanPham" class="form-control" name="tenSanPham" placeholder="VD: Áo sơ mi cho bé trai tay dài phối túi">
                </div>
                <div class="form-group">
                  <label for="inputChiTietSanPham">Chi tiết sản phẩm:</label>
                  <!-- <input type="textarea" class="form-control" placeholder="Tên sản phẩm" id="inputChiTietSanPham"> -->
                  <textarea id ="inputChiTietSanPham" class="form-control" name="chiTietSanPham" placeholder="VD: Áo sơ mi cho bé trai tay dài phối túi - Phù hợp cho các bé từ 1 đến 7 tuổi thích phong cách lịch lãm của sản phẩm áo sơ mi mang lại." id="inputChiTietSanPham" rows="5" style="resize: none;"></textarea>
                </div>
                <div>
	                <div class="col-sm-5" style="padding-left: 0px;">
		                <div class="form-group"">
			                  <label for="inputSoLuong">Số lượng:</label>
			                  <input type="number" id="inputSoLuong" class="form-control" name="soLuong" placeholder="VD: 1">
		                </div>
		                <div class="form-group"">
		                  <label for="inputGiaBan">Giá bán:</label>
		                  <input type="text" id="inputGiaBan" class="form-control" name="giaBan" placeholder="VD: 400">
		                </div>
		                <div class="form-group"">
		                  <label for="inputOrder">Order:</label>
		                  <input type="text" id="inputOrder" class="form-control" name="orDer" placeholder="VD: 1">
		                </div>
		                <div class="form-group"">
		                  <label for="selectNhomSanPham">Nhóm sản phẩm:</label>
		                 <select id="selectNhomSanPham" class="form-control select2" name="nhomSanPham">
		                    <% ArrayList<NhomSanPham> listNSP = (ArrayList<NhomSanPham>)request.getAttribute("listNSP");
		                    	for(NhomSanPham nsp : listNSP)
		                    	{
		                    %>
				                    
				                    <option value="<%=nsp.getMaNhomSP()%>"><%=nsp.getTenNhomSP()%></option>
				                <%}%>
		                  </select>
		                </div>
		                <div class="form-group"">
		                  <label for="selectNhaCungCap">Nhà cung cấp:</label>
		                 <select id="selectNhaCungCap" class="form-control select2" name="nhaCungCap">
		                    <% ArrayList<NhaCungCap> listNCC = (ArrayList<NhaCungCap>)request.getAttribute("listNCC");
		                    	for(NhaCungCap ncc : listNCC)
		                    	{
		                    %>
				                    
				                    <option value="<%=ncc.getMaNhaCungCap()%>"><%=ncc.getTenNhaCungCap()%></option>
				                <%}%>
		                  </select>
		                </div>
		                <div class="form-group">
		                  <label for="exampleInputFile">Chọn ảnh:</label>
		                  <input type="file" id="exampleInputFile" name="fileName">
		                  <!-- <p class="help-block">Example block-level help text here.</p> -->
		                </div>
	                </div>
	                <div class="col-sm-7" style="padding-right: 0px;">
	                	<div class="form-group">
	                		<input type="hidden" id="selectDoTuoiPhuHop" value="" name="nhomDoTuoi">
		                  <label>Độ tuổi phù hợp:</label>
			                	<table class="table table-bordered" id="table-input-checkbox">
			                		<thead>
										<tr>
											<th></th>
											<th>Độ tuổi</th>
											<th>Chiều cao</th>
											<th>Cân nặng</th>
											<th>Size</th>
										</tr>
									</thead>
									<tbody>
									<% ArrayList<DoTuoi> listDoTuoi = (ArrayList<DoTuoi>)request.getAttribute("listDoTuoi");
				                    	for(DoTuoi dt : listDoTuoi)
				                    	{
				                    %> 
				                		<tr>
				                			<td><input type="checkbox" name="hobby" value="<%=dt.getMaDoTuoi()%>"/></td>
				                			<td><%=StringProcess.getVaildString(dt.getTuoi())%></td>
				                			<td><%=StringProcess.getVaildString(dt.getChieuCao()) %></td>
				                			<td><%=StringProcess.getVaildString(dt.getTrongLuong()) %></td>
				                			<td><%=StringProcess.getVaildString(dt.getSize()) %></td>
				                		</tr>
				                	<%}%>
				                	</tbody>
			                	</table>
		                </div>
		                
	                </div>
	            </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button class="btn btn-danger" style="margin-right:10px; width: 80px;">Hủy</button>
                <button type="submit" class="btn btn-primary" name="subMit" value="submit" style="width: 80px;">Thêm</button>
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
<script src="Ad_bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<script src="Ad_bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>


<!-- Form nhập -->
<script src="Ad_bower_components/select2/dist/js/select2.full.min.js"></script>

<!-- AdminLTE for demo purposes -->
<script src="Ad_dist/js/demo.js"></script>
<script type="text/javascript" src="Ad_bower_components/chart.js/src/Chart.HoaiNam.js"></script>
<script type="text/javascript">
		                function resuftCheckBox(){
		            		var checkbox = document.getElementsByName('hobby');
		            	    var result = "";
		            	        // Lặp qua từng checkbox để lấy giá trị
		            	    for (var i = 0; i < checkbox.length; i++){
		            	       if (checkbox[i].checked === true){
		            	          result += checkbox[i].value + " ";
		            	       }
		            	     }
		            	    // In ra kết quả
		            	    $('#selectDoTuoiPhuHop').val(result.trim());
		            	}
		            	$('#table-input-checkbox input').on('click',function(){
		            		resuftCheckBox();
		            	});
</script>
</body>
</html>
