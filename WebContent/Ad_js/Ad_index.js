$(document).ready(function() {
	$('#yearSelect').change(function() {
		$.ajax({
			url:'QuanTriTrangChuServlet',
			data:{
				selectYear: $('#yearSelect').val(),
				ajaxLimit: 'true'
			},
			success: function(responseText) {
				$('#dataChartLine').html(responseText);
				window.onload();
			}
		});
	});
});
