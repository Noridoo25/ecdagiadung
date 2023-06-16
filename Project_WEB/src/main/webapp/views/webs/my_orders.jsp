<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt">My Orders</h1>
              </div>
            </div>
            <hr class="divider-w pt-20">
            <div class="row">
              <div class="col-sm-12">
                <table class="table table-striped table-border checkout-table">
                  <tbody class="product-items">
                    <tr>
                      <th class="hidden-xs">Cart Code</th>
                      <th>Order Code</th>
                      <th class="hidden-xs">Status</th>
                      <th>Detail</th>
                      <!-- <th>Cancel Order</th> -->
                    </tr>
                    <c:forEach items="${orderItem }" var="order">
                    <tr id="${order.cartId }">
                      <td>
                        <h5 class="product-title font-alt">#${order.orderId }</h5>
                      </td>
                      <td class="hidden-xs">
                        <h5 class="product-title font-alt" id="${order.orderId }">#${order.orderId }</h5>
                      </td>
                      <td>
                      	<c:choose>
                      		<c:when test="${order.status == 0}">
                      		<h5 class="product-title font-alt">incomplete</h5>
                      		</c:when>
                      		<c:when test="${order.status == 2}">
                      		<h5 class="product-title font-alt">Canceled</h5>
                      		</c:when>
                      		<c:otherwise>
                      		<h5 class="product-title font-alt">complete</h5>
                      		</c:otherwise>
                      	</c:choose>
                        
                      </td>
                     
                      <td class="pr-remove" ><a href="<c:url value="/DetailOdersController?cartId=${order.cartId }"/>" title="Detail"><i class="fa fa-asterisk" aria-hidden="true"></i></a></td>
                      <%-- <td class="pr-remove" ><a href="<c:url value="/RemoveItemInCart?id=${order.product.productId }&total=${totalPrice}"/>" title="Remove"><i class="fa fa-times"></i></a></td> --%>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            
            
            
          </div>
        </section>
        
        
      </div>