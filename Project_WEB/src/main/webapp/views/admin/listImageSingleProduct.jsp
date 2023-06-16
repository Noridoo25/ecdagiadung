<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/" var="images"></c:url>
<div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">LIST IMAGES</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody>
                    <tr>
                      <th class="hidden-xs">Item</th>
                      <th>Description</th>       
                      <th>Remove</th>
                    </tr>
                    <c:forEach items="${image }" var ="image"> 
                    	<tr>
                      <td class="hidden-xs"><a href="#"><img src="${images }${image.categoryId}/${image.productImage}" alt="images"/></a></td>
                      <td>
                        <h5 class="product-title font-alt">${image.productImage}</h5>
                      </td>
                      <td class="pr-remove"><a href="<c:url value="/admin/DeleteImages?id=${image.productId}&name=${image.productImage}"/>" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr>
                    </c:forEach>  
                  </tbody>
                </table>
              </div>
            </div>
          <hr class="divider-w">
      </div>
  </section>
</div>
      