<%@page import="model.bean.HoaDonBan"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Us_header.jsp"%>
<!-- start content -->
<div class="tygh-content clearfix">
	<div class="container-fluid  content-grid">
    <div class="row-fluid ">
        <div class="span16 main-content-grid">
            <div id="breadcrumbs_10">
                <div class="ty-breadcrumbs clearfix">
                    <a href="KhachHangTrangChuServlet" class="ty-breadcrumbs__a">Trang chủ</a><span class="ty-breadcrumbs__slash">/</span><span class="ty-breadcrumbs__current">Đơn đặt hàng của bạn đã được nhận</span>
                </div>
                <!--breadcrumbs_10-->
            </div>
            <%String maHD = (String)request.getAttribute("maHD"); 
            	ArrayList<HoaDonBan> listHdbBan = (ArrayList<HoaDonBan>)request.getAttribute("listHdbBan");%>
            <div class="ty-mainbox-container clearfix">
                <h1 class="ty-mainbox-title">
                    Mã đơn hàng: #<%=maHD%>
                </h1>
                <div class="ty-mainbox-body">
                    <div class="ty-checkout-complete__order-success">
                        <p>Chúc mừng! Đơn hàng của bạn đã được đặt thành công.
                            <a href="https://babi.vn/index.php?dispatch=orders.details&amp;order_id=448562">Chi tiết đơn hàng</a>.
                        </p>
                    </div>
                    <div class="ty-checkout-complete__login-info ty-checkout-complete_width_full">
                    </div>
                    <!-- Inline script moved to the bottom of the page -->
                    <a href="NguoiDungChiTietHoaDonBanServlet?maHD=<%=maHD%>" class="ty-btn ty-btn__secondary " >Chi tiết đơn hàng</a>
                    
                    <div class="ty-checkout-complete__buttons-right">
                            <a  class="ty-btn ty-btn__secondary text-button" href="KhachHangTrangChuServlet">Chọn thêm</a>
                    </div>
                    <div class="ty-checkout-complete__buttons buttons-container ">
                        <div class="ty-checkout-complete__buttons-left">
                            <% if(ss.getAttribute("Quyen") == null)
                            {
                            	
                            }
                            else{%>
                            	<h1>Danh sách đơn hàng đã mua</h1>
                            	<div>
                            		<table>
                            			<thead>
                            				<tr>
                            					<th>Mã hóa đơn</th>
                            					<th>Tên người nhận</th>
                            					<th>Số điện thoại</th>
                            					<th>Địa chỉ</th>
                            					<th>Ngày mua</th>
                            					<th>Trạng thái</th>
                            				</tr>
                            			</thead>
                            			<tbody>
                            				<%for(HoaDonBan hdb: listHdbBan){
                            					String ngaymua = hdb.getNgayBan().substring(0, 8);
                            					String trangthai = null;
                            					if(hdb.getTrangThai() == 0)
                            						trangthai = "Chưa duyệt";
                            					else
                            						trangthai = "Đã duyệt";
                            				%>
	                            				<tr>
	                            					<td><a href="NguoiDungChiTietHoaDonBanServlet?maHD=<%=hdb.getMaHD()%>"><%=hdb.getMaHD()%></a></td>
	                            					<td><%=hdb.getTenNguoiNhan()%></td>
	                            					<td><%=hdb.getSoDienThoai()%></td>
	                            					<td><%=hdb.getDiaChi() %></td>
	                            					<td><%=ngaymua%></td>
	                            					<td><%=trangthai %></td>
	                            				</tr>
	                            			<%} %>
                            			</tbody>
                            		</table>
                            	</div>		
                            <%}%>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%@include file="Us_footer.jsp"%>