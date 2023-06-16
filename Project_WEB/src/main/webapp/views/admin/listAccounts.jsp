<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${sessionScope.account.roleId == 1 }">
	<div class="col-12 tm-block-col">
		<div class="tm-bg-primary-dark tm-block-taller"
			style="padding: 20px; position: relative;">
			<form action="ListAccount" method="post">
				<div class="col-sm-4 mb-sm-20">
					<select class="form-control" name="status" style="padding: 0;">
						<option selected="selected" value="0">Select Type</option>
						<option value="1">User</option>
						<option value="2">Seller</option>
					</select>
				</div>
				<div class="" style="position: absolute; top: 20px; right: 20px;">
					<button class="btn btn-block btn-round btn-g" type="submit">Apply</button>
				</div>
			</form>

		</div>

	</div>
</c:if>

<div class="col-12 tm-block-col">
	<div class="tm-bg-primary-dark tm-block-taller"
		style="padding: 20px; position: relative;">
		<form action="SearchUserAndStore" method="post">
		<div class="search-wrapper">
					<div class="input-holder">
						<input name="key" id="key" type="text" class="search-input"
							placeholder="Search user and store" value="" />
						<button type="submit" class="search-icon"
							onclick="searchToggle(this, event);">
							<span></span>
						</button>
					</div>
					<span class="close" onclick="searchToggle(this, event);"></span>
				</div>
			<div class="col-sm-4 mb-sm-20">
				<input
					type="radio" id="Store" name="type" value="Store" checked> 
					<label
					for="Store" class="tm-block-title">Search Store</label>
					
					<input type="radio" id="User"
					name="type" value="User"> 
					<label for="User" class="tm-block-title">Search User</label><br>
			</div>
		</form>
	</div>
</div>
<div class="col-12 tm-block-col">
	<div
		class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
		<h2 class="tm-block-title">List Account</h2>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">USER NO.</th>
					<th scope="col">STORE</th>
					<th scope="col">USER NAME</th>
					<th scope="col">EMAIL</th>
 					<th scope="col">PHONE</th> 
					<th scope="col">STATISTIC</th> 
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${user }" var="u">
					<tr>
						<th scope="row"><a
							href="${pageContext.request.contextPath }/MyShopController?id=${u.userId}">
							<b>#${u.userId}</b></a></th>
						<td><b>${u.store.storeName } </b></td>
						<td><b>${u.userName }</b></td>
						<td><b>${u.email}</b></td>
						<td><b>${u.store.phone}</b></td>
						<c:choose>
							<c:when test="${u.store.storeName != null}">
								<td>
									<form action="HomeAdmin" method=post>
											<input value="${o.cartId }" name="cartId" style="display:none;">																				
											</form> <a class="btn btn-primary btn-block"
									href="<c:url value="/admin/ControllerReportDaily?id=${u.userId
									}"/>">
										<i class="fa fa-cog fa-spin"></i>Statistic
								</a>
								</td>
							</c:when>
						</c:choose> 
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
	
	}
    </script>