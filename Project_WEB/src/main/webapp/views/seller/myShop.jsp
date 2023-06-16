<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/BannerShop/" var="slider"></c:url>
<c:url value="/images/" var="images"></c:url>
<c:url value="/images/AvatarShop/" var="avatarShop"></c:url>
<div class="main">

	<section class="module bg-dark-60 about-page-header"
		data-background="${slider }${slideImage.bannerStore}">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">${slideImage.storeName}</h2>
					<div class="module-subtitle font-serif" style="margin-top: 20px;margin-bottom:10px;">${slideImage.email}</div>
					<div class="module-subtitle font-serif"style="margin-top: 0px;margin-bottom:10px;">${slideImage.ward}-
						${slideImage.provin} - ${slideImage.city}</div>
					<div class="box__amount" style="justify-content: center;">
						<div class="rating-shop">
							<label class="rating-text font-serif">RATING: </label> <label
								class="rating-amount font-serif">${numberRating }</label>
						</div>
						<div class="amount-product">
							<label class="amount-product-text font-serif">PRODUCT: </label> <label
								class="product-amount font-serif">${numberProduct} </label>
						</div>
						</br>

					</div>
					<c:if test="${sellerId == sessionScope.account.userId }">
						<div class="module-subtitle font-serif">
							<a class="btn btn-d btn-circle btn-lg"
								href="<c:url value="/admin/HomeAdmin?id=${sellerId}&storeName=${slideImage.storeName}"/>">GO
								TO SHOP</a>
						</div>
					</c:if>
				</div>
			</div>


		</div>
	</section>

	<section class="module-small">
		<div class="container">
			<form class="row" action="MyShopController?id=${sellerId }"
				method="post">
				<div class="col-sm-4 mb-sm-20">
					<select class="form-control" name="sort">
						<option selected="selected" value="defaul">Default
							Sorting</option>
						<option value="productId_desc">New</option>
						<option value="productId_asc">Latest</option>
						<option value="productPrice_asc">High Price</option>
						<option value="productPrice_desc">Low Price</option>
					</select>
				</div>
				<div class="col-sm-4 mb-sm-20">
					<select class="form-control" name="categoryId">
						<option selected="selected" value="all">All</option>
						<c:forEach items="${cates }" var="cate">
							<option value="${cate.categoryId }">${cate.categoryName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-4">
					<input value="${sellerId }" name="Id" style="display: none;">
					<button class="btn btn-block btn-round btn-g" type="submit">Apply</button>
				</div>
			</form>
		</div>
	</section>
	<hr class="divider-w">
	<section class="module-small">
		<div class="container">
			<div class="row multi-columns-row get-product">
				<c:forEach items="${imageMainProduct }" var="imageMainProduct">
					
					<div class="col-sm-6 col-md-4 col-lg-4">
						<div class="shop-item">
							<div class="shop-item-image">
								<img
									src="${images }${imageMainProduct.categoryId}/${imageMainProduct.productImage}"
									alt="Accessories Pack" />
								<div class="shop-item-detail">
									<a
										onclick="addtoCart(${imageMainProduct.productId},${imageMainProduct.productPrice})"
										class="btn btn-round btn-b"><span class="icon-basket">Add
											To Cart</span></a>
								</div>
							</div>
							<h4 class="shop-item-title font-alt">
								<a
									href="<c:url value="/ProductControllerWeb?id=${imageMainProduct.productId}&userId=${imageMainProduct.sellerId}"/>">${imageMainProduct.productName }</a>
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
								href="<c:url value="/GetNext6ProductOfSeller?page=${beginPage - 1 }&index=${(beginPage-1)*5 - 4}&cid=${cateId }&s=${Sort}&sellerId=${sellerId }"/>">
								<i class="fa fa-angle-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${beginPage}" end="${endPage }" var="i">
							<c:if test="${beginPage*5-4<=i && i < beginPage*5+1}">
								<a class="${id == i ? "
									active" : " "}" href="<c:url value="/GetNext6ProductOfSeller?page=${beginPage}&index=${i }&cid=${cateId }&s=${Sort}&sellerId=${sellerId }"/>">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${ beginPage*6<endPage}">
							<a
								href="<c:url value="/GetNext6ProductOfSeller?page=${beginPage + 1 }&index=${(beginPage+1)*5 - 4}&cid=${cateId }&s=${Sort}&sellerId=${sellerId }"/>">
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
	function search(t){
		console.log(t.value);
	}
	function searchByName(para){
		var txtsearch = para.value;
		console.log(txtsearch);
		$.ajax({
			url: "/Project_WEB/SearchProduct",
			type: "get",
			data:{
				txt: txtsearch
			},
		success: function(data){
			var product = $(".get-product");
			product.html(data);
		},
		error: function(xhr){}
		
		});
	}
</script>

