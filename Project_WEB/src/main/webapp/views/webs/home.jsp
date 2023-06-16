<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/" var="images"></c:url>
<section class="home-section home-fade home-full-height" id="home">
	<div class="hero-slider">
		<ul class="slides">
			<li class="bg-dark-30 bg-dark shop-page-header"
				style="background-image: url(https://cb.scene7.com/is/image/Crate/cb_dSC_20221201_GEMixer_SuperHero?wid=1160&qlt=80&op_sharpen=1);">
				<div class="titan-caption">
					<div class="caption-content">
						<div class="font-alt mb-30 titan-title-size-1">This is ThanhPhu</div>
						<div class="font-alt mb-30 titan-title-size-4">Summer 2023</div>
						<div class="font-alt mb-40 titan-title-size-1">Your online
							fashion destination</div>
						<a class="section-scroll btn btn-border-w btn-round"
							href="<c:url value='/AllProductControllerWeb '/>">Learn More</a>
					</div>
				</div>
			</li>
			<li class="bg-dark-30 bg-dark shop-page-header"
				style="background-image: url(https://cb.scene7.com/is/image/Crate/cb_dHP_20221124_8_Gifts_V2?wid=1440&qlt=70&op_sharpen=1);">
				<div class="titan-caption">
					<div class="caption-content">
						<div class="font-alt mb-30 titan-title-size-1">This is ThanhPhu</div>
						<div class="font-alt mb-40 titan-title-size-4">Exclusive
							products</div>
						<a class="section-scroll btn btn-border-w btn-round"
							href="<c:url value='/AllProductControllerWeb '/>">Learn More</a>
					</div>
				</div>
			</li>
		</ul>
	</div>
</section>
<div class="main">
	<section class="module-small">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Latest in clothing</h2>
				</div>
			</div>

			<div class="row multi-columns-row">
				<c:forEach items="${latestProduct }" var="p">
					<div class="col-sm-6 col-md-3 col-lg-3">
						<div class="shop-item">
							<div class="shop-item-image">
								<img src="${images }${p.categoryId}/${p.productImage}"
									alt="Accessories" />
								<div class="shop-item-detail">
									<a class="btn btn-round btn-b"
										<%-- href="<c:url value="/CartController?productId=${p.productId}&price=${p.productPrice}"/> --%>"><span
										onclick="addtoCart(${p.productId},${p.productPrice})"
										class="icon-basket">Add To Cart</span></a>
								</div>
							</div>
							<h4 class="shop-item-title font-alt">
								<a
									href="<c:url value="/ProductControllerWeb?id=${p.productId}&userId=${p.sellerId }"/>">${p.productName}</a>
							</h4>${p.productPrice } VNĐ
						</div>
					</div>
				</c:forEach>
			</div>

			<div class="row mt-30">
				<div class="col-sm-12 align-center">
					<a class="btn btn-b btn-round"
						href="<c:url value='/AllProductControllerWeb '/>">See all
						products</a>
				</div>
			</div>
		</div>
	</section>
	<section class="module module-video bg-dark-30" data-background="https://cb.scene7.com/is/image/Crate/cb_dSC_20221020_KTCH_Deals?wid=1160&qlt=80&op_sharpen=1">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt mb-0">Be inspired. Get ahead
						of trends.</h2>
				</div>
			</div>
		</div>
		<div class="video-player"
			data-property="{videoURL:'https://www.youtube.com/watch?v=EMy5krGcoOU', containment:'.module-video', startAt:0, mute:true, autoPlay:true, loop:true, opacity:1, showControls:false, showYTLogo:false, vol:25}"></div>
	</section>
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Exclusive products</h2>
					<div class="module-subtitle font-serif">The languages only
						differ in their grammar, their pronunciation and their most common
						words.</div>
				</div>
			</div>
			<div class="row">

				<div class="owl-carousel text-center" data-items="0"
					data-pagination="false" data-navigation="false">
					<c:forEach items="${latestProduct }" var="e">
						<div class="owl-item">
							<div class="col-sm-12">
								<div class="ex-product">
									<a href="#"><img
										src="${images }${e.categoryId}/${e.productImage}"
										alt="Leather belt" /></a>
									<h4 class="shop-item-title font-alt">
										<a
											href="<c:url value="/ProductControllerWeb?id=${e.productId}&userId=${e.sellerId }"/>">${e.productName }</a>
									</h4>${e.productPrice } VNĐ
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</div>
	</section>
	<hr class="divider-w">
	<hr class="divider-w">



</div>
