<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="module">
          <div class="container">
            <div class="row ">
              <div class="col-sm-6 col-sm-offset-1 mb-sm-40">
                <h4 class="font-alt">List Category</h4>
                <hr class="divider-w mb-10">
                <c:forEach items="${cates}" var="cate">
	                <div><p>${cate.categoryName }</p></div>
	                <hr class="divider-w mb-10">
                </c:forEach> 
              </div>
            </div>
          </div>
        </section>