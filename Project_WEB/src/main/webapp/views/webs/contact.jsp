<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="main">
	<section class="module bg-dark-60 contact-page-header bg-dark"
		data-background="https://tbcdn.talentbrew.com/company/351/v1_0/img/banners/Cratecareerpage.jpg">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<h2 class="module-title font-alt">Contact Us</h2>
					<div class="module-subtitle font-serif">A wonderful serenity
						has taken possession of my entire soul, like these sweet mornings
						of spring which I enjoy with my whole heart.</div>
				</div>
			</div>
		</div>
	</section>
	<section class="module">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h4 class="font-alt">Get in touch</h4>
					<br />
					<form role="form" method="post" action="ContactControllerWeb">
						<div class="form-group">
							<c:if test="${alert != null }">
								<h4 class="alert alert-success">${alert }</h4>
							</c:if>
						</div>
						<div class="form-group">
							<label class="sr-only" for="name">Name</label> <input
								class="form-control" type="text" id="name" name="name"
								placeholder="Your Name*" required="required"
								data-validation-required-message="Please enter your name." />
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group">
							<label class="sr-only" for="email">Email</label> <input
								class="form-control" type="email" id="email" name="email"
								placeholder="Your Email*" required="required"
								data-validation-required-message="Please enter your email address." />
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group">
							<textarea class="form-control" rows="7" id="message"
								name="message" placeholder="Your Message*" required="required"
								data-validation-required-message="Please enter your message."></textarea>
							<p class="help-block text-danger"></p>
						</div>
						<div class="text-center">
							<button class="btn btn-block btn-round btn-d" type="submit">Submit</button>
						</div>
					</form>
				</div>
				<div class="col-sm-6">
					<h4 class="font-alt">Additional info</h4>
					<br />
					<p>I am alone, and feel the charm of existence in this spot,
						which was created for the bliss of souls like mine. I am so happy,
						my dear friend.</p>
					<hr />
					<h4 class="font-alt">Business Hours</h4>
					<br />
					<ul class="list-unstyled">
						<li>Mo - Fr: 8am to 6pm</li>
						<li>Sa, Su: 10am to 2pm</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<section id="map-section">
		<div id="map">
			<iframe
				src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.484300945954!2d106.76973361471904!3d10.850721392271097!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752763f23816ab%3A0x282f711441b6916f!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgcGjhuqFtIEvhu7kgdGh14bqtdCBUcC4gSOG7kyBDaMOtIE1pbmg!5e0!3m2!1svi!2s!4v1670909407592!5m2!1svi!2s"
				width="100%" height="450" style="border: 0;" allowfullscreen=""
				loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
	</section>


</div>
