$(document).ready(function() {
	$('#select-tinh').change(function(){
		$.ajax({
			url:'NguoiDungSelectDiaChiServlet',
			data:{
				select:"selectTinh",
				maTinh: $('#select-tinh').val().trim()
			},
			success: function(responseText){
				$('#select-huyen').html(responseText);
			}
		});
	});
	$('#select-huyen').change(function(){
		$.ajax({
			url:'NguoiDungSelectDiaChiServlet',
			data:{
				select:"selectHuyen",
				maHuyen: $('#select-huyen').val().trim()
			},
			success: function(responseText){
				$('#select-xa').html(responseText);
			}
		});
	});
//	VALIDATE xác nhận địa chỉ nhận hàng
	$(".thong-tin-nguoi-nhan-popup").on('click',function(){
		$("#them-themtenlienhe").val('');
		$("#them-sodienthoai").val('');
		$('#select-tinh').prop('selectedIndex',0);
		$('#select-huyen').html('<option value="">-- Chọn Quận/Huyện --</option>');
		$('#select-xa').html('<option value="">-- Chọn Phường/Xã --</option>');
		$("#them-diachi-cuthe").val('');
		$(".validate").prop( "disabled", true );
		$(".validate").addClass("styleDisabled");
		$("#them-error-name").html("Trường bắt buộc!");
		$("#them-error-phone").html("Trường bắt buộc!");
		$("#them-error-tinh").html("Trường bắt buộc!");
		$("#them-error-huyen").html("Trường bắt buộc!");
		$("#them-error-xa").html("Trường bắt buộc!");
		$("#them-error-diachicuthe").html("Trường bắt buộc!");
	});
	function checkvalidate() {

		var a, b, c, d, e, f = 0;
		
//		if(($("#gvtg-thoigian").val().trim()!='') && ($("#gvtg-thoigian").val().trim().match(/^[0-9]+$/)))c=1;
//		else c=0;
		
		if(($("#them-themtenlienhe").val().trim()!='')
				&&($("#them-themtenlienhe").val().trim().match(/^[a-zA-Z_ ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/))
				&&($("#them-themtenlienhe").val().trim().length >= 2)) a=1;
		else a=0;
		
		if(($("#them-sodienthoai").val().trim()!='')&&($("#them-sodienthoai").val().trim().match(/^\+?\d{1,4}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/))) b=1;
		else b=0;
		
		if($("#select-tinh").val().trim()!='') c=1;
		else c=0;
		
		if($("#select-huyen").val().trim()!='') d=1;
		else d=0;
		
		if($("#select-xa").val().trim()!='') e=1;
		else e=0;
		
		if(($("#them-diachi-cuthe").val().trim()!='')&&($("#them-diachi-cuthe").val().trim().length >= 5)) f=1;	
		else f=0;
		
		if(a==0 || b==0 || c==0 || d==0 || e==0 || f==0) return false;
		else return true;
	}
	$(".check-input ").keyup(function() {
		if(checkvalidate() == true){	
			$(".validate").prop( "disabled", false );
			$(".validate").removeClass("styleDisabled");
		}
		else {
			$(".validate").prop( "disabled", true );
			$(".validate").addClass("styleDisabled");
		}
	});
	$(".change-input ").change(function() {
		if(checkvalidate() == true){
			$(".validate").prop( "disabled", false );
			$(".validate").removeClass("styleDisabled");
		}
		else {
			$(".validate").prop( "disabled", true );
			$(".validate").addClass("styleDisabled");
		}
	});
	
	//phan loai error
	$("#them-themtenlienhe").keyup(function() {
		if($("#them-themtenlienhe").val().trim()==''){
			$("#them-error-name").html("Tên không được để trống!");
			return;
		}
		else
			if($("#them-themtenlienhe").val().trim().length < 2){
				$("#them-error-name").html("Tên quá ngắn!");
				return;
			}
			else
				if($("#them-themtenlienhe").val().trim().match(/^[a-zA-Z_ ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+$/))
					{$("#them-error-name").html("");return}	
				else $("#them-error-name").html("Tên không hợp lệ!");
	});
	$("#them-sodienthoai").keyup(function() {
		if($("#them-sodienthoai").val().trim()==''){
			$("#them-error-phone").html("Số điện thoại không được để trống!");
			return;
		}
		else
			if($("#them-sodienthoai").val().trim().match(/^\+?\d{1,4}?[- .]?\(?(?:\d{2,3})\)?[- .]?\d\d\d[- .]?\d\d\d\d$/)){
				$("#them-error-phone").html("");
				return;
			}
			else $("#them-error-phone").html("Số điện thoại không hợp lệ!");
	});
	$("#select-tinh").change(function() {
		if($("#select-tinh").val().trim()==''){
			$("#them-error-tinh").html("Bạn phải chọn tỉnh thành!");
			return;
		}
		else
			$("#them-error-tinh").html("");
	});
	$("#select-huyen").change(function() {
		if($("#select-huyen").val().trim()==''){
			$("#them-error-huyen").html("Bạn phải chọn quận huyện!");
			return;
		}
		else
			$("#them-error-huyen").html("");
	});
	
	$("#select-xa").change(function() {
		if($("#select-xa").val().trim()==''){
			$("#them-error-xa").html("Bạn phải chọn phường xã!");
			return;
		}
		else
			$("#them-error-xa").html("");
	});
	
	$("#them-diachi-cuthe").keyup(function() {
		if($("#them-diachi-cuthe").val().trim()==''){
			$("#them-error-diachicuthe").html("Địa chỉ cụ thể không được để trống!");
			return;
		}
		else
			if($("#them-diachi-cuthe").val().trim().length < 5){
				$("#them-error-diachicuthe").html("Địa chỉ cụ thể quá ngắn!");
				return;
			}
			else $("#them-error-diachicuthe").html("");
	});
	
	
});