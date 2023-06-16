<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/ControllerMyAccount/edit" var="edit"></c:url>
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
					<h4 class="font-alt">Password Reset</h4>
					<div class="card-body px-5">
						<p class="card-text py-2">Change your password in three easy
							steps. This will help you to secure your password.</p>
						<ol class="list-unstyled">
							<li><span class="text-primary text-medium">1. </span> Enter
								your email address.</li>
							<li><span class="text-primary text-medium">2. </span> Our
								system will send you an OTP to your email.</li>
							<li><span class="text-primary text-medium">3. </span> Enter
								the OTP on the next page.</li>
						</ol>
					</div>
					<form class="card mt-4" action="ForgetPasswordController"
						method="POST">
						<c:if test="${alertReset != null }">
							<h3 class="alert alert-danger">${alertReset }</h3>
						</c:if>
						<div class="form-outline">
							<input type="email" id="typeEmail" name="email"
								class="form-control my-3" /> <label class="form-label"
								for="typeEmail">Email</label>
						</div>
						<div class="d-flex justify-content-between mt-4">
							<button class="btn btn-success btn-round btn-b" type="submit">Get New
								Password</button>
							<div class="form-group">
								<a href="<c:url value="/ControllerLogin"/>">Back To Login</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</div>
