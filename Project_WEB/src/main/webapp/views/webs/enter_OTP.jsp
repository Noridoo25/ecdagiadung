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
		<div class="form-gap">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-md-offset-4">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="text-center">
									<h3>
										<i class="fa fa-lock fa-4x"></i>
									</h3>
									<h2 class="text-center">Enter OTP</h2>

									<div class="panel-body">
										<form id="register-form" action="CheckOTP" role="form"
											autocomplete="off" class="form" method="POST">
											<c:if test="${status != null }">
												<h3 class="alert alert-danger">${status }</h3>
											</c:if>
											<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon"> <i
														class="glyphicon glyphicon-envelope color-blue"></i>
													</span> <input id="otp" name="otp" placeholder="Enter OTP"
														class="form-control" type="text" required="required">
												</div>
											</div>
											<div class="form-group">
												<input name="recover-submit"
													class="btn btn-success btn-round btn-b"
													value="Reset Password" type="submit">
											</div>

											<input type="hidden" class="hide" name="token" id="token"
												value="">
											<div class="form-group">
												<a href="<c:url value="/ControllerLogin"/>">Back To
													Login</a>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>

