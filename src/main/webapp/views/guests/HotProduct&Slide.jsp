<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">

		<div class="item active">
			<img src="image/1a.jpg" alt="Los Angeles"
				style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Sale mạnh</h3>
				<p>Mua sấm thả ra</p>
			</div>
		</div>

		<div class="item">
			<img src="image/2a.jpg" alt="Chicago"
				style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Siêu sale</h3>
				<p>Mua ngay</p>
			</div>
		</div>

		<div class="item">
			<img src="image/3a.jpg" alt="New York"
				style="width: 100%; height: 20cm;">
			<div class="carousel-caption">
				<h3>Giá cả hộp lý</h3>
				<p>Mua thôi</p>
			</div>
		</div>

	</div>

	<!-- Left and right controls -->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev">
		<span class="glyphicon glyphicon-chevron-left"></span> <span
		class="sr-only">Previous</span>
	</a> <a class="right carousel-control" href="#myCarousel" data-slide="next">
		<span class="glyphicon glyphicon-chevron-right"></span> <span
		class="sr-only">Next</span>
	</a>
</div>

<h3 style="text-align: center;">Sản Phẩm Nổi Bật</h3>
<br>
<div class="product">
	<c:forEach var="hp" items="${ hotProducts }" end="7">
		<div class="product-box">
			<div class="header-img">
				<a href= "/details/${hp.id}" ><img  src="/image/${hp.image}" alt="Ảnh đâu" /></a>
			</div>
			<div class="product-header">
				<div class="product-1">
					<span>${ hp.name }</span>
				</div>
				<div class="product-2">
					<p>Giá:</p>
					<span> ${ hp.price.toString().replace(".0","VND") }</span>
				</div>
			</div>
			<div class="header-pay">
				<a href="/details/${hp.id}"><button>Xem Ngay</button></a>

			</div>
		</div>
	</c:forEach>
</div>
<hr>
<h3 style="text-align: center;">Sản Phẩm Mới</h3>
<br>
<div class="product">
<c:forEach var="np" items="${ newProducts }" end="2">
	<div class="product-box">
		<div class="header-img">
			<a href= "/details/${np.id}"> <img src="/image/${np.image}" alt="" /></a>
		</div>
		<div class="product-header">
			<div class="product-1">
				<span>${ np.name }</span>
			</div>
			<div class="product-2">
				<p>Giá:</p>
				<span> ${ np.price.toString().replace(".0","VND") }</span>
			</div>
		</div>
		<div class="header-pay">
			<a href= "/details/${np.id}"> <button style="text-align: center">Xem Ngay</button></a>

		</div>
	</div>

</c:forEach>
</div>
<hr>
<a href="/shop">
	<button type="button"
		style="transform: translateX(600%); background-color: #31b0d5; border-color: #269abc; border-radius: 6px; border-style: outset; border-width: 2px; color: #ffffff; display: inline-block; font-family: Helvetica Neue; font-size: 18px; line-height: 24px; padding: 10px 16px; text-align: center;">Xem
		Thêm</button>
</a>
<hr>


<h3 style="text-align: center;">Tất Cả Sản Phẩm</h3>
<br>
<div class="product">
<c:forEach var="sp" items="${ saleProducts }" end="7">
			<div class="product-box">
			<div class="header-img">
				<a href= "/details/${sp.id}"> <img src="/image/${sp.image}" alt="" /></a>
			</div>
			<div class="product-header">
				<div class="product-1">
					<span>${ sp.name }</span>
				</div>
				<div class="product-2">
					<p>Giá:</p>
					<span> ${ sp.price.toString().replace(".0","VND") }</span>
				</div>
			</div>
			<div class="header-pay">
				<a href="/details/${sp.id}"><button>Xem Ngay</button></a>
			</div>
		</div>
</c:forEach>
</div>
<hr>
<a href="/shop">
	<button type="button"
		style="transform: translateX(600%); background-color: #31b0d5; border-color: #269abc; border-radius: 6px; border-style: outset; border-width: 2px; color: #ffffff; display: inline-block; font-family: Helvetica Neue; font-size: 18px; line-height: 24px; padding: 10px 16px; text-align: center;">Xem
		Thêm</button>
</a>
<hr>

