<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	html,body { height: 100%; }

	body{
		display: -ms-flexbox;
		display: -webkit-box;
		display: flex;
		-ms-flex-align: center;
		-ms-flex-pack: center;
		-webkit-box-align: center;
		align-items: center;
		-webkit-box-pack: center;
		justify-content: center;
		background-color: #f5f5f5;
	}
	
	form{
		padding-top: 10px;
		font-size: 13px;
		margin-top: 30px;
	}
	
	.card-title{ font-weight:300; }
	
	.btn{
		font-size: 13px;
	}
	
	.login-form{ 
		width:320px;
		margin:20px;
	}
	
	.sign-up{
		text-align:center;
		padding:20px 0 0;
	}
	
	span{
		font-size:14px;
	}
	
	.submit-btn{
		margin-top:20px;
	}

</style>
</head>
<body>
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Change password</h3>
		
		<!--Password must contain one lowercase letter, one number, and be at least 7 characters long.-->
		
		<div class="card-text">
			<form>
				<div class="alert alert-danger alert-dismissible fade show" role="alert">
  					<strong>Holy guacamole!</strong> You should check in on some of those fields below.
  						<a class="close" data-dismiss="alert" aria-label="Close">
   					 		<span aria-hidden="true">&times;</span>
  						</a>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Your new password</label>
					<input type="password" class="form-control form-control-sm">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Repeat password</label>
					<input type="password" class="form-control form-control-sm">
				</div>
				<button type="submit" class="btn btn-primary btn-block submit-btn">Confirm</button>
			</form>
		</div>
	</div>
</div>
</body>
</html>