<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="main">
	<section class="module bg-dark-30"
		data-background="/template/project/assets/images/section-4.jpg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h1 class="module-title font-alt mb-0">Password Reset</h1>
				</div>
			</div>
		</div>

	</section>
	<section class="module" style="padding: 60px 0">
		<div class="container">
			<div class="row"
				style="display: flex; justify-content: center; text-align: center;">
				<div class="col-sm-6  mb-sm-40"
					style="padding: 10px 20px; border: 1px solid #ddd; border-radius: 10px; -webkit-box-shadow: 10px 10px 10px rgb(0 0 0/ 40%);">
					<form class="card mt-4" action="ResetPasswordController"
						method="POST">

						<c:if test="${alertSucc != null }">
							<h3 class="alert alert-success">${alertSucc }</h3>
						</c:if>
						<c:if test="${alertMess != null }">
							<h3 class="alert alert-danger">${alertMess }</h3>
						</c:if>
						<div class="form-group">
							<label for="password" style="font-size: 14px;">New Password</label> <input type="password"
								name="password" class="form-control" id="password"
								placeholder="Password">
						</div>
						<div class="form-group">
							<label for="repassword" style="font-size: 14px;">Re-Password</label> <input
								type="password" name="repassword" class="form-control"
								id="repassword" placeholder="Re-Password">
						</div>
						<button type="submit" class="btn btn-success btn-round btn-b">Reset
							Password</button>
						<div class="form-group">
							<a href="<c:url value="/ControllerLogin"/>" style="font-size: 14px;">Back To Login</a>
						</div>
					</form>

				</div>
			</div>
		</div>

	</section>

</div>
