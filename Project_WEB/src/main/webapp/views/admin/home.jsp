<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<div id="loading" class="hide">
<div class="loader" >
  <div class="inner one"></div>
  <div class="inner two"></div>
  <div class="inner three"></div>
</div>
	
</div>
<div class="container">
	<div class="row">
		<div class="col">
			<c:choose>
				<c:when test="${storeName != null }">
					<p class="text-white mt-5 mb-5">
						WELCOME - <b>${storeName }</b>
					</p>
				</c:when>
				<c:otherwise>
					<p class="text-white mt-5 mb-5">
						WELCOME - <b>ADMIN</b>
					</p>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
	<!-- row -->
	<div class="row tm-content-row">
		<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
			<div class="tm-bg-primary-dark tm-block">
				<h2 class="tm-block-title"
					onCLick="drawLine1Chart(`${productOfForDay}`,`${TotalProductOfForDay }`)"
					style="cursor: pointer;">Statistic for day</h2>
				<canvas id="lineChart1"></canvas>
			</div>
		</div>
		<!-- listReports la list product, AmountProduct la so luong san pham-->
		<c:set var="listProductName" value="${listReports }"></c:set>
		<div class="col-sm-12 col-md-12 col-lg-6 col-xl-6 tm-block-col">
			<div class="tm-bg-primary-dark tm-block">
				<h2 class="tm-block-title tm-block-title1"
					onClick='drawBar1Chart(`${listProductName}`,`${AmountProduct}`)'
					style="cursor: pointer;">Statistic one day</h2>
				<canvas id="barChart1"></canvas>
			</div>
		</div>
		<c:if test="${sessionScope.account.roleId == 1 }">
			<div class="col-12 tm-block-col">
				<div class="tm-bg-primary-dark tm-block-taller"
					style="padding: 20px; position: relative;">
					<form action="HomeAdmin" method="get">
						<div class="col-sm-4 mb-sm-20">
							<select class="form-control" name="id" style="padding: 0;">
								<option selected="selected" value="1">Select Store</option>
								<c:forEach items="${listStore }" var="l">
									<option value="${l.storeId }">${l.storeName }</option>
								</c:forEach>
							</select>
						</div>
						<div class="" style="position: absolute; top: 20px; right: 20px;">
							<button class="btn btn-block btn-round btn-g" type="submit">Apply</button>
						</div>
					</form>

				</div>

			</div>
		</c:if>
		<div class="col-12 tm-block-col">
			<div
				class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">

				<h2 class="tm-block-title">Orders List</h2>
				<div class="search-wrapper">
					<div class="input-holder">
						<input id="codeOrder" type="text" class="search-input"
							placeholder="Search code order" value="" />
						<button type="submit" class="search-icon"
							onclick="searchToggle(this, event);">
							<span></span>
						</button>
					</div>
					<span class="close" onclick="searchToggle(this, event);"></span>
				</div>
				<label class="dropdown1">

					<div class="dd-button">STATUS</div> <input type="checkbox"
					class="dd-input" id="test">

					<ul class="dd-menu">
						<li onClick = "FilterStatus(1, 'Complete', ${userId})">Complete</li>
						<li onClick = "FilterStatus(0, 'Incomplete', ${userId})">Incomplete</li>
						<li onClick = "FilterStatus(2, 'Cancel', ${userId})">Cancel</li>
					</ul>

				</label>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">ORDER NO.</th>
							<th scope="col">STATUS</th>
							<th scope="col">FULL NAME</th>
							<th scope="col">LOCATION</th>
							<th scope="col">TOTAL PRICE</th>
							<c:if test="${sessionScope.account.roleId != 1 }">
								<th scope="col">UPDATE STATUS</th>
							</c:if>
						</tr>
					</thead>
					<tbody class="table-list-order">
						<c:forEach items="${order }" var="o">
							<tr>
								<c:if test="${user.roleId != 1 }">
									<th scope="row"><a
										href="<c:url value="/DetailOdersController?cartId=${o.cartId }&userId=${userId }"/>">
											<b>#${o.orderId }</b>
									</a></th>
								</c:if>
								<c:if test="${user.roleId == 1 }">
									<th scope="row"><a
										href="<c:url value="/DetailOdersController?cartId=${o.cartId }"/>">
											<b>#${o.orderId }</b>
									</a></th>
								</c:if>
								<c:choose>
									<c:when test="${o.items[0].status == 0 }">
										<td>
											<div class="tm-status-circle pending"></div>Incomplete
										</td>
									</c:when>
									<c:when test="${o.items[0].status == 2 }">
										<td>
											<div class="tm-status-circle cancelled"></div>Canceled
										</td>
									</c:when>
									<c:when test="${o.items[0].status == 1 }">
										<td>
											<div class="tm-status-circle moving"></div>Complete
										</td>
									</c:when>
								</c:choose>
								<td><b>${o.bill.userFName } ${o.bill.userLName } </b></td>
								<td><b>${o.bill.addr }</b></td>
								<td><b>${o.bill.cartTotal }</b></td>
								<c:if test="${sessionScope.account.roleId != 1 }">
									<c:choose>
										<c:when test="${o.items[0].status == 0 }">

											<td>
												<button class="btn btn-primary btn-block"
													onClick="ChangeStatus(${o.cartId }, 1)">
													<i class="fa fa-cog fa-spin"></i>Change Status
												</button>
												<button class="btn btn-default btn-block"
													onClick="ChangeStatus(${o.cartId }, 2)">
													<i class="fa fa-cog fa-spin"></i>Cancel Order
												</button>
											</td>
										</c:when>
										<c:when test="${o.items[0].status == 2 }">
											<td>
												<div class="tm-status-circle cancelled"></div>Canceled
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<div class="tm-status-circle moving"></div>Complete
											</td>
										</c:otherwise>
									</c:choose>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	function ChangeStatus(cartid, number){
		$.ajax({
  			url: "/Project_WEB/admin/HomeAdmin",
  			type:"post",
  			data:{
  				cartId: cartid,
  				status: number
  			},
  			success: function(data){
  				alert("update status success (reset page to view status)")
  			},
  			error: function(){
  				console.log("error")
  			}
  		});
	}
	function FilterStatus(Status, Type, userid){
		$("#loading").removeClass("hide").addClass("show");
		$.ajax({
  			url: "/Project_WEB/admin/SearchOrders",
  			type:"post",
  			data:{
  				type: Type,
  				status: Status,
  				userId: userid,
  			},
  			success: function(data){
  				
  				$(".table-list-order").html(data);
  				$("#loading").removeClass("show").addClass("hide");
  			},
  			error: function(){
  				console.log("error");
  				$("#loading").removeClass("show").addClass("hide");
  			}
  		});
	}
	function drawBar1Chart(data, amount) {
		let arr = data.replace("[","").replace("]","").split(',');
		let amou = amount.replace("[","").replace("]","").split(',');
		var a = [];
		for(var i =0; i<amou.length;i++){
			a.push(parseInt(amou[i]));
		}
		
		  if ($("#barChart1").length) {
		    ctxBar = document.getElementById("barChart1").getContext("2d");

		    optionsBar = {
		      responsive: true,
		      scales: {
		        yAxes: [
		          {
		            barPercentage: 0.2,
		            ticks: {
		              beginAtZero: true
		            },
		            scaleLabel: {
		              display: true,
		              labelString: "Name Product"
		            }
		          }
		        ]
		      }
		    };

		    optionsBar.maintainAspectRatio =
		      $(window).width() < width_threshold ? false : true;

		    /**
		     * COLOR CODES
		     * Red: #F7604D
		     * Aqua: #4ED6B8
		     * Green: #A8D582
		     * Yellow: #D7D768
		     * Purple: #9D66CC
		     * Orange: #DB9C3F
		     * Blue: #3889FC
		     */

		    configBar = {
		      type: "horizontalBar",
		      data: {
		    	  
		        labels: arr,
		        datasets: [
		          {
		            label: "Amount",
		            data: a,
		            backgroundColor: [
		              "#F7604D",
		              "#4ED6B8",
		              "#A8D582",
		              "#D7D768",
		              "#9D66CC",
		              "#DB9C3F",
		              "#3889FC",
		              "#5BBD2B",
		              "#00A6AD",
		              "#511F90",
		              "#A2007C",
		              "#220000",
		            ],
		            borderWidth: 0
		          }
		        ]
		      },
		      options: optionsBar
		    };

		    barChart = new Chart(ctxBar, configBar);
		  }
		}
	function drawLine1Chart(data, price){
		let arr = data.replace("[","").replace("]","").split(',');
		let p = price.replace("[","").replace("]","").split(',');
		/* var xValues = ["Italy", "France", "Spain", "USA", "Argentina"];
		var yValues = [55, 49, 44, 24, 15]; */
		var barColors = ["red", "green","blue","orange","brown","Yellow","Cyan / Aqua","Magenta / Fuchsia","Gray","#00FFFF","#FF33FF","red", "green","blue","orange","brown","Yellow","Cyan / Aqua","Magenta / Fuchsia","Gray","#00FFFF","#FF33FF","red", "green","blue","orange","brown","Yellow","Cyan / Aqua","Magenta / Fuchsia","Gray","#00FFFF","#FF33FF","red", "green","blue","orange","brown","Yellow","Cyan / Aqua","Magenta / Fuchsia","Gray","#00FFFF","#FF33FF","red", "green","blue","orange","brown","Yellow","Cyan / Aqua","Magenta / Fuchsia","Gray","#00FFFF","#FF33FF"];
		var a = [];
		for(var i =0; i<p.length;i++){
			a.push(parseInt(p[i]));
		}
		new Chart("lineChart1", {
		  type: "bar",
		  data: {
		    labels: arr,
		    datasets: [{
		      backgroundColor: barColors,
		      data: a
		    }]
		  },
		  options: {
		    legend: {display: false},
		    title: {
		      display: true,
		      text: "Price of Product for day"
		    }
		  }
		});
	}
	function searchToggle(obj, evt){
	    var container = $(obj).closest('.search-wrapper');
	        if(!container.hasClass('active')){
	            container.addClass('active');
	            evt.preventDefault();
	        }
	        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
	            container.removeClass('active');
            // clear input
	            container.find('.search-input').val('');
	            
	            
	        }
	        else{
	        	var x = document.getElementById("codeOrder").value; //value in input
	        	
	        	$.ajax({
            	url: "/Project_WEB/admin/SearchOrders",
      			type:"get",
      			data:{
      				codeOrder: x,
      			},
      			success: function(data){
      				$(".table-list-order").html(data)
      				
      			},
      			error: function(){
      				console.log("error")
      			}
            }) 
	        }
	}
	window.onload = function() {
		setTimeout(function() {
		    document.querySelector('.tm-block-title').click();
		    document.querySelector('.tm-block-title1').click();
		  }, 1000);
		};
	
</script>