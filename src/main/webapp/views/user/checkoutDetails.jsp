<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div class="container">
	<h2 class="breadcrumb text-center">
		<small> <a href="/cart/view">Shopping Cart</a> <span
			class="glyphicon glyphicon-menu-right"></span> <mark>
				<b>Checkout Details</b>
			</mark>
		</small>
	</h2>
	<div class="row">
		<div class="col-xs-8">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3>Thông Tin Thanh Toán</h3>
				</div>
				<div class="panel-body">
					<form:form role="form" action="/cart/checkout" method="POST" modelAttribute="order">
						<input name="account" value="${ User.username }" hidden>
						<div class="form-group">
							<label for="name">Họ và Tên *</label> <form:input type="text"
								class="form-control form-control-large" id="name" name="fullname" readonly="true"
								path="account" value="${ User.fullname }" />							
						</div>
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
									<label for="phone">Số Điện Thoại *</label> <form:input type="text"
										class="form-control form-control-small" id="phone" path="phone"
										placeholder="Số điện thoại của bạn" />
								</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
									<label for="email">Địa chỉ Email *</label> <form:input path="account"
								class="form-control form-control-large" id="email" readonly="true"
								value="${ User.email }" />
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="state" class="control-label">Địa chỉ giao
								hàng *</label> <form:input type="text" class="form-control" id="state" path="address"
								placeholder="Ví dụ: 288,Nguyễn Văn Linh" />
						</div>

						<select name="tinh" id="province" style="padding: 10px;width: 32.5%">
							<option  value="-1">Chọn tỉnh thành</option>
						</select>
						<select name="huyen" id="district" style="padding: 10px;width: 33%">
							<option value="-1">Chọn quận/huyện</option>
						</select>
						<select name="xa" id="town" style="padding: 10px;width: 33%">
							<option value="-1">Chọn phường/xã</option>
						</select>
<%--						<select name="tinh" id="province">--%>
<%--							<option value="-1">Tỉnh Thành/Chọn tỉnh thành</option>--%>
<%--						</select>--%>
<%--						<select name="huyen" id="district">--%>
<%--							<option value="-1">Quận Huyện/Chọn quận/huyện</option>--%>
<%--						</select>--%>
<%--						<select name="xa" id="town">--%>
<%--							<option value="-1">Chọn Xã/Chọn phường/xã</option>--%>
<%--						</select>--%>


						<h3>Thông tin bổ sung</h3>
						<div class="form-group">
							<label for="note" class="control-label">Ghi chú đơn hàng
								(Không bắt buộc)</label>
							<form:textarea class="form-control" rows="5" id="note" path="note"
								placeholder="Ghi chú về đơn hàng (thời gian nhận hàng hoặc điểm giao hàng chi tiết hơn)."></form:textarea>
						</div>
						<div class="well">
							<button type="submit" class="btn btn-lg btn-success btn-block" 
							${ cartItems.isEmpty() ? "disabled" : "" } >Đặt Hàng</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-xs-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3>Đơn Hàng Của Bạn</h3>
				</div>
				<div class="panel-body">
					<div class="table-responsive">
						<table class="table">
							<thead class="row">
								<tr>
									<th class="col-sm-8">Sản Phẩm</th>
									<th class="col-sm-4 text-right">Thành Tiền</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${ cartItems }">
									<tr>
										<td>${ item.productName }  <b>/${ item.size }</b> <b> x ${ item.quantity }</b></td>
										<td align="right"><b>${ item.price * item.quantity }
												VNĐ</b></td>

									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
<%--							<form action="/giamgia " method="post">--%>
<%--							<tr>--%>
<%--								<td><input name="giamgia"></td>--%>
<%--								<td><button>Sử Dụng</button></td>--%>
<%--							</tr>--%>
<%--								</form>--%>
								<tr class="text-center">
									<td>Tổng Sản Phẩm: </td>
									<td><b>${ Count }</b></td>
								</tr>
								<tr>
									<td><h4>Tổng Tiền</h4></td>
									<td align="right"><h4>${ Amount }VNĐ</h4></td>
								</tr>
							</tfoot>
						</table>
						<hr>
						<b>Trả tiền mặt khi nhận hàng (Hóa đơn chưa kèm phí ship. Quý
							khách vui lòng thanh toán thêm phí ship khi nhận hàng)</b>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script>
	$('#searchOption').change(function() {
		// Lấy giá trị tìm kiếm từ người dùng
		var searchTerm = $(this).val();

		// Lọc các giá trị option theo từ khoá tìm kiếm
		$('#option').find('option').filter(function() {
			return $(this).text().toLowerCase().indexOf(searchTerm.toLowerCase()) > -1;
		}).show();

		// Ẩn các giá trị option không thỏa mãn tìm kiếm
		$('#option').find('option').filter(function() {
			return $(this).text().toLowerCase().indexOf(searchTerm.toLowerCase()) == -1;
		}).hide();
	});

	// Get the form element
	var form = document.querySelector('form');

	// Add a submit event listener to the form
	form.addEventListener('submit', function(event) {
		// Prevent the form from being submitted
		event.preventDefault();

		// Get the value of the "name" field
		var name = document.getElementById('name').value;
		var phone = document.getElementById('phone').value;
		var state = document.getElementById('state').value;


		if (phone == '') {
			// Display an error message using alert
			alert('Vui lòng nhập Số Điện Thoai của bạn');
			return;

		}
		var phoneRegex = new RegExp(/^[0-9]{10}$/);
		if (!phoneRegex.test(phone)) {
			alert('Số điện thoại không hợp lệ. Vui lòng nhập số điện thoại 10 chữ số');
			return;
		}
		if (state == '') {
			// Display an error message using alert
			alert('Vui lòng nhập Địa Chỉ của bạn');
			return;
		}



		if ($('#province').val() == "-1") {
			alert("Vui lòng chọn tỉnh thành");
			return;
		}
		if ($('#district').val() == "-1") {
			alert("Vui lòng chọn quận/huyện");
			return;
		}
		if ($('#town').val() == "-1") {
			alert("Vui lòng chọn Phường/Xã");
			return;
		}



			// If the "name" field is not empty, submit the form
		form.submit();
	});

</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
<script   src="/js/data.json"></script>
<script src="/js/api.js"></script>
