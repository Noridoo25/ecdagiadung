<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container">

	<div class="row">

		<div class="col-12 tm-block-col">
			<div
				class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
				<c:if test="${sessionScope.account.roleId == 1}">
					<a class="btn btn-primary btn-block"
					href="<c:url value="/admin/ControllerReportDaily?id=${u}"/>"> Report Daily </a>
				</c:if>
				<h2 class="post-title">Choose date:</h2>
				<div class="tm-block-col" style="display: flex; width: 100%;">

					<form action="ControllerReportForDays" method="POST"
						style="display: flex; flex-wrap: wrap; width: 100%;">
						<input type="date" name="FromDate"
							style="width: 30%; border: none; margin-right: 10px;"> <input
							type="date" name="ToDate"
							style="width: 43%; border: none; margin-right: 10px;">
						<button class="btn btn-sm btn-defaut col-3">
							<i class="fa fa-cog fa-spin"></i>Statistic
						</button>
					</form>
				</div>
				<button class="btn btn-default btn-block col-3"
					onCLick="drawLine1Chart(`${productOfForDay}`,`${TotalProductOfForDay }`)">
					<i class="fa fa-cog fa-spin"></i>Charts
				</button>
				<h2 class="tm-block-title">Statistic List</h2>
		<table class="table">
			<thead>
				<tr>

					<th scope="col">STT</th>
					<c:if test="${user.roleId != 1}">
						<th>Product ID</th>
						<th>Product Name</th>
					</c:if>
					<c:if test="${user.roleId == 1}">
						<th scope="col">Store ID</th>
						<th scope="col">Store Name</th>
						<th scope="col">Email</th>

					</c:if>

					<th scope="col">Amount</th>
					<th scope="col">TurnOver</th>

				</tr>
			</thead>
			<tbody>
				<c:set var="order" value="${0}" />
				<c:forEach items="${listReports}" var="kq">
					<c:set var="order" value="${order + 1}" />
					<tr>
						<td><b>${order }</b></td>
						<c:if test="${user.roleId == 1}">
							<td><b>${kq.storeId}</b></td>
							<td><b>${kq.storeName}</b></td>
							<td><b>${kq.email}</b></td>

						</c:if>

						<c:if test="${user.roleId != 1}">
							<td>${kq.productId}</td>
							<td>${kq.productName}</td>
						</c:if>
						<td><b>${kq.amount}</b></td>
						<td><b>${kq.total} VNĐ</b></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:set var="total" value="${0}" />
		<c:forEach items="${listReports}" var="kq">
			<c:set var="total" value="${total + kq.total}" />
		</c:forEach>
		<h3>TOTAL: ${total } VNĐ</h3>
			</div>
		</div>
		<br>
		
	</div>
	<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
		<div class="tm-bg-primary-dark tm-block">
			<h2 class="tm-block-title"
				onCLick="drawLine1Chart(`${productOfForDay}`,`${TotalProductOfForDay }`)"
				style="cursor: pointer;">Statistic for day</h2>
			<canvas id="lineChart1"></canvas>
		</div>
	</div>
</div>
<script>
	function drawLine1Chart(data, price) {
		
		let arr = data.replace("[", "").replace("]", "").split(',');
		let p = price.replace("[", "").replace("]", "").split(',');
		/* var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
		var yValues = [55, 49, 44, 24, 15]; */
		var barColors = ["#FF0000", "#00FF00", "#0000FF", "#FFFF00", "#FF00FF", "#00FFFF", "#FFA500", "#800080", "#008080", "#FFC0CB", "#FF4500", "#FFD700", "#FF69B4", "#00CED1", "#7CFC00", "#DA70D6", "#DC143C", "#00FF7F", "#6495ED", "#FF8C00", "#FA8072", "#66CDAA", "#FFDAB9", "#CD5C5C", "#B8860B", "#FFA07A", "#20B2AA", "#9370DB", "#3CB371", "#FF1493", "#1E90FF", "#8A2BE2", "#D2691E", "#FFB6C1", "#7B68EE", "#4169E1", "#FF6347", "#228B22", "#BDB76B", "#8B008B", "#FF4500", "#2E8B57", "#DAA520", "#6A5ACD", "#FF00FF", "#1E90FF", "#FF69B4", "#F08080", "#32CD32", "#800000", "#FFA500", "#FFD700", "#B22222", "#008000"];
		var a = [];
		for (var i = 0; i < p.length; i++) {
			a.push(parseInt(p[i]));
		}
		new Chart("lineChart1", {
			type : "bar",
			data : {
				labels : arr,
				datasets : [ {
					backgroundColor : barColors,
					data : a
				} ]
			},
			options : {
				legend : {
					display : false
				},
				title : {
					display : true,
					text : "Price of Product for day"
				}
			}
		});
		
	}
</script>