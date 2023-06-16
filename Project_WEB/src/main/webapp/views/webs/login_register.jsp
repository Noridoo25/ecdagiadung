<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/ControllerMyAccount/edit" var="edit"></c:url>

<div class="main">
        <section class="module bg-dark-30" data-background="https://images.crateandbarrel.com/is/image/Crate/account-login-hero?wid=1440&qlt=40,1">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h1 class="module-title font-alt mb-0">Login-Register</h1>
              </div>
            </div>
          </div>
        </section>
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-5 col-sm-offset-1 mb-sm-40">
                <h4 class="font-alt">Login</h4>
                <c:if test="${alert != null }">
					<h3 class="alert alert-danger">${alert }</h3>
				</c:if>
                <hr class="divider-w mb-10">
                 <form action="ControllerLogin" method="post" class="form">
                  <div class="form-group">
                    <input class="form-control" id="username" type="text" name="username" placeholder="Username"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="password" type="password" name="password" placeholder="Password"/>
                  </div>
                  
                             
					<!-- <div class="form-check">
						<label class="checkbox"><input type="checkbox" name="remember" /><i></i>Remember me </label>
					</div>  --> 
                  <div class="form-group">
                     <button type="submit" class="btn btn-round btn-b">Login</button>
                  </div>
                  <div class="form-group"><a href="<c:url value="/ForgetPasswordController"/>">Forgot Password?</a></div>
                </form>
              </div>
              <div class="col-sm-5">
                <h4 class="font-alt">Register</h4>
                <c:if test="${alertrg != null }">
					<h3 class="alert alert-danger">${alertrg }</h3>
				</c:if>
                <hr class="divider-w mb-10">
                  <form action="ControllerRegister" method="post" class="form">
                 <div class="form-group">
                    <input class="form-control" id="username" type="text" name="usernamerg" placeholder="Username"/>
                  </div>
                  <div class="form-group">
                     <input class="form-control" id="E-mail" type="text" name="emailrg" placeholder="Email"/>
                  </div>
                  <div class="form-group">
                     <input class="form-control" id="password" type="password" name="passwordrg" placeholder="Password"/>
                  </div>
                  <div class="form-group">
                    <input class="form-control" id="repassword" type="password" name="repasswordrg" placeholder="Re-enter Password"/>
                  </div>
                  <div class="form-group">
                     <button type="submit" class="btn btn-block btn-round btn-b">Register</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </section>
        
      </div>
      