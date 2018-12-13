$(document).ready(function() {
	//PHANTRANG
	$(document).ready(function() {
		load = function Paging_Load() {
			window.tp = new Pagination('#tablePaging',
					{
						itemsCount : $("#example2 .data-page").length,
						onPageSizeChange : function(ps) {
							console.log('changed to ' + ps);
						},
						onPageChange : function(paging) {
							//custom paging logic here
							console.log(paging);
							var start = paging.pageSize
									* (paging.currentPage - 1), end = start
									+ paging.pageSize, $rows = $('#example2')
									.find('.data-page');

							$rows.hide();

							for (var i = start; i < end; i++) {
								$rows.eq(i).show();
							}
						}
					});
		}
		load();
	});
	//TIM KIEM
	$('#search_input579').keyup(function() {
		$.ajax({
			url:'NguoiDungTimKiemServlet',
			data:{
				keyWord: $('#search_input579').val(),
			},
			success: function(responseText) {
				$('.tygh-content.clearfix').html(responseText);
				load();
			}
		});
	});
	//DANH SACH MENU
	$('.cm-menu-item-responsive').hover(function() {
		var href= $(this);
		if(href.children('.ty-menu__submenu').html()=="")
			{
				$.ajax({
					url : 'NguoiDungLayDanhSachMenuParentServlet',
					data : {
						maMenu : $(this).children('.maMenu').val(),
					},
					success : function(responseText) {
						href.children('.ty-menu__submenu').html(responseText);
					}
				});
			}
	});
	//	
	// POPUP
	// ---open
	$('[data-popup-open]').on('click', function(e) {
		var targeted_popup_class = $(this).attr('data-popup-open');
		$('[data-popup="' + targeted_popup_class + '"]').show();
		e.preventDefault();
	});

	// ----- close
	$('[data-popup-close]').on('click', function(e) {
		var targeted_popup_class = $(this).attr('data-popup-close');
		$('[data-popup="' + targeted_popup_class + '"]').hide();
		e.preventDefault();
	});
	
	// DANG NHAP
	$('#dangnhap-ajax').on('click', function() {
		$.ajax({
			url : 'DangNhapServlet',
			data : {
				ajaxLimit:"true",
				userName : $('#dangNhapUserName').val(),
				passWord : $('#dangNhapPassWord').val()
			},
			success : function(responseText) {
				if (responseText =="Sai") {
					$('#thongbao-dangnhap').removeClass('hidden');
					$('#dangNhapPassWord').val('');
				} else {
					window.location = responseText;
				}
			}
		});
	});
	
	//GIO HANG
		//show	
		$('#sw_dropdown_577').on('click', function() {
			$('#dropdown_577').removeClass('hidden')
		});
		
		//close
		$('#close_dropdown_577').on('click',function(){
			$('#dropdown_577').addClass('hidden')
		});
	//SILDER
	$('.blider').bxSlider(
		  {
		      //pager:false,
		      touchEnabled:true,
		      auto:true,
		      controls: true,
	});
	var khoangcach = $('#fix-ty-sidebox').offset().top - 128;
	//LOC THEO NHOM
	$('.ty-sidebox__title_product').on('click',function(){
		if($('#sidebox_134-ul').attr('class')==='ty-text-links hidden'){
			$('#sidebox_134-ul').removeClass('hidden');
			$('.ty-sidebox__title .fa').removeClass('fa-angle-down');
			$('.ty-sidebox__title .fa').addClass('fa-angle-up');
			khoangcach = $('#fix-ty-sidebox').offset().top - 128;
		}
		else{
			$('#sidebox_134-ul').addClass('hidden');
			$('.ty-sidebox__title .fa').removeClass('fa-angle-up');
			$('.ty-sidebox__title .fa').addClass('fa-angle-down');
			khoangcach = $('#fix-ty-sidebox').offset().top - 128;
		}
	});
	
	//FIXED SIDERBAR WHEN SCROLL
    $(window).bind("scroll", function(e) {
    	var gioihan = $('#tablePaging').offset().top - 260;
        var top = $(window).scrollTop();
      if ((top>= khoangcach) && (top <gioihan)) {
        $("#fix-ty-sidebox").addClass("fix-box-filter");
      } else {
        $("#fix-ty-sidebox").removeClass("fix-box-filter");
      } 
    });
    
  //DIV LOC THEO KICH THUOC
	$('#sw_content_29_46').on('click',function(){
		if($('#content_29_46').attr('class')==='ty-product-filters hidden'){
			$('#content_29_46').removeClass('hidden');
			$('#sw_content_29_46 .fa').removeClass('fa-angle-down');
			$('#sw_content_29_46 .fa').addClass('fa-angle-up');
		}
		else{
			$('#content_29_46').addClass('hidden');
			$('#sw_content_29_46 .fa').removeClass('fa-angle-up');
			$('#sw_content_29_46 .fa').addClass('fa-angle-down');
		}
	});
	//Hàm
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
	    $('#data-table-input-checkbox').val(result.trim());
	}
	$('#table-input-checkbox input').on('click',function(){
		resuftCheckBox();
	});
	//DIV LỌC THEO GIÁ
	//hàm
	function addSeperator(nStr) {
        nStr += '';
        var x = nStr.split('.');
        var x1 = x[0];
        var x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + '.' + '$2');
        }
        return x1 + x2;
    }

    function rangeInputChangeEventHandler(e) {
        var rangeGroup = $(this).attr('name'),
            minBtn = $(this).parent().children('.min'),
            maxBtn = $(this).parent().children('.max'),
            range_min = $(this).parent().children('.range_min'),
            range_max = $(this).parent().children('.range_max'),
            minVal = parseInt($(minBtn).val()),
            maxVal = parseInt($(maxBtn).val()),
            origin = $(this).context.className;

        if (origin === 'min' && minVal > maxVal - 5) {
            $(minBtn).val(maxVal - 5);
        }
        var minVal = parseInt($(minBtn).val());
        $(range_min).val(addSeperator(minVal));


        if (origin === 'max' && maxVal - 5 < minVal) {
            $(maxBtn).val(5 + minVal);
        }
        var maxVal = parseInt($(maxBtn).val());
        $(range_max).val(addSeperator(maxVal));
    }

    function inputEventHandler(e) {
        var rangeGroup = $(this).attr('name'),
            minBtn = $(this).parent().children('.min'),
            maxBtn = $(this).parent().children('.max'),
            range_min = $(this).parent().children('.range_min'),
            range_max = $(this).parent().children('.range_max'),
            limitMinVal = parseInt($('#gia-min').val());
            limitMaxVal = parseInt($('#gia-max').val());
            minVal = parseInt($(range_min).val()),
            maxVal = parseInt($(range_max).val()),
            origin = $(this).context.className;

        if (origin === 'range_min light left' && (minVal < limitMinVal)|| $(range_min).val() == "") {
            $(range_min).val(limitMinVal);
        }
        if (origin === 'range_min light left' && minVal > maxVal - 5) {
            $(range_min).val(maxVal - 5);
        }
        var minVal = parseInt($(range_min).val());
        $(minBtn).val(addSeperator(minVal));

        if (origin === 'range_max light right' && (maxVal > limitMaxVal)||$(range_max).val()=="") {
            $(range_max).val(limitMaxVal);
        }
        if (origin === 'range_max light right' && maxVal - 5 < minVal) {
            $(range_max).val(5 + minVal);
        }
        var maxVal = parseInt($(range_max).val());
        $(maxBtn).val(addSeperator(maxVal));
    }
    function inputEventHandler1(e){
    	$('#ketqua').val("Sản phẩm có giá: " + parseInt($('.range_min').val())+"$ -> "+parseInt($('.range_max').val())+"$");
    }
    
    $('input[type="range"]').on('input', rangeInputChangeEventHandler);
    $('.light').blur(inputEventHandler);
    $('input[type="range"]').blur(inputEventHandler1);
    $('.light').blur(inputEventHandler1);
    
    //Tổng hợp các sự kiện trên slider lọc gọi ajax
    $('#table-input-checkbox input').on('click',function(){
    	if($('#maLoc').attr('class') === 'maNhom')
        	var URL = 'NguoiDungLayDanhSachSanPhamTheoGiaVaNhomServlet';
        else
        	var URL = 'NguoiDungLayDanhSachSanPhamTheoGiaServlet';
		$.ajax({
			url: URL,
			data:{
				maLoc: $('#maLoc').val(),
				doTuoi: $('#data-table-input-checkbox').val(),
				giaMin: $('.range_min').val(),
				giaMax: $('.range_max').val()
			},
			success: function(responseText) {
				$('.grid-list').html(responseText);
				load();
			}
		});
	});
    $('.light').blur(function() {
    	if($('#maLoc').attr('class') === 'maNhom')
        	var URL = 'NguoiDungLayDanhSachSanPhamTheoGiaVaNhomServlet';
        else
        	var URL = 'NguoiDungLayDanhSachSanPhamTheoGiaServlet';
		$.ajax({
			url: URL,
			data:{
				maLoc: $('#maLoc').val(),
				doTuoi: $('#data-table-input-checkbox').val(),
				giaMin: $('.range_min').val(),
				giaMax: $('.range_max').val()
			},
			success: function(responseText) {
				$('.grid-list').html(responseText);
				load();
			}
		});
	});
    $('input[type="range"]').blur(function() {
    	if($('#maLoc').attr('class') === 'maNhom')
        	var URL = 'NguoiDungLayDanhSachSanPhamTheoGiaVaNhomServlet';
        else
        	var URL = 'NguoiDungLayDanhSachSanPhamTheoGiaServlet';
		$.ajax({
			url: URL,
			data:{
				maLoc: $('#maLoc').val(),
				doTuoi: $('#data-table-input-checkbox').val(),
				giaMin: $('.range_min').val(),
				giaMax: $('.range_max').val()
			},
			success: function(responseText) {
				$('.grid-list').html(responseText);
				load();
			}
		});
	});
    
    //end thanh lọc theo giá
    
});