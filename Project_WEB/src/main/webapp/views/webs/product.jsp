<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url value="/images/" var="images"></c:url>
<c:url value="/images/AvatarShop/" var="avatarShop"></c:url>
<div class="main">
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 mb-sm-40">
					<div
						style="-swiper-navigation-color: #fff; - -swiper-pagination-color: #fff"
						class="swiper mySwiper2 ">
						<div class="swiper-wrapper">
							<c:forEach items="${ productDetail}" var="pD">
								<div class="swiper-slide">
									<img src="${images }${pD.categoryId}/${pD.productImage}"
										alt="${pD.productImage }" />
								</div>
							</c:forEach>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<div thumbsSlider="" class="swiper mySwiper product-gallery">
						<div class="swiper-wrapper">
							<c:forEach items="${ productDetail}" var="pD">
								<div class="swiper-slide">
									<img src="${images }${pD.categoryId}/${pD.productImage}"
										alt="${pD.productImage }" />
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="row">
						<div class="col-sm-12">
							<h1 class="product-title font-alt">${productDetail[0].productName }</h1>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<!-- <span><i class="fa fa-star star"></i></span><span><i
								class="fa fa-star star"></i></span><span><i
								class="fa fa-star star"></i></span><span><i
								class="fa fa-star star"></i></span><span><i
								class="fa fa-star star-off"></i></span> --><a
								class="open-tab section-scroll" href="#reviews">${fn:length(allComment)}
								customer reviews</a>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="price font-alt">
								<span class="amount">${productDetail[0].productPrice } VNĐ</span>
							</div>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="description">
								<p>${productDetail[0].depiction }</p>
							</div>
						</div>
					</div>
					<div class="row mb-20">

						<div class="col-sm-12">
							<a class="btn btn-lg btn-block btn-round btn-b"
								onclick="addtoCart(${productDetail[0].productId},${productDetail[0].productPrice})">Add
								To Cart</a>
						</div>
					</div>
					<div class="row mb-20">
						<div class="col-sm-12">
							<div class="product_meta">
								Category:<a href="#"> ${cate.categoryName } </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row mt-50">
				<div class="col-sm-12 box__shop">
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
										class="rating-amount">${numberRating }</label>
								</div>
								<div class="amount-product">
									<label class="amount-product-text">PRODUCT: </label> <label
										class="product-amount">${numberProduct} </label>
								</div>
							</div>

							<a href="<c:url value="/MyShopController?id=${sellerId }"/>"
								class="btn-shop btn btn-lg btn-block btn-round btn-b"> <i
								class="fa fa-shopping-bag" aria-hidden="true"></i> REVIEW SHOP
							</a>
						</div>
					</div>

				</div>
			</div>
			<div class="row mt-70">
				<div class="col-sm-12">
					<ul class="nav nav-tabs font-alt" role="tablist">
						<li class="active"><a href="#description" data-toggle="tab"><span
								class="icon-tools-2"></span>Description</a></li>
						
						<li><a href="#reviews" data-toggle="tab"><span
								class="icon-tools-2"></span>Reviews (${fn:length(allComment)})</a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="description">

								<p>${productDetail[0].detail }</p>
						</div>
						
						<div class="tab-pane" id="reviews">
							<div class="comments reviews">
								<c:forEach items="${comment }" var="c">

									<div class="comment clearfix">
										<div class="comment-avatar">
											<img src="https://d1nhio0ox7pgb.cloudfront.net/_img/o_collection_png/green_dark_grey/512x512/plain/user.png" alt="avatar" />
										</div>
										<div class="comment-content clearfix">
											<div class="comment-author font-alt">
												<a href="#">${c.user.userName }</a>
											</div>
											<div class="comment-body">
												<p>${c.content }</p>
											</div>
											<div class="comment-meta font-alt">
												${c.time }-
												<c:choose>
													<c:when test="${c.rating == 1 }">
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
													</c:when>
													<c:when test="${c.rating == 2 }">
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
													</c:when>
													<c:when test="${c.rating == 3 }">
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
													</c:when>
													<c:when test="${c.rating == 4 }">
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star-off"></i></span>
													</c:when>
													<c:when test="${c.rating == 5 }">
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>
														<span><i class="fa fa-star star"></i></span>

													</c:when>


												</c:choose>



											</div>
										</div>
									</div>
								</c:forEach>


							</div>
							<div class="row">
								<div class="col-sm-12">
									<div class="pagination font-alt">
										<c:forEach begin="${beginPage}" end="${endPage }" var="i">
											<c:if test="${beginPage  > 1}">
												<a
													href="<c:url value="/GetNext6CommentOfProductController?Page=${beginPage - 1 }&index=${beginPage - 1 }&seller=${sellerId }&productId=${productDetail[0].productId }"/>">
													<i class="fa fa-angle-left"></i>
												</a>
											</c:if>
											<c:if test="${i < beginPage*6}">
												<a class="${id == i ? "
													active" : " "}" href="<c:url value="/GetNext6CommentOfProductController?Page=${beginPage}&index=${i }&seller=${sellerId }&productId=${productDetail[0].productId }"/>">${i}</a>
											</c:if>


											<c:if test="${ beginPage*6<endPage}">
												<a
													href="<c:url value="/GetNext6CommentOfProductController?Page=${beginPage + 1 }&index=${beginPage + 1 }&seller=${sellerId }&productId=${productDetail[0].productId }"/>">
													<i class="fa fa-angle-right"></i>
												</a>
											</c:if>

										</c:forEach>



									</div>
								</div>
							</div>
							<c:if test="${checkBought == 1 }">
							<div class="comment-form mt-30">
								<h4 class="comment-form-title font-alt">Add review</h4>
								<form action="CommentController" method="post">
									<div class="row">
		
										<div class="col-sm-12">
											<div class="form-group">
												<select class="form-control" name="rating">
													<option selected="true" disabled="">Rating</option>
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
												</select>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="form-group">
												<textarea class="form-control" id="" name="content" rows="4"
													placeholder="Review"></textarea>
											</div>
										</div>
										<div class="col-sm-12">
											<input value="${productDetail[0].productId }"
												name="productId" style="display: none"> <input
												value="${sellerId }" name="sellerId" style="display: none">
											<button class="btn btn-round btn-d" type="submit">Submit
												Review</button>
										</div>
									</div>
								</form>
							</div>
							
							</c:if>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr class="divider-w">
	<section class="module-small">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Related Products</h2>
				</div>
			</div>
			<div class="row multi-columns-row">
				<c:forEach items="${imageMainProduct }" var="pd">
					<div class="col-sm-6 col-md-3 col-lg-3">
						<div class="shop-item">
							<div class="shop-item-image">
								<img src="${images }${pd.categoryId}/${pd.productImage}"
									alt="Accessories Pack" />
								<div class="shop-item-detail">
									<a class="btn btn-round btn-b" onclick="addtoCart(${pd.productId},${pd.productPrice})"><span class="icon-basket">Add
											To Cart</span></a>
								</div>
							</div>
							<h4 class="shop-item-title font-alt">
								<a href="<c:url value="/ProductControllerWeb?id=${pd.productId}&userId=${pd.sellerId }"/>">${pd.productName }</a>
							</h4>
							${pd.productPrice} VNĐ
						</div>
					</div>
				</c:forEach>


			</div>
		</div>
	</section>
	<hr class="divider-w">



</div>
<script>


</script>