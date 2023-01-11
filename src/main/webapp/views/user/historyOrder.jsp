<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>LSdonhang</title>
    <link rel="stylesheet" href="/css/donhang.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
  </head>
  <body>
  <c:if test="${not empty successMessage}">
    <div class="alert alert-success">
        ${successMessage}
    </div>
  </c:if>

  <div class="orderDetails">
      <div class="w3-bar w3-black">
        <button class="w3-bar-item w3-button" onclick="openCity('tt1')">
          Đang Xử Lý
        </button>
        <button class="w3-bar-item w3-button" onclick="openCity('tt2')">
          Đang Lấy Hàng
        </button>
        <button class="w3-bar-item w3-button" onclick="openCity('tt3')">
          Đang Giao Hàng
        </button>
        <button class="w3-bar-item w3-button" onclick="openCity('tt4')">
          Đã Giao Hàng
        </button>
        <button class="w3-bar-item w3-button" onclick="openCity('tt5')">
          Đã Hủy
        </button>
      </div>
      <div id="tt1" class="w3-container city">
        <table id="customers">
          <tr>
            <th>Tên Người Đặt</th>
            <th>Địa Chỉ</th>
            <th>Ngày Đặt</th>
            <th>Trạng Thái</th>
            <th>Xem Đơn</th>
            <th>Hủy Đơn</th>
          </tr>
          <c:forEach var="o" items="${page0}">
          <tr>
            <td>${ o.account.fullname }</td>
            <td>${ o.address }</td>
            <td>${ o.formattedDate }</td>
            <td><c:if test="${ o.status == 0}">
              <b style="color: orange;">Đang Xử Lý</b>
            </c:if> <c:if test="${ o.status == 1}">
              <b style="color: aqua;">Đang Lấy Hàng</b>
            </c:if> <c:if test="${ o.status == 2}">
              <b style="color: blue;">Đang Giao Hàng</b>
            </c:if> <c:if test="${ o.status == 3}">
              <b style="color: green;">Đã Giao Hàng</b>
            </c:if></td>
            <td><a href="/myAcc/historyOrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>
            <td><a href="/myAcc/cancel/${ o.id }"><button class="btn btn-info">Hủy Đơn</button></a></td>
          </tr>
          </c:forEach>
        </table>
      </div>
      <div id="tt2" class="w3-container city" style="display: none">
        <table id="customers">
          <tr>
            <th>Tên Người Đặt</th>
            <th>Địa Chỉ</th>
            <th>Ngày Đặt</th>
            <th>Trạng Thái</th>
            <th></th>
          </tr>
          <c:forEach var="o" items="${page1}">
            <tr>
              <td>${ o.account.fullname }</td>
              <td>${ o.address }</td>
              <td>${ o.createDate }</td>
              <td><c:if test="${ o.status == 0}">
                <b style="color: orange;">Đang Xử Lý</b>
              </c:if> <c:if test="${ o.status == 1}">
                <b style="color: aqua;">Đang Lấy Hàng</b>
              </c:if> <c:if test="${ o.status == 2}">
                <b style="color: blue;">Đang Giao Hàng</b>
              </c:if> <c:if test="${ o.status == 3}">
                <b style="color: green;">Đã Giao Hàng</b>
              </c:if></td>
              <td><a href="/myAcc/historyOrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>

            </tr>
          </c:forEach>
        </table>
      </div>
      <div id="tt3" class="w3-container city" style="display: none">
        <table id="customers">
          <tr>
            <th>Tên Người Đặt</th>
            <th>Địa Chỉ</th>
            <th>Ngày Đặt</th>
            <th>Trạng Thái</th>
            <th></th>
          </tr>
          <c:forEach var="o" items="${page2}">
            <tr>
              <td>${ o.account.fullname }</td>
              <td>${ o.address }</td>
              <td>${ o.createDate }</td>
              <td><c:if test="${ o.status == 0}">
                <b style="color: orange;">Đang Xử Lý</b>
              </c:if> <c:if test="${ o.status == 1}">
                <b style="color: aqua;">Đang Lấy Hàng</b>
              </c:if> <c:if test="${ o.status == 2}">
                <b style="color: blue;">Đang Giao Hàng</b>
              </c:if> <c:if test="${ o.status == 3}">
                <b style="color: green;">Đã Giao Hàng</b>
              </c:if></td>
              <td><a href="/myAcc/historyOrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>
              <button></button>
            </tr>
          </c:forEach>
        </table>
      </div>
      <div id="tt4" class="w3-container city" style="display: none">
        <table id="customers">
          <tr>
            <th>Tên Người Đặt</th>
            <th>Địa Chỉ</th>
            <th>Ngày Đặt</th>
            <th>Trạng Thái</th>
            <th></th>
          </tr>
          <c:forEach var="o" items="${page3}">
            <tr>
              <td>${ o.account.fullname }</td>
              <td>${ o.address }</td>
              <td>${ o.createDate }</td>
              <td><c:if test="${ o.status == 0}">
                <b style="color: orange;">Đang Xử Lý</b>
              </c:if> <c:if test="${ o.status == 1}">
                <b style="color: aqua;">Đang Lấy Hàng</b>
              </c:if> <c:if test="${ o.status == 2}">
                <b style="color: blue;">Đang Giao Hàng</b>
              </c:if> <c:if test="${ o.status == 3}">
                <b style="color: green;">Đã Giao Hàng</b>
              </c:if></td>
              <td><a href="/myAcc/historyOrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>
              <button></button>
            </tr>
          </c:forEach>
        </table>
      </div>
    </div>
  <div id="tt5" class="w3-container city" style="display: none">
    <table id="customers">
      <tr>
        <th>Tên Người Đặt</th>
        <th>Địa Chỉ</th>
        <th>Ngày Đặt</th>
        <th>Trạng Thái</th>
        <th></th>
      </tr>
      <c:forEach var="o" items="${page4}">
        <tr>
          <td>${ o.account.fullname }</td>
          <td>${ o.address }</td>
          <td>${ o.createDate }</td>
          <td><c:if test="${ o.status == 0}">
            <b style="color: orange;">Đang Xử Lý</b>
          </c:if> <c:if test="${ o.status == 1}">
            <b style="color: aqua;">Đang Lấy Hàng</b>
          </c:if> <c:if test="${ o.status == 2}">
            <b style="color: blue;">Đang Giao Hàng</b>
          </c:if>
            <c:if test="${ o.status == 3}">
            <b style="color: green;">Đã Giao Hàng</b>
          </c:if>
            <c:if test="${ o.status == 4}">
              <b style="color: green;">Đã Hủy</b>
            </c:if>
          </td>
          <td><a href="/myAcc/historyOrderDetails/${ o.id }"><button class="btn btn-info">Order Details</button></a></td>
          <button></button>
        </tr>
      </c:forEach>
    </table>
  </div>

  </div>
    <script>
      function openCity(cityName) {
        var i;
        var x = document.getElementsByClassName("city");
        for (i = 0; i < x.length; i++) {
          x[i].style.display = "none";
        }
        document.getElementById(cityName).style.display = "block";
      }
    </script>

  </body>
</html>
