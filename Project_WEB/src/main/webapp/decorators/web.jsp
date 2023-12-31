<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/template/project/" var="URL"></c:url>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>THANHPHU</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="${URL}assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${URL}assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${URL}assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${URL}assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${URL}assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${URL}assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${URL}assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${URL}assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${URL}assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="${URL}assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${URL}assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${URL}assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${URL}assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${URL}assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="${URL}assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="${URL}assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="${URL}assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="${URL}assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="${URL}assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="${URL}assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="${URL}assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="${URL}assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="${URL}assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="${URL}assets/css/style.css" rel="stylesheet">
    <!--  Swiper-->
    <link href="${URL}assets/css/swiper-bundle.css" rel="stylesheet">
    <link id="color-scheme" href="${URL}assets/css/colors/default.css" rel="stylesheet">
    <link rel="stylesheet" href="${URL}css/style.css" type="text/css">
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <%@ include file="/commons/web/header.jsp"%>
      
      <dec:body />
      <jsp:include page="/commons/web/footer.jsp"></jsp:include>
      <div class="scroll-up"><a href="#totop"><i class="fa fa-angle-double-up"></i></a></div>
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="${URL}assets/lib/jquery/dist/jquery.js"></script>
    <script src="${URL}assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="${URL}assets/lib/wow/dist/wow.js"></script>
    <script src="${URL}assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="${URL}assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="${URL}assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="${URL}assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="${URL}assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="${URL}assets/lib/smoothscroll.js"></script>
    <script src="${URL}assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="${URL}assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="${URL}assets/js/plugins.js"></script>
    <script src="${URL}assets/js/main.js"></script>
    <script src="${URL}assets/js/swiper-bundle.js"></script>
    <script>
      var swiper = new Swiper(".mySwiper", {
        loop: true,
        spaceBetween: 10,
        slidesPerView: 4,
        freeMode: true,
        watchSlidesProgress: true,
      });
      var swiper2 = new Swiper(".mySwiper2", {
        loop: true,
        spaceBetween: 10,
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        thumbs: {
          swiper: swiper,
        },
      });
    </script>
    
    <script>
	function addtoCart(id, price) {
		var productId = parseInt(id);
		var productPrice = parseInt(price);
		// Lấy giá trị từ session

		$.ajax({
			url : "/Project_WEB/CartController",
			type : "get",
			data : {
				price : productPrice,
				productId : productId,
			},
			success : function(data) {
				$(".shop-item-detail").click(function() {
					if(data=="false"){
						alert("Login to add product in cart")
					}
					else{
						
						$(".alert.alert-success").removeClass("hide");
						$(".alert.alert-success").addClass("show");
						setTimeout(function() {
							$(".alert.alert-success").removeClass("show");
							$(".alert.alert-success").addClass("hide");
						}, 5000);
					
					}
				});
					
			},
			error : function(xhr) {
				alert("Login to add product in cart")
			}

		});
	}
</script>
  </body>
</html>