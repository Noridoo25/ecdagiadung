<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/slider/" var="slider"></c:url>
<c:url value="/images/" var="images"></c:url>
<div class="main">
	<section class="module bg-dark-60 about-page-header"
			data-background="https://cb.scene7.com/is/image/Crate/cb_dHP_20221130_Hero-1?wid=1440&qlt=50">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3">
						<h2 class="module-title font-alt">Product</h2>
						<div class="module-subtitle font-serif">
							<p style="color: #fff">New &amp; Exclusive. The GE Profile<sup>™</sup><br> Smart Mixer is designed to work<br>alongside you in the kitchen. </p></div>

					</div>
				</div>
			</div>
		</section>
	<section class="module-small">
		<div class="container">
			<form class="row" action="AllProductControllerWeb" method="post">
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
									<a class="btn btn-round btn-b"<%-- href="<c:url value="/CartController?productId=${imageMainProduct.productId}&price=${imageMainProduct.productPrice}"/>" --%>><span
										onclick="addtoCart(${imageMainProduct.productId},${imageMainProduct.productPrice})"
										class="icon-basket">Add To Cart</span></a>
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
								href="<c:url value="/GetNext6Product?page=${beginPage - 1 }&index=${(beginPage-1)*5 - 4}&cid=${cateId }&s=${Sort}"/>">
								<i class="fa fa-angle-left"></i>
							</a>
						</c:if>
						<c:forEach begin="${beginPage}" end="${endPage }" var="i">

							<c:if test="${beginPage*5-4<=i && i < beginPage*5+1}">
								<a class="${id == i ? "
									active" : " "}" href="<c:url value="/GetNext6Product?page=${beginPage}&index=${i }&cid=${cateId }&s=${Sort}"/>">${i}</a>
							</c:if>




						</c:forEach>
						<c:if test="${ beginPage*6<endPage}">
							<a
								href="<c:url value="/GetNext6Product?page=${beginPage + 1 }&index=${(beginPage+1)*5 - 4}&cid=${cateId }&s=${Sort}"/>">
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

	}
	
	function searchByName(para) {
		key = para.value;
		var txtsearch = para.value;
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

