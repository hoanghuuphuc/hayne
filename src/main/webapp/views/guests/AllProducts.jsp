<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  <link rel="stylesheet" href="/css/xemthem.css" />
</head>

<body>
  <div class="list-product">
    <div class="list-product-left">
      <h2>Danh mục</h2>
      <div class="accordion">
        <c:forEach var="cate" items="${ categories }">
          <div class="contentBx">
            <div class="accordion-label">
              <ion-icon name="bookmarks"></ion-icon>
              <button><a href="/shop/${ cate.id }">${ cate.name } </a></button>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
    <div class="list-product-right">
      
			<c:if test="${ products.isEmpty() }">
				<h1 style="padding: 169px;">
					<small>Không có sản phẩm</small>
				</h1>
			</c:if>
      <div class="product">
        <c:forEach var="p" items="${ products }">
        <div class="product-box">
          <div class="header-img">
            <a href= "/details/${p.id}"> <img src="/image/${p.image}" alt="" /></a>
          </div>
          <div class="product-header">
            <div class="product-1">
              <span>${ p.name }</span>
            </div>
            <div class="product-2">
              <p></p>
            
              <del>${ p.prices.toString().replace(".0"," VND") }</del>
            </div>
            <div class="product-2">
              <p>Giá:</p>
              <span>${ p.price.toString().replace(".0"," VND") }</span>
             
            </div>
          </div>
          <div class="header-pay">
           <a href="/details/${p.id}"><button>Xem Ngay</button></a>
           
          </div>
        </div>
      </c:forEach>
      </div>
    </div>
  </div>
  <script>
    const accordion = document.getElementsByClassName("contentBx");
    for (i = 0; i < accordion.length; i++) {
      accordion[i].addEventListener("click", function () {
        this.classList.toggle("active");
      });
    }
  </script>
</body>

</html>