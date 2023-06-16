<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container tm-mt-big tm-mb-big">
      <div class="row">
        <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
          <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
            <div class="row">
              <div class="col-12">
                <h2 class="tm-block-title d-inline-block">Product Detail</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-12 col-lg-12 col-md-12">
                <form class="tm-edit-product-form" enctype="multipart/form-data">
                  <div class="form-group mb-3">
                    <label for="productName">Product Name
                    </label>
                    <input id="productName" name="productName" type="text" class="form-control validate" required readonly="" value="${productdetail.productName }"/>
                  </div>
                  <div class="form-group mb-3">
                    <label for="productDescription" >Description</label>
                    <textarea class="form-control validate"  name="productDescription" rows="3"  required readonly="" value="${productdetail.depiction }"></textarea>
                  </div>
                  <div class="row">
                      <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="productPrice">Price Product
                          </label>
                          <input id="productPrice" name="productPrice" readonly="" value="${productdetail.productPrice }" type="text" class="form-control validate hasDatepicker" data-large-mode="true">
                        </div>
                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                          <label for="detail">Short Detail Product
                          </label>
                          <input id="detail" name="detail" type="text" class="form-control validate" readonly="" value="${productdetail.detail }">
                        </div>
                  </div>
              </div> 
              </form>
            	</div>
            </div>
          </div>
        </div>
      </div>
    </div>
    

