<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "Us_header.jsp"%>
<!-- start content -->
                <style type="text/css">
                    .tygh-content .main-content-grid{
                        background: #fff;
                        padding: 20px 30px;
                        border: 1px solid #e3e2df;
                        border-radius: 5px;
                    }
                    .tygh-content .main-content-grid .ty-btn{
                        font-size: 15px;
                        text-transform: uppercase;
                        font-weight: 600;
                        padding: 10px 30px;
                    }
                    .tygh-content .main-content-grid .buttons-container{
                        text-align: center;
                    }
                    .tygh-content .profile-information-grid h4{
                        padding-bottom: 22px;
                        font-size: 19px;
                        font-weight: 600;
                    }
                </style>
                <div class="tygh-content clearfix">
                    <div class="container-fluid  content-grid">
                        <div class="row-fluid ">                
                            <div class="span16 breadcrumbs-grid">
                                <div id="breadcrumbs_10">
                                    <div class="ty-breadcrumbs clearfix">
                                        <a href="https://babi.vn/" class="ty-breadcrumbs__a">Trang chủ</a>
                                        <span class="ty-breadcrumbs__slash">/</span><span class="ty-breadcrumbs__current">Đăng ký</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row-fluid ">               
                            <div class="span10 main-content-grid">
                                <div class="ty-mainbox-container clearfix">
                                    <h1 class="ty-mainbox-title">
                                        Đăng ký tài khoản mới
                                    </h1>
                                    <div class="ty-mainbox-body"><!-- Inline script moved to the bottom of the page -->
                                        <div class="ty-account">
                                            <form action="NguoiDungDangKyServlet" class="cm-processed-form">
                                                <div class="ty-control-group">
                                                    <label for="taiKhoan" class="ty-control-group__title cm-required cm-email cm-trim">Tên tài khoản</label>
                                                    <input type="text" id="taiKhoan" name="taiKhoan" size="32" maxlength="128" value="" class="ty-input-text cm-focus">
                                                </div>
                                                <div class="ty-control-group">
                                                    <label for="password1" class="ty-control-group__title cm-required cm-password">Mật khẩu</label>
                                                    <input type="password" id="password1" name="passWord" size="32" maxlength="32" value="" class="ty-input-text cm-autocomplete-off" autocomplete="off">
                                                </div>
                                                <div class="ty-control-group">
                                                    <label for="password2" class="ty-control-group__title cm-required cm-password">Xác nhận mật khẩu</label>
                                                    <input type="password" id="password2" size="32" maxlength="32" value="" class="ty-input-text cm-autocomplete-off" autocomplete="off">
                                                </div>
                                                <div class="ty-control-group">
                                                    <label for="email" class="ty-control-group__title cm-required cm-email cm-trim">Email</label>
                                                    <input type="text" id="email" name="email" size="32" maxlength="128" value="" class="ty-input-text cm-focus">
                                                </div>
                                                <div class="ty-profile-field__buttons buttons-container">
                                                    <button class="ty-btn__secondary ty-btn" type="submit" name="submit" value="submit">Đăng ký</button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="span6 profile-information-grid">
                                <div class="ty-account-benefits">
                                    <h4>Là thành viên của Dolakis, Quý khách được hưởng: </h4>
                                    <ul>
                                        <li>Đăng nhập mọi lúc mọi nơi để kiểm tra trạng thái đơn hàng.</li>
                                        <li>Dễ dàng xem lại những sản phẩm Quý khách đã mua.</li>
                                        <li>Tích luỹ đơn hàng và được hưởng những ưu đãi dành riêng cho khách hàng thân thiết.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

<%@include file="Us_footer.jsp"%>