<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="module-small bg-dark">
	<div class="container">
		<div class="row">
			<div class="col-sm-4">
				<div class="widget">
					<h5 class="widget-title font-alt">Contact us</h5>
					<p>The languages only differ in their grammar, their
						pronunciation and their most common words.</p>
					<p>Phone: +1 234 567 89 10</p>
					Fax: +1 234 567 89 10
					<p>
						Email:<a href="#">THANHPHU@gmail.com</a>
					</p>
				</div>
			</div>

			<div class="col-sm-4">
				<div class="widget">
					<h5 class="widget-title font-alt">Additional Info</h5>
					<p>I am alone, and feel the charm of existence in this spot,
						which was created for the bliss of souls like mine. I am so happy,
						my dear friend.</p>

					<ul class="list-unstyled">
						Bussiness Hours
						<li>Mo - Fr: 8am to 6pm</li>
						<li>Sa, Su: 10am to 2pm</li>
					</ul>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="widget">
					<h5 class="widget-title font-alt">Information</h5>
					<ul class="icon-list">
						<li><a href="<c:url value="/AllProductControllerWeb"/>">Shop</a></li>
						<li><a href="<c:url value="/AboutControllerWeb"/>">About</a></li>
						<li><a href="<c:url value="/ContactControllerWeb"/>">Contact</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</div>
<hr class="divider-w">

<footer class="footer bg-dark">
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<p class="copyright font-alt">
					&copy; 2023&nbsp;<a href="index.html">THANHPHU</a>, All Rights
					Reserved
				</p>
			</div>
			<div class="col-sm-6">
				<div class="footer-social-links">
					<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
						class="fa fa-twitter"></i></a><a href="#"><i
						class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
				</div>
			</div>
		</div>
	</div>
</footer>
