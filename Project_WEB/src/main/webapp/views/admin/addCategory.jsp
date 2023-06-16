<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<section class="module">
          <div class="container">
            <div class="row ">
              <div class="col-sm-6 col-sm-offset-1 mb-sm-40">
                <h4 class="font-alt">Add Category</h4>
                <hr class="divider-w mb-10">
                <form class="form" action="AddCategory" method="post">
                  <div class="form-group">
                    <input class="form-control" id="categoryId" type="text" name="categoryName" value="" placeholder="categoryName">
                  </div>
                  <div class="form-group">
                    <button type="submit" class="btn btn-round btn-b">Add Category Now</button>
                  </div>
                </form>
              </div>
            </div>
       </div>
</section>