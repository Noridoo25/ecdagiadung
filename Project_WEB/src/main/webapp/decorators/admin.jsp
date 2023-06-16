<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="dec" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:url value="/template/product-admin/" var="URL"></c:url>
<c:url value="/template/project/" var="URL1"></c:url>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin</title>
    
    <link rel="apple-touch-icon" sizes="57x57" href="${URL1}assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="${URL1}assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="${URL1}assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${URL1}assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="${URL1}assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${URL1}assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="${URL1}assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${URL1}assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${URL1}assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="${URL1}assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="${URL1}assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="${URL1}assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="${URL1}assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="${URL1}assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
    <!-- https://fonts.google.com/specimen/Roboto -->
    <link rel="stylesheet" href="${URL}css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="${URL}css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="${URL}css/templatemo-style.css">
    <!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
    <main>
      <%@ include file="/commons/admin/admin_header.jsp"%>
      
      <dec:body />
      <jsp:include page="/commons/admin/footer.jsp"></jsp:include>
      	
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
    <script src="${URL}js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="${URL}js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="${URL}js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="${URL}js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="${URL}js/tooplate-scripts.js"></script>
    <script>
        Chart.defaults.global.defaultFontColor = 'white';
        let ctxLine,
            ctxBar,
            ctxPie,
            optionsLine,
            optionsBar,
            optionsPie,
            configLine,
            configBar,
            configPie;
            //lineChart;
        //barChart, 
        //pieChart;
        // DOM is ready
        $(function () {
            //drawLineChart(); // Line Chart
            //drawBarChart(); // Bar Chart
            //drawPieChart(); // Pie Chart

            $(window).resize(function () {
                //updateLineChart();
                //updateBarChart();                
            });
        })
        
        $(".nav-item").click(function(e){
        	
        	$(this).closest(".navbar-nav").find(".nav-link").removeClass("active");
        	
        	$(this).children().addClass("active");
        })
    </script>
  </body>
</html>