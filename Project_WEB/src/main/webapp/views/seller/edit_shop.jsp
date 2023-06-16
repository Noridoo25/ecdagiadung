<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/images/" var="images"></c:url>
<div class="container tm-mt-big tm-mb-big">
	<div class="row">
		<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
			<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
				<div class="row">
					<div class="col-12">
						<h2 class="tm-block-title d-inline-block">Edit My Store</h2>
					</div>
				</div>
				<div class="row tm-edit-product-row">
					<div class="col-xl-12 col-lg-12 col-md-12">
						<form role="form" action="EditShop" method="post"
							enctype="multipart/form-data">
							<c:if test="${alert != null }">
								<h3 class="alert alert-danger">${alert }</h3>
							</c:if>
							<div class="row">
								<div class="col-sm-12 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="storeName">Shop Name</label> <input
											value="${myStore.storeName }" class="form-control"
											type="text" id="storeName" name="storeName"
											placeholder="Shop Name*" required="required"
											data-validation-required-message="Please enter shop name." />
										<p class="help-block text-danger"></p>
									</div>
									<div class="form-group">
										<label for="email">Email</label> <input
											value="${myStore.email }" class="form-control" type="email"
											id="email" name="email" placeholder="Email*"
											required="required"
											data-validation-required-message="Please enter your email address." />
										<p class="help-block text-danger"></p>
									</div>
									<div class="form-group">
										<label for="phone">Phone Number</label> <input
											value="${myStore.phone }" class="form-control" id="phone"
											name="phone" placeholder="Phone number*" required="required"
											data-validation-required-message="Please enter your phone number." />
										<p class="help-block text-danger"></p>
									</div>

									<div class="ajax-response font-alt" id="contactFormResponse"></div>
								</div>
								<div class="col-sm-12 col-md-6 col-lg-6">
									<div class="form-group">
										<label for="Address">Address</label> <select
											class="form-control form-group" id="city" name="city"
											aria-label=".form-select-sm" style="padding: 0;padding-left: 18px;">
											<option value="" selected>Select City</option>
										</select> <select class="form-control form-group" id="district"
											name="provin" aria-label=".form-select-sm"
											style="padding: 0;padding-left: 18px;">
											<option value="" selected>Select District</option>
										</select> <select class="form-control form-group" id="ward" name="ward"
											aria-label=".form-select-sm" style="padding: 0;padding-left: 18px;">
											<option value="" selected>Select Ward</option>
										</select>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-xl-6 col-lg-6 col-md-12 mb-4">
									<h4 class="tm-block-title d-inline-block">Edit avatar of shop</h4>
									<br />
									<div class="tm-product-img-dummy mx-auto">
										<img src="${images }/AvatarShop/${myStore.avartarStore }"
											class="img-fluid d-block mx-auto" id="imageAvatar">

									</div>
									<div class="custom-file mt-3 mb-3">
										<!-- <input type="file" name="avartarStore" />
					<input type="file" name="bannerStore" /> -->
										<input name="avartarStore" id="fileInput" type="file"
											style="display: none;"> <input type="button"
											class="btn btn-primary btn-block mx-auto"
											value="UPLOAD AVATAR SHOP"
											onclick="document.getElementById('fileInput').click();">
									</div>
								</div>
								<div class="col-xl-6 col-lg-6 col-md-12 mb-4">
									<h4 class="tm-block-title d-inline-block">Edit banner of shop</h4>
									<br />
									<div class="tm-baner-img-dummy mx-auto">
										<img src="${images }/BannerShop/${myStore.bannerStore }"
											alt="Product image" class="img-fluid d-block mx-auto"
											id="imageBanner"
											style="width: -webkit-fill-available; height: -webkit-fill-available;">
										<i class="fa fa-cloud-upload tm-upload-icon"
											onclick="document.getElementById('fileInput1').click();"></i>

									</div>
									<div class="custom-file mt-3 mb-3">
										<input id="fileInput1" name="bannerStore" type="file"
											style="display: none;"> <input type="button"
											class="btn btn-primary btn-block mx-auto"
											value="UPLOAD BANNER SHOP"
											onclick="document.getElementById('fileInput1').click();">
									</div>
								</div>
							</div>


							<div class="text-center">
								<button type="submit" class="btn btn-primary btn-block text-uppercase">Submit</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>



<!--  
    JavaScripts
    =============================================
    -->
<script src="assets/lib/jquery/dist/jquery.js"></script>
<script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="assets/lib/wow/dist/wow.js"></script>
<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
<script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
<script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
<script src="assets/lib/flexslider/jquery.flexslider.js"></script>
<script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
<script src="assets/lib/smoothscroll.js"></script>
<script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
<script
	src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
<script async="" defer=""
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDK2Axt8xiFYMBMDwwG1XzBQvEbYpzCvFU"></script>
<script src="assets/js/plugins.js"></script>
<script src="assets/js/main.js"></script>
<!-- address -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
            var citis = document.getElementById("city");
        var districts = document.getElementById("district");
        var wards = document.getElementById("ward");
        var Parameter = {
          url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json", 
          method: "GET", 
          responseType: "application/json", 
        };
        var promise = axios(Parameter);
        promise.then(function (result) {
          renderCity(result.data);
        });
        
        function renderCity(data) {
          for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Name);
          }
          citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if(this.value != ""){
              const result = data.filter(n => n.Name === this.value);
        
              for (const k of result[0].Districts) {
                district.options[district.options.length] = new Option(k.Name, k.Name);
              }
            }
          };
          district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Name === citis.value);
            if (this.value != "") {
              const dataWards = dataCity[0].Districts.filter(n => n.Name === this.value)[0].Wards;
        
              for (const w of dataWards) {
                wards.options[wards.options.length] = new Option(w.Name, w.Name);
              }
            }
          };
        }
        loadImageBanner();
    	loadImageAvatar();
    	
    	
    	function loadImageAvatar(){
    		const image_input =document.querySelector("#fileInput");
        	var upload_image = "";
    		image_input.addEventListener("change", function(){
        		const reader = new FileReader();
        		reader.addEventListener("load", ()=>{
        			upload_image = reader.result;
        			document.querySelector("#imageAvatar").setAttribute("src", upload_image);
        			
        		})
        		reader.readAsDataURL(this.files[0]);
        	})
    	}
    	function loadImageBanner(){
    		const image_input =document.querySelector("#fileInput1");
        	var upload_image = "";
    		image_input.addEventListener("change", function(){
        		const reader = new FileReader();
        		reader.addEventListener("load", ()=>{
        			upload_image = reader.result;
        			document.querySelector("#imageBanner").setAttribute("src", upload_image);
        			
        		})
        		reader.readAsDataURL(this.files[0]);
        	})
    	}
    	
        
</script>
