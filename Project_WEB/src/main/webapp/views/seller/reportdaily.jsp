<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<div class="row">

		<div class="row">
			<div class="col-sm-3">
				</br> </br> </br> </br>

				<h2 class="post-title">Choose date:</h2>
				<form action="ReportDailyController" method="POST">
					<input type="date" name="date">
					<button class="btn btn-sm btn-defaut">Statistic</button>
				</form>
			</div>
			<div class="row" style="float: right">
				<button class="btn btn-info btn-sm" data-toggle="modal"
					data-target="#bieudotheongay">Charts</button>
				<div class="modal fade" id="bieudotheongay" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" style="text-align: center">Chart
									product sales by day</h4>
							</div>
							<div class="modal-body"></div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
		<br>
		<div class="row ">
			<table id="datatable-buttons"
				class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>STT</th>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Amount</th>
						<th>TurnOver</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="order" value="${0}" />
					<c:forEach items="${listReports}" var="kq">
						<c:set var="order" value="${order + 1}" />
						<tr>
							<td>${order }</td>
							<td>${kq.productId}</td>
							<td>${kq.productName}</td>
							<td>${kq.amount}</td>
							<td>${kq.total} VNĐ</td>
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
</div>