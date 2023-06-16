<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main">
        <section class="checkout spad">
            <div class="container">
                
                <div class="checkout__form">
                    <h4>Billing Details #${bill.billId}</h4>
                    <form action="CheckoutControllerWeb" method="post">
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>First Name<span>*</span></p>
                                            <input readonly name="firstName" type="text" value="${bill.userFName}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Last Name<span>*</span></p>
                                            <input readonly name="lastName" type="text" value="${bill.userLName}">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    
                                    <input  readonly name="address" type="text" placeholder="Apartment, suite, unite ect (optinal)" value="${bill.addr}">
                                </div>
                                
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone<span>*</span></p>
                                            <input readonly name="phone" type="text" value="${bill.phone}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input readonly name="email" type="text" value="${bill.email}">
                                        </div>
                                    </div>
                                </div>   
                            </div>
                            
                            <div class="col-lg-4 col-md-6">
                                <div class="checkout__order">
                                    <h4>Your Order</h4>
                                    <div class="checkout__order__products">Products <span>Total</span></div>
                                    <ul>
                                    <c:forEach items="${items }" var="order">
                                    
                                    <li><a href="<c:url value="/ProductControllerWeb?id=${order.product.productId}&userId=${order.product.sellerId }"/>">${order.product.productName } x ${order.total/order.product.productPrice } </a><span id="${order.product.productPrice }">${order.product.productPrice } VNĐ</span></li>
                                    
                                    </c:forEach>
                                        
                                    </ul>
                                    <div class="checkout__order__subtotal" id="${bill.subTotal}">Subtotal <span>${bill.subTotal} VNĐ</span></div>
                                    <div class="checkout__order__total">Total <span>${bill.cartTotal} VNĐ</span></div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
      </div>
      