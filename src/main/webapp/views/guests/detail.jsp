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
    <link rel="stylesheet" href="/css/details.css" />
    <style></style>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    <style>
      .modal {
        background: #ddd;
        width: 300px;
        height: 150px;
        margin: 300px 600px;
      }
      .modal-content {
        display: flex;
        flex-direction: column;
        padding: 30px 45px;
      }
      .close {
        font-size: 30px;
      }
    </style>
  </head>
  <body>

  <c:forEach var="p" items="${list}"  >
    <form action="/cart/add/${p.id}" method="post" onsubmit="return validateForm()">
    <div class="details">
      <div class="detail-left">
        <img
          src="/image/${p.image}"
           />
      </div>

      <div class="detail-right">
        <div class="detail-right-name">
          <p>${p.name}</p>
        </div>
        <div class="detail-right-price">
          <span>${p.price.toString().replace(".0","VND")} </span>
          <del>${p.prices.toString().replace(".0","VND")}</del>
        </div>
        <div class="size-item">
          <input type="radio" id="html" name="fav_language" value="S">
          <label for="html">S</label><br>
          <input type="radio" id="css" name="fav_language" value="M">
          <label for="css">M</label><br>
          <input type="radio" id="javascript" name="fav_language" value="Xl">
          <label for="javascript">Xl</label>

        </div>
        <div class="detail-right-quantity">
          <span>S??? L?????ng: </span>
          <div class="container">
            <button id="decrement" type="button">-</button>
            <input name="soLuong" type="text" min="1" value="1" />
            <button id="increment" type="button">+</button>
          </div>
        </div>

        <div class="buy-now">
          <button>Mua Ngay</button>
        </div>
        <div class="add-to-cart">
          <a href="/cart/add/${p.id}">
          <button type="submit">
          Th??m V??o Gi??? H??ng
          </button></a>
        </div>
        <div class="product-box">
          <div class="product-box-item">
            <p>B???o h??nh trong v??ng 90 ng??y.</p>
          </div>
          <div class="product-box-item">
            <p>?????i h??ng trong 30 ng??y v???i s???n ph???m nguy??n gi??.</p>
          </div>
        </div>
      </div>

    </div>
      </form>
  </c:forEach>
    <hr />
    <div class="detail-content">
      <div class="detail-content-left details-content">
        <h2>TH??NG TIN S???N PH???M</h2>
        <span>??o Kho??c N??? Anti UV V???i ?????m R?? Ph???i M??u WOK 2027</span>
        <p>
          ??o kho??c thun UV v???i c?? t??nh n??ng ch???ng n???ng, d???t k???t c???u l??? c?? ?????m
          tr??n b??? m???t. V???i c?? s??? d???ng s???i Polyester t??i ch??? th??n thi???n m??i
          tr?????ng, r?? ph???i m??u th???i trang tr??? trung. 2 t??i con ??? th??n tr?????c, 2
          t??i l???n b??n trong ti???n l???i v?? 1 t??i d???c c?? d??y k??o an to??n ?????ng ?????.
          Tay c?? x??? ng??n v?? ph???n bo d??i che ph??? mu b??n tay.
        </p>
        <ul>
          <li>
            Ch???t li???u: double face m?? ?????m, th??nh ph???n 55% Polyester + 12%
            Recycled polyester + 30% Cotton + 3% Spandex, tr???ng l?????ng 255GSM
          </li>
          <li>Form d??ng: Regular</li>
          <li>M??u s???c: Cam, Xanh ?????m</li>
          <li>S???n xu???t: Vi???t Nam</li>
        </ul>
      </div>
      <div class="detail-content-center details-content">
        <h2>THAM KH???O</h2>
        <ul>
          <li>S??? d???ng h??ng ng??y khi ra ngo??i</li>
          <li>Ph???i c??ng ??o thun, qu???n jean ????? t???o n??n phong c??ch n??ng ?????ng.</li>
          <li>
            M???c th??nh set ????? ????i v???i m???u
            <strong>??o Kho??c Nam Anti UV V???i ?????m R?? Ph???i M??u MOK 1027</strong>
          </li>
        </ul>
      </div>
      <div class="detail-content-right details-content">
        <h2>TH??NG S??? K??? THU???T</h2>
        <table>
          <tr>
            <th>Th??ng s???/ v??? tr?? ??o</th>
            <td>S</td>
            <td>M</td>
            <td>L</td>
            <td>XL</td>
          </tr>
          <tr>
            <th>D??i ??o</th>
            <td>52</td>
            <td>54</td>
            <td>56</td>
            <td>58</td>
          </tr>
          <tr>
            <th>D??i tay</th>
            <td>55</td>
            <td>56</td>
            <td>57</td>
            <td>58</td>
          </tr>
          <tr>
            <th>Ngang ng???c</th>
            <td>47</td>
            <td>49</td>
            <td>51</td>
            <td>53</td>
          </tr>
          <tr>
            <th>Ngang lai</th>
            <td>37</td>
            <td>38</td>
            <td>39</td>
            <td>40</td>
          </tr>
        </table>
      </div>
    </div>
    <hr />
    <br /><br /><br /><br /><br />

  <%-- Check if the message attribute exists, and if so, display the alert --%>
<%--  <c:if test="${flash.message != null}">--%>
<%--    <script>--%>
<%--      alert('${flash.message}');--%>
<%--    </script>--%>
<%--  </c:if>--%>
  <c:if test="${message != null}">
    <script>
      window.location.reload();
      alert("Xin l???i r???t ti???c s???n ph???m ???? h???t h??ng!");

    </script>
  </c:if>



  <div id="myModal" class="modal" style="text-align: center">
    <!-- Modal content -->
    <div class="modal-content">

      <span  class="close">&times;</span>
      <p style="color:red">Vui l??ng ch???n size</p>
    </div>
  </div>

  <script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    function validateForm() {
      var size = document.querySelector('input[name="fav_language"]:checked');
      if (!size) {
        // Open modal and show error message
        modal.style.display = "block";
        return false;
      }
      return true;
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
      modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }
    const input = document.querySelector('input[name="soLuong"]');
    const decrementButton = document.querySelector('#decrement');
    const incrementButton = document.querySelector('#increment');

    decrementButton.addEventListener('click', () => {
      input.value = Math.max(1, parseInt(input.value) - 1);
    });

    incrementButton.addEventListener('click', () => {
      input.value = parseInt(input.value) + 1;
    });

  </script>
  </body>

</html>
