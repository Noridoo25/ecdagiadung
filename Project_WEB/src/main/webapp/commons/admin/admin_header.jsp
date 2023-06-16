<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-expand-xl">
	<div class="container h-100">
		<a class="navbar-brand"
			href="<c:url value="/admin/HomeAdmin?id=${sessionScope.account.userId}"/>">
			<h1 class="tm-site-title mb-0">Product Admin</h1>
		</a>
		<button class="navbar-toggler ml-auto mr-0" type="button"
			data-toggle="collapse" data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars tm-nav-icon"></i>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mx-auto h-100">
				<li class="nav-item"><a class="nav-link ${Page == 1 ? " active" : " "} "
					href="<c:url value="/admin/HomeAdmin?id=${sessionScope.account.userId}"/>">
						<i class="fas fa-tachometer-alt"></i> Dashboard <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle ${Page == 2 ? " active" : " "}" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="far fa-file-alt"></i> <span>
							Reports <i class="fas fa-angle-down"></i>
					</span>
				</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item"
							href="<c:url value="/admin/ControllerReportDaily?id=${sessionScope.account.userId}"/>">Report
							Daily</a> <a class="dropdown-item"
							href="<c:url value="/admin/ControllerReportForDays?id=${sessionScope.account.userId}"/>">Report
							For Days</a>
					</div></li>
				<c:if test="${sessionScope.account.roleId != 1}">
					<li class="nav-item"><a class="nav-link ${Page == 4 ? " active" : " "}"
						href="<c:url value = "/admin/ListProductAndCategory?userId=${sessionScope.account.userId}"/>">
							<i class="fas fa-shopping-cart"></i> Products
					</a></li>
					<li class="nav-item"><a class="nav-link ${Page == 5 ? " active" : " "}"
						href="<c:url value = "/admin/EditShop?userId=${sessionScope.account.userId}"/>">
							<i class="fa fa-shopping-bag" aria-hidden="true"></i>Store
					</a></li>
				</c:if>

				<c:if test="${sessionScope.account.roleId == 1}">
					<li class="nav-item"><a class="nav-link ${Page == 3 ? " active" : " "}"
						href="<c:url value="/admin/ListAccount"/>"> <i
							class="far fa-user"></i> Accounts
					</a></li>
					<li class="nav-item"><a class="nav-link ${Page == 4 ? " active" : " "}"
						href="<c:url value = "/admin/ListAllProductAndCategory"/>">
							<i class="fas fa-shopping-cart"></i> Products
					</a></li>
				</c:if>
				<!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-cog"></i>
                                <span>
                                    Settings <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Profile</a>
                                <a class="dropdown-item" href="#">Billing</a>
                                <a class="dropdown-item" href="#">Customize</a>
                            </div>
                        </li> -->
			</ul>
			<ul class="navbar-nav">
				<li class="nav-item"><a
					href="${pageContext.request.contextPath }/HomeControllerWeb">BACK TO HOME</a></li>
			</ul>
		</div>
	</div>

</nav>
