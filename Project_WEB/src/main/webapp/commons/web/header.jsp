	<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="page-loader">
	<div class="loader">Loading...</div>
</div>
<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#custom-collapse">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value="HomeControllerWeb"/>">ThanhPhu</a>
		</div>
		<div class="header-search">
			<form id="header-header-search-form" action="SearchProduct"
				class="site-search search-area-sli react-search-form " method="post">
				<div>
					<input type="search" id="header-header-search-input" name="search"
						oninput="searchByName(this)" value=""
						class="search-typeAhead-input "
						placeholder="What can we help you find?" maxlength="100"
						autocomplete="off" value="" aria-label="Search" role="combobox"
						aria-expanded="false" aria-controls="typeAhead-result-header"
						aria-autocomplete="both" aria-activedescendant=""
						aria-owns="typeAhead-result-header">
					<div></div>
					<button id="header-header-search-button" type="submit"
						value="Submit" class="header-search-icon ">
						<i class="fa fa-search" aria-hidden="true"></i><span
							class="sr-only">Search</span>
					</button>
					<span class="underline
                  "></span>
					<div aria-live="polite" class="sr-only"></div>
				</div>
			</form>
		</div>
		<div class="collapse navbar-collapse" id="custom-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<c:url value="/HomeControllerWeb"/>">Home</a></li>
				<li><a href="<c:url value="/AllProductControllerWeb"/>">Shop</a></li>
				<li><a href="<c:url value="/AboutControllerWeb"/>">About</a></li>
				<li><a href="<c:url value="/ShoppingCartControllerWeb"/>">Cart</a></li>
				<li><a href="<c:url value="/ContactControllerWeb"/>">Contact</a></li>
				<c:choose>
					<c:when test="${sessionScope.account == null}">
						<li><a
							href="${pageContext.request.contextPath }/ControllerLogin">Login
								/ Register</a></li>
					</c:when>
					<c:when test="${sessionScope.account.roleId == 1 }">
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle"
							href="<%-- ${pageContext.request.contextPath}/member/myaccount --%>#">HEllO
								${sessionScope.account.userName}</a>
							<ul class="dropdown-menu" role="menu">
								<li><a
									href="${pageContext.request.contextPath }/ControllerMyAccount/edit?userId=${sessionScope.account.userId}">My
										Account</a></li>
								<li><a
									href="${pageContext.request.contextPath }/MyOrdersController?userId=${sessionScope.account.userId}">My
										Orders</a></li>
								<li><a
									href="${pageContext.request.contextPath }/admin/HomeAdmin?id=${sessionScope.account.userId}">Admin</a></li>
								<li><a
									href="${pageContext.request.contextPath }/ControllerLogout">LogOut</a></li>
							</ul></li>
					</c:when>
					<c:otherwise>
						<li class="dropdown"><a data-toggle="dropdown"
							class="dropdown-toggle"
							href="<%-- ${pageContext.request.contextPath}/member/myaccount --%>#">HEllO
								${sessionScope.account.userName}</a>
							<ul class="dropdown-menu" role="menu">
								<li><a
									href="${pageContext.request.contextPath }/ControllerMyAccount/edit?userId=${sessionScope.account.userId}">My
										Account</a></li>
								<li><a
									href="${pageContext.request.contextPath }/MyOrdersController?userId=${sessionScope.account.userId}">My
										Orders</a></li>
								<li><a
									href="${pageContext.request.contextPath }/MyShopController?id=${sessionScope.account.userId}">My
										Shop</a></li>
								<%-- <li><a
									href="${pageContext.request.contextPath }/ReportDailyController?id=${sessionScope.account.userId}">My
										Report</a></li> --%>
								<li><a
									href="${pageContext.request.contextPath }/ControllerLogout">LogOut</a></li>
							</ul></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</div>
</nav>
<div class="alert alert-success hide" role="alert">

	<i class="fa fa-cog fa-spin"></i><strong>Add product to cart
		success!</strong>
</div>
