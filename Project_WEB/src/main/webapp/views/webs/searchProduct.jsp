<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/slider/" var="slider"></c:url>
<c:url value="/images/" var="images"></c:url>
<c:url value="/images/AvatarShop/" var="avatarShop"></c:url>
<div class="main">
	<section class="module bg-dark-60 about-page-header"
		data-background="https://cb.scene7.com/is/image/Crate/cb_dHP_20221130_Hero-1?wid=1440&qlt=50">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Search "${key }"</h2>
					<div class="module-subtitle font-serif">
						<p style="color: #fff">
							New &amp; Exclusive. The GE Profile<sup>™</sup><br> Smart
							Mixer is designed to work<br>alongside you in the kitchen.
						</p>
					</div>

				</div>
			</div>
		</div>
	</section>


	<section class="module-small">
		<div class="container get-product">

			<div class="row mt-50">
				<c:forEach items="${listStore }" var="store">
					<div class="col-sm-12 box__shop" style="margin: 20px 0;">
						<div class=" avatar__shop">
							<a class="box-avatar-shop">
								<div class="box-avatar__placeholder">
									<img src="${avatarShop }${store.avartarStore}" alt="">
								</div>

							</a>
							<div class="info-shop">
								<div class="shop-name">
									<label>${store.storeName }</label>
								</div>
								<div class="box__amount">
									<div class="rating-shop">
										<label class="rating-text">RATING: </label> <label
											class="rating-amount">${store.numberRating }</label>
									</div>
									<div class="amount-product">
										<label class="amount-product-text">PRODUCT: </label> <label
											class="product-amount">${store.numberProduct} </label>
									</div>
								</div>

								<a href="<c:url value="/MyShopController?id=${store.userId }"/>"
									class="btn-shop btn btn-lg btn-block btn-round btn-b"> <i
									class="fa fa-shopping-bag" aria-hidden="true"></i> REVIEW SHOP
								</a>
							</div>
						</div>

					</div>
				</c:forEach>

			</div>
			<div class="row multi-columns-row ">

				
				<c:forEach items="${imageMainProduct }" var="imageMainProduct">
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="shop-item">
							<div class="shop-item-image">
								<img
									src="${images }${imageMainProduct.categoryId}/${imageMainProduct.productImage}"
									alt="Accessories Pack" />
								<div class="shop-item-detail">
									<a onclick="addtoCart(${imageMainProduct.productId},${imageMainProduct.productPrice})" class="btn btn-round btn-b"><span class="icon-basket">Add
											To Cart</span></a>
								</div>
							</div>
							<h4 class="shop-item-title font-alt">
								<a
									href="<c:url value="/ProductControllerWeb?id=${imageMainProduct.productId}&userId=${imageMainProduct.sellerId }"/>">${imageMainProduct.productName }</a>
							</h4>${imageMainProduct.productPrice}
							VNĐ
						</div>
					</div>
				</c:forEach>

			</div>
			<div class="row">
				<div class="col-sm-12">
					<div class="pagination font-alt">
						<c:if test="${beginPage  > 1}">
							<a
								href="<c:url value="/GetNext6ProductSearch?page=${beginPage - 1 }&index=${(beginPage-1)*6 - 5}&cid=${cateId }&s=${Sort}&key=${key}"/>">
								<i class="fa fa-angle-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${beginPage}" end="${endPage }" var="i">

							<c:if test="${beginPage*6-5<=i && i < beginPage*6}">
								<a class="${id == i ? "
									active" : " "}" href="<c:url value="/GetNext6ProductSearch?page=${beginPage}&index=${i }&cid=${cateId }&s=${Sort}&key=${key}"/>">${i}</a>
							</c:if>




						</c:forEach>
						<c:if test="${ beginPage*6<endPage}">
							<a
								href="<c:url value="/GetNext6ProductSearch?page=${beginPage + 1 }&index=${(beginPage+1)*6 - 5}&cid=${cateId }&s=${Sort}&key=${key}"/>">
								<i class="fa fa-angle-right"></i>
							</a>
						</c:if>


					</div>
				</div>
			</div>
		</div>
	</section>


</div>
<script>
var key = "";
	function search(t) {
		console.log(t.value);
	}
	function searchByName(para) {
		key = para.value;
		var txtsearch = para.value;
		console.log(txtsearch);
		$.ajax({
			url : "/Project_WEB/SearchProduct",
			type : "get",
			data : {
				txt : txtsearch
			},
			success : function(data) {
				var product = $(".get-product");
				product.html(data);
				$(".pagination").html("<button class=\"btn btn-block btn-round btn-g\" onClick=\"loadMore()\">LOAD MORE</button>");
			},
			error : function(xhr) {
			}

		});
	}
	function loadMore(){
		var amount = $(".shop-item").length;
		$.ajax({
			url: "/Project_WEB/LoadMore6ProductSearch",
			type:"get",
			data:{
				exits: amount,
				key: key,
			},
			success:function(data){
				$(".get-product").append(data);
			},
			error:function(xhr){
				}
		});
	}
</script>
