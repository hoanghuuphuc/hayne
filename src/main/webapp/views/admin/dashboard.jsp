<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<h1>
	<small>Dashboard Page</small>
</h1>
<hr>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link rel="stylesheet" href="/css/thongke.css" />
  <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
</head>
<body>
<div class="thongke_box">
  <div class="thongke_box-header">
    <div class="thongke_box-header-l">
      <button>Thông kê theo tháng</button>
    </div>
  </div>
  <form action="/search" method="post">

  <div class="thongke_box-content-1">
    <div class="thongke_box-content-l">
      <span>Tháng bắt đầu:</span>
      <input type="month" name="month" id="" />
    </div>


    <div class="thongke_box-content-r">
      <span>Tháng kết thúc:</span>
      <input type="month" name="month2" id="" />
    </div>
  </div>
    <button>Tìm Kiếm</button>
  </form>

  <div class="thongke_box-table">
    <div class="accordion">
      <div class="contentBx">
        <div class="accordion-label">
          <span>Tháng ${startMonthInt} Năm ${startYear} --> Tháng ${endMonthInt} Năm ${endYear}</span>
          <span>Doanh thu: <strong></strong> VND</span>
        </div>
        <div class="accordion-content">
          <table>
            <tr>
              <th>Loại</th>
              <th>Đã Bán</th>
              <th>Còn lại</th>
              <th>Size</th>
            </tr>
            <c:set var="totalBought" value="0" />
            <c:set var="totalLeft" value="0" />
            <c:forEach var="order" items="${thongke}">
              <c:forEach var="orderDetail" items="${order.orderDetails}">
                <tr>
                  <td>
                    <strong>${orderDetail.product.name}</strong>
                  </td>
                  <c:set var="totalBought" value="${ orderDetail.quantity}" />
                  <c:set var="totalLeft" value="${orderDetail.product.total}" />
                  <td>Đã bán: <strong>${totalBought}</strong></td>
                  <td>Còn lại: <strong>${totalLeft}</strong></td>
                  <td>Size : ${orderDetail.size}</td>
                </tr>

              </c:forEach>
            </c:forEach>


          </table>
        </div>
      </div>
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

