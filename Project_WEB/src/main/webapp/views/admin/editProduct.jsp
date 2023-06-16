<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/" var="images"></c:url>
<div class="container tm-mt-big tm-mb-big">
	<div class="row">
		<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
			<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
				<div class="row">
					<div class="col-12">
						<h2 class="tm-block-title d-inline-block">Edit Product</h2>
					</div>
				</div>
				<div class="row tm-edit-product-row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<form action="EditProduct" class="tm-edit-product-form" method="Post" enctype="multipart/form-data">
							<div class="form-group mb-3">
								<label for="productName">Product Name </label> <input id="productName" name="productName"
									value="${product.productName }" type="text"
									class="form-control validate" required />
							</div>
							<div class="form-group mb-3">
								<label for="productDescription">Description</label>
								<textarea class="form-control validate"
									name="productDescription" rows="3" required>${product.depiction }</textarea>
							</div>
							<div class="form-group mb-3">
								<label for="category">Category</label> <select
									class="custom-select tm-select-accounts" id="category"
									name="categoryId">
									<option>Select category</option>
									<c:forEach items="${cates }" var="cate">
										<c:choose>
											<c:when test="${cate.categoryId  == product.categoryId }">
												<option value="${cate.categoryId }" selected>${cate.categoryName }</option>
											</c:when>
											<c:otherwise>
												<option value="${cate.categoryId }">${cate.categoryName }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="row">
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="productPrice">Price Product </label> <input
										id="productPrice" name="productPrice"
										value="${product.productPrice }" type="text"
										class="form-control validate hasDatepicker"
										data-large-mode="true">
								</div>
								<div class="form-group mb-3 col-xs-12 col-sm-6">
									<label for="detail">Short Detail Product </label> <input
										id="detail" name="detail" type="text"
										class="form-control validate" value="${product.detail }">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
								<div class="tm-product-img-dummy mx-auto">
									<img
										src="${images }${product.categoryId}/${product.productImage}"
										alt="Product image" class="img-fluid d-block mx-auto"
										id="image">
									<c:if test="${sessionScope.account.roleId != 1}">
										<i class="fas fa-cloud-upload-alt tm-upload-icon"
											onclick="document.getElementById('fileInput').click();"></i>
									</c:if>
								</div>
								<c:if test="${sessionScope.account.roleId != 1}">
									<div class="custom-file mt-3 mb-3">
										<input id="fileInput" type="file" name="productImage"
											value="${product.productImage}" style="display: none;" /> <input
											type="button" class="btn btn-primary btn-block mx-auto"
											value="CHANGE PRODUCT IMAGE"
											onclick="document.getElementById('fileInput').click();" />
									</div>

									<div class="custom-file mt-3 mb-3">
										<a
											href="<c:url value="/admin/AddImagesProductDetail?id=${product.productId }&cateId=${product.categoryId }"/>"
											type="button" class="btn btn-primary btn-block mx-auto">ADD MORE IMAGES PRODUCT</a>
									</div>
									<div class="custom-file mt-3 mb-3">
										<a
											href="<c:url value="/admin/EditListImageSingleProduct?id=${product.productId }&cateId=${product.categoryId }"/>"
											type="button" class="btn btn-primary btn-block mx-auto">EDIT IMAGES PRODUCT</a>

									</div>
								</c:if>
							</div>

							<div class="row">
								<c:if test="${sessionScope.account.roleId != 1}">
									<div class="col-md-6	 col-12  mb-3 ">
										<button type="submit"
											class="btn btn-primary btn-block text-uppercase">Update Product Now</button>
									</div>
								</c:if>
								<div class="col-md-6 col-12  mb-3">
									<a
										href="<c:url value="/ProductControllerWeb?id=${product.productId }&cateId=${product.categoryId }&userId=${product.sellerId }"/>"
										type="button" class="btn btn-primary btn-block mx-auto">PREVIEW PRODUCT</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
    	const image_input =document.querySelector("#fileInput");
    	var upload_image = "";
    	
    	image_input.addEventListener("change", function(){
    		const reader = new FileReader();
    		reader.addEventListener("load", ()=>{
    			upload_image = reader.result;
    			document.querySelector("#image").setAttribute("src", upload_image);
    			
    		})
    		reader.readAsDataURL(this.files[0]);
    	})
    
    </script>