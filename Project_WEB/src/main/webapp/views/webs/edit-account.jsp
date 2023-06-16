<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/ControllerMyAccount/edit" var="edit"></c:url>
<div class="main">
	<section class="module bg-dark-30 about-page-header"
		data-background="https://images.crateandbarrel.com/is/image/Crate/account-login-hero?wid=1440&qlt=40,1">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h1 class="module-title font-alt mb-0">MY ACCOUNT</h1>
				</div>
			</div>
		</div>
	</section>
	<section class="module">
		<div class="container">
			<div class="row">
				<form class="form" role="form" action="edit" method="post">
					<div class="col-sm-8 col-sm-offset-2">
						<h4 class="font-alt mb-0">MY ACCOUNT</h4>
						<hr class="divider-w mt-10 mb-20">
						<c:if test="${alert != null }">
							<h3 class="alert alert-danger">${alert }</h3>
						</c:if>
						<div class="form-group">
							<label for="name">UserName </label> <input class="form-control "
								type="text" name="username" value="${useracc.userName }" />
						</div>
						<div class="form-group">
							<label for="firstname">FirstName </label> <input class="form-control"
								type="text" placeholder="FirstName" name="firstname"
								value="${useracc.firstName }" />
						</div>
						<div class="form-group">
							<label for="lastname">LastName </label> <input class="form-control "
								type="text" placeholder="lastName" name="lastname" value="${useracc.lastName }" />
						</div>
						<div class="form-group">
							<label for="email">Email </label> <input class="form-control"
								type="text" placeholder="email"  name ="email" 
								value="${useracc.email }" />
						</div>

						<div class="form-group">
							<label for="address">Address </label> <input class="form-control"
								type="text" placeholder="address" name="address" value="${useracc.addr }" />
						</div>
						<div class="form-group">
							<label for="phone">Phone </label> <input class="form-control"
								type="text" placeholder="phone" name="phone" 
								value="${useracc.phone }" />
						</div>
						
						<div class="panel-group" id="accordion">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title font-alt">
										<a data-toggle="collapse" class="collapsed"
											data-parent="#accordion" href="#support1">Change Password</a>
									</h4>
								</div>
								<div class="panel-collapse collapse " id="support1">
									<div class="panel-body">
										<label for="newpassword">Password </label> <input
											class="form-control input-sm" type="text"
											placeholder="Password" name="newpassword" /> <label for="repass">Re-pass
										</label> <input class="form-control input-sm" type="text"
											placeholder="Re-Password" name="repass" />
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-8 col-sm-offset-2">
					<c:choose>
						<c:when test="${useracc.roleId==3}">
						<div class="col-md-4">
							<p>
								<button type="submit" class="btn btn-default btn-block">
									<i class="fa fa-plug"></i>EDIT ACCOUNT
								</button>
							</p>
						</div>
						<div class="col-md-4">
							<p>
								<button type="reset" class="btn btn-primary btn-block">
									<i class="fa fa-cog fa-spin"></i>RESET
								</button>
							</p>
						</div>
						<div class="col-md-4">
							<p>
								<a class="btn btn-success btn-round btn-block"
									href="<c:url value="/RegisterStoreController?userId=${sessionScope.account.userId }"/>"><i
									class="fa fa-paper-plane-o"></i>REGISTER STORE</a>
							</p>
						</div>
						</c:when>
						
						<c:otherwise>
						<div class="col-md-6">
							<p>
								<button type="submit" class="btn btn-default btn-block">
									<i class="fa fa-plug"></i>EDIT ACCOUNT
								</button>
							</p>
						</div>
						<div class="col-md-6">
							<p>
								<button type="reset" class="btn btn-primary btn-block">
									<i class="fa fa-cog fa-spin"></i>RESET
								</button>
							</p>
						</div>
						</c:otherwise>
					</c:choose>
					</div>
				</form>
			</div>
		</div>
	</section>
</div>

