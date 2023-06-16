<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="main">
	<section class="module">
		<div class="container">
			<div class="row">

				<form role="form" action="RegisterStoreController" method="post"
					enctype="multipart/form-data">
					<c:if test="${alert != null }">
						<h3 class="alert alert-danger">${alert }</h3>
					</c:if>
					<div class="col-sm-6">
						<h4 class="font-alt">CREATE YOUR SHOP</h4>
						<br />

						<div class="form-group">
							<label class="sr-only" for="storeName">Shop Name</label> <input
								class="form-control" type="text" id="storeName" name="storeName"
								placeholder="Shop Name*" required="required"
								data-validation-required-message="Please enter shop name." />
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group">
							<label class="sr-only" for="email">Email</label> <input
								class="form-control" type="email" id="email" name="email"
								placeholder="Email*" required="required"
								data-validation-required-message="Please enter your email address." />
							<p class="help-block text-danger"></p>
						</div>
						<div class="form-group">
							<label class="sr-only" for="phone">Phone Number</label> <input
								class="form-control" type="number" id="phone"
								name="phone" placeholder="Phone number*" required="required"
								data-validation-required-message="Please enter your phone number." />
							<p class="help-block text-danger"></p>
						</div>
						<div>
							<select class="form-control form-group" id="city" name="city"
								aria-label=".form-select-sm">
								<option value="" selected>Select City</option>
							</select> 
							<select class="form-control form-group" id="district"
								name="provin" aria-label=".form-select-sm">
								<option value="" selected>Select District</option>
							</select> 
							<select class="form-control form-group" id="ward" name="ward"
								aria-label=".form-select-sm">
								<option value="" selected>Select Ward</option>
							</select>
						</div>
						<div class="ajax-response font-alt" id="contactFormResponse"></div>
					</div>

					<div class="col-xl-3 col-lg-3 col-md-12 mx-auto mb-4">
						<h4 class="font-alt image-shop">Add avatar of shop</h4>
						<br />
						<div class="tm-product-img-dummy mx-auto">
							<img src=""  class="img-fluid d-block mx-auto"
								id="imageAvatar" style="width: -webkit-fill-available;border-radius: 50%;height: -webkit-fill-available;"> <i
								class="fa fa-cloud-upload tm-upload-icon"
								onclick="document.getElementById('fileInput').click();"></i>

						</div>
						<div class="custom-file mt-3 mb-3">
							<!-- <input type="file" name="avartarStore" />
					<input type="file" name="bannerStore" /> -->
							<input name="avartarStore" id="fileInput" type="file"
								style="display: none;"> <input type="button"
								class="btn btn-block btn-round btn-d" value="UPLOAD AVATAR SHOP"
								onclick="document.getElementById('fileInput').click();">
						</div>
					</div>
					<div class="col-xl-3 col-lg-3 col-md-12 mx-auto mb-4">
						<h4 class="font-alt image-shop">Add banner of shop</h4>
						<br />
						<div class="tm-baner-img-dummy mx-auto">
							<img src="" alt="Product image" class="img-fluid d-block mx-auto"
								id="imageBanner" style="width: -webkit-fill-available;height: -webkit-fill-available;"> <i
								class="fa fa-cloud-upload tm-upload-icon"
								onclick="document.getElementById('fileInput1').click();"></i>

						</div>
						<div class="custom-file mt-3 mb-3">
							<input id="fileInput1" name="bannerStore" type="file"
								style="display: none;"> <input type="button"
								class="btn btn-block btn-round btn-d" value="UPLOAD BANER SHOP"
								onclick="document.getElementById('fileInput1').click();">
						</div>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-block btn-round btn-d">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</section>
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
