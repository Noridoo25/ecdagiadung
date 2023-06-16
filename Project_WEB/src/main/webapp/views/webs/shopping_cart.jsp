<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/" var="images"></c:url>
<div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">Checkout</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody class="product-items">
                    <tr>
                      <th class="hidden-xs">Image</th>
                      <th>Product Name</th>
                      <th class="hidden-xs">Price</th>
                      <th>Quantity</th>
                      <th>Total</th>
                      <th>Remove</th>
                    </tr>
                    <c:forEach items="${cart.items }" var="order">
                    <tr id="${order.product.productId }">
                      <td class="hidden-xs"><a href="#"><img src="${images }${order.product.categoryId}/${order.product.productImage}" alt="${order.product.productName }"/></a></td>
                      <td>
                        <h5 class="product-title font-alt">${order.product.productName }</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt product-price" id="${order.product.productPrice }"><p>${order.product.productPrice }</p>VND</h5>
                      </td>
                      <td>
                        <input oninput="changeQuanity(this)" class="form-control" type="number" name="" value="${order.amount }" max="50" min="1" id="${order.amount }"/>
                      </td>
                      <td>
                        <h5 class="product-title font-alt product-total">
                        <p class="product-total1"> ${order.total }
                        </p>
                        VND</h5>
                      </td>
                      <td class="pr-remove" ><a href="<c:url value="/RemoveItemInCart?id=${order.product.productId }&total=${totalPrice}"/>" title="Remove"><i class="fa fa-times"></i></a></td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            
            <hr class="divider-w">
            <div class="row mt-70">
              <div class="col-sm-5 col-sm-offset-7">
                <div class="shop-Cart-totalbox">
                  <h4 class="font-alt">Cart Totals</h4>
                  <table class="table table-striped table-border checkout-table table-cart-total">
                    <tbody>
                      <tr class="shop-Cart-price">
                        <th>Cart Subtotal :</th>
                        <td class="Cart-price" id="${totalPrice}">${totalPrice} VNĐ</td>
                      </tr>
                      <tr>
                        <th>Shipping Total :</th>
                        <td>20000 VNĐ</td>
                      </tr>
                      <tr class="shop-Cart-totalprice">
                        <th>Total :</th>
                        <td class="Cart-totalprice">${totalPrice + 20000} VNĐ</td>
                      </tr>
                    </tbody>
                  </table>
                  <a href="<c:url value="/CheckoutControllerWeb"/>"class="btn btn-lg btn-block btn-round btn-d" type="submit">Proceed to Checkout</a>
                </div>
              </div>
            </div>
          </div>
        </section>
        
        
      </div>
      
      <script>
      	function changeQuanity(number){
      		//id is productId
      		var id = $(number).closest("tr").attr("id");
      		var price = parseInt($(number).closest("tr").find($(".product-price")).attr("id"));
      		
      		$(number).closest("tr").find($(".product-total")).html("<p class=\"product-total1\"> "+parseInt(number.value)*price+"</p>"+"VND");
      		var subTotalPrice = 0;
      		$('.product-total1').each(function(index, value){
      			subTotalPrice += parseInt($(this).html());
      		})
      		$(".Cart-price").html(subTotalPrice+"VND");
      		var totalPrice = subTotalPrice + 20000;
      		$(".Cart-totalprice").html(totalPrice + "VND");
      		$.ajax({
      			url: "/Project_WEB/ChangeAmountProduct",
      			type:"get",
      			data:{
      				id: id,
      				amount: number.value,
      				total: parseInt(number.value)*price,
      				totalPrice: subTotalPrice
      			},
      			success: function(data){
      				
      			},
      			error: function(){
      				console.log("error")
      			}
      		});
      	}
      	
      	 </script>
      