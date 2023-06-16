<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Add Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-12 col-lg-12 col-md-12">
                <form action="AddProduct" class="tm-edit-product-form" method="Post" enctype="multipart/form-data">
                  <div class="form-group mb-3">
                    <label
                      for="productName"
                      >Product Name
                    </label>
                    <input
                      id="productName"
                      name="productName"
                      
                      type="text"
                      class="form-control validate"
                      required
                    />
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="productDescription"
                      >Description</label
                    >
                    <textarea
                      class="form-control validate"
                      name="productDescription"
                      
                      rows="3"
                      required
                    ></textarea>
                  </div>
                  <div class="form-group mb-3">
                    <label
                      for="category"
                      >Category</label
                    >
                    <select
                      class="custom-select tm-select-accounts"
                      id="category"
                      name="categoryId"
                    >
                    <option selected>Select category</option>
                    <c:forEach items="${cates }" var = "cate">
                    	<option value="${cate.categoryId }">${cate.categoryName }</option>
                    </c:forEach>
                    </select>
                  </div>
                  <div class="row">
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="productPrice">Price Product
                          </label>
                          <input id="productPrice" name="productPrice" value="" type="text" class="form-control validate hasDatepicker" data-large-mode="true">
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="detail">Short Detail Product
                          </label>
                          <input id="detail" name="detail" type="text" class="form-control validate" value="">
                        </div>
                  </div>
                 <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                <img src="" alt="Product image" class="img-fluid d-block mx-auto" id="image">
                  <i
                    class="fas fa-cloud-upload-alt tm-upload-icon"
                    onclick="document.getElementById('fileInput').click();"
                  ></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" name="productImage"  style="display:none;" />
                  <input
                    type="button"
                    class="btn btn-primary btn-block mx-auto"
                    value="UPLOAD PRODUCT IMAGE"
                    onclick="document.getElementById('fileInput').click();"
                  />
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
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
