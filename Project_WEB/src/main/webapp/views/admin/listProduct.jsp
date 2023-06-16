<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container mt-5">
	<div class="row tm-content-row">
		<div class="col-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block-taller"
					style="padding: 20px; position: relative;">
					<form action="ListProductAndCategory" method="post">
						<div class="col-sm-4 mb-sm-20">
							<select class="form-control" name="id" style="padding: 0;">
								<option selected="selected" value="0">Select Category</option>
								<c:forEach items="${cates }" var="l">
									<option value="${l.categoryId }">${l.categoryName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="" style="position: absolute; top: 20px; right: 20px;">
							<input name="userId" id="userId" value="${user.userId }" style="display:none;">
							<button class="btn btn-block btn-round btn-g" type="submit">Apply</button>
						</div>
					</form>

				</div>

			</div>
		<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
			<div class="tm-bg-primary-dark tm-block tm-block-products">
				<div class="tm-product-table-container">
				<div class="search-wrapper">
					<div class="input-holder">
						<input id="key" type="text" class="search-input"
							placeholder="Search product name" value="" />
						<button type="submit" class="search-icon"
							onclick="searchToggle(this, event);">
							<span></span>
						</button>
					</div>
					<span class="close" onclick="searchToggle(this, event);"></span>
				</div>
					<table class="table table-hover tm-table-small tm-product-table">
						<thead>
							<tr>
								<th scope="col">&nbsp;</th>
								<th scope="col">PRODUCT NAME</th>
								<th scope="col">PRODUCT PRICE </th>
								<th scope="col">DELETE</th> 
								<th scope="col">&nbsp;</th>
							</tr>
						</thead>
						<tbody class="table-product">
							<c:forEach items="${allProduct }" var="allProduct">
								<tr class="table-product-item">
									<th scope="row"><!-- <input type="checkbox" /> --></th>
									<td class="product-name"
										style="font-size: 0.95rem; font-weight: 600;"><a
										href="<c:url value='/admin/EditProduct?productid=${allProduct.productId}&userId=${allProduct.sellerId }'/>">${allProduct.productName }</a></td>
									<td>${allProduct.productPrice } VNĐ</td>
									<td><a
										href="<c:url value='/admin/DeleteProduct?productid=${allProduct.productId}&userId=${allProduct.sellerId }'/>"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
							</c:forEach>


						</tbody>
					</table>
				</div>
				<c:choose>
					<c:when test="${apply == true}">
					<button  
							class="btn btn-primary btn-block text-uppercase mb-3" onclick="loadMoreCategory(${user.userId }, ${cateId })">Load More</button>
					</c:when>
					<c:otherwise>
						<button  
							class="btn btn-primary btn-block text-uppercase mb-3" onclick="loadMore(${user.userId })">Load More</button>
					</c:otherwise>
				</c:choose>
				
				<!-- table container -->
				<a href="<c:url value='/admin/AddProduct?userId=${user.userId }'/>"
					class="btn btn-primary btn-block text-uppercase mb-3">Add new
					product</a>
			</div>
		</div>
		<c:choose>
			<c:when test="${user.roleId == 2 || user.roleId == 3}">
				<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-product-categories">
						<h2 class="tm-block-title">Product Categories</h2>
						<div class="tm-product-table-container">
							<table class="table tm-table-small tm-product-table">
								<tbody>

									<c:forEach items="${cates }" var="cates">
										<tr>
											<td class="tm-product-name">${cates.categoryName }</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
					<div
						class="tm-bg-primary-dark tm-block tm-block-product-categories">
						<h2 class="tm-block-title">Product Categories</h2>
						<div class="tm-product-table-container">
							<table class="table tm-table-small tm-product-table">
								<tbody>
									<c:forEach items="${cates }" var="cates">
										<tr>
											<td class="tm-product-name"><a
												href="<c:url value="/admin/EditCategory?id=${cates.categoryId }"/>">${cates.categoryName }</a></td>
											<td class="text-center"><a
												href="<c:url value="/admin/DeleteCategory?id=${cates.categoryId }"/>"
												class="tm-product-delete-link"> <i
													class="far fa-trash-alt tm-product-delete-icon"></i>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
						<!-- table container -->
						<a href="<c:url value='/admin/AddCategory'/>"
							class="btn btn-primary btn-block text-uppercase mb-3">Add new
							category</a>
						<!-- <button class="btn btn-primary btn-block text-uppercase mb-3">
              Add new category
            </button> -->
					</div>
				</div>
			</c:otherwise>
		</c:choose>

	</div>
</div>
<script>
    ${mess}
    function searchToggle(obj, evt){
	    var container = $(obj).closest('.search-wrapper');
	        if(!container.hasClass('active')){
	            container.addClass('active');
	            evt.preventDefault();
	        }
	        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
	            container.removeClass('active');
            // clear input
	            container.find('.search-input').val('');
	            
	            
	        }
	        else{
	        	var x = document.getElementById("key").value; //value in input
	        	var uId = document.getElementById("userId").value
	        	$.ajax({
            	url: "/Project_WEB/admin/SearchProducts",
      			type:"get",
      			data:{
      				key: x,
      				userId: uId, 
      			},
      			success: function(data){
      				$(".table-product").html(data)
      				
      			},
      			error: function(){
      				console.log("error")
      			}
            }) 
	        }
	}
    function loadMore(userid){
    	var amount = $(".table-product-item").length;

    	$.ajax({
  			url: "/Project_WEB/admin/LoadMoreProductOfSeller",
  			type:"post",
  			data:{
  				userId: userid,
  				exits: amount,
  			},
  			success: function(data){
  				$(".table-product").append(data)
  				
  			},
  			error: function(){
  				console.log("error")
  			}
  		});
    }
    function loadMoreCategory(userid, cateid){
    	var amount = $(".table-product-item").length;

    	$.ajax({
  			url: "/Project_WEB/admin/LoadMoreProductOfSeller",
  			type:"get",
  			data:{
  				userId: userid,
  				cateId: cateid,
  				exits: amount,
  			},
  			success: function(data){
  				$(".table-product").append(data)
  				
  			},
  			error: function(){
  				console.log("error")
  			}
  		});
    }
    </script>