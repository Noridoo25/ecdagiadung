<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="main">
        <section class="checkout spad">
            <div class="container">
                
                <div class="checkout__form">
                    <h4>Billing Details</h4>
                    <form action="CheckoutControllerWeb" method="post">
                        <div class="row">
                            <div class="col-lg-8 col-md-6">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>First Name<span>*</span></p>
                                            <input name="firstName" type="text" value="${sessionScope.account.firstName}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Last Name<span>*</span></p>
                                            <input name="lastName" type="text" value="${sessionScope.account.lastName}">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="checkout__input">
                                    <p>Address<span>*</span></p>
                                    <input name="street_address" type="text" placeholder="Street Address" class="checkout__input__add">
                                    <input name="address" type="text" placeholder="Apartment, suite, unite ect (optinal)" value="${sessionScope.account.addr}">
                                </div>
                                
                                <div class="row">
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Phone<span>*</span></p>
                                            <input name="phone" type="text" value="${sessionScope.account.phone}">
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="checkout__input">
                                            <p>Email<span>*</span></p>
                                            <input name="email" type="text" value="${sessionScope.account.email}">
                                        </div>
                                    </div>
                                </div>
                                
                                
                                
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="checkout__order">
                                    <h4>Your Order</h4>
                                    <div class="checkout__order__products">Products <span>Total</span></div>
                                    <ul>
                                    <c:forEach items="${cart.items }" var="order">
                                    <li>${order.product.productName } x ${order.amount }<span id="${order.product.productPrice }">${order.product.productPrice } VND</span></li>
                                    
                                    </c:forEach>
                                        
                                    </ul>
                                    <div class="checkout__order__subtotal" id="${totalPrice}">Subtotal <span>${totalPrice} VND</span></div>
                                    <div class="checkout__order__total">Total <span>${totalPrice + 20000} VND</span></div>
                                   
                                    <button type="submit" class="site-btn">PLACE ORDER</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        
      </div>
      