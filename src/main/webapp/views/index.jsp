<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ TitlePage }</title>
<style>
.affix {
	top: 0;
	width: 100%;
	z-index: 9999 !important;
}

.affix+.container-fluid {
	padding-top: 70px;
}
/* Remove the navbar's default rounded borders and increase the bottom margin */
.navbar {
	margin-bottom: 50px;
	border-radius: 0;
}

/* Remove the jumbotron's default bottom margin */
.jumbotron {
	margin-bottom: 0;
}



.product {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.product-box {
	border: 1px solid #999;
	margin: 10px;
	padding: 15px 20px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 6px 6px 10px -1px rgba(0, 0, 0, 0.5), -6px -6px 10px -1px
		rgba(0, 0, 0, 0.5);
}

.product-header {
	font-weight: 600;
	padding: 10px;
	font-family: Arial, Helvetica, sans-serif;
}

.product-header .product-1 {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 230px;
	text-align: center;
	font-size: 20px;
}

.product-header .product-2 {
	display: flex;
	align-items: center;
	font-weight: 500;
	justify-content: center;
	font-family: Arial, Helvetica, sans-serif;
	opacity: 0.6;
	font-size: 18px;
}

.product-header .product-2 p {
	padding: 8px 5px 0px 5px;
	font-weight: 600;
}

.header-img img {
	height: 250px;
	width: 250px;
	object-fit: cover;
	border-radius: 10px;
}

.header-pay {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 5px;
	transform: translateX(30%);
}

.product-header .product-2 del {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.header-pay button {
	background: #0984e3;
	padding: 7px 10px;
	border: none;
	border-radius: 5px;
	font-size: 15px;
	font-weight: 600;
	font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
	color: #fff;
}

.header-pay button a {
	text-decoration: none;
	color: #fff;
}

body {
	background: rgb(238, 174, 202);
	background: radial-gradient(circle, rgba(238, 174, 202, 1) 0%,
		rgba(148, 187, 233, 1) 100%);
}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


</head>
<body>
	<nav class="navbar-inverse" data-spy="affix" data-offset-top="197">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/">Four N</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="/">Trang Chủ</a></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="">Loại
							Sản Phẩm<span class="caret"></span>
					</a>
						<ul class="nav dropdown-menu">
							<c:forEach var="cate" items="${ categories }">
								<li><a href="/shop/${ cate.id }">${ cate.name }</a></li>
							</c:forEach>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${ User == null }">
						<li><a href="/login"> <span
								class="glyphicon glyphicon-log-in"></span> Đăng Nhập
						</a></li>
					</c:if>
					<c:if test="${ User != null }">
						<li><a class="dropdown-toggle" data-toggle="dropdown"
							href="/#"><span class="glyphicon glyphicon-user"></span>Tài
								Khoản</a>
							<ul class="nav dropdown-menu">
								<c:if test="${ User.isRole() == true }">
									<li><a href="/admin">Quản Lý Bán Hàng</a></li>
								</c:if>
								<li><a href="/myAcc/historyOrder/${ User.getUsername() }">Lịch
										Sử Order</a></li>
								<li><a href="/myAcc/myProfile/${ User.getUsername() }">Quản
										Lý Tài Khoản</a></li>
								<li><a href="/login">Đăng Xuất</a></li>
							</ul></li>
					</c:if>

					<li><a href="/cart/view"> <span
							class="glyphicon glyphicon-shopping-cart"></span>Giỏ Hàng <span
							class="badge">${ Count }</span>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<jsp:include page="${ view }"></jsp:include>

	<br>
	<br>

	<footer>
	<style>
.ft-bg {
  background: #181821;
  display: flex;
  justify-content: space-around;
  padding: 50px;
  position: relative;
  z-index: 10;
  bottom: 0;
}
.footer-one a {
  font-size: 25px;
  padding: 5px;
  color: #fff;
  font-weight: 600;
}
.footer-one ul li {
  color: #a9b3bb;
  list-style: none;
  padding: 5px;
  font-size: 16px;
}
.footer-one .logo {
  font-style: italic;
  font-size: 27px;
  color: #fff;
}
.footer-one ul li span {
  font-style: italic;
}
.footer-two span {
  font-size: 25px;
  padding: 5px;
  color: #fff;
  font-weight: 600;
}
.footer-two ul li {
  color: #a9b3bb;
  list-style: none;
  padding: 5px;
  font-size: 16px;
}
.footer-three span {
  font-size: 25px;
  padding: 5px;
  color: #fff;
  font-weight: 600;
}
.footer-three ul li {
  color: #a9b3bb;
  list-style: none;
  padding: 5px;
  font-size: 16px;
}
.footers {
  display: flex;
  justify-content: space-around;
  background: #181821;
  padding: 10px;
  border-top: 2px solid #333;
  align-items: center;
}
.footers-text {
  color: #a9b3bb;
  font-size: 16px;
}
.footers-media img {
  width: auto;
  height: 40px;
  object-fit: cover;
  padding: 5px;
}
</style>
<br><br><br><br><br><br><br><br>
<footer class="ft-bg">
        <div class="footer-one">
         <span class="logo">Four N</span>
          <ul>
            <li>Điện Thoại: <span>+123.456.789</span></li>
            <li>Email: <span>volunteerqt123@gamil.com</span></li>
            <li>Địa Chỉ: <span>Cần thơ</span></li>
          </ul>
        </div>
        <div class="footer-two">
          <span>Về Chúng Tôi</span>
          <ul>
            <li>Giới Thiệu</li>
            <li>Cơ Hội Việc Làm</li>
            <li>Lộ Trình Học</li>
          </ul>
        </div>
        <div class="footer-three">
          <span>Hỗ Trợ</span>
          <ul>
            <li>Liên Hệ</li>
            <li>Bảo Mật</li>
            <li>Điều khoản</li>
          </ul>
      </footer>
      <div class="footers">
        <div class="footers-text">
          Designed By KhanhDuy © 2022
        </div>
        <div class="footers-media">
          <a href="https://www.facebook.com/"><img src="/Img/fb1.png" alt=""></a>
          <a href=""><img src="/Img/email.png" alt=""></a>
        </div>
      </div>

</body>

</html>