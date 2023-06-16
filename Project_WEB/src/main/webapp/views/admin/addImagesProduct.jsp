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
                <h2 class="tm-block-title d-inline-block">Add Images Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-12 col-lg-12 col-md-12">
                <form action="AddImagesProductDetail" class="tm-edit-product-form" method="Post" enctype="multipart/form-data">
                  <div class="form-group mb-3">
                    <label for="category">Category</label>
                    <select class="custom-select tm-select-accounts" id="category" name="categoryId">
                    	<option value="${cates.categoryId }">${cates.categoryName }</option>
                    </select>
                  </div>
                 <div class="col-xl-12 col-lg-12 col-md-12 mx-auto mb-4">
                <div class="tm-product-img-dummy mx-auto">
                   <img id="image" src="${images }${product.categoryId}/${product.productImage}" alt="Product image" class="img-fluid d-block mx-auto">
                  <i class="fas fa-cloud-upload-alt tm-upload-icon" onclick="document.getElementById('fileInput').click();"></i>
                </div>
                <div class="custom-file mt-3 mb-3">
                  <input id="fileInput" type="file" name="productImage" multiple="multiple"/>
                  <output id="result"></output>
                  <input
                    type="button"
                    class="btn btn-primary btn-block mx-auto"
                    value="UPLOAD PRODUCT IMAGE"
                    onclick="document.getElementById('fileInput').click();"
                    multiple="multiple"/>
                </div>
              </div>
              <div class="col-12">
                <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Images Product Now</button>
              </div>
              </form>
            </div>	
            </div>
          </div>
        </div>
      </div>
    </div>
<script>
	document.querySelector("#fileInput").addEventListener("change",(e)=>{
		if(window.File && window.FileReader && window.FileList && window.Blob){
			const files = e.target.files;
			console.log(files);
			const output = document.querySelector("#result");
			
			for(var i = 0 ; i<files.length;i++){
				if(!files[i].type.match("image")) continue;
				const picReader = new FileReader();
				picReader.addEventListener("load", function(event){
					const picFile = event.target;
					
					const div = document.createElement("div");
					div.innerHTML = `<img class="thumnail" src="${picFile.result}" title="image" style="    width: -webkit-fill-available;"/>`;
					output.appendChild(div);
				})
				picReader.readAsDataURL(files[i]);
			}
		}else{
			alert("don't support File API")
		}
	})
</script>